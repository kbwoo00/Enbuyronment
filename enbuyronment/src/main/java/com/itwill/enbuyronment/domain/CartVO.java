package com.itwill.enbuyronment.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CartVO {
	private Integer cartNo;
	private String prodName;
	private String thumb;
	private String price;
	private String uid;
	private Integer prodNo;
	private Integer amount;
}
