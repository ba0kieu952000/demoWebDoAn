@extends('welcome')
@section('content')
    <h2 class="title text-center">ĐẶT HÀNG THÀNH CÔNG</h2>
    <div class="register-req">
				<p>Đơn hàng của bạn đã được hệ thống ghi nhân, 
                    chúng tôi sẽ sớm liên lạc cho bạn để giao hàng vào thành toán trực tiếp khi giao hàng.<br/><br/>
                    <b>Cảm ơn bạn vì đã tin tưởng và lựa chọn chúng tôi!</b></p>
	</div><!--/register-req-->
    <center>
    <button class="btn btn-primary"><a href="{{URL::to('/home')}}" class="active" style="color: white;">Quay về trang chủ</a></button>
    </center>
@endsection