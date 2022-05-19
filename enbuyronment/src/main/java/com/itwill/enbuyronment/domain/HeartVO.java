package com.itwill.enbuyronment.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class HeartVO {
	private String uid;
	private Integer prodNo;
	
	private String thumb;
	private String prodName;
	private Integer price;
	private String brandName;
}
