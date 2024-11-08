<?php

namespace App\Filament\Resources;

use Filament\Forms;
use Filament\Tables;
use App\Models\Product;
use Filament\Forms\Form;
use Filament\Tables\Table;
use Filament\Resources\Resource;
use Filament\Forms\Components\Fieldset;
use Filament\Tables\Filters\SelectFilter;
use Illuminate\Database\Eloquent\Builder;
use App\Filament\Resources\ProductResource\Pages;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Filament\Resources\ProductResource\RelationManagers;

class ProductResource extends Resource
{
    protected static ?string $model = Product::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationGroup = 'Product';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Fieldset::make('Details')
                ->schema([
                    Forms\components\TextInput::make('name')
                    ->required()
                    ->maxLength(255),
                    Forms\components\TextInput::make('tagline')
                    ->required()
                    ->maxLength(255),
                    Forms\components\FileUpload::make('thumbnail')
                    ->image()
                    ->required(),
                    Forms\components\FileUpload::make('photo')
                    ->image()
                    ->required(),

                    Forms\components\TextInput::make('price')
                    ->required()
                    ->numeric()
                    ->prefix('IDR')
                    ->live()
                    ->afterStateUpdated(function (callable $get, callable $set){
                        $price = $get('price');
                        $capacity = $get('capacity');
                        if ($capacity > 0) {
                            $set('price_per_person', $price / $capacity );
                        } else {
                            $set('price_per_person', null);
                        }
                    }),

                    Forms\components\TextInput::make('capacity')
                    ->required()
                    ->numeric()
                    ->prefix('people')
                    ->live()
                    ->afterStateUpdated(function (callable $get, callable $set){
                        $price = $get('price');
                        $capacity = $get('capacity');
                        if ($capacity > 0) {
                            $set('price_per_person', $price / $capacity );
                        } else {
                            $set('price_per_person', null);
                        }
                    }),

                    Forms\components\TextInput::make('price_per_person')
                    ->numeric()
                    ->readOnly()
                    ->prefix('IDR')
                    ->live()
                    ->afterStateHydrated(function (callable $get, callable $set){
                        $price = $get('price');
                        $capacity = $get('capacity');
                        if ($capacity > 0) {
                            $set('price_per_person', $price / $capacity );
                        } else {
                            $set('price_per_person', null);
                        }
                    }),

                    Forms\components\TextInput::make('duration')
                    ->required()
                    ->numeric()
                    ->prefix('Month'),
                ]),
                Fieldset::make('Addintional')
                ->schema([
                    Forms\components\Textarea::make('about')
                    ->required(),

                    Forms\components\Repeater::make('keypoints')
                    ->relationship('keypoints')
                    ->schema([
                        Forms\components\TextInput::make('name')
                        ->required(),
                    ]),

                    Forms\components\Select::make('is_popular')
                    ->options([
                        true => 'Popular',
                        false => 'Not Popular',
                    ])
                    ->required(),
                ]),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\ImageColumn::make('thumbnail'),

                Tables\Columns\TextColumn::make('name')
                    ->searchable(),
                
                Tables\Columns\IconColumn::make('is_popular')
                    ->boolean()
                    ->trueColor('success')
                    ->falseColor('danger')
                    ->trueIcon('heroicon-o-check-circle')
                    ->falseIcon('heroicon-o-x-circle')
                    ->label('Popular'),

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
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListProducts::route('/'),
            'create' => Pages\CreateProduct::route('/create'),
            'edit' => Pages\EditProduct::route('/{record}/edit'),
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
