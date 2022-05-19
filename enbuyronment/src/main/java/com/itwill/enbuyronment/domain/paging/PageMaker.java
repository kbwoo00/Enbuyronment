package com.itwill.enbuyronment.domain.paging;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageMaker {
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int pageBlock = 5;
	Criteria cri;

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;

		// 계산
		calcPage();
	}

	private void calcPage() {
		endPage = (int) Math.ceil(cri.getPage() / (double) pageBlock) * pageBlock;

		startPage = endPage - pageBlock + 1;

		int tmpEndPage = (int) Math.ceil(totalCount / (double) cri.getPerDataCnt());
		if (endPage > tmpEndPage) {
			endPage = tmpEndPage;
		}

		prev = startPage == 1 ? false : true;

		next = endPage * cri.getPerDataCnt() >= totalCount ? false : true;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
}
