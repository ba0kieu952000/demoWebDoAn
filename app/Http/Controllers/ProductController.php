<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Http\Requests;
use Session;
use Illuminate\Support\Facades\Redirect;
session_start();


class ProductController extends Controller
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

    //Hien thi form them san pham
    public function add_product()
    {
        $this->AuthLogin();
        $category_product  = DB::table('tbl_category_product')->orderby('category_id', 'desc')->get();
        $brand_product     = DB::table('tbl_brand_product')->orderby('brand_id', 'desc')->get();
        return view('admin.add_product')->with('category_product',$category_product)->with('brand_product',$brand_product);
    }

    //Hien thi tat ca san pham
    public function all_product()
    {
        $this->AuthLogin();
        $all_product         =     DB::table('tbl_product')
        ->join('tbl_category_product','tbl_category_product.category_id','=','tbl_product.category_id')
        ->join('tbl_brand_product','tbl_brand_product.brand_id','=','tbl_product.brand_id')->orderby('product_id','desc')->get();
        $manager_product     =    view('admin.all_product')->with('all_product', $all_product);
        return view('admin_layout')->with('admin.all_product', $manager_product);
    }

    //Hien thi form cap nhap san pham
    public function edit_product($product_id)
    {
        $this->AuthLogin();
        $category_product   = DB::table('tbl_category_product')->orderby('category_id', 'desc')->get();
        $brand_product      = DB::table('tbl_brand_product')->orderby('brand_id', 'desc')->get();
        $edit_product       = DB::table('tbl_product')->where('product_id', $product_id)->get();
        $manager_product =  view('admin.edit_product')
                            ->with('edit_product', $edit_product)
                            ->with('category_product',$category_product)
                            ->with('brand_product',$brand_product);
        return view('admin_layout')->with('admin.edit_product', $manager_product);
    }

    //luu san pham 
    public function save_product(Request $request)
    {
        $this->AuthLogin();
        $data             =    array();
        $data['product_name']       =    $request->product_name;
        $data['category_id']        =    $request->product_category;
        $data['brand_id']           =    $request->product_brand;
        $data['product_desc']       =    $request->product_desc;
        $data['product_content']    =    $request->product_content;
        $data['product_status']     =    $request->product_status;
        $data['product_price']      =    $request->product_price;           

        $get_image = $request->file('product_image');
        if ($get_image) {
            $get_name_image =   $get_image->getClientOriginalName();
            $name_image     =   current(explode('.',$get_name_image));
            $new_image      =   $name_image.rand(0,99).'.'.$get_image->getClientOriginalExtension();
            $get_image->move('../public/uploads/product',$new_image);
            $data['product_image']    =    $new_image;
            DB::table('tbl_product')->insert($data);
            Session::put('message', 'Th??m s???n ph???m th??nh c??ng!');
            return Redirect::to('add-product');
        }

        $data['product_image']    =    '';
        DB::table('tbl_product')->insert($data);
        Session::put('message', 'Th??m s???n ph???m th??nh c??ng!');
        return Redirect::to('add-product');
    }

    //Cap nhat san pham 
    public function update_product(Request $request, $product_id)
    {
        $this->AuthLogin();
        $data                       =    array();
        $data['product_name']       =    $request->product_name;
        $data['category_id']        =    $request->product_category;
        $data['brand_id']           =    $request->product_brand;
        $data['product_desc']       =    $request->product_desc;
        $data['product_content']    =    $request->product_content;
        $data['product_status']     =    $request->product_status;
        $data['product_price']      =    $request->product_price; 

        $get_image = $request->file('product_image');
        if ($get_image) {
            $get_name_image =   $get_image->getClientOriginalName();
            $name_image     =   current(explode('.',$get_name_image));
            $new_image      =   $name_image.rand(0,99).'.'.$get_image->getClientOriginalExtension();
            $get_image->move('../public/uploads/product',$new_image);
            $data['product_image']    =    $new_image;

            $product_old = DB::table('tbl_product')->where('product_id', $product_id)->get();
            foreach ($product_old as $key => $value) {
                unlink('../public/uploads/product/'.$value->product_image);
            }

            DB::table('tbl_product')->where('product_id', $product_id)->update($data);
            Session::put('message', 'C???p nh???t s???n ph???m th??nh c??ng!');
            return Redirect::to('all-product');
        }
        DB::table('tbl_product')->where('product_id', $product_id)->update($data);
        Session::put('message', 'C???p nh???t s???n ph???m th??nh c??ng!');
        return Redirect::to('all-product');
    }

    //Xoa thuong hieu
    public function delete_product($product_id)
    {
        $this->AuthLogin();
        $product    =   DB::table('tbl_product')->where('product_id', $product_id)->get();
        foreach ($product as $key => $value) {
            unlink("../public/uploads/product/".$value->product_image);
        }
        DB::table('tbl_product')->where('product_id', $product_id)->delete();
        Session::put('message', 'X??a s???n ph???m th??nh c??ng!');
        return Redirect::to('all-product');
    }

    //Thay doi thuoc tinh Hien Thi cua san pham
    public function active_product($product_id)
    {
        $this->AuthLogin();
        DB::table('tbl_product')->where('product_id', $product_id)->update(['product_status' => 1]);
        Session::put('message', 'Hi???n th??? s???n ph???m th??nh c??ng!');
        return Redirect::to('all-product');
    }
    public function unactive_product($product_id)
    {
        $this->AuthLogin();
        DB::table('tbl_product')->where('product_id', $product_id)->update(['product_status' => 0]);
        Session::put('message', '???n th??? s???n ph???m th??nh c??ng!');
        return Redirect::to('all-product');
    }
        //ket thuc admin pages

    //hien thi thong tin chi tiet cua san pham
    public function show_details_product($product_id){
        $category_product   =   DB::table('tbl_category_product')->where('category_status','1')->orderby('category_id','desc')->get();
        $brand_product      =   DB::table('tbl_brand_product')->where('brand_status','1')->orderby('brand_id','desc')->get();;
        
        $product            =   DB::table('tbl_product')
        ->join('tbl_category_product','tbl_category_product.category_id','=','tbl_product.category_id')
        ->join('tbl_brand_product','tbl_brand_product.brand_id','=','tbl_product.brand_id')
        ->where('tbl_product.product_id', $product_id)->get();

        foreach($product as $key => $value){
            $category_id    =   $value->category_id;
        }

        $recommend_product    =   DB::table('tbl_product')
        ->join('tbl_category_product','tbl_category_product.category_id','=','tbl_product.category_id')
        ->join('tbl_brand_product','tbl_brand_product.brand_id','=','tbl_product.brand_id')
        ->where('tbl_category_product.category_id', $category_id)->whereNotIn('tbl_product.product_id', [$product_id])->get();

        return view('pages.show_details_product')->with('product',$product)->with('category',$category_product)->with('brand',$brand_product)->with('recommend',$recommend_product);
    }
}
