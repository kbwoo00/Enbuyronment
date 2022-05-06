package com.itwill.enbuyronment.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ProdService {

	//상품 등록
	public void prodUpload(MultipartHttpServletRequest request) throws Exception;
}
