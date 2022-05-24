package com.itwill.enbuyronment;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.Random;

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

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.itwill.enbuyronment.domain.AddressVO;
import com.itwill.enbuyronment.domain.UserVO;
import com.itwill.enbuyronment.persistence.UserDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@PropertySource("classpath:config.properties")
public class UserTest {

	@Inject
	private UserDAO userDao;
	
	@Value("${mail.sender}")
	private String sender;
	
	@Value("${mail.apppw}")
	private String appPw;
	
//	@Test
	public void 회원가입() {
		log.info("회원가입 테스트");
		UserVO user = new UserVO();
		user.setUid("test");
		user.setPass("password");
		user.setAddr("주소");
		user.setAddrName("설정 주소 닉네임");
		user.setDtAddr("상세주소");
		user.setEmail("test@email.com");
		user.setJumin("123456-1234567");
		user.setName("이름");
		user.setPostcode("150305");
		user.setPhone("010-1234-5678");
		
		userDao.join(user);
	}
//	@Test
	public void 아이디중복체크() {
		log.info("아이디 중복체크 테스트");
		String uid = "test";
		if(userDao.getUser(uid) == null) {
			log.info("중복 X");
		} else {
			log.info("중복된 아이디입니다.");
		}
	}
	
	//@Test
	public void 아이디찾기() {
		log.info("아이디찾기 테스트");

		UserVO vo = new UserVO();
		vo.setName("관리자");
		vo.setEmail("bss05007@naver.com");

		String id = userDao.findId(vo);
		String foundId = id.substring(0, id.length() - 4) + "****";

		log.info(foundId);
	}

	//@Test
	public void 비밀번호찾기() {
		log.info("비밀번호찾기 테스트");

		String uid = "admin123";
		String email = "bss05007@naver.com";

		UserVO vo = userDao.getUser(uid);

		if (vo != null) {
			if (vo.getEmail().equals(email)) { // id와 email 모두 일치

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
				vo.setPass(password.toString());

				if (userDao.modPw(vo) == 1) {
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
						msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email, uid)); // 받는 계정
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

				} else {
					log.info("DB 비밀번호 업데이트 실패, 돌아가기");
				}

			} else { // email 입력 오류
				log.info("이메일을 확인해주세요");
			}

		} else { // id 입력 오류
			log.info("비회원입니다");
		}
	}
	
//	@Test
	public void 회원탈퇴() {
		UserVO user = new UserVO();
		user.setUid("test");
		user.setPass("password");
		
		userDao.delUser(user);
	}
	
//	@Test
	public void 회원정보수정() {
		UserVO user = new UserVO();
		user.setUid("test");
		user.setPass("updatePass");
		user.setEmail("update@email.com");
		user.setName("변경이름");
		user.setPhone("010-1234-0000");
		
		userDao.modUser(user);
	}
	
//	@Test
	public void 배송지추가등록() {
		AddressVO addr = new AddressVO();
		addr.setUid("admin");
		addr.setAddrName("직장");
		addr.setPostcode("30539");
		addr.setAddr("서울 송파구 바람드리길 2");
		addr.setDtAddr("상세주소입력테스트");
		addr.setExAddr(" (풍납동)");
		addr.setReceiver("홍길동");
		addr.setStatus(1);
		userDao.addAddr(addr);
	}
}
