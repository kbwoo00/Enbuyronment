# Enbuyronment
환경돌이 팀의 친환경제품 쇼핑몰 'Enbuyronment' 프로젝트

## 목차
1. [서비스 소개](#서비스-소개)
2. [기술 스택](#기술-스택)
3. [제작 기간](#제작-기간)
4. [설계 (DB, API)](#설계-(DB,-API))
5. [브랜치, 커밋 규칙](#깃-커밋-규칙)
6. [프로젝트 화면](#프로젝트-화면)
7. [구현 목록](#구현-목록)

## 서비스 소개

## 기술 스택
### Front-end
- 프레임워크 및 라이브러리 : Bootstrap, jQuery,  jQuery.ajax
- 언어 : html, css, Javascript
### Back-end
- 프레임워크 및 라이브러리 : Spring, Mybatis
- DBMS : MySQL
- 언어 : Java(8), JSP
- 서버 : Tomcat
### Tools
- 협업툴 : slack, Google Docs, [Trello](https://trello.com/b/QGbyUTgI/%ED%8C%80%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8)
- IDE : Eclipse(STS)
### Version Control
- Git, Github

## 제작 기간
2022.05.02 ~ 2022.06.02

## 설계 (DB, API)
- ### [구글 docs로 작성한 HTTP API 설계](https://docs.google.com/document/d/13xFg6rb-ijE4OgyMSpTWLmfi9NQ_jvxKPYn1LjvEivw/edit?usp=sharing) 

## 깃 커밋 규칙
<img src="https://i.pinimg.com/originals/20/78/a9/2078a921387fb535735b19820175bacf.jpg](https://user-images.githubusercontent.com/59406944/169727919-7b4117d7-8138-44d3-a179-5a305bdc0bf2.png)" width="400" height="800">


## 프로젝트 화면



## 구현 목록
### Pages
 - [ ] - 메인페이지 
 * 회원
 - [X] - 로그인 페이지
 - [X] - 회원가입 페이지
 - [X] - 아이디 찾기 페이지
 - [X] - 비밀번호 찾기 페이지
 * 스토어
 - [X] - 장바구니 페이지
 - [X] - 상품 목록 페이지
 - [X] - 상품 상세 페이지
 - [ ] - 주문 하기 페이지
 - [ ] - 주문 확인 페이지
 * 마이페이지
 - [ ] - 회원 정보 조회 및 수정 페이지
 - [X] - 관심 상품 목록 페이지
 - [ ] - 내 리뷰 목록 페이지
 - [ ] - 주문 내역 페이지
 - [ ] - 리뷰 작성 페이지
 - [X] - 회원 탈퇴 페이지
 * 게시판
 - [ ] 게시글 목록 페이지
 - [ ] 게시글 상세 페이지
 * 관리자
 - [X] 회원 관리 페이지
 - [X] 상품 등록 페이지
 - [X] 상품 수정 페이지
 - [ ] 회원 주문내역 관리 페이지
 - [ ] 게시판 글 등록 페이지
 - [ ] 게시글 수정 페이지

### Function
 * 회원
 - [X] 로그인
 - [X] 회원가입
 - [X] 아이디 찾기
 - [X] 비밀번호 찾기
 * 스토어
 - [X] 장바구니 상품 담기, 수량 변경, 장바구니에서 상품 제거
 - [X] 관심 상품 등록, 삭제
 - [ ] 결제 기능
 * 마이페이지
 - [ ] - 회원 정보 수정
 - [X] - 관심 상품 제거, 장바구니에 담기
 - [ ] - 상품 리뷰 작성, 수정
 - [ ] - 리뷰 작성, 삭제
 - [ ] - 회원 정보 수정
 - [X] - 회원 탈퇴
 * 관리자
 - [X] - 회원 관리(조회, 삭제)
 - [X] - 상품 등록
 - [X] - 상품 수정
 - [ ] - 회원 주문 상태 변경 (배송처리)
 - [ ] - 게시글 작성
 - [ ] - 게시글 수정
