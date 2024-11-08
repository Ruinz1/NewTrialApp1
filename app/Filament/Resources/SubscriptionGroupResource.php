<?php

namespace App\Filament\Resources;

use Filament\Forms;
use Filament\Tables;
use App\Models\Product;
use Filament\Forms\Form;
use Filament\Tables\Table;
use Filament\Resources\Resource;
use App\Models\SubscriptionGroup;
use Filament\Forms\Components\Select;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\TextInput;
use Filament\Tables\Columns\ImageColumn;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Filters\TrashedFilter;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Filament\Resources\SubscriptionGroupResource\Pages;
use App\Filament\Resources\SubscriptionGroupResource\RelationManagers;
use App\Filament\Resources\SubscriptionGroupResource\RelationManagers\GroupMessagesRelationManager;
use App\Filament\Resources\SubscriptionGroupResource\RelationManagers\GroupParticipantRelationManager;
use App\Filament\Resources\SubscriptionGroupResource\RelationManagers\GroupParticipantsRelationManager;

class SubscriptionGroupResource extends Resource
{
    protected static ?string $model = SubscriptionGroup::class;

    protected static ?string $navigationIcon = 'heroicon-o-user-group';

    protected static ?string $navigationGroup = 'GroupSubscription';


    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                //
                Forms\components\Select::make('product_id')
                ->relationship('product','name')
                ->searchable()
                ->preload()
                ->required()
                ->live()
                ->afterStateUpdated(function ($state, callable $set){
                    $product = Product::find($state);
                    $max_capacity = $product ? $product->capacity : 0;

                    $set('max_capacity', $max_capacity);
                })
                ->afterStateHydrated(function( callable $get, callable $set, $state) {
                    $productId = $state;
                    if ($productId) {
                        $product = Product::find($productId);
                        $max_capacity = $product ? $product->capacity : 0;

                        $set('max_capacity', $max_capacity);
                    }
                }),

                Forms\components\TextInput::make('max_capacity')
                ->required()
                ->label('Max Capacity')
                ->readOnly()
                ->numeric()
                ->prefix('People'),

                Forms\components\TextInput::make('participant_count')
                ->required()
                ->label('Total Capacity')
                ->numeric()
                ->prefix('People'),

                Forms\components\Select::make('product_subscription_id')
                ->relationship('productSubscription','booking_trx_id')
                ->searchable()
                ->label('Booking Ticket')
                ->preload()
                ->required()
                ->live(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                //
                Tables\Columns\ImageColumn::make('product.thumbnail')
                ->label('photo'),

                Tables\Columns\TextColumn::make('productSubscription.id')
                ->label('Subscription Id')
                ->searchable(),

                Tables\Columns\TextColumn::make('id')
                ->label('Group ID')
                ->searchable(),

                Tables\Columns\TextColumn::make('participant_count'),

                Tables\Columns\TextColumn::make('max_capacity'),

                Tables\Columns\IconColumn::make('is_full')
                    ->label('Full')
                    ->boolean()
                    ->getStateUsing(fn ($record) => $record->participant_count >= $record->max_capacity)
                    ->trueColor('success')
                    ->falseColor('danger')
                    ->trueIcon('heroicon-o-check-circle')
                    ->falseIcon('heroicon-o-x-circle')
                    ->label('Capacity is Full'),
            ])
            ->filters([
                Tables\Filters\TrashedFilter::make(),
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                    Tables\Actions\ForceDeleteBulkAction::make(),
                    Tables\Actions\RestoreBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
            GroupMessagesRelationManager::class,
            GroupParticipantsRelationManager::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListSubscriptionGroups::route('/'),
            'create' => Pages\CreateSubscriptionGroup::route('/create'),
            'edit' => Pages\EditSubscriptionGroup::route('/{record}/edit'),
        ];
    }

    public static function getEloquentQuery(): Builder
    {
        return parent::getEloquentQuery()
            ->withoutGlobalScopes([
                SoftDeletingScope::class,
            ]);
    }
}
