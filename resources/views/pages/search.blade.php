@extends('welcome')
@section('content')
<div class="features_items">
    <!--features_items-->
    <h2 class="title text-center">Kết quả tìm kiếm</h2>
    
    @foreach ($search_product as $key => $value)
    <div class="col-sm-4">
        <div class="product-image-wrapper">
            <div class="single-products">
                <div class="productinfo text-center">
                    <img src="{{URL::to('../public/uploads/product/'.$value->product_image)}}" alt="" />
                    <h2>{{number_format($value->product_price)}} VNĐ</h2>
                    <p><b>{!!$value->product_name!!}</b></p>
                    <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm Vào Giỏ Hàng</a>
                </div>
                <div class="product-overlay">
                    <div class="overlay-content">
                        <h2>{{number_format($value->product_price)}} VNĐ</h2>
                        <span style="display: block; padding-bottom: 15px">{!! $value->product_desc !!}</span>
                        <a href="{{URL::to('/chi-tiet-san-pham/'.$value->product_id)}}" class="btn btn-default add-to-cart"><i class="fa fa-search"></i>Xem Thông Tin Chi Tiết</a>
                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm Vào Giỏ Hàng</a>
                    </div>
                </div>
            </div>
            <div class="choose">
                <ul class="nav nav-pills nav-justified">
                    <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                    <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                </ul>
            </div>
        </div>
    </div>
    @endforeach

</div>
<!--features_items-->

@endsection