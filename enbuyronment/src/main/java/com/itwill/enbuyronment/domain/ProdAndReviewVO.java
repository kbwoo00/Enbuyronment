package com.itwill.enbuyronment.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProdAndReviewVO{
	private Integer prodNo;
	private String prodName;
	private String thumb;
	
	private Integer reviewNo;
	private String uid;
	private String star;
	private String comment;
	private Timestamp regdate;

}
