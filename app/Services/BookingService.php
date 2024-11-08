<?php
namespace App\Services;

use App\Models\Product;
use Illuminate\Support\Session;
use App\Models\GroupParticipant;
use Illuminate\Support\Facades\DB;
use App\Models\ProductSubscription;
use Illuminate\Support\Facades\Log;

class BookingService {

    public function getBookingDetails(array $validated)
    {
        return ProductSubscription::where('booking_trx_id', $validated['booking_trx_id'])
            ->where('phone', $validated['phone'])
            ->first();
    }

    public function calculatedBookingData(Product $product, $validatedData)
    {

        $ppn = 0.11;
        $price = $product->price_per_person;
        $totalPpn = $ppn * $price;
        $totalAmount = $price + $totalPpn;

        return [
            'product_id' => $product->id,
            'name' => $validatedData['name'],
            'email' => $validatedData['email'],
            'phone' => $validatedData['phone'],
            'duration' => $product->duration,
            'price_per_person' => $price,
            'sub_total' => $price,
            'total_ppn' => $totalPpn,
            'total_amount' => $totalAmount,
        ];
    }

    public function storeBookingInSession($product, $validated)
    {
        $bookingData = $this->calculatedBookingData($product, $validated);
        session()->put('booking_data', $bookingData);
    }

    public function payment()
    {
        $booking = session('booking_data', []);
        if (empty($booking)){
            Log::error("No Booking data found in session");
            return [];
        }
        $product = Product::find($booking['product_id']);

        return compact('booking', 'product');
    }

    public function paymentStore(array $validated)
    {
        $bookingData = session('booking_data');
        if (!$bookingData) {
            Log::error("No Booking data found in session");
            return null;
        }

        $bookingTransictionId = null;

        return DB::transaction(function() use ($validated, $bookingData) {
            if (isset($validated['proof'])) {
                $proofPath = $validated['proof']->store('proofs', 'public');
                $validated['proof'] = $proofPath;
            }

            $validated = array_merge($validated, [
                'name' => $bookingData['name'],
                'email' => $bookingData['email'],
                'phone' => $bookingData['phone'],
                'duration' => $bookingData['duration'],
                'total_tax_amount' => $bookingData['total_ppn'],
                'price' => $bookingData['price_per_person'],
                'total_amount' => $bookingData['total_amount'],
                'product_id' => $bookingData['product_id'],
                'is_paid' => false,
            ]);

            $newBooking = ProductSubscription::create($validated);

            return $newBooking->id;
        });
    }

    public function getBookingDetailsWithGroupAndCapacity(array $validatedData)
    {
        $bookingDetails = ProductSubscription::with(['product'])
            ->where('booking_trx_id', $validatedData['booking_trx_id'])
            ->where('phone', $validatedData['phone'])
            ->first();

        if (!$bookingDetails) {
            return null;
        }

        $group = GroupParticipant::where('booking_trx_id', $bookingDetails->booking_trx_id)->first();

        $subscriptionGroup = null;

        if($group) {
            $subscriptionGroup = $group->subscriptionGroup()
                                    ->with(['groupParticipant', 'groupMessages'])
                                    ->first();
        }

        $productCapacity = $bookingDetails->product->capacity ?? 0;

        return [
            'bookingDetails' => $bookingDetails,
            'subscriptionGroup' => $subscriptionGroup,
            'productCapacity' => $productCapacity,
        ];
    }

    
}