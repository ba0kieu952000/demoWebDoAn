@extends('welcome')
@section('content')

    <section id="cart_items">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">Thanh toán giỏ hàng</li>
				</ol>
			</div><!--/breadcrums-->


			<div class="register-req">
				<p>Vùi lòng đăng nhập hoặc đăng ký để thành toán cũng như hưởng nhiều ưu đãi hơn!</p>
			</div><!--/register-req-->

			<div class="shopper-informations">
				<div class="row">
					
					<div class="col-sm-11 clearfix">
						<div class="bill-to">
							<p>Thông tin hóa đơn</p>
							<div class="form-one">
								<form action="{{URL::to('/save-checkout')}}" method="POST">
									{{ csrf_field() }}
									<input type="text" name="shipping_email" required placeholder="Email">
									<input type="text" name="shipping_name" required placeholder="Tên người nhận:">
									<input type="text" name="shipping_phone" required placeholder="Số điện thoại">
									<input type="text" name="shipping_address" required placeholder="Địa chỉ nhận hàng">
									<textarea name="shipping_message" placeholder="Lời nhắn dành cho shop về yêu cầu đơn hàng của bạn!" rows="16"></textarea>
									<input type="submit" name="send_order" value="Thanh toán" class="btn btn-primary btn-sm">
								</form>	
							</div>
						</div>
					</div>		
				</div>
			</div>
			<div class="review-payment">
				<h2>Xem lại giỏ hàng</h2>
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
	</section> <!--/#cart_items-->

@endsection