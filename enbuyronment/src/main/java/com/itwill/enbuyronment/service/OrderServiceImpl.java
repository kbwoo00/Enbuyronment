package com.itwill.enbuyronment.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwill.enbuyronment.persistence.OrderDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OrderServiceImpl implements OrderService {

	@Inject
	private OrderDAO orderDao;
}
