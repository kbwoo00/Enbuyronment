package com.itwill.enbuyronment.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderVO {

	private Integer orderNo;
	private Timestamp orderDate;
	private List<CartVO> orderProd;
	
	private String uid;
	private String userName;
	private String email;
	private String phone;
	private Integer pointDown;
	
	private String postcode;
	private String addr;
	private String dtAddr;
	private String exAddr;
	private String request;
}
