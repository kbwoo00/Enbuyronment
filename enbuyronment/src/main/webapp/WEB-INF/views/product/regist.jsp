<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<fieldset>
	<form method="post" enctype="multipart/form-data">
		상품명 : <input type="text" name="prodName"><br>
		가격 : <input type="number" name="price"><br>
		수량 : <input type="number" name="stock"><br>
		상품 이미지(대표) : <input type="file" name="prodImg" accept="image/*"><br>
		상품 이미지 : <input type="file" name="prodImg" accept="image/*"><br>
		상품 이미지 : <input type="file" name="prodImg" accept="image/*"><br>
		상품 이미지 : <input type="file" name="prodImg" accept="image/*"><br>
		상품설명 : <input type="file" name="prodImg" accept="image/*"><br>
		브랜드 : <select name="brandNo">
					<option value="0">브랜드를 선택하세요</option>
					<option value="1">동구밭</option>
					<option value="2">톤28</option>
					<option value="3">슈가랩몰</option>
					<option value="4">자연상점</option>
				</select><br>
		용도 : <select name="cateNo">
					<option value="0">용도를 선택하세요</option>
					<option value="1">LIVING</option>
					<option value="2">KITCHEN</option>
					<option value="3">BETHROOM</option>
					<option value="4">OFFICE</option>
					<option value="5">TRAVEL</option>
					<option value="6">MARKET</option>
				</select><br><br>
		<input type="submit" value="등록">
	</form>
</fieldset>

</body>
</html>