package com.itwill.enbuyronment.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserOrderVO {
	
	private String uid;
	private String orderNo;
	private String trackNo;
	private Timestamp orderDate;
	private String status;
	
	private Integer prodNo;
	private String prodName;
	private Integer price;
	private String thumb;

	private Integer amount;
}
