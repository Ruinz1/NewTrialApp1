@extends('layouts.master')

@section('content')
<x-navbar/>
    <header class="py-10 text-center">
        <h1 class="text-4xl font-bold">Semua Produk</h1>
        <p class="mt-4 text-lg">Berikut adalah semua produk yang kami tawarkan.</p>
    </header>

    <section id="Products" class="relative w-full overflow-hidden">
        <section class="Content relative flex flex-col w-full max-w-[1280px] px-16 mx-auto gap-8 py-[100px]">
            <div class="grid grid-cols-3 gap-8">
                @forelse ($products as $product)
                    <div class="product-card flex flex-col rounded-[32px] overflow-hidden bg-white">
                        <div class="w-full h-[180px] flex shrink-0 bg-[#D9D9D9]">
                            <img src="{{ Storage::url($product->thumbnail) }}" class="w-full h-full object-cover" alt="thumbnails">
                        </div>
                        <div class="flex flex-col p-6 gap-6">
                            <p class="font-bold text-xl leading-[25px]">{{ $product->name }}</p>
                            <p class="font-extrabold text-2xl leading-[30px]">Rp. {{ number_format($product->price_per_person, 0, '', '.') }}</p>
                            <a href="{{ route('front.details', $product->slug) }}" class="flex items-center rounded-full h-[60px] px-9 w-full gap-[6px] bg-patungan-orange justify-center">
                                <span class="font-bold text-lg leading-5 text-white">Pesan Sekarang</span>
                            </a>
                        </div>
                    </div>
                @empty
                    <p>Belum ada produk yang tersedia.</p>
                @endforelse
            </div>
        </section>
    </section>
@endsection 