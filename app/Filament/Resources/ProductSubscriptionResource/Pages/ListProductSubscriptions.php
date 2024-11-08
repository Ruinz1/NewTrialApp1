<?php

namespace App\Filament\Resources\ProductSubscriptionResource\Pages;

use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use App\Filament\Resources\ProductSubscriptionResource;
use App\Filament\Resources\ProductSubscriptionResource\Widgets\ProductsSubscriptionStats;

class ListProductSubscriptions extends ListRecords
{
    protected static string $resource = ProductSubscriptionResource::class;

    protected function getHeaderWidgets(): array
    {
        return [
            ProductsSubscriptionStats::class,
        ];
    }

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
