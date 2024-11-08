<?php

namespace App\Providers;

use App\Models\ProductSubscription;
use Illuminate\Support\ServiceProvider;
use App\Observers\ProductSubscriptionObserver;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
        ProductSubscription::observe(ProductSubscriptionObserver::class);
    }
}
