<?php

namespace App\Filament\Resources;

use Filament\Forms;
use Filament\Tables;
use App\Models\Product;
use Filament\Forms\Form;
use Filament\Tables\Table;
use Filament\Resources\Resource;
use App\Models\ProductSubscription;
use Filament\Forms\Components\Grid;
use Filament\Notifications\Notification;
use Filament\Tables\Filters\SelectFilter;
use Illuminate\Database\Eloquent\Builder;
use Filament\Forms\Components\ToggleButtons;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Filament\Resources\ProductSubscriptionResource\Pages;
use App\Filament\Resources\ProductSubscriptionResource\RelationManagers;

class ProductSubscriptionResource extends Resource
{
    protected static ?string $model = ProductSubscription::class;

    protected static ?string $navigationIcon = 'heroicon-o-credit-card';

    protected static ?string $navigationGroup = 'Transactions';

    public static function getNavigationBadge(): ?string
    {
        return (string) ProductSubscription::where('is_paid', false)->count();
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                //

                Forms\Components\Wizard::make([

                    Forms\Components\Wizard\Step::make('Product and Price')
                    ->schema([

                        Grid::make(2)
                        ->schema([
                            Forms\components\Select::make('product_id')
                            ->relationship('product','name')
                            ->searchable()
                            ->preload()
                            ->required()
                            ->live()
                            ->afterStateUpdated(function ($state, callable $set)
                            {
                                $product = Product::find($state);
                                $price = $product ? $product->price_per_person : 0 ;
                                $duration = $product ? $product->duration : 0;

                                $set('price', $price);
                                $set('duration', $duration);

                                $tax = 0.11;
                                $totalTaxAmount = $tax * $price;

                                $totalAmount = $price + $totalTaxAmount;
                                $set('total_amount', number_format($totalAmount, 0, '', ''));
                                $set('total_tax_amount', number_format($totalTaxAmount, 0, '', ''));
                            })
                            ->afterStateHydrated(function( callable $get, callable $set, $state) {
                                $productId = $state;
                                if ($productId) {
                                    $product = Product::find($productId);
                                    $price = $product ? $product->price : 0;
                                    $set('price', $price);

                                    $tax = 0.11;
                                    $totalTaxAmount = $tax * $price;
                                    $set('total_tax_amount', number_format($totalTaxAmount, 0, '', ''));
                                }
                            }),

                            Forms\components\TextInput::make('price')
                            ->required()
                            ->label('Price per person')
                            ->readOnly()
                            ->numeric()
                            ->prefix('IDR'),

                            Forms\components\TextInput::make('total_amount')
                            ->required()
                            ->label('Total Amount')
                            ->readOnly()
                            ->numeric()
                            ->prefix('IDR'),

                            Forms\components\TextInput::make('total_tax_amount')
                            ->required()
                            ->label('Total Tax Amount')
                            ->readOnly()
                            ->numeric()
                            ->prefix('IDR'),

                            
                            Forms\components\TextInput::make('duration')
                            ->required()
                            ->label('Duration')
                            ->readOnly()
                            ->numeric()
                            ->prefix('month'),
                        ]),
                    ]),

                    Forms\Components\Wizard\Step::make('Customer Infromation')
                    ->schema([

                        Grid::make(2)
                        ->schema([
                        
                            Forms\components\TextInput::make('name')
                            ->required()
                            ->maxLength(255),

                            Forms\components\TextInput::make('phone')
                            ->required()
                            ->maxLength(255),

                            Forms\components\TextInput::make('email')
                            ->required()
                            ->maxLength(255),
                        ]),
                    ]),

                    Forms\Components\Wizard\Step::make('Payment Infromation')
                    ->schema([

                        
                        Forms\components\TextInput::make('booking_trx_id')
                        ->required()
                        ->maxLength(255),
                        
                        Forms\components\TextInput::make('customer_bank_name')
                        ->required()
                        ->maxLength(255),
                        
                        Forms\components\TextInput::make('customer_bank_account')
                        ->required()
                        ->maxLength(255),
                        
                        Forms\components\TextInput::make('customer_bank_number')
                        ->required()
                        ->maxLength(255),

                        ToggleButtons::make('is_paid')
                        ->label('Already Paid')
                        ->boolean()
                        ->grouped()
                        ->icons([
                            true=> 'heroicon-o-pencil',
                            false=> 'heroicon-o-clock',
                        ])
                        ->required(),

                        Forms\components\FileUpload::make('proof')
                        ->image()
                        ->required(),
                    ]),



                ])
                ->columnSpan('full')
                ->columns(1)
                ->skippable()


            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\ImageColumn::make('product.thumbnail'),

                Tables\Columns\TextColumn::make('name')
                ->searchable(),

                Tables\Columns\TextColumn::make('booking_trx_id')
                ->searchable(),

                Tables\Columns\IconColumn::make('is_paid')
                    ->boolean()
                    ->trueColor('success')
                    ->falseColor('danger')
                    ->trueIcon('heroicon-o-check-circle')
                    ->falseIcon('heroicon-o-x-circle')
                    ->label('Verified'),
            ])
            ->filters([
                SelectFilter::make('product_id')
                ->label('Product')
                ->relationship('product', 'name'),

                SelectFilter::make('is_paid')
                ->label('Paid Gateway')
                ->options([
                    '1' => 'Paid',   // Representing true
                    '0' => 'Unpaid', // Representing false
                ]),
                
                Tables\Filters\TrashedFilter::make(),
            ])
            ->actions([

                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
                Tables\Actions\Action::make('approve')
                ->label('Approve')
                ->action(function (ProductSubscription $record){
                    $record->is_paid = true;
                    $record->save();

                    Notification::make()
                        ->title('Order Approval')
                        ->success()
                        ->body('Order Approve')
                        ->send();
                })
                ->color('success')
                ->requiresConfirmation()
                ->visible(fn (ProductSubscription $record) => !$record->is_paid ),
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
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListProductSubscriptions::route('/'),
            'create' => Pages\CreateProductSubscription::route('/create'),
            'edit' => Pages\EditProductSubscription::route('/{record}/edit'),
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
