<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>enbuyronment</title>
    
    <!-- Vendor CSS-->
    <link href="/resources/product/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="/resources/product/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="/resources/product/css/main.css" rel="stylesheet" media="all">
</head>

<body>
    <div class="page-wrapper bg-gra-02 p-t-130 p-b-100">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title">상품 등록</h2>
                    <form method="post" enctype="multipart/form-data">
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">상품명</label><br>
                                    <input class="input--style-4" type="text" name="prodName">
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                        <div class="col-2">
                                <div class="input-group">
                                    <label class="label">가격</label><br>
                                    <input class="input--style-4" type="text" name="price">
                                </div>
                                <div class="input-group">
                                    <label class="label">수량</label><br>
                                    <input class="input--style-4" type="text" name="stock">
                                </div>
                            </div>
                       </div>
                       <div class="row row-space">
                        <div class="col-2">
                                <div class="input-group">
                                    <label class="label">상품이미지(대표)</label><br>
                                    <input class="input--style-4" type="file" name="prodImg" accept="image/*">
                                </div>
                            </div>
                        <div class="col-2">
                                <div class="input-group">
                                    <label class="label">상품이미지</label><br>
                                    <input class="input--style-4" type="file" name="prodImg" accept="image/*">
                                </div>
                            </div>
                       </div>
                       <div class="row row-space">
                        <div class="col-2">
                                <div class="input-group">
                                    <label class="label">상품이미지</label><br>
                                    <input class="input--style-4" type="file" name="prodImg" accept="image/*">
                                </div>
                            </div>
                        <div class="col-2">
                                <div class="input-group">
                                    <label class="label">상품이미지</label><br>
                                    <input class="input--style-4" type="file" name="prodImg" accept="image/*">
                                </div>
                            </div>
                       </div>
                       <div class="row row-space">
                        <div class="col-2">
                                <div class="input-group">
                                    <label class="label">상품설명</label><br>
                                    <input class="input--style-4" type="file" name="prodImg" accept="image/*">
                                </div>
                            </div>
                       </div>
                        <div class="input-group">
                            <label class="label">브랜드</label><br>
                            <div class="rs-select2 js-select-simple select--no-search">
                                <select name="brandName">
                                    <option disabled="disabled" selected="selected">브랜드를 선택하세요</option>
                                    <option value="동구밭">동구밭</option>
                                    <option value="톤28">톤28</option>
                                    <option value="슈가랩몰">슈가랩몰</option>
                                    <option value="자연상점">자연상점</option>
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                            <br>
                            <label class="label">용도</label><br>
                            <div class="rs-select2 js-select-simple select--no-search">
                                <select name="cateName">
                                    <option disabled="disabled" selected="selected">용도를 선택하세요</option>
                                    <option value="LIVING">LIVING</option>
                                    <option value="KITCHEN">KITCHEN</option>
                                    <option value="BATHROOM">BATHROOM</option>
                                    <option value="OFFICE">OFFICE</option>
                                    <option value="TRAVEL">TRAVEL</option>
                                    <option value="MARKET">MARKET</option>
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                        </div>
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue" type="submit">등록</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="/resources/product/vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="/resources/product/vendor/select2/select2.min.js"></script>
    <script src="/resources/product/vendor/datepicker/moment.min.js"></script>
    <script src="/resources/product/vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="/resources/product/js/global.js"></script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
<!-- end document-->