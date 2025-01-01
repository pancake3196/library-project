# 온라인 도서관 서비스

## 소개
온라인 도서관 서비스는 사용자들이 도서관의 기능을 온라인으로 편리하게 이용할 수 있도록 설계된 웹 애플리케이션입니다.  
이 프로젝트는 회원가입부터 도서 대출, 반납까지 도서관의 주요 기능을 제공합니다.

---

## 주요 기능

### 1. 회원가입 및 로그인
- **회원가입**: 사용자는 필수 정보를 입력하여 계정을 생성할 수 있습니다.
- **로그인**: 기존 계정으로 로그인하여 서비스를 이용할 수 있습니다.
- **아이디/비밀번호 찾기**: 이메일 인증을 통해 잃어버린 계정 정보를 복구할 수 있습니다.  

#### 예시 화면
![회원가입 및 로그인 화면](https://github.com/pancake3196/library-project/blob/main/images/signup_login.png.png)


---

### 2. 도서 검색 및 대출
- **도서 검색**: 사용자는 키워드를 기반으로 원하는 도서를 검색할 수 있습니다.
- **도서 대출**: 대출 가능한 도서를 선택하여 대출 요청을 할 수 있습니다.  

#### 예시 화면
![대출 및 반납 시스템](https://github.com/pancake3196/library-project/blob/main/images/book_search.png.png)
---

### 3. 대출 및 반납 관리 시스템
- **대출 기록 확인**: 사용자는 자신이 대출한 도서 목록을 확인할 수 있습니다.
- **반납**: 대출한 도서를 반납 처리할 수 있습니다.
- **대출 상태 관리**: 대출 기한과 연체 여부를 자동으로 확인합니다.

#### 예시 화면
![도서 검색 화면](https://github.com/pancake3196/library-project/blob/main/images/loan_return.png.png)

---

## 기술 스택

### 개발 언어 및 기술
- **프론트엔드**: JSP (Java Server Pages)
- **백엔드**: Oracle Database, Java
- **데이터베이스**: Oracle
- **빌드 도구**: Maven

---

## 프로젝트 설치 및 실행

1. 저장소 클론  
   ```bash
   git clone https://github.com/your-repo/online-library.git
   cd online-library
