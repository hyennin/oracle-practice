@D:\3411\Oracle\20230616.sql

--초록색 플러스 버튼 누르고
--이름 정하기(대문자)
--사용자 이름(SYSTEM)
--비밀번호(1234)
--시스템에 접속 후
--다른 사용자 우클릭 사용자 생성 눌러서
--기본 테이블스페이스 USERS
--임시 테이블스페이스 TEMP
--탭에 부여된 롤 들어가서 CONNECT, RESOURCE 권한이 부여됨 체크
--탭에 할당량 가서 USERS에 할당량 10 단위 M
--탭에 SQL 가서 코드 복사해서 붙여넣고 시작하기
--
--시스템이랑 접속 끊고 다시 초록색 플러스 버튼 눌러서 만든 사용자 넣고 접속(이름에는 하이픈 X, 언더바 넣기)
--접속한 사용자 옆에 + 누르고 테이블 우클릭 해서 새 테이블 만들기
--컬럼 만들고 DDL 눌러서 코드 복사하고 확인 누르고 파일에 붙여넣기
--맨 앞줄에 DROP TABLE 테이블명 하면 실행할 때마다 테이블 삭제, 생성 가능
--
--왼쪽에 테이블 누르고 탭 중에 데이터 들어가서 초록색 플러스 버튼 클릭해서 데이터 넣기
--다 넣그면 변경사항 커밋(초록색 체크 버튼 누르기)하면 로그에 코드 뜸
--그거 붙여넣고 코드 보면 사용자 이름 잇는데 그건 지우고 저장하기, 따옴표도 빼기
--
--시퀀스키 설정(자동으로 값 넣어줌)
--왼쪽 밑에 시퀀스 우클릭 새 시퀀스해서 이름 대충 넣고 시작 어디부터, 증분 얼마나 할 건지 정하고 DDL 가서 코드 복사 후 확인
--테이블에 열 가서 연필 모양 누르고 시퀀스 연결할 열 누르고 밑에 ID열에서 시퀀스 설정 후 DDL에서 코드 복사 후 확인
--시퀀스키 코드도 앞에 DROP 넣어야댐
--
--포렌키 설정(딴데있는거랑 연결)
--테이블 우클릭 하고 편집에서 제약 조건 들어가기
--초록색 드랍버튼 누르고 외래키 제약 조건 들어가기
--테이블이랑 제약 조건 선택하고 DDL에서 코드 복사 후 확인
--포렌키 설정하려면 테이블 드랍 순서 중요
--참조할 테이블을 먼저 드랍 시키면 안댐