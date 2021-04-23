<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Http\Requests;
use Session;
use Illuminate\Support\Facades\Redirect;
session_start();

class OrderController extends Controller
{
    //Kiem tra dang nhap
    public function AuthLogin(){
        $admin_id = Session::get('admin_id');
        if (isset($admin_id)) {
            return redirect('dashboard');
        } else {
            return redirect('admin')->send();
        }
	}

    public function view_order ($order_id){
        $this->AuthLogin();
		$order_details = DB::table('tbl_order_details')->where('tbl_order_details.order_id', $order_id)
        ->join('tbl_order','tbl_order.order_id','=','tbl_order_details.order_id')->get();
        $shipping = DB::table('tbl_order')->where('order_id', $order_id)
        ->join('tbl_shipping','tbl_order.shipping_id','=','tbl_shipping.shipping_id')->get();
        $customer = DB::table('tbl_order')->where('order_id', $order_id)
        ->join('tbl_customers','tbl_order.customer_id','=','tbl_customers.customer_id')->get();
        return view('admin.view_order')->with('order_details',$order_details)->with('shipping',$shipping)->with('customer',$customer);
    }

    public function del_order ($order_id){
        $this->AuthLogin();
		DB::table('tbl_order_details')->where('order_id', $order_id)->delete();
        DB::table('tbl_order')->where('order_id', $order_id)->delete();
		Session::put('message', 'Xóa danh hóa đơn thành công!');
		return Redirect::to('dashboard');
    }
}
