@extends('admin_layout')
@section('admin_content')
<div class="row">
            <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            THÊM THƯƠNG HIỆU SẢN PHẨM
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
                                <form role="form" action="{{URL::to('/save-brand-product')}}" method="post">
                                    {{csrf_field()}} <!-- Tăng độ bảo mật cho form -->
                                <div class="form-group">
                                    <label for="exampleInputName1">Tên thương hiệu:</label>
                                    <input type="text" name="brand_product_name" class="form-control" id="exampleInputName1">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputDescription1">Mô tả thương hiệu:</label>
                                    <textarea style="resize: none" rows="5" name="brand_product_desc" type="password" class="form-control" id="exampleInputDescription1"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="select1">Hiện thị:</label>
                                    <select name="brand_product_status" class="form-control  m-bot15" id="select1">
                                        <option value="1">Hiển thị</option>
                                        <option value="0">Ẩn</option>
                                    </select>
                                </div>
                                <center>
                                    <button type="submit" name="add_brand_product" class="btn btn-info">Thêm danh mục
                                    </button>
                                </center>
                            </form>
                            </div>

                        </div>
                    </section>

            </div>
</div>
@endsection