@extends('welcome')
@section('content')
    @foreach($product as $key => $value)
	<div class="product-details"><!--product-details-->
		<div class="col-sm-5">
			<div class="view-product">
				<img src="{{URL::to('../public/uploads/product/'.$value->product_image)}}" alt="" />
				<h3>ZOOM</h3>
			</div>
			<div id="similar-product" class="carousel slide" data-ride="carousel">			
				<!-- Wrapper for slides -->
				<div class="carousel-inner">
					<div class="item active">
						<a href=""><img src="{{URL::to('../public/frontend/images/product-details/similar1.jpg')}}" alt=""></a>
						<a href=""><img src="{{URL::to('../public/frontend/images/product-details/similar2.jpg')}}" alt=""></a>
						<a href=""><img src="{{URL::to('../public/frontend/images/product-details/similar3.jpg')}}" alt=""></a>
					</div>				
				</div>

				<!-- Controls -->
				<a class="left item-control" href="#similar-product" data-slide="prev">
				    <i class="fa fa-angle-left"></i>
				</a>
				<a class="right item-control" href="#similar-product" data-slide="next">
				    <i class="fa fa-angle-right"></i>
				</a>
			</div>
		</div>
						
        <div class="col-sm-7">
			<div class="product-information"><!--/product-information-->
				<img src="{{URL::to('../public/frontend/images/product-details/new.jpg')}}" class="newarrival" alt="" />
				<h2>{!! $value->product_name !!}</h2>
				<p>Mã ID: {{ $value->product_id }}</p>
				<img src="{{URL::to('../public/frontend/images/product-details/rating.png')}}" alt="" /><br>
				<form action="{{URL::to('/save-cart')}}" method="POST">
                    {{ csrf_field() }}
                <span>
					<span>{{ number_format($value->product_price) }} VNĐ</span>
					<label>Số lượng:</label>
					<input type="number" name="qty" min="1" value="1" />
                    <input type="hidden" name="productid" value="{{ $value->product_id }}" />
					<button type="submit" class="btn btn-fefault cart">
						<i class="fa fa-shopping-cart"></i>
							Thêm vào giỏ hàng
					</button>
				</span>
                </form>
                <table>
                    <tr>
                        <td><p><b>Tình trạng: </b></p></td>
                        <td style="padding-left: 5px"><p>Còn hàng</p></td>
                    </tr>
                    <tr>
                        <td><p><b>Điều kiện:</b></p></td>
                        <td style="padding-left: 5px"><p>Hàng chính hãng</p></td>
                    </tr>
                    <tr>
                        <td><p><b>Danh mục: </b></p></td>
                        <td style="padding-left: 5px"><p>{{ $value->category_name }}</p></td>
                    </tr>
                    <tr>
                        <td><p><b>Thương hiệu:</b></p></td>
                        <td style="padding-left: 5px"><p>{{ $value->brand_name }}</p></td>
                    </tr>
                </table>
				<a href=""><img src="{{URL::to('../public/frontend/images/product-details/share.png')}}" class="share img-responsive"  alt="" /></a>
			</div><!--/product-information-->
		</div>
	</div><!--/product-details-->			
                    
        <div class="category-tab">
        <!--category-tab-->
        <div class="col-sm-12">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#cauhinh" data-toggle="tab">Cấu hình</a></li>
                <li><a href="#thongtin" data-toggle="tab">Thông tin chi tiết</a></li>
                <li><a href="#reviews" data-toggle="tab">Đánh giá</a></li>
            </ul>
        </div>
        <div class="tab-content">
            <div class="tab-pane fade active in" id="cauhinh">
                <div class="col-sm-12">
                    {!! $value->product_desc !!}
                </div>
            </div>

            <div class="tab-pane fade" id="thongtin">
                <div class="col-sm-12">
                    {!! $value->product_content !!}
                </div>
            </div>

            <div class="tab-pane fade" id="reviews" >
								<div class="col-sm-12">
									<ul>
										<li><a href=""><i class="fa fa-user"></i>EUGEN</a></li>
										<li><a href=""><i class="fa fa-clock-o"></i>12:41 PM</a></li>
										<li><a href=""><i class="fa fa-calendar-o"></i>31 DEC 2014</a></li>
									</ul>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
									<p><b>Write Your Review</b></p>
									
									<form action="#">
										<span>
											<input type="text" placeholder="Your Name"/>
											<input type="email" placeholder="Email Address"/>
										</span>
										<textarea name="" ></textarea>
										<b>Rating: </b> <img src="images/product-details/rating.png" alt="" />
										<button type="button" class="btn btn-default pull-right">
											Submit
										</button>
									</form>
								</div>
							</div>
        </div>
    </div>
	@endforeach	

    <div class="recommended_items">
    <!--recommended_items-->
    <h2 class="title text-center">Sản Phẩm Gợi Ý</h2>

    <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="item active">
            @foreach($recommend as $key => $value)
                <div class="col-sm-4">
                    <div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center">
                                <img src="{{URL::to('../public/uploads/product/'.$value->product_image)}}" alt="" />
                                <h2>{{ number_format($value->product_price) }} VNĐ</h2>
                                <p>{{ $value->product_name }}</p>
                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                            </div>

                        </div>
                    </div>
                </div>
            @endforeach
            </div>
            <div class="item">
                <div class="col-sm-4">
                    <div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center">
                                <img src="{{URL::to('../public/frontend/images/home/recommend1.jpg')}}" alt="" />
                                <h2>$56</h2>
                                <p>Easy Polo Black Edition</p>
                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
            <i class="fa fa-angle-left"></i>
        </a>
        <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
            <i class="fa fa-angle-right"></i>
        </a>
    </div>
</div>
<!--/recommended_items-->
@endsection
