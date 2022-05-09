<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>enbuyronment</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="/resources/main/image/x-icon"
	href="/resources/main/img/favicon.ico">
<link rel="stylesheet" href="/resources/product/css/main.css">
<%@include file="/WEB-INF/views/include/css.jsp"%>
</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>
<br><br><br>
	<div class="container">
    <div class="page-wrapper">
        <div class="wrapper">
            <div class="card card-4">
                <div class="card-body">
                <br>
                    <h2 class="title">상품 등록</h2><br><br>
                    <form method="post" enctype="multipart/form-data">
                        <div class="row row-space">
                            <div class="col-10">
                                <div class="input-group">
                                    <label class="label">상품명</label><br>
                                    <input class="reg_input" type="text" name="prodName">
                                </div>
                                <br>
                            </div>
                        </div>
                        <div class="row row-space">
                                <div class="input-group col-6">
                                    <label class="label">가격</label><br>
                                    <input class="reg_input" type="text" name="price">
                                </div>
                                <div class="input-group col-4">
                                    <label class="label">수량</label><br>
                                    <input class="reg_input" type="text" name="stock">
                                </div>
                            </div>
                            <br>
                       <br>
                       <div class="row row-space">
                        <div class="col-5">
                                <div class="input-group">
                                    <label class="label">상품이미지(대표)</label>
                                    <input class="input" type="file" name="prodImg" accept="image/*">
                                </div>
                            </div>
                        <div class="col-5">
                                <div class="input-group">
                                    <label class="label">상품이미지</label><br>
                                    <input class="input" type="file" name="prodImg" accept="image/*">
                                </div>
                            </div><br>
                       </div>
                       <div class="row row-space">
                        <div class="col-5">
                                <div class="input-group">
                                    <label class="label">상품이미지</label><br>
                                    <input class="input" type="file" name="prodImg" accept="image/*">
                                </div>
                            </div>
                        <div class="col-5">
                                <div class="input-group">
                                    <label class="label">상품이미지</label><br>
                                    <input class="input" type="file" name="prodImg" accept="image/*">
                                </div>
                            </div>
                       </div>
                       <div class="row row-space">
                        <div class="col-5">
                                <div class="input-group">
                                    <label class="label">상품설명</label><br>
                                    <input class="input" type="file" name="prodImg" accept="image/*">
                                </div>
                            </div>
                       </div>
                       <br>
                        <div class="input-group"><br>
                            <label class="label">브랜드</label>
                                <select class="select-group col-10" name="brandNo">
                                    <option disabled="disabled" selected="selected">브랜드를 선택하세요</option>
                                    <option value="동구밭">동구밭</option>
                                    <option value="톤28">톤28</option>
                                    <option value="슈가랩몰">슈가랩몰</option>
                                    <option value="자연상점">자연상점</option>
                                </select>
                            </div>
                            <br>
                            <div class="input-group"><br>
                            <label class="label">용도</label>
                                <select class="select-group col-10" name="cateNo">
                                    <option disabled="disabled" selected="selected">용도를 선택하세요</option>
                                    <option value="LIVING">LIVING</option>
                                    <option value="KITCHEN">KITCHEN</option>
                                    <option value="BATHROOM">BATHROOM</option>
                                    <option value="OFFICE">OFFICE</option>
                                    <option value="TRAVEL">TRAVEL</option>
                                    <option value="MARKET">MARKET</option>
                                </select>
                            </div>
                            <br>
                        <div class="btn_submit">
                            <button class="btn header-btn" type="submit" style="transform: translate(500px,0px);">등록</button>
                       </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
<%@include file="/WEB-INF/views/include/script.jsp"%>
<%@include file="/WEB-INF/views/include/header_script.jsp"%>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
<!-- end document-->