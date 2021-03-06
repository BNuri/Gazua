# Gazua

## 프로젝트 명
위치 기반 자동 경로 추천 플랫폼 by GAZUA

## 설명
다익스트라 및 TSP 알고리즘을 적용하여 최적의 여행 코스를 추천해주고, 추천 받은 코스를 공유하며 소통할 수 있는 SNS 서비스 입니다.

## 기간
2017.12 ~ 2018.03 (4명 팀프로젝트)

## 개발 내용
* 다익스트라와 TSP 알고리즘을 활용하여 최적의 경로 추천
* python의 Selenium, BeautifulSoup 라이브러리를 활용하여 NAVER 플레이스의 평점, 이미지, 후기 등 스크래핑
* Tour API를 활용하여 관광지, 음식점의 위치와 정보 데이터 입출력
* 카카오 지도 API를 활용하여 추천 경로, 마커를 표시
* 사진첨부 가능한 게시글 및 추천 경로 CRUD
* Ajax를 활용하여 좋아요, 팔로우 등 기능 구현
* AES를 활용하여 ID 암호화

## 맡은 역할

* AWS RDS에 DB서버 구축
* 선택한 노드를 모두 포함하는 최적 경로 도출 알고리즘 구축(TSP 알고리즘 적용)
* 장소에 대한 평점, 이미지, 후기 등 가중치로써 사용할 정보 긁어오는 스크래퍼 작성
* 지도 API에서 위치, 경로를 받아와 지도상에 마커로 표시
* Tour API에서 위치 관련 정보를 json 파일로 받아와 표시
* 글 작성, 사진 첨부 및 수정, 채팅 페이지의 클라이언트단과 서버단 작성
* 글 작성 및 수정시 position 속성을 이용하여 지도를 고정
* inline-block을 이용하여 탑바의 레이아웃 잡음
* Ajax Polling을 활용하여 회원간 채팅 기능 구축
