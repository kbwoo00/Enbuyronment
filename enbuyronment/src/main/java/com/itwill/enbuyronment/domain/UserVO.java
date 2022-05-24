package com.itwill.enbuyronment.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVO {
	
	private String uid;
	private String pass;
	private String newPass;
	private String email;
	private String name;
	private String phone;
	private String jumin;
	private Timestamp regdate;
	private Integer point;
	
	private String addrName;
	private String postcode;
	private String addr;
	private String dtAddr;
	private String exAddr;
}