package com.itwill.enbuyronment.domain;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class Criteria {
	private int page;
	private int perDataCnt;

	public Criteria() {
		this.page = 1;
		this.perDataCnt = 10;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public void setPerDataCnt(int perDataCnt) {
		// 1페이지에 최대 100개 
		if (!(0 < perDataCnt && perDataCnt < 100)) {
			this.perDataCnt = 10;
			return;
		}

		this.perDataCnt = perDataCnt;
	}

	public int getPageStart() {
		return (this.page - 1) * perDataCnt;
	}


}