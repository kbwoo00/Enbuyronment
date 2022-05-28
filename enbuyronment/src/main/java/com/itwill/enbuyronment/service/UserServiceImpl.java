package com.itwill.enbuyronment.service;

import java.util.List;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.itwill.enbuyronment.domain.AddressVO;
import com.itwill.enbuyronment.domain.ProdAndReviewVO;
import com.itwill.enbuyronment.domain.ReviewVO;
import com.itwill.enbuyronment.domain.UserVO;
import com.itwill.enbuyronment.domain.paging.Criteria;
import com.itwill.enbuyronment.persistence.UserDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@PropertySource("classpath:config.properties")
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO userDao;
	
	@Value("${mail.sender}")
	private String sender;
	
	@Value("${mail.apppw}")
	private String appPw;
	
	@Override
	public void join(UserVO vo) {
		userDao.join(vo);
	}
	
	@Override
	public UserVO login(UserVO vo) {
		return userDao.login(vo);
	}
	
	@Override
	public UserVO checkId(String uid) {
		return userDao.getUser(uid);
	}
	
	// 아이디 찾기
	@Override
	public String findId(UserVO vo) {
		log.info("findId(vo)");

		String id = userDao.findId(vo);
		String result = "";

		if (id != null) {
			result = "아이디는 " + id.substring(0, id.length() - 4) + "**** 입니다.";
		} else {
			result = "아이디가 존재하지 않습니다!";
		}

		log.info(result);

		return result;
	}

	// 비밀번호 찾기
	@Override
	public void updatePw(UserVO vo, String tempPass) {
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587"); // 구글 포트번호
		props.put("mail.smtp.auth", "true"); // 인증절차 필요함(앱 비밀번호)
		props.put("mail.smtp.starttls.enable", "true"); // TLS

		/* 이메일로 업데이트 된 비밀번호 보내기(멀티쓰레딩) */
		new Thread(new Runnable() {
			@Override
			public void run() {
				try {
					Thread.sleep(3000);
					Session session = Session.getDefaultInstance(props, new Authenticator() {
						@Override
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(sender, appPw); // 구글계정 및 앱 비밀번호 체크
						}
					});
					
					Message msg = new MimeMessage(session);

					msg.setFrom(new InternetAddress(sender, "ENBUYRONMENT")); // 보내는 계정
					msg.addRecipient(Message.RecipientType.TO, new InternetAddress(vo.getEmail(), vo.getUid())); // 받는계정
					msg.setSubject("[ENBUYRONMENT] 임시 비밀번호입니다.");
					msg.setText("회원님의 임시 비밀번호는 " + tempPass + " 입니다.");
					Transport.send(msg);

					log.info("메일 발송 완료");

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}).start();;
	}
	
	@Override
	public UserVO isExistUser(UserVO vo) {
		return userDao.getUser(vo.getUid());
	}
	@Override
	public Integer canModPw(UserVO vo) {
		return userDao.modPw(vo);
	}

	@Override
	public void checkEmail(String email, String certiNum) {

		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587"); // 구글 포트번호
		props.put("mail.smtp.auth", "true"); // 인증절차 필요함(앱 비밀번호)
		props.put("mail.smtp.starttls.enable", "true"); // TLS
		
		/*  회원인증 */
		new Thread(new Runnable() {
			@Override
			public void run() {
				try {
					Thread.sleep(5000);
					Session session = Session.getDefaultInstance(props, new Authenticator() {
						@Override
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(sender, appPw); // 구글계정 및 앱 비밀번호 체크
						}
					});
					
					Message msg = new MimeMessage(session);

					msg.setFrom(new InternetAddress(sender, "ENBUYRONMENT")); // 보내는 계정
					msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); // 받는계정
					msg.setSubject("[ENBUYRONMENT] 인증번호 입니다.");
					msg.setText("회원님의 인증번호는 " + certiNum + " 입니다.");
					Transport.send(msg);

					log.info("메일 발송 완료");
					return;
					
				} catch (Exception e) {
					return;
				}
				
			}
		}).start();;
	}

	// 회원정보 조회
	@Override
	public UserVO getUserInfo(String uid) {
		log.info("getUserInfo(uid) 호출");
		
		return userDao.getUser(uid);
	}

	// 회원 배송지정보(목록) 조회
	@Override
	public List<AddressVO> getUserAddr(String uid) {
		log.info("getUserAddr(uid) 호출");
		
		return userDao.getUserAddr(uid);
	}
	
	// 회원 배송지정보(1개) 가져오기
	@Override
	public AddressVO getOneAddr(String uid, String addrName) {
		log.info("getOndAddr(uid,addrName) 호출");
		
		return userDao.getOneAddr(uid, addrName);
	}

	@Override
	public void withdrawal(UserVO user) {
		userDao.delUser(user);
	}

	@Override
	public void modUser(UserVO user) {
		userDao.modUser(user);
	}

	@Override
	public List<ProdAndReviewVO> getReviewList(String uid, Criteria cri) {
		return userDao.getReviewList(uid, cri);
	}

	@Override
	public void addAddr(AddressVO addr, String uid) {
		addr.setUid(uid);
		userDao.addAddr(addr);
	}

	@Override
	public void delAddr(AddressVO addr) {
		userDao.delAddr(addr);
	}

	@Override
	public void modAddr(UserVO user) {
		userDao.toNormalAddr(user);
		userDao.toDefaultAddr(user);
	}

	@Override
	public int getReviewTotalCnt(String uid) {
		return userDao.getReviewTotalCnt(uid);
	}

	@Override
	public void delReview(Integer reviewNo) {
		userDao.delReview(reviewNo);
	}

	@Override
	public ProdAndReviewVO getReview(Integer reviewNo) {
		return userDao.getReview(reviewNo);
	}

	@Override
	public void modReview(ReviewVO review) {
		userDao.modReview(review);
	}

	@Override
	public boolean isPresentReview(ReviewVO review) {
		return userDao.isPresentReview(review);
	}

	@Override
	public void writeReview(ReviewVO review) {
		userDao.writeReview(review);
	}

	

}
