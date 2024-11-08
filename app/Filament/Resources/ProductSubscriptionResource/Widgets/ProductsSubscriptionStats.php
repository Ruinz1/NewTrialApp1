<?php

namespace App\Filament\Resources\ProductSubscriptionResource\Widgets;

use App\Models\ProductSubscription;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;

class ProductsSubscriptionStats extends BaseWidget
{
    protected function getStats(): array
    {
        $totalTransactions = ProductSubscription::count();
        $approveTransactions = ProductSubscription::where('is_paid', true)->count();
        $totalRevenue = ProductSubscription::where('is_paid', true)->sum('total_amount');
        $idrRev = 'Rp, ' . number_format($totalRevenue);


        return [
            Stat::make('Total transactions', $totalTransactions)
            ->description('All Transactions')
            ->descriptionIcon('heroicon-o-ticket'),

            Stat::make('Approved transactions', $approveTransactions)
            ->description('Approved transactions')
            ->descriptionIcon('heroicon-o-check-circle')
            ->color('success'),

            Stat::make('Total Revenue', $idrRev )
            ->description('Total Revenue')
            ->descriptionIcon('heroicon-o-currency-dollar')
            ->color('success'),

        ];
    }
}
