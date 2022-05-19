package com.itwill.enbuyronment.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwill.enbuyronment.domain.HeartVO;
import com.itwill.enbuyronment.persistence.HeartDAO;

@Service
public class HeartServiceImpl implements HeartService{

	@Inject
	private HeartDAO heartDao;

	@Override
	public boolean isHeart(Integer prodNo, String uid) {
		HeartVO vo = new HeartVO();
		vo.setProdNo(prodNo);
		vo.setUid(uid);
		return heartDao.isHeart(vo);
	}

	@Override
	public void addProdToHeart(HeartVO heart) {
		heartDao.addProdToHeart(heart);
	}

	@Override
	public void delProdFromHeart(HeartVO heart) {
		heartDao.delProdFromHeart(heart);
	}
	
	@Override
	public void delProdFromHeart(List<Integer> prodNoList, String uid) {
		for (Integer prodNo : prodNoList) {
			HeartVO heart = new HeartVO();
			heart.setProdNo(prodNo);
			heart.setUid(uid);
			heartDao.delProdFromHeart(heart);
		}
	}

	@Override
	public List<HeartVO> getHeartList(String uid) {
		return heartDao.getHeartList(uid);
	}
}
