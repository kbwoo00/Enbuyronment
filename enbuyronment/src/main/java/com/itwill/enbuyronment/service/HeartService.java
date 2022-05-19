package com.itwill.enbuyronment.service;

import java.util.List;

import com.itwill.enbuyronment.domain.HeartVO;

public interface HeartService {

	boolean isHeart(Integer prodNo, String uid);

	public void addProdToHeart(HeartVO heart);

	public void delProdFromHeart(HeartVO heart);
	
	public void delProdFromHeart(List<Integer> prodNoList, String uid);
	
	List<HeartVO> getHeartList(String uid);

}
