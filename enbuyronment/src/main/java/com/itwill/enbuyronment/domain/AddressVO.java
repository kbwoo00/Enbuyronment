package com.itwill.enbuyronment.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AddressVO {
	
	private Integer addrNo;
	private String addrName;
	private String postcode;
	private String addr;
	private String dtAddr;
	private String exAddr;
	private String uid;
}
