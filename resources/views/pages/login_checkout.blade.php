@extends('welcome')
@section('content')
	<?php
		
		$message = Session::get('message');
		//dd($message);
		if ($message != null) { ?>
			<script>alert("<?=$message?>")</script>
		<?php 
		Session::put('message',null);
		}
	?>
    <section id="form"><!--form-->
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>Đăng nhập</h2>
						<form action="{{URL::to('/customer-login')}}" method="POST">
							{{ csrf_field() }}
							<input type="email" name="customer_email" required placeholder="Tài khoản | Email" />
							<input type="password" name="customer_password" required placeholder="Mật khẩu" />
							<span>
								<input type="checkbox" class="checkbox"> 
								Duy trì đăng nhập
							</span>
							<button type="submit" class="btn btn-default">Đăng nhập</button>
						</form>
					</div><!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">HOẶC</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2>Đăng ký!</h2>
						<form action="{{URL::to('/add-customer')}}" method="POST">
							{{ csrf_field() }}
							<input type="text" name="customer_name" required placeholder="Họ và Tên"/>
							<input type="email" name="customer_email" required placeholder="Địa chỉ email"/>
							<input type="password" name="customer_password" required placeholder="Mật khẩu"/>
                            <input type="text" name="customer_phone" required placeholder="Số điện thoại"/>
							<button type="submit" class="btn btn-default">Đăng ký</button>
						</form>
					</div><!--/sign up form-->
				</div>
			</div>
	</section><!--/form-->

@endsection