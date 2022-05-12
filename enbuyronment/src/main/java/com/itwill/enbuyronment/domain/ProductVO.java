package com.itwill.enbuyronment.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductVO {

	private Integer prodNo;
	private String prodName;
	private Integer price;
	private Integer stock;
	
	private String filePath;
	private String thumb;
	private String prodImg2;
	private String prodImg3;
	private String prodImg4;
	private String script;
	
	private String cateName;
	private String brandName;
}
