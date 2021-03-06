package com.itwill.enbuyronment.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderVO {

	private String orderNo;
	private Timestamp orderDate;
	private Integer totalPrice;
	
	private String uid;
	private String userName;
	private Integer pointDown;
	private Integer pointUp;
	
	private String addrName;
	private String postcode;
	private String addr;
	private String dtAddr;
	private String exAddr;
	private String receiver;
	private String phone;
	private String request;
	private String status;
	private String trackNo;
}
