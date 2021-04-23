<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Http\Requests;
use Session;
use Illuminate\Support\Facades\Redirect;
use Cart;
session_start();

class CartController extends Controller
{
    public function save_cart(Request $request){
        $productId          =   $request->productid;
        $quantity           =   $request->qty ;
        $product            =   DB::table('tbl_product')->where('product_id', $productId)->first();
        $data['id']         =   $productId;
        $data['name']       =   $product->product_name;
        $data['qty']        =   $quantity;
        $data['price']      =   $product->product_price;
        $data['weight']     =   '12';
        $data['options']['image']   =   $product->product_image;
        Cart::add($data);
        $content = Cart::content();
        echo $content;
        //return Redirect::to('/show-cart');
        return redirect('show-cart');
    }

    public function show_cart(){
        $category_product   =   DB::table('tbl_category_product')->where('category_status','1')->orderby('category_id','desc')->get();
        $brand_product      =   DB::table('tbl_brand_product')->where('brand_status','1')->orderby('brand_id','desc')->get();
        return view('pages.show_cart')->with('category',$category_product)->with('brand',$brand_product);
    }

    public function delete_to_cart($rowId){
        Cart::update($rowId,0);
        return redirect('show-cart');
    }

    public function update_cart_quantity(Request $request){
        $quantity   =   $request->quantity ;
        $rowId      =   $request->rowId_cart;  
        Cart::update($rowId,$quantity);
        return redirect('show-cart');
    }
}
