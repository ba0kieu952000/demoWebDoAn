@extends('welcome')
@section('content')
    <section id="cart_items">
		{{-- <div class="container"> --}}
        <div>
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="{{URL::to('/')}}">Home</a></li>
				  <li class="active">Giỏ hàng</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed" >
					<thead>
						<tr class="cart_menu">
							<td class="image">Hình ảnh</td>
							<td class="description">Tên sản phẩm</td>
							<td class="price">Giá</td>
							<td class="quantity">Số lượng</td>
							<td class="total">Tổng tiền</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<?php
							$content = Cart::content();
						?>
						@foreach ($content as $item)
						<tr>
							<td class="cart_product">
								<a href=""><img src="{{URL::to('../public/uploads/product/'.$item->options->image)}}" width="50" alt=""></a>
							</td>
							<td class="cart_description">
								<h4><a href="">{{ $item->name }}</a></h4>
							</td>
							<td class="cart_price">
								<p> {{ number_format($item->price) }} <b><u>đ</u></b></p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<form action="{{URL::to('/update-cart-quantity')}}" method="POST">
									{{-- <a class="cart_quantity_up" href=""> + </a> --}}
									{{ csrf_field() }}
									<input type="hidden" value="{{ $item->rowId }}" name="rowId_cart">
									<input class="cart_quantity_input" type="text" name="quantity" value="{{ $item->qty }}" autocomplete="off" size="2">&nbsp;
									<input type="submit" name="update_qty" value="Cập nhật" class="btn btn-default btn-sm">
									{{-- <a class="cart_quantity_down" href=""> - </a> --}}
									</form>
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">
									<?php
										$subtotal = $item->price * $item->qty;
										echo number_format($subtotal). ' VNĐ';
									?>
								</p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href="{{URL::to('/delete-to-cart/'.$item->rowId)}}"><i class="fa fa-times"></i></a>
							</td>
						</tr>	
						@endforeach
					</tbody>
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->

	<section id="do_action">
			<div class="row">
				<div class="col-sm-6">
					<div class="total_area">
						<ul>
							<li>Tổng <span>{{Cart::priceTotal()}} VNĐ</span></li>
							<li>Thuế <span> 0 VNĐ</span></li>
							<li>Phí vận chuyển <span>Free</span></li>
							<li>Thành tiền <span>{{Cart::priceTotal()}} VNĐ</span></li>
						</ul>
							<a class="btn btn-default check_out" href="{{URL::to('/checkout')}}">Thanh toán</a>
					</div>
				</div>
			</div>
	</section><!--/#do_action-->
@endsection