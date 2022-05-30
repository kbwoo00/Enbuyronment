package com.itwill.enbuyronment.domain;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderProdVO {
	private Integer opNo;
	private String orderNo;
	
	private Integer prodNo;
	private String prodName;
	private Integer price;
	private String thumb;
	private Integer totalPrice;
	private String brandName;

	private Integer amount;
}
