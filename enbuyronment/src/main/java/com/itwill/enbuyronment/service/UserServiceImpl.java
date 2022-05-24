package com.itwill.enbuyronment.service;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.itwill.enbuyronment.domain.AddressVO;
import com.itwill.enbuyronment.domain.ReviewVO;
import com.itwill.enbuyronment.domain.UserVO;
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
	public Integer findPw(UserVO vo) {
		log.info("findPw(vo)");

		UserVO voTmp = userDao.getUser(vo.getUid());
		
		log.info(voTmp+"");

		if (voTmp != null) {
			if (voTmp.getEmail().equals(vo.getEmail())) { // id와 email 모두 일치

				log.info("회원 확인됨, 임시비밀번호 생성");

				// 임시 비밀번호 생성
				int index = 0;
				char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E',
						'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
						'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q',
						'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };

				StringBuffer password = new StringBuffer();
				Random random = new Random();

				for (int i = 0; i < 8; i++) {
					double rd = random.nextDouble();
					index = (int) (charSet.length * rd);

					password.append(charSet[index]);
				}
				log.info("임시 비밀번호 : " + password);

				// 비밀번호 업데이트
				voTmp.setPass(password.toString());

				if (userDao.modPw(voTmp) == 1) {
					log.info("DB 비밀번호 업데이트 성공");

					// 메일보내기
					Properties props = new Properties();
					props.put("mail.smtp.host", "smtp.gmail.com");
					props.put("mail.smtp.port", "587"); // 구글 포트번호
					props.put("mail.smtp.auth", "true"); // 인증절차 필요함(앱 비밀번호)
					props.put("mail.smtp.starttls.enable", "true"); // TLS

					Session session = Session.getDefaultInstance(props, new Authenticator() {

						@Override
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(sender, appPw); // 구글계정 및 앱 비밀번호 체크
						}

					});

					try {
						Message msg = new MimeMessage(session);

						msg.setFrom(new InternetAddress(sender, "ENBUYRONMENT")); // 보내는 계정
						msg.addRecipient(Message.RecipientType.TO, new InternetAddress(vo.getEmail(), vo.getUid())); // 받는계정
						msg.setSubject("[ENBUYRONMENT] 임시 비밀번호입니다.");
						msg.setText("회원님의 임시 비밀번호는 " + password + " 입니다.");
						Transport.send(msg);

						log.info("메일 발송 완료");

					} catch (AddressException e) {
						e.printStackTrace();
					} catch (MessagingException e) {
						e.printStackTrace();
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}

					return 1;

				} else { // 비밀번호 업데이트 실패
					return 0;
				}

			} else { // email 입력 오류
				return 2;
			}

		} else { // id 입력 오류
			return 3;
		}
	}

	@Override
	public String checkEmail(String email) {
		
		String certiNum = String.valueOf(UUID.randomUUID()).substring(1,8); 

		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587"); // 구글 포트번호
		props.put("mail.smtp.auth", "true"); // 인증절차 필요함(앱 비밀번호)
		props.put("mail.smtp.starttls.enable", "true"); // TLS

		Session session = Session.getDefaultInstance(props, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, appPw); // 구글계정 및 앱 비밀번호 체크
			}

		});
		
		try {
			Message msg = new MimeMessage(session);

			msg.setFrom(new InternetAddress(sender, "ENBUYRONMENT")); // 보내는 계정
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); // 받는계정
			msg.setSubject("[ENBUYRONMENT] 인증번호 입니다.");
			msg.setText("회원님의 인증번호는 " + certiNum + " 입니다.");
			Transport.send(msg);

			log.info("메일 발송 완료");
			return certiNum;

		} catch (Exception e) {
			return "인증실패";
		}
		
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
	public List<ReviewVO> getReviewList(String uid) {
		return userDao.getReviewList(uid);
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

}
