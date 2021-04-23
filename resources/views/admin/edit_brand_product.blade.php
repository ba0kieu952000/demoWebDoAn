@extends('admin_layout')
@section('admin_content')
<div class="row">
            <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            CẬP NHẬT DANH MỤC SẢN PHẨM
                        </header>
                        <div class="panel-body">
                            @foreach($edit_brand_product as $key => $value)
                            <div class="position-center">
                                <form role="form" action="{{URL::to('/update-brand-product/'.$value->brand_id)}}" method="post">
                                    {{csrf_field()}} <!-- Tăng độ bảo mật cho form -->
                                <div class="form-group">
                                    <label for="exampleInputName1">Tên danh mục:</label>
                                    <input type="text" value="{{$value->brand_name}}" name="brand_product_name" class="form-control" id="exampleInputName1" placeholder="Tên danh mục sản phẩm">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputDescription1">Mô tả danh mục:</label>
                                    <textarea style="resize: none" rows="5" name="brand_product_desc" type="password" class="form-control" id="exampleInputDescription1" placeholder="Mô tả danh mục sản phẩm">{{$value->brand_desc}}</textarea>
                                </div>
                                <center>
                                    <button type="submit" name="update_brand_product" class="btn btn-info">Cập nhật danh mục
                                    </button>
                                </center>
                            </form>
                            </div>
                            @endforeach
                        </div>
                    </section>
            </div>
</div>
@endsection