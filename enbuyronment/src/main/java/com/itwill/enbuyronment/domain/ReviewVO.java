package com.itwill.enbuyronment.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewVO {

	private String uid;
	private String star;
	private String comment;
	private Timestamp regdate;
}
