package com.itwill.enbuyronment.service;

import com.itwill.enbuyronment.domain.HeartVO;

public interface HeartService {

	boolean isHeart(Integer prodNo, String uid);

	public void addProdToHeart(HeartVO heart);

}
