<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//frontend
Route::get('/', 'HomeController@index');
Route::get('/home', 'HomeController@index');
Route::get('/DanhMucSanPham/{category_id}', 'CategoryProduct@show_category_home');
Route::get('/ThuongHieuSanPham/{brand_id}', 'BrandProduct@show_brand_home');
Route::get('/chi-tiet-san-pham/{product_id}', 'ProductController@show_details_product');
Route::post('/tim-kiem', 'HomeController@search');

//backend
Route::get('/admin', 'AdminController@index');
Route::get('/dashboard', 'AdminController@show_dashboard');
Route::get('/logout', 'AdminController@log_out');
Route::post('/admin-dashboard', 'AdminController@dashboard');

//Category Product
Route::get('/add-category-product', 'CategoryProduct@add_category_product');
Route::get('/edit-category-product/{category_product_id}', 'CategoryProduct@edit_category_product');
Route::get('/del-category-product/{category_product_id}', 'CategoryProduct@delete_category_product');
Route::get('/all-category-product', 'CategoryProduct@all_category_product');
Route::get('/active-category-product/{category_product_id}', 'CategoryProduct@active_category_product');
Route::get('/unactive-category-product/{category_product_id}', 'CategoryProduct@unactive_category_product');
Route::post('/save-category-product', 'CategoryProduct@save_category_product');
Route::post('/update-category-product/{category_product_id}', 'CategoryProduct@update_category_product');

//Brand Product
Route::get('/add-brand-product', 'BrandProduct@add_brand_product');
Route::get('/edit-brand-product/{brand_product_id}', 'BrandProduct@edit_brand_product');
Route::get('/del-brand-product/{brand_product_id}', 'BrandProduct@delete_brand_product');
Route::get('/all-brand-product', 'BrandProduct@all_brand_product');
Route::get('/active-brand-product/{brand_product_id}', 'BrandProduct@active_brand_product');
Route::get('/unactive-brand-product/{brand_product_id}', 'BrandProduct@unactive_brand_product');
Route::post('/save-brand-product', 'BrandProduct@save_brand_product');
Route::post('/update-brand-product/{brand_product_id}', 'BrandProduct@update_brand_product');

//Product
Route::get('/add-product', 'ProductController@add_product');
Route::get('/edit-product/{product_id}', 'ProductController@edit_product');
Route::get('/del-product/{product_id}', 'ProductController@delete_product');
Route::get('/all-product', 'ProductController@all_product');
Route::get('/active-product/{product_id}', 'ProductController@active_product');
Route::get('/unactive-product/{product_id}', 'ProductController@unactive_product');
Route::post('/save-product', 'ProductController@save_product');
Route::post('/update-product/{product_id}', 'ProductController@update_product');

//Cart
Route::post('/save-cart', 'CartController@save_cart');
Route::post('/update-cart-quantity', 'CartController@update_cart_quantity');
Route::get('/show-cart', 'CartController@show_cart');
Route::get('/delete-to-cart/{rowId}', 'CartController@delete_to_cart');

//Checkout
Route::get('/login-checkout', 'CheckoutController@login_checkout');
Route::get('/logout-checkout', 'CheckoutController@logout_checkout');
Route::get('/checkout', 'CheckoutController@checkout');
Route::get('/payment', 'CheckoutController@payment');
Route::post('/add-customer', 'CheckoutController@add_customer');
Route::post('/save-checkout', 'CheckoutController@save_checkout');
Route::post('/customer-login', 'CheckoutController@customer_login');

//Order
Route::get('/view-order/{order_id}', 'OrderController@view_order');
Route::get('/del-order/{order_id}', 'OrderController@del_order');