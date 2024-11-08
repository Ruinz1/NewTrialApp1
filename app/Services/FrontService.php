<?php
namespace App\Services;

use App\Models\Product;

class FrontService
{
    public function getFrontPageData()
    {
        $popularProducts = Product::where('is_popular', 1)->oldest()->get();
        $newProducts = Product::oldest()->limit(6)->get();

        return compact('popularProducts', 'newProducts');
    }


    
}
