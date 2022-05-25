package com.itwill.enbuyronment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
		)
public class InitTest {

	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	@Value("${db.mysqlurl}")
	private String DBURL;
	@Value("${db.username}")
	private String DBID;
	@Value("${db.password}")
	private String DBPW;
	
	@Inject
	private DataSource ds;
	@Inject
	private SqlSessionFactory sqlFactory;
	
	@Test
	public void DataSource객체확인() {
		log.info("dataSource = {}", ds);
	}
	
	@Test
	public void 디비연결테스트() {
		try {
			Connection con = ds.getConnection();
			log.info("con = {}", con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void MySQL연결테스트() {
		try(Connection con = DriverManager.getConnection(DBURL, DBID, DBPW)) {
			Class.forName(DRIVER);
			log.info("드라이버 로드 성공");
			log.info("con = {}", con);
			log.info("DB연결 성공");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
	
	@Test
	public void MyBatis연결테스트() {
		log.info("SqlSessionFactory = {}", sqlFactory);
		SqlSession session = sqlFactory.openSession();
		log.info("session = {}", session);
	}
	
}
