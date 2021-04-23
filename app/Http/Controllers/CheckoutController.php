<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Http\Requests;
use Session;
use Illuminate\Support\Facades\Redirect;
use Cart;
session_start();

class CheckoutController extends Controller
{
    public function login_checkout(){
        $category_product   =   DB::table('tbl_category_product')->where('category_status','1')->orderby('category_id','desc')->get();
        $brand_product      =   DB::table('tbl_brand_product')->where('brand_status','1')->orderby('brand_id','desc')->get();
        return view('pages.login_checkout')->with('category',$category_product)->with('brand',$brand_product);
    }

    public function customer_login(Request $request){
        $customer_email    =   $request->customer_email;
        $customer_password =   md5($request->customer_password);

        $result =   DB::table('tbl_customers')->where('customer_email',$customer_email)->where('customer_password',$customer_password)->first();
        if ($result) {
            Session::put('customer_id', $result->customer_id);
            Session::put('customer_name', $result->customer_name);
            return redirect('/home');
        }
        else {
            Session::put('message', 'Mật khẩu hoặc tài khoản không tồn tại');
            return Redirect('/login-checkout');
        }
    }

    public function logout_checkout(){
        Session::put('customer_id',null);
        Session::put('customer_name',null);
        return Redirect('/home');
    }

    public function add_customer(Request $request){
        $data   =   array();
        $data['customer_name']      =   $request->customer_name;
        $data['customer_email']     =   $request->customer_email;
        $data['customer_password']  =   md5($request->customer_password);
        $data['customer_phone']     =   $request->customer_phone;

        $customer_id = DB::table('tbl_customers')->insertGetId($data);

        Session::put('customer_id',$customer_id);
        Session::put('customer_name',$request->customer_name);
        return Redirect('/home');
    }

    public function checkout(){
        $customer_id = Session::get('customer_id');
        if ($customer_id != null){
            $category_product   =   DB::table('tbl_category_product')->where('category_status','1')->orderby('category_id','desc')->get();
            $brand_product      =   DB::table('tbl_brand_product')->where('brand_status','1')->orderby('brand_id','desc')->get();
            return view('pages.show_checkout')->with('category',$category_product)->with('brand',$brand_product);
        }
        else {
            return Redirect('/login-checkout');
        }      
    }

    public function save_checkout(Request $request){
        $data   =   array();
        $data['customer_id']        =   Session::get('customer_id');
        $data['shipping_name']      =   $request->shipping_name;
        $data['shipping_email']     =   $request->shipping_email;
        $data['shipping_phone']     =   $request->shipping_phone;
        $data['shipping_address']   =   $request->shipping_address;
        $data['shipping_message']   =   $request->shipping_message;

        $shipping_id = DB::table('tbl_shipping')->insertGetId($data);
        Session::put('shipping_id',$shipping_id);
        return Redirect('/payment');
    }

    public function payment(){
        //insert order
        $data   = array();
        $data['customer_id']    =   Session::get('customer_id');
        $data['shipping_id']    =   Session::get('shipping_id');
        $data['order_total']    =   Cart::priceTotal();
        $data['order_status']   =   0;
        $order_id = DB::table('tbl_order')->insertGetId($data);

        //insert order_details
        $data_details   = array();
        $content = Cart::content();
        foreach ($content as $key => $value) {         
            $data_details['order_id']               =   $order_id;
            $data_details['product_id']             =   $value->id;
            $data_details['product_name']           =   $value->name;
            $data_details['product_price']          =   $value->price;
            $data_details['product_sales_quantity'] =   $value->qty;
            DB::table('tbl_order_details')->insert($data_details);
        }

        Cart::destroy();
        
        $category_product   =   DB::table('tbl_category_product')->where('category_status','1')->orderby('category_id','desc')->get();
        $brand_product      =   DB::table('tbl_brand_product')->where('brand_status','1')->orderby('brand_id','desc')->get();
        return view('pages.payment')->with('category',$category_product)->with('brand',$brand_product);
    }
}
