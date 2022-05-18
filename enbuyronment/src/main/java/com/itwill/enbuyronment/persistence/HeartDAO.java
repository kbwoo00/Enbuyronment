package com.itwill.enbuyronment.persistence;

import com.itwill.enbuyronment.domain.HeartVO;

public interface HeartDAO {
	boolean isHeart(HeartVO vo);

	public void addProdToHeart(HeartVO heart);

	public void delProdFromHeart(HeartVO heart);
}
