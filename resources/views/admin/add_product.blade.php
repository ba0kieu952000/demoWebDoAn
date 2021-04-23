@extends('admin_layout')
@section('admin_content')
<div class="row">
            <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            THÊM SẢN PHẨM
                        </header>
                        <div class="panel-body">
                            <?php
                                $message = Session::get('message');
                                if ($message ?? '') {
                                    echo "<span style='padding-left: 15px; color: blue'>".$message."</span>";
                                    Session::put('message', null);
                                }
                            ?>
                            <div class="position-center">
                                <form role="form" action="{{URL::to('/save-product')}}" method="post" enctype="multipart/form-data">
                                    {{csrf_field()}} <!-- Tăng độ bảo mật cho form -->
                                <div class="form-group">
                                    <label for="exampleInputName1">Tên sản phẩm:</label>
                                    <input type="text" name="product_name" class="form-control" id="exampleInputName1" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputName2">Giá sản phẩm:</label>
                                    <input type="text" name="product_price" class="form-control" id="exampleInputName2" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputName3">Hình ảnh sản phẩm:</label>
                                    <input type="file" name="product_image" class="form-control" id="exampleInputName3" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputName4">Mô tả sản phẩm:</label>
                                    <textarea required class="ckeditor" style="resize: none" rows="5" name="product_desc" type="password" class="form-control" id="exampleInputName4"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputName5">Nội dung sản phẩm:</label>
                                    <textarea required class="ckeditor" style="resize: none" rows="5" name="product_content" type="password" class="form-control" id="exampleInputName5"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="select1">Danh mục sản phẩm:</label>
                                    <select name="product_category" class="form-control  m-bot15" id="select1">
                                        @foreach($category_product as $key => $value)
                                            <option value="{{$value->category_id}}">{{$value->category_name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="select1">Thương hiệu sản phẩm:</label>
                                    <select name="product_brand" class="form-control  m-bot15" id="select1">
                                        @foreach($brand_product as $key => $value)
                                            <option value="{{$value->brand_id}}">{{$value->brand_name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="select1">Hiện thị:</label>
                                    <select name="product_status" class="form-control  m-bot15" id="select1">
                                        <option value="1">Hiển thị</option>
                                        <option value="0">Ẩn</option>
                                    </select>
                                </div>
                                <center>
                                    <button type="submit" name="add_product" class="btn btn-info">Thêm sản phẩm
                                    </button>
                                </center>
                            </form>
                            </div>

                        </div>
                    </section>

            </div>
</div>
@endsection