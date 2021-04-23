<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Http\Requests;
use Session;
use Illuminate\Support\Facades\Redirect;
session_start();

class BrandProduct extends Controller
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
	
	//Hien thi form them thuong hieu san pham
    public function add_brand_product(){
		$this->AuthLogin();
		return view('admin.add_brand_product');
    }

    //Hien thi tat ca thuong hieu
    public function all_brand_product(){
		$this->AuthLogin();
		$all_brand_product 		= 	DB::table('tbl_brand_product')->get();
		$manager_brand_product 	=	view('admin.all_brand_product')->with('all_brand_product', $all_brand_product);
		return view('admin_layout')->with('admin.all_brand_product', $manager_brand_product);
    }

    //Hien thi trang cap nhap thuong hieu
    public function edit_brand_product($brand_product_id){
		$this->AuthLogin();
		$edit_brand_product = DB::table('tbl_brand_product')->where('brand_id', $brand_product_id)->get();
		$manager_brand_product =	view('admin.edit_brand_product')->with('edit_brand_product', $edit_brand_product);
		return view('admin_layout')->with('admin.edit_brand_product', $manager_brand_product);	
    }

    //Them thuong hieu
    public function save_brand_product(Request $request){
		$this->AuthLogin();
		$data 					=	array();
		$data['brand_name']		=	$request->brand_product_name;
		$data['brand_desc']		=	$request->brand_product_desc;
		$data['brand_status']	=	$request->brand_product_status;

		DB::table('tbl_brand_product')->insert($data);
		Session::put('message', 'Thêm thương hiệu sản phẩm thành công!');
		return Redirect::to('add-brand-product');	
    }

    //Cap nhat thuong hieu
    public function update_brand_product(Request $request, $brand_product_id){
		$this->AuthLogin();
		$data 					=	array();
		$data['brand_name']		=	$request->brand_product_name;
		$data['brand_desc']		=	$request->brand_product_desc;

		DB::table('tbl_brand_product')->where('brand_id', $brand_product_id)->update($data);
		Session::put('message', 'Cập nhật danh mục sản phẩm thành công!');
		return Redirect::to('all-brand-product');	
    }

    //Xoa thuong hieu
    public function delete_brand_product($brand_product_id){
		$this->AuthLogin();
		DB::table('tbl_brand_product')->where('brand_id', $brand_product_id)->delete();
		Session::put('message', 'Xóa danh mục sản phẩm thành công!');
		return Redirect::to('all-brand-product');	
    }

    //Thay doi thuoc tinh Hien Thi cua thuong hieu
    public function active_brand_product($brand_product_id){
		$this->AuthLogin();
		DB::table('tbl_brand_product')->where('brand_id', $brand_product_id)->update(['brand_status' => 1]);
		Session::put('message', 'Hiển thị thương hiệu thành công!');
		return Redirect::to('all-brand-product');		
    }
    public function unactive_brand_product($brand_product_id){
		$this->AuthLogin();
		DB::table('tbl_brand_product')->where('brand_id', $brand_product_id)->update(['brand_status' => 0]);
		Session::put('message', 'Ẩn thị thương hiệu thành công!');
		return Redirect::to('all-brand-product');
    }

		//End function admin page - Ket thuc cac chuc nang cua trang admin

	//hien thi san pham theo thuong hieu
	public function show_brand_home($brand_id){
		$category_product   =   DB::table('tbl_category_product')->where('category_status','1')->orderby('category_id','desc')->get();
        $brand_product      =   DB::table('tbl_brand_product')->where('brand_status','1')->orderby('brand_id','desc')->get();
		$brand_by_id		=	DB::table('tbl_product')->join('tbl_brand_product','tbl_product.brand_id','=','tbl_brand_product.brand_id')
								->where('tbl_product.brand_id',$brand_id)->get();
		$brand_name 		=	DB::table('tbl_brand_product')->where('brand_id',$brand_id)->get();
		return view('pages.show_brand')->with('category',$category_product)->with('brand',$brand_product)->with('brand_by_id',$brand_by_id)->with('brand_name',$brand_name);
	}
}
