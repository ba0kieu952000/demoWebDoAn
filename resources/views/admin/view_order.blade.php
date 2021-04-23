@extends('admin_layout')
@section('admin_content')

    <div class="table-agile-info">
  <div class="panel panel-default">
    <div class="panel-heading">
      LIỆT KÊ CHI TIẾT HÓA ĐƠN
    </div>
    <div class="row w3-res-tb">
      <div class="col-sm-5 m-b-xs">
        {{-- <select class="input-sm form-control w-sm inline v-middle">
          <option value="0">Bulk action</option>
          <option value="1">Delete selected</option>
          <option value="2">Bulk edit</option>
          <option value="3">Export</option>
        </select>
        <button class="btn btn-sm btn-default">Apply</button> --}}
      </div>
      <div class="col-sm-4">
      </div>
      <div class="col-sm-3">
      </div>
    </div>
    <div class="table-responsive">
      <table class="table table-striped b-t b-light">
        <thead>
          <tr>
            <th>Tên sản phẩm</th>
            <th>Số lượng</th>
            <th>Giá</th>
            <th>Tổng tiền</th>
          </tr>
        </thead>
        <tbody>
            @foreach($order_details as $key => $value)
          <tr>
            <td>{{ $value->product_name }}</td>
            <td>{{ $value->product_sales_quantity }}</td>
            <th>{{ number_format($value->product_price) }}</th>
            <td>
                <b>
                <?php
					$subtotal = $value->product_price * $value->product_sales_quantity;
					echo number_format($subtotal). ' VNĐ';
				?>
                </b>
            </td>
          </tr>
            @endforeach
        </tbody>
      </table>
    </div>
    {{-- <footer class="panel-footer">
      <div class="row">
        
        <div class="col-sm-5 text-center">
          
        </div>
        <div class="col-sm-7 text-right text-center-xs">                
          <ul class="pagination pagination-sm m-t-none m-b-none">
            <li><a href=""><i class="fa fa-chevron-left"></i></a></li>
            <li><a href="">1</a></li>
            <li><a href="">2</a></li>
            <li><a href="">3</a></li>
            <li><a href="">4</a></li>
            <li><a href=""><i class="fa fa-chevron-right"></i></a></li>
          </ul>
        </div>
      </div>
    </footer> --}}
  </div>
</div>
    <br/>

    <div class="row">
        <div class="col-sm-5">
            <div class="table-agile-info">
                <div class="panel panel-default">
                    <div class="panel-heading">
                    Tài khoản
                    </div>
                    <div class="row w3-res-tb">
                    <div class="col-sm-5 m-b-xs">
                    </div>
                    <div class="col-sm-4">
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                        </div>
                    </div>
                    </div>
                    <div class="table-responsive">
                    <table class="table table-striped b-t b-light">
                        <tbody>
                            @foreach ($customer as $item)
                        <tr>
                            <td>Tên khách hàng:</td>
                            <td>{{ $item->customer_name }}</td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td>{{ $item->customer_email }}</td>
                        </tr>
                        <tr>
                            <td>Số điện thoại:</td>
                            <td>{{ $item->customer_phone }}</td>
                        </tr>   
                            @endforeach
                        </tbody>
                    </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-7">
            <div class="table-agile-info">
                <div class="panel panel-default">
                    <div class="panel-heading">
                    Thông tin đơn hàng
                    </div>
                    <div class="row w3-res-tb">
                    <div class="col-sm-5 m-b-xs">
                    </div>
                    <div class="col-sm-4">
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                        </div>
                    </div>
                    </div>
                    <div class="table-responsive">
                    <table class="table table-striped b-t b-light">
                        <tbody>
                            @foreach ($shipping as $item)
                        <tr>
                            <td>Tên người nhận:</td>
                            <td>{{ $item->shipping_name }}</td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td>{{ $item->shipping_email }}</td>
                        </tr>
                        <tr>
                            <td>Số điện thoại</td>
                            <td>{{ $item->shipping_phone }}</td>
                        </tr>
                        <tr>
                            <td>Địa chỉ:</td>
                            <td>{{ $item->shipping_address }}</td>
                        </tr>
                        <tr>
                            <td>Lời nhắn</td>
                            <td>{{ $item->shipping_message }}</td>
                        </tr>    
                            @endforeach
                        </tbody>
                    </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    



@endsection