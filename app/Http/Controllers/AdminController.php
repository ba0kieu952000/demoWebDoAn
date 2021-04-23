<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Http\Requests;
use Session;
use Illuminate\Support\Facades\Redirect;
session_start();

class AdminController extends Controller
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

    //Hiển thị form login
    public function index(){
        return view('admin_login');
    }

    //Hiện thị trang main của admin - quan ly hoa don
    public function show_dashboard(){
        $this->AuthLogin();
        $all_order = DB::table('tbl_order')
        ->join('tbl_customers','tbl_order.customer_id','=','tbl_customers.customer_id')
        ->orderby('tbl_order.order_id','desc')->get();
        return view('admin.dashboard')->with('all_order',$all_order);
    }

    //Xử lý đăng nhập
    public function dashboard(Request $request){
        $admin_email    =   $request->admin_email;
        $admin_password =   md5($request->admin_password);

        $result =   DB::table('tbl_admin')->where('admin_email',$admin_email)->where('admin_password',$admin_password)->first();
        if ($result) {
            Session::put('admin_id', $result->admin_id);
            Session::put('admin_name', $result->admin_name);
            return redirect('/dashboard');
        }
        else {
            Session::put('message', 'Mật khẩu hoặc tài khoản không tồn tại');
            return redirect('/admin');
        }
    }

    //Đăng xuất
    public function log_out()
    {
        Session::put('admin_id',null);
        Session::put('admin_name', null);
        return Redirect::to('/admin');
    }
}
