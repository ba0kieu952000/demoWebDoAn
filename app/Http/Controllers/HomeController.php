<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Http\Requests;
use Session;
use Illuminate\Support\Facades\Redirect;
session_start();

class HomeController extends Controller
{
    public function index(){
        $category_product   =   DB::table('tbl_category_product')->where('category_status','1')->orderby('category_id','desc')->get();
        $brand_product      =   DB::table('tbl_brand_product')->where('brand_status','1')->orderby('brand_id','desc')->get();
        $new_product        =   DB::table('tbl_product')->where('product_status','1')->orderby('product_id','desc')->limit(9)->get();
        //$all_product         =     DB::table('tbl_product')
        //->join('tbl_category_product','tbl_category_product.category_id','=','tbl_product.category_id')
        //->join('tbl_brand_product','tbl_brand_product.brand_id','=','tbl_product.brand_id')->orderby('product_id','desc')->get();   
        return view('pages.home')->with('category',$category_product)->with('brand',$brand_product)->with('new_product',$new_product);
    }

    public function search(Request $request){
        $category_product   =   DB::table('tbl_category_product')->where('category_status','1')->orderby('category_id','desc')->get();
        $brand_product      =   DB::table('tbl_brand_product')->where('brand_status','1')->orderby('brand_id','desc')->get();
        $keywords           =   $request->keywords_submit;
        $search_product     =   DB::table('tbl_product')->where('product_name','like', '%'.$keywords.'%')->get();
        return view('pages.search')->with('category',$category_product)->with('brand',$brand_product)->with('search_product',$search_product);
    }
}
