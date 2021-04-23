<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Http\Requests;
use Session;
use Illuminate\Support\Facades\Redirect;
session_start();

class CategoryProduct extends Controller
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

	//Hien thi form them danh muc san pham
    public function add_category_product(){
		$this->AuthLogin();
		return view('admin.add_category_product');
    }

    //Hien thi tat ca danh muc san pham
    public function all_category_product(){
		$this->AuthLogin();
		$all_category_product = DB::table('tbl_category_product')->get();
		$manager_category_product =	view('admin.all_category_product')->with('all_category_product', $all_category_product);
		return view('admin_layout')->with('admin.all_category_product', $manager_category_product);
    }

    //Hien thi trang cap nhap danh muc san pham
    public function edit_category_product($category_product_id){
		$this->AuthLogin();
		$edit_category_product = DB::table('tbl_category_product')->where('category_id', $category_product_id)->get();
		$manager_category_product =	view('admin.edit_category_product')->with('edit_category_product', $edit_category_product);
		return view('admin_layout')->with('admin.edit_category_product', $manager_category_product);
    }

    //Them danh muc san pham
    public function save_category_product(Request $request){
		$this->AuthLogin();
		$data 						=	array();
		$data['category_name']		=	$request->category_product_name;
		$data['category_desc']		=	$request->category_product_desc;
		$data['category_status']	=	$request->category_product_status;

		DB::table('tbl_category_product')->insert($data);
		Session::put('message', 'Thêm danh mục sản phẩm thành công!');
		return Redirect::to('add-category-product');
    }

    //Cap nhat danh muc san pham
    public function update_category_product(Request $request, $category_product_id){
		$this->AuthLogin();
		$data 						=	array();
		$data['category_name']		=	$request->category_product_name;
		$data['category_desc']		=	$request->category_product_desc;

		DB::table('tbl_category_product')->where('category_id', $category_product_id)->update($data);
		Session::put('message', 'Cập nhật danh mục sản phẩm thành công!');
		return Redirect::to('all-category-product');
    }

    //Xoa danh muc san pham
    public function delete_category_product($category_product_id){
		$this->AuthLogin();
		DB::table('tbl_category_product')->where('category_id', $category_product_id)->delete();
		Session::put('message', 'Xóa danh mục sản phẩm thành công!');
		return Redirect::to('all-category-product');
    }

    //Thay doi thuoc tinh Hien Thi cua danh muc san pham
    public function active_category_product($category_product_id){
		$this->AuthLogin();
		DB::table('tbl_category_product')->where('category_id', $category_product_id)->update(['category_status' => 1]);
		Session::put('message', 'Hiển thị danh mục thành công!');
		return Redirect::to('all-category-product');
    }
    public function unactive_category_product($category_product_id){
		$this->AuthLogin();
		DB::table('tbl_category_product')->where('category_id', $category_product_id)->update(['category_status' => 0]);
		Session::put('message', 'Ẩn thị danh mục thành công!');
		return Redirect::to('all-category-product');
    }

		//End function admin page - Ket thuc cac chuc nang cua trang admin

	//hien thi san pham theo danh muc
	public function show_category_home($category_id){
		$category_product   =   DB::table('tbl_category_product')->where('category_status','1')->orderby('category_id','desc')->get();
        $brand_product      =   DB::table('tbl_brand_product')->where('brand_status','1')->orderby('brand_id','desc')->get();
		$category_by_id		=	DB::table('tbl_product')->join('tbl_category_product','tbl_product.category_id','=','tbl_category_product.category_id')
								->where('tbl_product.category_id',$category_id)->get();
		$category_name 		=	DB::table('tbl_category_product')->where('category_id',$category_id)->get();
		return view('pages.show_category')->with('category',$category_product)->with('brand',$brand_product)->with('category_by_id',$category_by_id)->with('category_name',$category_name);
	}
}
