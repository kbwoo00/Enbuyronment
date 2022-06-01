package com.itwill.enbuyronment.domain;

import java.sql.Timestamp;

import com.itwill.enbuyronment.domain.paging.Criteria;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO {

	private Integer boardNo;
	private String boardName;
	private String uid;
	private String writer;
	private String title;
	private String content;
	private Integer reRef;
	private Timestamp regdate;
	private Integer status;
}
