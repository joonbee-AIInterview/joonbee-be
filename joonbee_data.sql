/**
테스트 데이터 Member
*/
INSERT INTO member (id, email, password, thumbnail, login_type, del_flag, nick_name) 
VALUES 
('13b4a', 
'testuser1@example.com', 
'03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4', 
'https://i.ytimg.com/vi/_LVtaiW6j3U/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBN2WG-3sj3NY31Fxp4z0EnzyEnjQ', 
'KAKAO',
 false,
'패스트캠퍼스'
 );

/** 더미 데이터
like -> joonbee.like
*/
use joonbee;
DROP TABLE IF EXISTS interview_and_question, joonbee.like, interview, member, question, category;

CREATE TABLE IF NOT EXISTS `category` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `category_name` VARCHAR(255) NOT NULL,
    `category_level` tinyint(1) NOT NULL,
    `category_upper_id` INT NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `question` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `gpt_flag` tinyint(1) NOT NULL,
    `question_level` INT NOT NULL,
    `category_id` int not null,
    `writer` VARCHAR(255) NOT NULL,
    `question_content` TEXT NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    foreign key(`category_id`) REFERENCES `category`(`id`) on delete cascade
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `member` (
    id varchar(255) PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    thumbnail TEXT,
    login_type varchar(50),
    del_flag boolean not null default false,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `interview` (
  `id` bigint AUTO_INCREMENT,
  `member_id` varchar(255) NOT NULL,
  `count_flag` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `interview_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `like` (
	`member_id` varchar(255) not null,
	`interview_id` BIGINT not null,
	 primary key (`member_id`, `interview_id`),
	 foreign key (`member_id`) REFERENCES `member`(`id`) on delete cascade,
	 foreign key (`interview_id`) REFERENCES `interview`(`id`) on delete CASCADE
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `interview_and_question` (
  `interview_id` bigint NOT NULL,
  `question_id` bigint NOT NULL,
  `answer_content` text not null,
  PRIMARY KEY (`interview_id`,`question_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `interview_and_question_ibfk_1` FOREIGN KEY (`interview_id`) REFERENCES `interview` (`id`),
  CONSTRAINT `interview_and_question_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- CATEGORY
-- 메인 0
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('fe', 0, 0, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('be', 0, 0, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('language', 0, 0, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('mobile', 0, 0, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('etc', 0, 0, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('cs', 0, 0, NOW(), NOW());
-- FE 1
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('web', 1, 1, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('network', 1, 1, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('react', 1, 1, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('next', 1, 1, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('html/css', 1, 1, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('vue', 1, 1,NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('svelte', 1, 1,NOW(), NOW());
-- BE 2
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('db', 1, 2, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('spring framework', 1, 2, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('nest', 1, 2, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('node', 1, 2, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('msa', 1, 2, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('rebbitmq', 1, 2, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('redis', 1, 2, NOW(), NOW());
-- language 3
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('java', 1, 3, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('kotlin', 1, 3, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('typescript', 1, 3, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('javascript', 1, 3, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('delphi', 1, 3, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('c c++', 1, 3, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('c#', 1, 3, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('golang', 1, 3, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('swift', 1, 3, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('objective-c', 1, 3, NOW(), NOW());
-- mobile 4
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('aos', 1, 4, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('ios', 1, 4, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('flutter', 1, 4, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('react native', 1, 4, NOW(), NOW());
-- etc 5
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('git', 1, 5, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('team', 1, 5, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('project', 1, 5, NOW(), NOW());
-- cs 6
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('datastructure algorithm', 1, 6, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('network', 1, 6, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('operating system', 1, 6, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('virtual machine', 1, 6, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('docker', 1, 6, NOW(), NOW());
INSERT INTO category (category_name, category_level, category_upper_id, created_at, updated_at)VALUES ('computer architecture', 1, 6, NOW(), NOW());


-- QUESTION
-- Gpt 1
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at)
		VALUES ( 9, 1, 5, 'gpt', '리엑트 컴포넌트에 대해서 설명해보세요.', NOW(), NOW());
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at)
		VALUES ( 15, 1, 5, 'gpt', '스프링에 대해서 설명해보세요.', NOW(), NOW());
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at)
		VALUES ( 21, 1, 5, 'gpt', '객체지향에 대해서 설명해보세요.', NOW(), NOW());
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at)
		VALUES ( 33, 1, 5, 'gpt', 'flutter가 어떤 언어 기반인지 설명해보세요.', NOW(), NOW());
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at)
		VALUES ( 37, 1, 5, 'gpt', '팀프로젝트 시 가장 먼저 팀장이 해야할일이 무엇인지 설명해보세요.', NOW(), NOW());
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at)
		VALUES ( 42, 1, 5, 'gpt', 'docker 컨테이너가 올라가는 원리에 대해서 설명해보세요.', NOW(), NOW());
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at)
		VALUES ( 42, 1, 5, 'gpt', 'docker-compose에 관해서 설명해보세요.', NOW(), NOW());
-- 사람 0
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at)
		VALUES ( 18, 0, 5, '송재근', 'msa 트랜젝션 과정에 대해 설명해보세요.', NOW(), NOW());
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at)
		VALUES ( 38, 0, 5, '송재근', '이진탐색을 자바로 구현해보세요.', NOW(), NOW());
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at)
		VALUES ( 35, 0, 5, '이찬영', '깃허브 사용시 형상관리를 어떻게하는지 예시를 들어주세요.', NOW(), NOW());
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at)
		VALUES ( 32, 0, 5, '권범준', 'ios constuctor에대해서 설명해보세요.', NOW(), NOW());
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at)
		VALUES ( 21, 0, 5, '김재우', '코틀린의 DI에대해서 설명해보세요.', NOW(), NOW());
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at)
		VALUES ( 14, 0, 5, '김재우', 'RDBMS와 NoSQL 차이에 대해서 설명해보세요.', NOW(), NOW());
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at)
		VALUES ( 12, 0, 5, '권범준', 'vue 컴포넌트에 대해서 설명해보세요.', NOW(), NOW());
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at)
		VALUES ( 14, 0, 5, '김재우', 'index의 동작원리를 설명하세요.', NOW(), NOW());
        
        
-- MEMBER
INSERT INTO member (id, email, password, thumbnail, login_type, del_flag, created_at, updated_at)
		VALUES ( '1', '권범준@gmail.com', 'qwe123', '권범준 썸네일.png', 'KAKAO', false, NOW(), NOW());
INSERT INTO member (id, email, password, thumbnail, login_type, del_flag, created_at, updated_at)
		VALUES ( '2', '이찬영@gmail.com', 'qwe123', '권범준 썸네일.png', 'GOOGLE', false, NOW(), NOW());
INSERT INTO member (id, email, password, thumbnail, login_type, del_flag, created_at, updated_at)
		VALUES ( '3', '송재근@gmail.com', 'qwe123', '권범준 썸네일.png', 'NAVER', false, NOW(), NOW());
INSERT INTO member (id, email, password, thumbnail, login_type, del_flag, created_at, updated_at)
		VALUES ( '4', '김재우@gmail.com', 'qwe123', '권범준 썸네일.png', 'KAKAO', false, NOW(), NOW());
INSERT INTO member (id, email, password, thumbnail, login_type, del_flag, created_at, updated_at)
		VALUES ( '5', '최주호@gmail.com', 'qwe123', '권범준 썸네일.png', 'GOOGLE', false, NOW(), NOW());


-- INTERVIEW
-- 1 ~ 5
INSERT INTO interview (member_id, count_flag, created_at, updated_at) 
	VALUES ( '1', 5, NOW(), NOW());
INSERT INTO interview (member_id,  count_flag, created_at, updated_at) 
	VALUES ( '1', 3, NOW(), NOW());
INSERT INTO interview (member_id, count_flag, created_at, updated_at) 
	VALUES ( '1', 2, NOW(), NOW());
INSERT INTO interview (member_id, count_flag, created_at, updated_at) 
	VALUES ( '1', 1, NOW(), NOW());
INSERT INTO interview (member_id, count_flag, created_at, updated_at) 
	VALUES ( '1', 0, NOW(), NOW());
-- 6 ~ 9
INSERT INTO interview (member_id, count_flag, created_at, updated_at) 
	VALUES ( '2', 1, NOW(), NOW());
INSERT INTO interview (member_id, count_flag, created_at, updated_at) 
	VALUES ( '2', 4, NOW(), NOW());
INSERT INTO interview (member_id, count_flag, created_at, updated_at) 
	VALUES ( '2', 4, NOW(), NOW());
INSERT INTO interview (member_id, count_flag, created_at, updated_at) 
	VALUES ( '2', 3, NOW(), NOW());
-- 10 ~ 12
INSERT INTO interview (member_id, count_flag, created_at, updated_at) 
	VALUES ( '3', 5, NOW(), NOW());
INSERT INTO interview (member_id, count_flag, created_at, updated_at) 
	VALUES ( '3', 5, NOW(), NOW());
INSERT INTO interview (member_id, count_flag, created_at, updated_at) 
	VALUES ( '3', 4, NOW(), NOW());
-- 13 ~ 22
INSERT INTO interview (member_id, count_flag, created_at, updated_at) 
	VALUES ( '4', 3, NOW(), NOW());
INSERT INTO interview (member_id, count_flag, created_at, updated_at) 
	VALUES ( '4', 5, NOW(), NOW());
INSERT INTO interview (member_id, count_flag, created_at, updated_at) 
	VALUES ( '4', 5, NOW(), NOW());
INSERT INTO interview (member_id, count_flag, created_at, updated_at) 
	VALUES ( '4', 1, NOW(), NOW());
INSERT INTO interview (member_id, count_flag, created_at, updated_at) 
	VALUES ( '4', 1, NOW(), NOW());
INSERT INTO interview (member_id, count_flag, created_at, updated_at) 
	VALUES ( '4', 0, NOW(), NOW());
INSERT INTO interview (member_id, count_flag, created_at, updated_at) 
	VALUES ( '4', 4, NOW(), NOW());
INSERT INTO interview (member_id, count_flag, created_at, updated_at) 
	VALUES ( '4', 5, NOW(), NOW());
INSERT INTO interview (member_id, count_flag, created_at, updated_at) 
	VALUES ( '4', 3, NOW(), NOW());
INSERT INTO interview (member_id, count_flag, created_at, updated_at) 
	VALUES ( '4', 2, NOW(), NOW());
-- 23 ~ 26
INSERT INTO interview (member_id, count_flag, created_at, updated_at) 
	VALUES ( '5', 5, NOW(), NOW());
INSERT INTO interview (member_id, count_flag, created_at, updated_at) 
	VALUES ( '5', 5, NOW(), NOW());
INSERT INTO interview (member_id, count_flag, created_at, updated_at) 
	VALUES ( '5', 4, NOW(), NOW());
INSERT INTO interview (member_id, count_flag, created_at, updated_at) 
	VALUES ( '5', 2, NOW(), NOW());


-- LIKE 3 2 5 3 4
INSERT INTO joonbee.like (member_id, interview_id) VALUES ( '1', 6);
INSERT INTO joonbee.like (member_id, interview_id) VALUES ( '1', 10);
INSERT INTO joonbee.like (member_id, interview_id) VALUES ( '1', 25);

INSERT INTO joonbee.like (member_id, interview_id) VALUES ( '2', 25);
INSERT INTO joonbee.like (member_id, interview_id) VALUES ( '2', 14);

INSERT INTO joonbee.like (member_id, interview_id) VALUES ( '3', 1);
INSERT INTO joonbee.like (member_id, interview_id) VALUES ( '3', 3);
INSERT INTO joonbee.like (member_id, interview_id) VALUES ( '3', 7);
INSERT INTO joonbee.like (member_id, interview_id) VALUES ( '3', 25);
INSERT INTO joonbee.like (member_id, interview_id) VALUES ( '3', 20);

INSERT INTO joonbee.like (member_id, interview_id) VALUES ( '4', 1);
INSERT INTO joonbee.like (member_id, interview_id) VALUES ( '4', 25);
INSERT INTO joonbee.like (member_id, interview_id) VALUES ( '4', 16);

INSERT INTO joonbee.like (member_id, interview_id) VALUES ( '5', 2);
INSERT INTO joonbee.like (member_id, interview_id) VALUES ( '5', 9);
INSERT INTO joonbee.like (member_id, interview_id) VALUES ( '5', 16);
INSERT INTO joonbee.like (member_id, interview_id) VALUES ( '5', 22);


-- interview_and_question
INSERT INTO interview_and_question (interview_id, question_id, answer_content) VALUES ( 1, 1, 'answer_content1');
INSERT INTO interview_and_question (interview_id, question_id, answer_content) VALUES ( 4, 6, 'answer_content2');
INSERT INTO interview_and_question (interview_id, question_id, answer_content) VALUES ( 7, 3, 'answer_content3');
INSERT INTO interview_and_question (interview_id, question_id, answer_content) VALUES ( 10, 4, 'answer_content4');
INSERT INTO interview_and_question (interview_id, question_id, answer_content) VALUES ( 13, 4, 'answer_content5');
INSERT INTO interview_and_question (interview_id, question_id, answer_content) VALUES ( 16, 2, 'answer_content6');
INSERT INTO interview_and_question (interview_id, question_id, answer_content) VALUES ( 19, 11, 'answer_content7');
INSERT INTO interview_and_question (interview_id, question_id, answer_content) VALUES ( 22, 12, 'answer_content8');
INSERT INTO interview_and_question (interview_id, question_id, answer_content) VALUES ( 25, 13, 'answer_content9');
INSERT INTO interview_and_question (interview_id, question_id, answer_content) VALUES ( 2, 10, 'answer_content10');
INSERT INTO interview_and_question (interview_id, question_id, answer_content) VALUES ( 20, 14, 'answer_content11');


/** 
 * 실 서비스용 Question 더미 데이터 
 */
INSERT INTO category (category_name, category_level, category_upper_id)VALUES 
    -- 분류 (6 ea)
    ('fe', 0, 0), ('be', 0, 0), ('language', 0, 0), ('mobile', 0, 0), ('etc', 0, 0), ('cs', 0, 0),
    -- fe 1 (7 ea)
    ('web', 1, 1), ('network', 1, 1), ('react', 1, 1), ('nextjs', 1, 1), ('html/css', 1, 1), ('vuejs', 1, 1), ('svelte', 1, 1),
    -- be 2 (7 ea)
    ('db', 1, 2), ('spring framework', 1, 2), ('nestjs', 1, 2), ('nodejs', 1, 2), ('msa', 1, 2), ('rebbitmq', 1, 2), ('redis', 1, 2),
    -- language 3 (10 ea)
    ('java', 1, 3), ('kotlin', 1, 3), ('typescript', 1, 3), ('javascript', 1, 3), ('delphi', 1, 3), ('c c++', 1, 3), ('c#', 1, 3), ('golang', 1, 3), ('swift', 1, 3), ('objective-c', 1, 3),
    -- mobile 4 (4 ea)
    ('aos', 1, 4), ('ios', 1, 4), ('flutter', 1, 4), ('react native', 1, 4),
    -- etc 5 (3 ea)
    ('git', 1, 5), ('team', 1, 5), ('project', 1, 5),
    -- cs 6 (6 ea)
    ('datastructure algorithm', 1, 6), ('operating system', 1, 6), ('docker', 1, 6), ('virtual machine', 1, 6), ('network', 1, 6), ('computer architecture', 1, 6)
;
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content) values
    -- check
    -- fe (web 7, 14 ea)
    (7, 1, 5, 'gpt', 'HTTP와 HTTPS의 차이점은 무엇인가요?'), (7, 1, 5, 'gpt', 'GET과 POST 메서드의 차이는 무엇인가요?'), (7, 1, 5, 'gpt', '웹 브라우저의 캐싱이란 무엇인가요?'), (7, 1, 5, 'gpt', '쿠키와 세션의 차이는 무엇인가요?'), (7, 1, 5, 'gpt', 'CORS (Cross-Origin Resource Sharing)가 무엇이며 왜 필요한가요?'),
    (7, 1, 5, 'gpt', 'RESTful API와 GraphQL의 차이점은 무엇인가요?'), (7, 1, 5, 'gpt', '웹 보안의 기본 원칙은 어떤 것이 있나요?'), (7, 1, 5, 'gpt', 'XSS (Cross-Site Scripting)와 CSRF (Cross-Site Request Forgery)의 개념을 설명해보세요.'), (7, 1, 5, 'gpt', '웹 성능 최적화를 위해 어떤 기술이 사용될 수 있나요?'), (7, 1, 5, 'gpt', '웹 애플리케이션 로드 타임을 개선하기 위한 방법은 무엇인가요?'),
    (7, 1, 5, 'gpt', '웹 페이지 로딩 시간을 단축하기 위한 기술과 전략은 어떤 것이 있나요?'), (7, 1, 5, 'gpt', 'HTTP/2와 HTTP/3의 주요 특징은 무엇인가요?'), (7, 1, 5, 'gpt', '웹 접근성 (Web Accessibility)이 중요한 이유는 무엇인가요?'), (7, 1, 5, 'gpt', '웹 표준과 웹 접근성 지침을 준수하기 위한 방법은 무엇인가요?'),
    -- fe (network 8, 20 ea)
    (8, 1, 5, 'gpt', 'OSI 모델과 TCP/IP 모델의 차이는 무엇인가요?'), (8, 1, 5, 'gpt', 'TCP와 UDP의 차이점을 설명해보세요.'), (8, 1, 5, 'gpt', 'IP 주소와 포트 번호의 역할을 설명해보세요.'), (8, 1, 5, 'gpt', '서브넷 마스크의 목적은 무엇이며 어떻게 사용되나요?'), (8, 1, 5, 'gpt', '라우터와 스위치의 역할과 차이를 설명해보세요.'),
    (8, 1, 5, 'gpt', '네트워크 토폴로지의 주요 종류 중 몇 가지를 언급해보세요.'), (8, 1, 5, 'gpt', 'ARP (Address Resolution Protocol)의 역할은 무엇이며 어떻게 작동하나요?'), (8, 1, 5, 'gpt', 'ICMP (Internet Control Message Protocol)의 주요 용도는 무엇인가요?'), (8, 1, 5, 'gpt', 'DNS (Domain Name System)의 역할과 동작 원리를 설명해보세요.'), (8, 1, 5, 'gpt', 'IP 주소의 종류 중 IPv4와 IPv6의 차이점은 무엇인가요?'),
    (8, 1, 5, 'gpt', '서브넷팅 (Subnetting)이 무엇이고 어떻게 구현하는지 설명해보세요.'), (8, 1, 5, 'gpt', 'DHCP (Dynamic Host Configuration Protocol)의 역할을 설명해보세요.'), (8, 1, 5, 'gpt', 'NAT (Network Address Translation)의 목적과 종류를 언급해보세요.'), (8, 1, 5, 'gpt', 'VLAN (Virtual LAN)이 무엇이며 어떻게 사용되나요?'), (8, 1, 5, 'gpt', '포트 포워딩 (Port Forwarding)이 무엇이고 언제 사용되나요?'),
    (8, 1, 5, 'gpt', '네트워크 보안에서 방화벽 (Firewall)의 역할을 설명해보세요.'), (8, 1, 5, 'gpt', 'VPN (Virtual Private Network)의 작동 원리와 사용 사례를 설명해보세요.'), (8, 1, 5, 'gpt', 'OSI 모델의 각 계층별 주요 프로토콜을 몇 가지 언급해보세요.'), (8, 1, 5, 'gpt', '스위치에서 MAC 주소 테이블 (MAC Address Table)의 역할을 설명해보세요.'), (8, 1, 5, 'gpt', '라우팅 (Routing)과 스위칭 (Switching)의 차이점을 설명해보세요.'),
    -- fe (react 9, 64 ea)
    (9, 1, 5, 'gpt', 'React의 주요 특징은 무엇인가요?'), (9, 1, 5, 'gpt', 'Virtual DOM이 무엇이며 어떻게 작동하나요?'), (9, 1, 5, 'gpt', 'React 컴포넌트란 무엇이며 어떻게 만들죠?'), (9, 1, 5, 'gpt', 'JSX란 무엇이며 어떻게 사용하나요?'), (9, 1, 5, 'gpt', 'React에서 상태(state)와 속성(props)의 차이는 무엇인가요?'),
    (9, 1, 5, 'gpt', 'React 생명주기 메서드의 종류와 각각의 역할은 무엇인가요?'), (9, 1, 5, 'gpt', 'React에서 이벤트 처리 방법을 설명해보세요.'), (9, 1, 5, 'gpt', '조건부 렌더링을 구현하는 방법은 무엇인가요?'), (9, 1, 5, 'gpt', 'React Router를 어떻게 설정하고 사용하나요?'), (9, 1, 5, 'gpt', '컴포넌트 간의 데이터 전달 방법은 어떤 것이 있나요?'),
    (9, 1, 5, 'gpt', '상태(state)를 업데이트하는 방법은 무엇이 있나요?'), (9, 1, 5, 'gpt', 'React의 키(key)의 역할은 무엇이며 왜 중요한가요?'), (9, 1, 5, 'gpt', '컴포넌트 스타일링 방법은 어떤 것이 있나요?'), (9, 1, 5, 'gpt', 'React Hooks는 무엇이며 어떻게 사용하나요?'), (9, 1, 5, 'gpt', 'useEffect 훅의 사용 사례와 주요 기능은 무엇인가요?'),
    (9, 1, 5, 'gpt', 'useContext를 사용하여 상태 관리하는 방법은 무엇인가요?'), (9, 1, 5, 'gpt', 'Redux의 액션, 리듀서, 스토어의 역할을 설명해보세요.'), (9, 1, 5, 'gpt', 'Redux Thunk와 Redux Saga의 차이점은 무엇인가요?'), (9, 1, 5, 'gpt', 'React에서 성능 최적화를 위한 방법은 어떤 것이 있나요?'), (9, 1, 5, 'gpt', 'React의 Portals는 무엇이며 어떻게 사용하나요?'),
    (9, 1, 5, 'gpt', 'React와 SEO (Search Engine Optimization)를 어떻게 연동하나요?'), (9, 1, 5, 'gpt', 'React에서 비동기 데이터 가져오는 방법은 무엇인가요?'), (9, 1, 5, 'gpt', 'React의 Error Boundary는 무엇이며 어떻게 사용하나요?'), (9, 1, 5, 'gpt', 'React의 고차 컴포넌트 (Higher-Order Components)에 대해 설명해보세요.'), (9, 1, 5, 'gpt', 'React의 렌더 프롭 (Render Props) 패턴은 무엇이며 어떻게 사용하나요?'),
    (9, 1, 5, 'gpt', 'React와 Webpack의 관계는 무엇이며 어떻게 설정하나요?'), (9, 1, 5, 'gpt', '서버 사이드 렌더링 (Server-Side Rendering, SSR)이 무엇이며 어떻게 구현하나요?'), (9, 1, 5, 'gpt', 'React와 테스트 (테스팅)의 연동 방법은 어떤 것이 있나요?'), (9, 1, 5, 'gpt', 'React의 컴포넌트 통신 패턴 중 Context API를 사용해본 경험을 공유하세요.'), (9, 1, 5, 'gpt', 'React의 Strict 모드는 어떤 역할을 하나요?'),
    (9, 1, 5, 'gpt', 'React DevTools를 사용하는 방법은 무엇이며 어떤 기능이 있나요?'), (9, 1, 5, 'gpt', 'React에서 메모이제이션을 구현하는 방법을 설명해보세요.'), (9, 1, 5, 'gpt', 'React에서 SSR을 통해 데이터 프리페칭 (데이터 미리 가져오기)을 어떻게 수행하나요?'), (9, 1, 5, 'gpt', 'React에서 컴포넌트 코드 스플리팅을 어떻게 설정하고 사용하나요?'), (9, 1, 5, 'gpt', 'React Native와 React의 차이점은 무엇인가요?'),
    (9, 1, 5, 'gpt', 'React의 렌더링 최적화를 위한 메모이제이션 라이브러리 중 useMemo와 useCallback의 차이는 무엇인가요?'), (9, 1, 5, 'gpt', 'React에서 컴포넌트의 키(key)가 중요한 이유를 설명해보세요.'), (9, 1, 5, 'gpt', 'React에서 리액트 포털 (React Portal)을 사용하는 상황을 예를 들어 설명해보세요.'), (9, 1, 5, 'gpt', 'React에서 라이프사이클 메서드의 사용을 피하는 대신 훅을 사용하는 이유는 무엇인가요?'), (9, 1, 5, 'gpt', 'React에서 컴포넌트의 리렌더링이 발생하는 상황을 설명해보세요.'),
    (9, 1, 5, 'gpt', 'React에서 클래스형 컴포넌트 대신 함수형 컴포넌트를 권장하는 이유는 무엇인가요.'), (9, 1, 5, 'gpt', 'React에서 자식 컴포넌트가 부모 컴포넌트에 데이터를 전달하는 방법은 어떤 것이 있나요?'), (9, 1, 5, 'gpt', 'React에서 컴포넌트가 언마운트될 때 리소스 해제를 어떻게 처리하나요?'), (9, 1, 5, 'gpt', 'React에서 컴포넌트의 렌더링을 방지하기 위한 방법은 어떤 것이 있나요?'), (9, 1, 5, 'gpt', 'React에서 불변성 (Immutability)을 유지하는 이유를 설명해보세요.'),
    (9, 1, 5, 'gpt', 'React에서 컴포넌트의 상태를 다른 컴포넌트와 공유하려면 어떻게 해야 하나요?'), (9, 1, 5, 'gpt', 'React에서 특정 컴포넌트를 리렌더링하는 방법은 무엇인가요?'), (9, 1, 5, 'gpt', 'React에서 리듀서 (Reducer) 함수의 순수성에 대해 설명해보세요.'), (9, 1, 5, 'gpt', 'React의 클래스 컴포넌트와 함수 컴포넌트 간에 어떤 차이가 있을 수 있나요?'), (9, 1, 5, 'gpt', 'React에서 에러 경계 (Error Boundary) 컴포넌트의 사용 사례를 예를 들어 설명해보세요.'),
    (9, 1, 5, 'gpt', 'React에서 메모이제이션 (Memoization)을 사용하여 성능을 최적화하는 방법은 무엇인가요?'), (9, 1, 5, 'gpt', 'React에서 코드 스플리팅 (Code Splitting)을 어떻게 설정하고 사용하나요?'), (9, 1, 5, 'gpt', 'React에서 트랜스파일링 (Transpiling)과 번들링 (Bundling)의 역할은 무엇인가요?'), (9, 1, 5, 'gpt', 'React에서 스타일링 라이브러리 중 CSS Modules과 Styled Components의 차이는 무엇인가요?'), (9, 1, 5, 'gpt', 'React에서 리덕스 (Redux)에서 액션과 리듀서의 관계를 설명해보세요.'),
    (9, 1, 5, 'gpt', 'React에서 리덕스 (Redux)의 비동기 액션을 처리하는 방법은 무엇인가요?'), (9, 1, 5, 'gpt', 'React에서 Jest를 사용하여 비동기 코드를 테스트하는 방법은 무엇인가요?'), (9, 1, 5, 'gpt', 'React에서 프롭체인과 컨텍스트체인의 차이를 설명해보세요.'), (9, 1, 5, 'gpt', 'React에서 리덕스 (Redux)의 작동 원리를 설명해보세요.'), (9, 1, 5, 'gpt', 'React에서 리덕스 (Redux) 미들웨어의 사용 사례를 예를 들어 설명해보세요.'),
    (9, 1, 5, 'gpt', 'React에서 TypeScript를 도입할 때 주요 이점은 무엇인가요?'), (9, 1, 5, 'gpt', 'React에서 TypeScript를 사용하여 컴포넌트에 타입을 어떻게 정의하나요?'), (9, 1, 5, 'gpt', 'React에서 테스트 주도 개발 (TDD)의 기본 원칙은 무엇인가요?'), (9, 1, 5, 'gpt', 'React에서 정적 타입 검사를 위해 TypeScript를 사용하는 이유는 무엇인가요?'),
    -- fe (nextjs 10, 24 ea)
    (10, 1, 5, 'gpt', 'Next.js의 SSR은 어떻게 작동하나요?'), (10, 1, 5, 'gpt', 'Next.js의 SPA는 어떻게 작동하나요?'), (10, 1, 5, 'gpt', 'Next.js의 API 서버는 어떻게 작동하나요?'), (10, 1, 5, 'gpt', 'Next.js의 SEO는 어떻게 최적화할 수 있나요?'), (10, 1, 5, 'gpt', 'Next.js의 Accessibility는 어떻게 고려해야 하나요?'),
    (10, 1, 5, 'gpt', 'Next.js의 Performance는 어떻게 개선할 수 있나요?'), (10, 1, 5, 'gpt', 'Next.js의 Debugging은 어떻게 하나요?'), (10, 1, 5, 'gpt', 'Next.js의 Unit Testing은 어떻게 하나요?'), (10, 1, 5, 'gpt', 'Next.js의 Integration Testing은 어떻게 하나요?'), (10, 1, 5, 'gpt', 'Next.js의 E2E Testing은 어떻게 하나요?'),
    (10, 1, 5, 'gpt', 'Next.js의 CI/CD는 어떻게 구축할 수 있나요?'), (10, 1, 5, 'gpt', 'Next.js의 프레임워크는 무엇이 있나요?'), (10, 1, 5, 'gpt', 'Next.js의 라이브러리는 무엇이 있나요?'), (10, 1, 5, 'gpt', 'Next.js의 유용한 리소스는 무엇이 있나요?'), (10, 1, 5, 'gpt', 'Next.js 13의 새로운 기능은 무엇인가요?'),
    (10, 1, 5, 'gpt', 'Next.js 13의 SSR 개선 사항은 무엇인가요?'), (10, 1, 5, 'gpt', 'Next.js 13의 SPA 개선 사항은 무엇인가요?'), (10, 1, 5, 'gpt', 'Next.js 13의 API 서버 개선 사항은 무엇인가요?'), (10, 1, 5, 'gpt', 'Next.js 13의 개발 환경 개선 사항은 무엇인가요?'), (10, 1, 5, 'gpt', 'Next.js의 12 버전과 13 버전의 차이는 무엇인가요?'),
    (10, 1, 5, 'gpt', 'Next.js의 장점과 단점은 무엇이라고 생각하나요?'), (10, 1, 5, 'gpt', 'Next.js의 컴포넌트 구조를 어떻게 설계하시겠습니까?'), (10, 1, 5, 'gpt', 'Next.js의 SSR과 SPA의 장단점은 무엇이라고 생각하나요?'), (10, 1, 5, 'gpt', 'Next.js의 API 서버의 장단점은 무엇이라고 생각하나요?'),
    -- fe (html/css 11, 68 ea)
    (11, 1, 5, 'gpt', 'HTML과 XHTML의 차이점은 무엇인가요?'), (11, 1, 5, 'gpt', '시맨틱 태그(Semantic Tag)란 무엇이며, 어떤 이점을 가지고 있나요?'), (11, 1, 5, 'gpt', '"DOCTYPE"이란 무엇이며 왜 필요한가요?'), (11, 1, 5, 'gpt', '"alt" 속성의 용도는 무엇인가요?'), (11, 1, 5, 'gpt', 'CSS 선택자에 대해 설명해주세요.'),
    (11, 1, 5, 'gpt', 'CSS 박스 모델에 대해 설명해주세요.'), (11, 1, 5, 'gpt', 'CSS에서 id와 class의 차이는 무엇인가요?'), (11, 1, 5, 'gpt', '인라인 스타일과 내부 스타일, 외부 스타일시트의 차이점은 무엇인가요?'), (11, 1, 5, 'gpt', '부트스트랩(Bootstrap)은 어떤 경우에 사용하나요? 그리고 장단점은 무엇인가요? 10 .Flexbox와 Grid layout의 차이점을 설명해주세요.'), (11, 1, 5, 'gpt', 'CSS 전처리기(CSS Preprocessor)에 대해서 알고 계신가요? 사용 경험이 있다면 어떤 것을 사용하셨나요?'),
    (11, 1, 5, 'gpt', 'HTML5에서 새로 추가된 기능들에 대해서 설명할 수 있으신가요?'), (11, 1, 5, 'gpt', 'CSS에서 position 속성 값 (static, relative, absolute, fixed) 각각의 특징과 차이를 말씀해주실 수 있나요?'), (11, 1, 5, 'gpt', '레스폰시브 웹 디자인(Responsive Web Design)이란 무엇인지 설명해주세요.'), (11, 1, 5, 'gpt', '"viewport" 메타 태그에 대해서 설명하세요.'), (11, 1, 5, 'gpt', '웹 접근성(Web Accessibility)과 SEO(Search Engine Optimization)에 대한 중요성을 이야기 해주세요.'),
    (11, 1, 5, 'gpt', '"float" 속성과 "clear" 속성의 역할과 관계를 설명할 수 있으신가요?'), (11, 1, 5, 'gpt', '"z-index" 속성은 어떻게 작동하는지 말씀 해주실 수 있나요?'), (11, 1, 5, 'gpt', '"em", "rem", "px" 단위의 차이를 설명해주세요.'), (11, 1, 5, 'gpt', '"!important" 선언은 어떤 경우에 사용하나요? 그리고 이것의 장단점은 무엇인가요?'), (11, 1, 5, 'gpt', '브라우저 호환성(Cross Browser Compatibility) 문제를 해결하기 위한 방법을 말씀해주세요.'),
    (11, 1, 5, 'gpt', 'CSS 애니메이션과 JavaScript 애니메이션의 차이는 무엇인가요?'), (11, 1, 5, 'gpt', '웹 폰트(Web Font)와 시스템 폰트(System Font)의 차이는 무엇인가요?'), (11, 1, 5, 'gpt', 'CSS에서 transform 속성에 대해 설명해주세요.'), (11, 1, 5, 'gpt', '미디어 쿼리(Media Query)란 무엇인가요? 어떻게 사용하나요?'), (11, 1, 5, 'gpt', 'CSS에서 "display: none"과 "visibility: hidden"의 차이점은 무엇인가요?'),
    (11, 1, 5, 'gpt', 'HTML form 태그에서 GET 방식과 POST 방식의 차이점을 설명해주세요.'), (11, 1, 5, 'gpt', '웹사이트 성능 최적화를 위한 방법 중 HTML/CSS 관련된 것들은 어떤 것들이 있나요?'), (11, 1, 5, 'gpt', 'CSS Methodology (BEM, SMACSS, OOCSS 등)에 대해서 아시나요? 사용 경험이 있다면 그 이유와 장단점을 말씀해주세요.'), (11, 1, 5, 'gpt', '반응형 웹 디자인과 적응형 웹 디자인(Adaptive Web Design)의 차이를 설명할 수 있으신가용'), (11, 1, 5, 'gpt', '다양한 환경(브라우저, 기기 등등)에서 일관된 스타일링을 유지하기 위한 전략에는 어떤 것들이 있나요?'),
    (11, 1, 5, 'gpt', 'CSS에서 Pseudo-classes와 Pseudo-elements의 차이는 무엇인가용'), (11, 1, 5, 'gpt', 'HTML5 Canvas와 SVG 간의 주된 착각하기 쉬운 점 몇 개만 알 수 있으면 좋겟슴다!'), (11, 1, 5, 'gpt', 'CSS3 Transitions과 Animations 의 특징 및 장 단점에 대해서 설명해주세요.'), (11, 1, 5, 'gpt', 'HTML 문서 내에서 구조를 나타내는 태그들 (div, section, article, nav, aside 등등) 에 대해서 설명해주세요.'), (11, 1, 5, 'gpt', '웹사이트에서 이미지 최적화를 위한 방법에는 어떤 것들이 있나요?'),
    (11, 1, 5, 'gpt', 'CSS에서 "overflow" 속성은 어떻게 작동하나요?'), (11, 1, 5, 'gpt', 'HTML5의 localStorage와 sessionStorage의 차이점을 설명해주세요.'), (11, 1, 5, 'gpt', 'iframe 태그를 사용할 때의 장단점과 주의할 점은 무엇인가요?'), (11, 1, 5, 'gpt', 'HTML의 기본 구조는 무엇인가요?'), (11, 1, 5, 'gpt', 'HTML의 태그 종류에는 어떤 것들이 있나요?'),
    (11, 1, 5, 'gpt', '블록 요소와 인라인 요소의 차이는 무엇인가요?'), (11, 1, 5, 'gpt', '요소의 순서가 렌더링 순서에 영향을 미치는가요?'), (11, 1, 5, 'gpt', 'DOCTYPE이란 무엇인가요?'), (11, 1, 5, 'gpt', '시멘틱 태그란 무엇인가요?'), (11, 1, 5, 'gpt', 'ID와 클래스의 차이는 무엇인가요?'),
    (11, 1, 5, 'gpt', 'href 속성은 무엇을 의미하나요?'), (11, 1, 5, 'gpt', 'alt 속성은 무엇을 의미하나요?'), (11, 1, 5, 'gpt', 'title 속성은 무엇을 의미하나요?'), (11, 1, 5, 'gpt', 'margin과 padding의 차이는 무엇인가요?'), (11, 1, 5, 'gpt', 'border의 속성에는 어떤 것들이 있나요?'),
    (11, 1, 5, 'gpt', 'float 속성은 무엇을 의미하나요?'), (11, 1, 5, 'gpt', 'clear 속성은 무엇을 의미하나요?'), (11, 1, 5, 'gpt', 'display 속성의 값에는 어떤 것들이 있나요?'), (11, 1, 5, 'gpt', 'position 속성의 값에는 어떤 것들이 있나요?'), (11, 1, 5, 'gpt', 'z-index 속성은 무엇을 의미하나요?'),
    (11, 1, 5, 'gpt', 'visibility 속성은 무엇을 의미하나요?'), (11, 1, 5, 'gpt', 'opacity 속성은 무엇을 의미하나요?'), (11, 1, 5, 'gpt', 'transition 속성은 무엇을 의미하나요?'), (11, 1, 5, 'gpt', 'animation 속성은 무엇을 의미하나요?'), (11, 1, 5, 'gpt', '@import 구문은 무엇을 의미하나요?'),
    (11, 1, 5, 'gpt', '@media 구문은 무엇을 의미하나요?'), (11, 1, 5, 'gpt', '@font-face 구문은 무엇을 의미하나요?'), (11, 1, 5, 'gpt', '@keyframes 구문은 무엇을 의미하나요?'), (11, 1, 5, 'gpt', '@import 구문과 link 태그의 차이는 무엇인가요?'), (11, 1, 5, 'gpt', '@media 구문과 viewport 태그의 차이는 무엇인가요?'),
    (11, 1, 5, 'gpt', '@font-face 구문과 font-family 속성의 차이는 무엇인가요?'), (11, 1, 5, 'gpt', '@keyframes 구문과 animation 속성의 차이는 무엇인가요?'), (11, 1, 5, 'gpt', 'HTML5에서 추가된 새로운 요소에는 어떤 것들이 있나요?'),
    -- fe (vuejs 12, 45 ea)
    (12, 1, 5, 'gpt', 'Vue.js는 무엇이며, 어떤 특징을 가지고 있나요?'), (12, 1, 5, 'gpt', 'Vue.js와 React, Angular 등 다른 프레임워크와의 차이점은 무엇인가요?'), (12, 1, 5, 'gpt', 'MVVM(Model-View-ViewModel) 패턴에 대해 설명해주세요.'), (12, 1, 5, 'gpt', 'Vue 인스턴스를 생성할 때 옵션으로 사용할 수 있는 속성들에 대해서 설명해주세요.'), (12, 1, 5, 'gpt', 'Vue에서 컴포넌트 간 데이터를 전달하는 방법에는 어떤 것들이 있나요?'),
    (12, 1, 5, 'gpt', 'props와 data의 차이점은 무엇인가요?'), (12, 1, 5, 'gpt', 'computed 속성과 methods의 차이점은 무엇인가요?'), (12, 1, 5, 'gpt', 'watcher(watch 속성)는 언제 사용하나요?'), (12, 1, 5, 'gpt', 'Vue에서 생명주기 훅(Lifecycle Hooks)에 대해서 설명해주세요.'), (12, 1, 5, 'gpt', 'v-if와 v-show의 차이점은 무엇인가요?'),
    (12, 1, 5, 'gpt', 'Vue에서 key 속성을 사용하는 이유는 무엇인가요?'), (12, 1, 5, 'gpt', 'Vue Router란 무엇이며, 어떻게 동작하나요?'), (12, 1, 5, 'gpt', '동적 경로 매개 변수(Dynamic Route Matching)를 처리하는 방법을 알려주세요.'), (12, 1, 5, 'gpt', 'Vuex란 무엇인가요? 그리고 왜 필요한지 설명해주세요.'), (12, 1, 5, 'gpt', '"actions"과 "mutations"의 차이점은 무슨일까요?'),
    (12, 1, 5, 'gpt', '"getter" 역할 및 사용 예시를 말씀 해주실 수 있나요?'), (12, 1, 5, 'gpt', '"state" 상태 관리 방식 및 사용 예시를 말씀 해주실 수 있나요?'), (12, 1, 5, 'gpt', 'Vue CLI는 어떻게 활용되는 걸까요?'), (12, 1, 5, 'gpt', 'Vue CLI 프로젝트 생성 시 선택 가능한 옵션들에 대해서 말씀 해주실 수 있나요?'), (12, 1, 5, 'gpt', 'SSR(Server Side Rendering)과 CSR(Client Side Rendering), 그리고 Nuxt.js 에 대해서 알고 계신가요?'),
    (12, 1, 5, 'gpt', 'Single File Component에 대하여 설명하시오.'), (12, 1, 5, 'gpt', 'Vue에서 컴포넌트 간 통신을 위한 이벤트 버스(Event Bus) 패턴에 대하여 설명해주세요.'), (12, 1, 5, 'gpt', 'Vue에서 Mixin이란 무엇인가요? 어떤 경우에 사용하나요?'), (12, 1, 5, 'gpt', 'Vue에서 Slot을 사용하는 이유와 방법에 대해 설명해주세요.'), (12, 1, 5, 'gpt', '라우터(Router)의 네비게이션 가드(Navigation Guards)에 대해서 설명해주세요.'),
    (12, 1, 5, 'gpt', 'Vuex Store 모듈화 하는 방법에 대해서 설명해주세요.'), (12, 1, 5, 'gpt', 'Vue에서 커스텀 디렉티브를 작성하는 방법에 대해 설명해주세요.'), (12, 1, 5, 'gpt', 'Vue.js에서 템플릿과 렌더링 함수의 차이점은 무엇인가요?'), (12, 1, 5, 'gpt', 'Vue.js에서 디렉티브(Directive)란 무엇인가요? 자주 사용하는 디렉티브를 예를 들어 말씀해주세요.'), (12, 1, 5, 'gpt', 'V-model 디렉티브의 역할은 무엇인가요?'),
    (12, 1, 5, 'gpt', 'Vue.js 에서 트랜지션(Transition)을 구현하는 방법에는 어떤 것들이 있나요?'), (12, 1, 5, 'gpt', '컴포넌트 간 상태 공유를 위한 전역 상태 관리 패턴(Global State Management Pattern)을 설명하시오.'), (12, 1, 5, 'gpt', 'Vue.js 에서 서버 사이드 렌더링(Server Side Rendering, SSR)을 구현하기 위한 방법과 그 장단점은 무엇인가요?'), (12, 1, 5, 'gpt', 'Axios는 어떻게 활용되나요?'), (12, 1, 5, 'gpt', 'Vue 프로젝트에서 스타일링을 할 때 CSS 대신 SASS나 LESS를 사용하는 이유는 무엇인가요.'),
    (12, 1, 5, 'gpt', 'Vue 애플리케이션 성능 최적화 방안 중 하나로 Lazy Loading에 대해서 설명 해주실 수 있나요.'), (12, 1, 5, 'gpt', 'Vue 애플리케이션 테스팅 도구 및 전략들 중 하나로 Jest와 vue-test-utils 등등 여러 가지 기법들에 대해서 아시나요.'), (12, 1, 5, 'gpt', 'Vuex에서 Namespaced Modules 사용 시 주의할 점은 무엇인가요?'), (12, 1, 5, 'gpt', 'vue-router의 Navigation Guards와 Meta Fields 활용 방안을 말씀 해주실 수 있나요.'), (12, 1, 5, 'gpt', 'render 함수와 JSX in Vue 의 개념 및 활용 예제 좀 알려주세요.'),
    (12, 1, 5, 'gpt', 'provide / inject mechanism in Composition API 외 용도와 장단점 그리고 활용 예제 좀 알려주세요.'), (12, 1, 5, 'gpt', '"teleport" feature in Vue3 의 개념 및 활용 예제 좀 알려주세요.'), (12, 1, 5, 'gpt', '"suspense" feature in Vue3 의 개념 및 활용 예제 좀 알려주세요.'), (12, 1, 5, 'gpt', 'Vuex4 와 Vuex5 의 차이점 및 Migration 전략 등등 여러 가지 기법들에 대해서 아시나요.'), (12, 1, 5, 'gpt', 'Vite 외 용도와 장단점 그리고 활용 예제 좀 알려주세요.'),
    -- fe (svelte 13, 31 ea)
    (13, 1, 5, 'gpt', 'Svelte란 무엇이며 기본 동작 원리는?'), (13, 1, 5, 'gpt', 'Svelte와 다른 프레임워크/라이브러리(예: React, Vue)의 주요 차이점은?'), (13, 1, 5, 'gpt', 'Svelte의 주요 장점은 무엇인가요?'), (13, 1, 5, 'gpt', 'Svelte가 가지는 컴파일러의 역할은 무엇인가요?'), (13, 1, 5, 'gpt', 'Svelte 애플리케이션의 구조는 어떻게 되나요?'),
    (13, 1, 5, 'gpt', 'Svelte 컴포넌트란 무엇이고 어떻게 만드나요?'), (13, 1, 5, 'gpt', 'Svelte 컴포넌트의 라이프사이클에 대해 설명해보세요.'), (13, 1, 5, 'gpt', 'Svelte에서 상태(스토어) 관리는 어떻게 이루어지나요?'), (13, 1, 5, 'gpt', 'Svelte에서 이벤트 핸들링 방법은?'), (13, 1, 5, 'gpt', 'Svelte에서 조건부 렌더링을 어떻게 구현하나요?'),
    (13, 1, 5, 'gpt', 'Svelte에서 반복문을 사용하는 방법은?'), (13, 1, 5, 'gpt', 'Svelte에서 컴포넌트 간 데이터 전달은 어떻게 이루어지나요?'), (13, 1, 5, 'gpt', 'Svelte에서 클래스 바인딩을 사용하는 방법은?'), (13, 1, 5, 'gpt', 'Svelte에서 스타일 지정 방법은?'), (13, 1, 5, 'gpt', 'Svelte에서 컴포넌트간 통신을 어떻게 처리하나요?'),
    (13, 1, 5, 'gpt', 'Svelte에서 다이나믹 컴포넌트를 어떻게 렌더링하나요?'), (13, 1, 5, 'gpt', 'Svelte에서 라우팅을 구현하는 방법은?'), (13, 1, 5, 'gpt', 'Svelte 앱의 성능 최적화를 위한 방법은?'), (13, 1, 5, 'gpt', 'Svelte에서 서버사이드 렌더링(SSR)을 구현하는 방법은?'), (13, 1, 5, 'gpt', 'Svelte의 템플릿 언어에 대해 설명해보세요.'),
    (13, 1, 5, 'gpt', 'Svelte에서 슬롯을 어떻게 사용하나요?'), (13, 1, 5, 'gpt', 'Svelte에서 리액티브 선언문을 사용하는 이유는 무엇인가요?'), (13, 1, 5, 'gpt', 'Svelte의 이벤트 시스템에 대해 설명해보세요.'), (13, 1, 5, 'gpt', 'Svelte의 애니메이션을 다루는 방법은?'), (13, 1, 5, 'gpt', 'Svelte에서 컴포넌트 스타일의 범위(scope)에 대해 설명해보세요.'),
    (13, 1, 5, 'gpt', 'Svelte에서 데이터 바인딩에 대한 이해를 설명해보세요.'), (13, 1, 5, 'gpt', 'Svelte에서 컴포넌트의 재사용성을 높이는 방법은?'), (13, 1, 5, 'gpt', 'Svelte에서 API 호출과 데이터 처리를 어떻게 수행하나요?'), (13, 1, 5, 'gpt', 'Svelte에서 에러 핸들링 방법은?'), (13, 1, 5, 'gpt', 'Svelte 앱을 빌드하고 배포하는 과정을 설명해보세요.'),
    (13, 1, 5, 'gpt', 'Svelte와 관련된 주요 라이브러리 및 플러그인은 무엇인가요?'),
    
    
    --
    -- be (db 14, 50 ea)
    (14, 1, 5, 'gpt', 'SQL의 기본 명령어들을 설명하세요.'), (14, 1, 5, 'gpt', 'SQL의 DML(Data Manipulation Language)에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'SQL의 DDL(Data Definition Language)에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'SQL의 DCL(Data Control Language)에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'SQL의 트랜잭션에 대해 설명하세요.'),
    (14, 1, 5, 'gpt', 'SQL의 인덱스에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'SQL의 서브쿼리에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'SQL의 조인에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'SQL의 집계 함수에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'SQL의 조건 연산자에 대해 설명하세요.'),
    (14, 1, 5, 'gpt', 'SQL의 그룹 함수에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'SQL의 UNION, INTERSECT, EXCEPT 구문에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'SQL의 NULL 값에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'SQL의 DISTINCT 키워드에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'SQL의 ORDER BY 키워드에 대해 설명하세요.'),
    (14, 1, 5, 'gpt', 'SQL의 LIMIT 키워드에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'SQL의 OFFSET 키워드에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'SQL의 EXISTS 키워드에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'SQL의 IN 키워드에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'SQL의 LIKE 키워드에 대해 설명하세요.'),
    (14, 1, 5, 'gpt', 'SQL의 CASE WHEN 구문에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'SQL의 CURSOR에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'SQL의 CTE(Common Table Expression)에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'SQL의 VIEW에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'SQL의 TRIGGER에 대해 설명하세요.'),
    (14, 1, 5, 'gpt', 'SQL의 stored procedure에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'SQL의 쿼리 최적화에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'SQL의 성능 테스트에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'SQL의 보안에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'SQL의 다양한 데이터베이스 엔진에 대해 설명하세요.'),
    (14, 1, 5, 'gpt', 'NOSQL의 특징에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'NOSQL의 종류에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'Key-value DB의 특징과 장단점에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'Document DB의 특징과 장단점에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'Graph DB의 특징과 장단점에 대해 설명하세요.'),
    (14, 1, 5, 'gpt', 'Multi-model DB의 특징과 장단점에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'Multi-model DB의 특징과 장단점에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'NoSQL DB의 선택 기준에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'NoSQL DB의 성능 테스트에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'NoSQL DB의 보안에 대해 설명하세요.'),
    (14, 1, 5, 'gpt', 'NoSQL DB의 다양한 데이터베이스 엔진에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'NoSQL DB와 SQL DB의 차이점에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'NoSQL DB와 SQL DB의 장단점에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'NoSQL DB와 SQL DB의 활용 사례에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'NoSQL DB와 SQL DB의 상호 보완성에 대해 설명하세요.'),
    (14, 1, 5, 'gpt', 'NoSQL DB의 미래 전망에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'DB의 분산 처리에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'DB의 클라우드 컴퓨팅에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'DB의 마이그레이션에 대해 설명하세요.'), (14, 1, 5, 'gpt', 'DB의 백업과 복구에 대해 설명하세요.'),
    -- be (spring framework 15, 73 ea)
    (15, 1, 5, 'gpt', '스프링 프레임워크가 무엇인지 설명하세요.'), (15, 1, 5, 'gpt', '스프링의 장단점에 대해 설명하세요.'), (15, 1, 5, 'gpt', '스프링의 구조와 구성 요소에 대해 설명하세요.'), (15, 1, 5, 'gpt', '스프링의 IOC(Inversion of Control)와 DI(Dependency Injection)에 대해 설명하세요.'), (15, 1, 5, 'gpt', '스프링의 AOP(Aspect-Oriented Programming)에 대해 설명하세요.'),
    (15, 1, 5, 'gpt', '스프링의 MVC 패턴에 대해 설명하세요.'), (15, 1, 5, 'gpt', '스프링의 트랜잭션 관리에 대해 설명하세요.'), (15, 1, 5, 'gpt', '스프링의 보안에 대해 설명하세요.'), (15, 1, 5, 'gpt', '스프링의 다양한 버전에 대해 설명하세요.'), (15, 1, 5, 'gpt', '스프링의 BeanFactory와 ApplicationContext의 차이점에 대해 설명하세요.'),
    (15, 1, 5, 'gpt', '스프링의 @Autowired와 @Resource의 차이점에 대해 설명하세요.'), (15, 1, 5, 'gpt', '스프링의 @Controller, @Service, @Repository의 차이점에 대해 설명하세요.'), (15, 1, 5, 'gpt', '스프링의 @RequestMapping, @GetMapping, @PostMapping의 차이점에 대해 설명하세요.'), (15, 1, 5, 'gpt', '스프링의 @ControllerAdvice와 @ExceptionHandler의 차이점에 대해 설명하세요.'), (15, 1, 5, 'gpt', '스프링의 @Transactional의 속성에 대해 설명하세요.'), 
    (15, 1, 5, 'gpt', '스프링의 @Secured와 @PreAuthorize의 차이점에 대해 설명하세요.'), (15, 1, 5, 'gpt', '스프링의 @EnableCaching과 @Cacheable의 차이점에 대해 설명하세요.'), (15, 1, 5, 'gpt', '스프링의 @RestController와 @Controller의 차이점에 대해 설명하세요.'), (15, 1, 5, 'gpt', '스프링의 @RestfulController와 @Controller의 차이점에 대해 설명하세요.'), (15, 1, 5, 'gpt', '스프링의 @EnableWebMvc와 @Configuration의 차이점에 대해 설명하세요.'),
    (15, 1, 5, 'gpt', '스프링을 사용하여 만든 웹 애플리케이션의 예를 들어 설명하세요.'), (15, 1, 5, 'gpt', '스프링을 사용하여 만든 모바일 애플리케이션의 예를 들어 설명하세요.'), (15, 1, 5, 'gpt', '스프링을 사용하여 만든 IoT 애플리케이션의 예를 들어 설명하세요.'), (15, 1, 5, 'gpt', '스프링을 사용하여 만든 클라우드 애플리케이션의 예를 들어 설명하세요.'), (15, 1, 5, 'gpt', '스프링을 사용하여 만든 대규모 시스템의 예를 들어 설명하세요.'),
    (15, 1, 5, 'gpt', '스프링을 사용하여 개발한 프로젝트의 경험을 설명하세요.'), (15, 1, 5, 'gpt', '스프링에서 발생한 문제점과 해결 방법에 대해 설명하세요.'), (15, 1, 5, 'gpt', '스프링에서 사용한 다양한 라이브러리와 프레임워크에 대해 설명하세요.'), (15, 1, 5, 'gpt', '스프링의 향후 발전 방향에 대해 설명하세요.'), (15, 1, 5, 'gpt', 'Bean이란 무엇이고 어떻게 정의되나요?'),
    (15, 1, 5, 'gpt', '스프링 컨테이너의 종류에 대해 설명해보세요.'), (15, 1, 5, 'gpt', '스프링 빈 스코프에 대해 설명해보세요.'), (15, 1, 5, 'gpt', 'AOP(Aspect-Oriented Programming)가 무엇이며 어떻게 스프링에서 구현되나요?'), (15, 1, 5, 'gpt', '스프링에서 어떻게 의존성을 주입하나요?'), (15, 1, 5, 'gpt', '스프링 부트(Spring Boot)란 무엇이고 어떤 장점이 있나요?'), 
    (15, 1, 5, 'gpt', '스프링 부트의 자동 구성(auto-configuration)에 대해 설명해보세요.'), (15, 1, 5, 'gpt', '스프링 부트의 스타터(starter)란 무엇이며 어떻게 사용하나요?'), (15, 1, 5, 'gpt', '스프링 부트 애플리케이션을 어떻게 실행하나요?'), (15, 1, 5, 'gpt', '스프링 부트의 테스트 지원에 대해 설명해보세요.'), (15, 1, 5, 'gpt', '스프링 데이터(Spring Data)란 무엇이며 어떻게 사용하나요?'),
    (15, 1, 5, 'gpt', '스프링 시큐리티(Spring Security)의 주요 기능은 무엇인가요?'), (15, 1, 5, 'gpt', '스프링 시큐리티를 사용하여 어떻게 사용자 인증과 권한 부여를 구현하나요?'), (15, 1, 5, 'gpt', '스프링 MVC(Model-View-Controller) 패턴에 대해 설명해보세요.'), (15, 1, 5, 'gpt', '스프링 MVC에서 컨트롤러의 역할은 무엇인가요?'), (15, 1, 5, 'gpt', '스프링 MVC에서 모델과 뷰는 어떻게 작동하나요?'),
    (15, 1, 5, 'gpt', 'RESTful 웹 서비스를 개발할 때 스프링에서 어떻게 처리하나요?'), (15, 1, 5, 'gpt', '스프링에서 ORM(Object-Relational Mapping)을 사용하는 방법은?'), (15, 1, 5, 'gpt', 'JPA(Java Persistence API)와 하이버네이트(Hibernate)의 관계에 대해 설명해보세요.'), (15, 1, 5, 'gpt', '스프링 데이터 JPA를 사용하여 어떻게 데이터베이스를 조작하나요?'), (15, 1, 5, 'gpt', '스프링 부트에서 데이터베이스 설정은 어떻게 이루어지나요?'),
    (15, 1, 5, 'gpt', '스프링에서 예외 처리를 어떻게 다루나요?'), (15, 1, 5, 'gpt', '스프링에서 인터셉터(Interceptors)의 역할은 무엇인가요?'), (15, 1, 5, 'gpt', '스프링에서 프로파일(Profile)을 어떻게 사용하나요?'), (15, 1, 5, 'gpt', '스프링에서 캐싱을 구현하는 방법은?'), (15, 1, 5, 'gpt', '스프링에서 스케줄링을 어떻게 구현하나요?'), 
    (15, 1, 5, 'gpt', '스프링에서 보안 설정을 어떻게 변경하나요?'), (15, 1, 5, 'gpt', '스프링에서 파일 업로드와 다운로드를 어떻게 처리하나요?'), (15, 1, 5, 'gpt', '스프링에서 메시징 서비스를 사용하는 방법은?'), (15, 1, 5, 'gpt', '스프링에서 테스트 코드를 작성하는 방법은?'), (15, 1, 5, 'gpt', '스프링 애플리케이션의 로깅을 어떻게 구성하나요?'),
    (15, 1, 5, 'gpt', '스프링에서 데이터 유효성 검사(Validation)를 어떻게 수행하나요?'), (15, 1, 5, 'gpt', '스프링에서 보안 및 인증을 커스터마이즈하는 방법은?'), (15, 1, 5, 'gpt', '스프링에서 세션(Session) 관리 방법은?'), (15, 1, 5, 'gpt', '스프링에서 동시성(Concurrency)을 다루는 방법은?'), (15, 1, 5, 'gpt', '스프링에서 멀티스레딩을 지원하는 방법은?'), 
    (15, 1, 5, 'gpt', '스프링에서 비동기 프로그래밍을 어떻게 처리하나요?'), (15, 1, 5, 'gpt', '스프링에서 크로스 오리진 요청(CORS)을 어떻게 처리하나요?'), (15, 1, 5, 'gpt', '스프링에서 보안 취약점으로부터 어떻게 애플리케이션을 보호하나요?'), (15, 1, 5, 'gpt', '스프링에서 테스트 주도 개발(TDD)을 어떻게 적용하나요?'), (15, 1, 5, 'gpt', '스프링에서 로깅 프레임워크를 변경하거나 확장하는 방법은?'),
    (15, 1, 5, 'gpt', '스프링에서 성능 모니터링과 프로파일링을 어떻게 수행하나요?'), (15, 1, 5, 'gpt', '스프링 애플리케이션의 배포 및 스케일링 방법은?'), (15, 1, 5, 'gpt', '스프링에서 모바일 앱 또는 웹 서비스'),
    -- be (nextjs 16, 60 ea)
    (16, 1, 5, 'gpt', 'NestJS가 무엇인가요?'), (16, 1, 5, 'gpt', 'NestJS와 Express의 차이점은 무엇인가요?'), (16, 1, 5, 'gpt', 'NestJS의 주요 특징은 무엇인가요?'), (16, 1, 5, 'gpt', 'Dependency Injection은 무엇이며 왜 중요한가요?'), (16, 1, 5, 'gpt', 'Middleware는 어떤 역할을 하나요?'),
    (16, 1, 5, 'gpt', 'NestJS에서 미들웨어를 구현하는 방법은 무엇인가요?'), (16, 1, 5, 'gpt', 'Provider와 Service의 차이점은 무엇인가요?'), (16, 1, 5, 'gpt', '의존성 주입 시 주입 범위에 대해 설명해주세요.'), (16, 1, 5, 'gpt', 'NestJS에서 모듈이 무엇이며 어떻게 구성되나요?'), (16, 1, 5, 'gpt', '라우터의 역할과 사용 방법에 대해 설명해주세요.'),
    (16, 1, 5, 'gpt', 'Pipes가 무엇이며 어떻게 사용되나요?'), (16, 1, 5, 'gpt', 'Guard의 역할과 사용 방법에 대해 설명해주세요.'), (16, 1, 5, 'gpt', 'Interceptor가 무엇이며 어떻게 사용되나요?'), (16, 1, 5, 'gpt', 'Exception Filters의 역할과 사용 방법에 대해 설명해주세요.'), (16, 1, 5, 'gpt', 'Serialize와 Deserialize의 차이는 무엇인가요?'),
    (16, 1, 5, 'gpt', 'DTO (Data Transfer Object)가 무엇인가요? 왜 사용하나요?'), (16, 1, 5, 'gpt', 'GraphQL을 NestJS에서 사용하는 방법에 대해 설명해주세요.'), (16, 1, 5, 'gpt', 'WebSocket을 NestJS에서 구현하는 방법은 무엇인가요?'), (16, 1, 5, 'gpt', 'Middleware, Guard, Interceptor의 실행 순서는 어떻게 되나요?'), (16, 1, 5, 'gpt', 'TypeORM을 NestJS에서 사용하는 방법에 대해 설명해주세요.'),
    (16, 1, 5, 'gpt', 'JWT (JSON Web Tokens)를 NestJS에서 사용하는 방법은 무엇인가요?'), (16, 1, 5, 'gpt', '유닛 테스트와 E2E 테스트의 차이는 무엇인가요?'), (16, 1, 5, 'gpt', '테스트 모듈을 만드는 방법에 대해 설명해주세요.'), (16, 1, 5, 'gpt', '테스트에서 Mock을 사용하는 이유는 무엇인가요?'), (16, 1, 5, 'gpt', 'Swagger를 NestJS 프로젝트에 추가하는 방법은 무엇인가요?'),
    (16, 1, 5, 'gpt', 'Passport를 NestJS에서 사용하는 방법은 무엇인가요?'), (16, 1, 5, 'gpt', '에러 핸들링을 위해 어떤 라이브러리나 기술을 사용할 수 있나요?'), (16, 1, 5, 'gpt', 'NestJS에서 다국어 지원을 구현하는 방법은 무엇인가요?'), (16, 1, 5, 'gpt', '트랜잭션을 NestJS에서 다루는 방법은 무엇인가요?'), (16, 1, 5, 'gpt', '서버리스 (Serverless) 환경에서 NestJS를 사용하는 방법은 무엇인가요?'),
    (16, 1, 5, 'gpt', '프로덕션 환경에서의 NestJS 애플리케이션 배포 전략은 무엇인가요?'), (16, 1, 5, 'gpt', '메시지 큐를 NestJS 프로젝트에 통합하는 방법은 무엇인가요?'), (16, 1, 5, 'gpt', 'NestJS에서 주기적으로 실행되는 작업을 구현하는 방법은 무엇인가요?'), (16, 1, 5, 'gpt', 'NestJS에서 파일 업로드를 다루는 방법은 무엇인가요?'), (16, 1, 5, 'gpt', '테스트 커버리지를 측정하고 개선하는 방법은 무엇인가요?'),
    (16, 1, 5, 'gpt', 'NestJS에서 인증과 권한 부여를 구현하는 방법은 무엇인가요?'), (16, 1, 5, 'gpt', 'NestJS에서 세션 기반 인증을 구현하는 방법은 무엇인가요?'), (16, 1, 5, 'gpt', 'NestJS에서 캐싱을 구현하는 방법은 무엇인가요?'), (16, 1, 5, 'gpt', 'NestJS 애플리케이션에서의 로깅 전략은 무엇인가요?'), (16, 1, 5, 'gpt', 'NestJS에서 다양한 환경 변수를 관리하는 방법은 무엇인가요?'),
    (16, 1, 5, 'gpt', 'NestJS에서 데이터베이스 마이그레이션을 다루는 방법은 무엇인가요?'), (16, 1, 5, 'gpt', 'NestJS에서 GraphQL Subscriptions을 다루는 방법은 무엇인가요?'), (16, 1, 5, 'gpt', 'NestJS에서 Redis를 사용하는 방법은 무엇인가요?'), (16, 1, 5, 'gpt', 'NestJS에서 gRPC를 사용하는 방법은 무엇인가요?'), (16, 1, 5, 'gpt', 'NestJS에서 프론트엔드 프레임워크와 통합하는 방법은 무엇인가요?'),
    (16, 1, 5, 'gpt', 'NestJS에서의 보안 취약점을 방지하기 위한 Best Practice는 무엇인가요?'), (16, 1, 5, 'gpt', 'NestJS에서 프로덕션 환경에서의 성능 최적화 방법은 무엇인가요?'), (16, 1, 5, 'gpt', 'NestJS에서 데이터베이스 트랜잭션을 다루는 방법은 무엇인가요?'), (16, 1, 5, 'gpt', 'NestJS에서 태스크 스케줄링을 다루는 방법은 무엇인가요?'), (16, 1, 5, 'gpt', 'NestJS에서 서비스 간의 통신 시 발생할 수 있는 문제와 해결 방법은 무엇인가요?'),
    (16, 1, 5, 'gpt', 'NestJS에서 환경 변수를 사용하는 이유는 무엇인가요?'), (16, 1, 5, 'gpt', 'NestJS에서 의존성 주입을 위해 사용되는 데코레이터는 무엇인가요?'), (16, 1, 5, 'gpt', '마이크로서비스 아키텍처에서 NestJS의 역할은 무엇인가요?'), (16, 1, 5, 'gpt', 'NestJS에서 커스텀 미들웨어를 작성하는 방법에 대해 설명해주세요.'), (16, 1, 5, 'gpt', 'NestJS에서 Passport를 이용한 소셜 로그인 구현 방법은 무엇인가요?'),
    (16, 1, 5, 'gpt', 'NestJS에서 ORM(Object-Relational Mapping)을 사용하는 이유는 무엇인가요?'), (16, 1, 5, 'gpt', 'NestJS에서 에러 핸들링을 위한 좋은 방법은 무엇인가요?'), (16, 1, 5, 'gpt', 'NestJS에서 글로벌 예외 필터를 설정하는 방법은 무엇인가요?'), (16, 1, 5, 'gpt', 'NestJS에서 자동으로 API 문서를 생성하는 도구는 무엇인가요?'), (16, 1, 5, 'gpt', 'NestJS에서 미들웨어를 만들 때 주의할 점은 무엇인가요?'),
    -- be (nodejs 17, 80 ea)
    (17, 1, 5, 'gpt', 'Node.js가 무엇인지 설명하세요.'), (17, 1, 5, 'gpt', 'Node.js의 장단점에 대해 설명하세요.'), (17, 1, 5, 'gpt', 'Node.js의 구조와 구성 요소에 대해 설명하세요.'), (17, 1, 5, 'gpt', 'Node.js의 이벤트 기반 아키텍처에 대해 설명하세요.'), (17, 1, 5, 'gpt', 'Node.js의 Non-blocking I/O에 대해 설명하세요.'),
    (17, 1, 5, 'gpt', 'Node.js의 JavaScript의 특징에 대해 설명하세요.'), (17, 1, 5, 'gpt', 'Node.js의 버전별 특징에 대해 설명하세요.'), (17, 1, 5, 'gpt', 'Node.js의 설치 및 실행 방법에 대해 설명하세요.'), (17, 1, 5, 'gpt', 'Express가 무엇인지 설명하세요.'), (17, 1, 5, 'gpt', 'Express의 장단점에 대해 설명하세요.'),
    (17, 1, 5, 'gpt', 'Express의 구조와 구성 요소에 대해 설명하세요.'), (17, 1, 5, 'gpt', 'Express의 라우팅에 대해 설명하세요.'), (17, 1, 5, 'gpt', 'Express의 미들웨어에 대해 설명하세요.'), (17, 1, 5, 'gpt', 'Express의 템플릿 엔진에 대해 설명하세요.'), (17, 1, 5, 'gpt', 'Express의 보안에 대해 설명하세요.'),
    (17, 1, 5, 'gpt', 'Express의 다양한 버전에 대해 설명하세요.'), (17, 1, 5, 'gpt', 'Express의 @Controller와 @Get, @Post, @Put, @Delete에 대해 설명하세요.'), (17, 1, 5, 'gpt', 'Express의 @Middleware와 @Param에 대해 설명하세요.'), (17, 1, 5, 'gpt', 'Express의 @RequestBody와 @ResponseBody에 대해 설명하세요.'), (17, 1, 5, 'gpt', 'Express의 @ResponseRedirect와 @ResponseStatus에 대해 설명하세요.'),
    (17, 1, 5, 'gpt', 'Express의 @Session과 @Cookie에 대해 설명하세요.'), (17, 1, 5, 'gpt', 'Express의 @ValidationPipe와 @ValidationResult에 대해 설명하세요.'), (17, 1, 5, 'gpt', 'Express의 @ErrorController와 @AppError에 대해 설명하세요.'), (17, 1, 5, 'gpt', 'Express의 @BodyParser와 @FormDataParser에 대해 설명하세요.'), (17, 1, 5, 'gpt', 'Express의 @Router와 @StaticRouter에 대해 설명하세요.'),
    (17, 1, 5, 'gpt', 'Express를 사용하여 만든 웹 애플리케이션의 예를 들어 설명하세요.'), (17, 1, 5, 'gpt', 'Express를 사용하여 만든 모바일 애플리케이션의 예를 들어 설명하세요.'), (17, 1, 5, 'gpt', 'Express를 사용하여 만든 IoT 애플리케이션의 예를 들어 설명하세요.'), (17, 1, 5, 'gpt', 'Express를 사용하여 만든 클라우드 애플리케이션의 예를 들어 설명하세요.'), (17, 1, 5, 'gpt', 'Express를 사용하여 만든 대규모 시스템의 예를 들어 설명하세요.'),
    (17, 1, 5, 'gpt', 'Express를 사용하여 개발한 프로젝트의 경험을 설명하세요.'), (17, 1, 5, 'gpt', 'Express에서 발생한 문제점과 해결 방법에 대해 설명하세요.'), (17, 1, 5, 'gpt', 'Express에서 사용한 다양한 라이브러리와 프레임워크에 대해 설명하세요.'), (17, 1, 5, 'gpt', 'Express의 향후 발전 방향에 대해 설명하세요.'), (17, 1, 5, 'gpt', 'Node.js와 Express.js의 차이점은 무엇인가요?'),
    (17, 1, 5, 'gpt', '비동기 프로그래밍이 Node.js에서 왜 중요한가요?'), (17, 1, 5, 'gpt', 'Node.js에서 이벤트 루프(Event Loop)에 대해 설명해보세요.'), (17, 1, 5, 'gpt', '콜백(Callback) 함수와 콜백 지옥(Callback Hell)에 대해 설명해보세요.'), (17, 1, 5, 'gpt', 'Promises와 async/await를 사용한 비동기 프로그래밍 방법은 무엇인가요?'), (17, 1, 5, 'gpt', 'Node.js의 모듈 시스템은 어떻게 동작하나요?'),
    (17, 1, 5, 'gpt', 'CommonJS와 ES6 모듈의 차이는 무엇인가요?'), (17, 1, 5, 'gpt', 'Node.js에서 패키지 관리자로 사용되는 도구는 무엇인가요?'), (17, 1, 5, 'gpt', 'Node.js에서 npm의 역할과 주요 명령어는 무엇인가요?'), (17, 1, 5, 'gpt', 'Node.js의 버전 관리 도구(nvm, n)에 대해 설명해보세요.'), (17, 1, 5, 'gpt', 'Node.js의 이벤트(Events) 모듈을 어떻게 활용하나요?'),
    (17, 1, 5, 'gpt', 'Express.js에서 미들웨어(Middleware)의 역할은 무엇인가요?'), (17, 1, 5, 'gpt', 'Express.js에서 미들웨어 함수를 작성하고 사용하는 방법은?'), (17, 1, 5, 'gpt', '라우팅(Routing)이란 무엇이며 Express.js에서 어떻게 구현하나요?'), (17, 1, 5, 'gpt', 'Express.js에서 RESTful API를 개발하는 방법은?'), (17, 1, 5, 'gpt', 'Express.js에서 뷰 엔진(예: EJS, Pug)을 어떻게 설정하나요?'),
    (17, 1, 5, 'gpt', 'Express.js에서 에러 핸들링을 어떻게 구현하나요?'), (17, 1, 5, 'gpt', 'Express.js에서 파일 업로드와 다운로드를 어떻게 처리하나요?'), (17, 1, 5, 'gpt', 'Express.js에서 세션(Session) 및 쿠키(Cookie)를 다루는 방법은?'), (17, 1, 5, 'gpt', 'Express.js에서 보안 및 CSRF(Cross-Site Request Forgery) 방어를 어떻게 처리하나요?'), (17, 1, 5, 'gpt', 'Express.js에서 CORS(Cross-Origin Resource Sharing)를 어떻게 다루나요?'),
    (17, 1, 5, 'gpt', 'Express.js에서 미들웨어를 직접 작성하는 경우에 어떤 사항을 고려해야 하나요?'), (17, 1, 5, 'gpt', 'Node.js에서 서버의 확장성(Scalability)을 높이는 방법은?'), (17, 1, 5, 'gpt', 'Node.js와 Express.js에서 테스트 코드를 작성하는 방법은?'), (17, 1, 5, 'gpt', 'Node.js에서 클러스터링(Clustering)을 사용하여 다중 프로세스를 관리하는 방법은?'), (17, 1, 5, 'gpt', 'Node.js에서 프로미스(Promise)와 async/await을 사용하여 비동기 코드를 처리하는 방법은?'),
    (17, 1, 5, 'gpt', 'Node.js에서 버퍼(Buffer)와 스트림(Stream)에 대해 설명해보세요.'), (17, 1, 5, 'gpt', 'Node.js에서 실시간 통신을 위한 웹소켓(WebSocket)을 구현하는 방법은?'), (17, 1, 5, 'gpt', 'Node.js에서 데이터베이스 연동을 위한 ORM(Object-Relational Mapping) 도구는 어떤 것이 있나요?'), (17, 1, 5, 'gpt', 'Node.js에서 데이터베이스 연결 풀(Database Connection Pool)을 설정하는 방법은?'), (17, 1, 5, 'gpt', 'Node.js에서 푸시 알림(Push Notification)을 구현하는 방법은?'),
    (17, 1, 5, 'gpt', 'Node.js와 Express.js에서 보안 취약점에 대한 대비책은 무엇인가요?'), (17, 1, 5, 'gpt', 'Node.js에서 프로파일링(Profiling) 및 성능 최적화를 수행하는 방법은?'), (17, 1, 5, 'gpt', 'Node.js에서 비즈니스 로직과 라우팅 로직을 어떻게 분리하나요?'), (17, 1, 5, 'gpt', 'Node.js에서 서버 사이드 렌더링(SSR)을 구현하는 방법은?'), (17, 1, 5, 'gpt', 'Node.js에서 마이크로서비스 아키텍처(Microservices Architecture)를 구현하는 방법은?'),
    (17, 1, 5, 'gpt', 'Node.js에서 JWT(Json Web Tokens)를 사용하여 사용자 인증을 처리하는 방법은?'), (17, 1, 5, 'gpt', 'Node.js와 Express.js에서 논블로킹 I/O(Non-blocking I/O)에 대해 설명해보세요.'), (17, 1, 5, 'gpt', 'Node.js와 Express.js에서 클라이언트와 서버 간의 웹소켓 통신을 구현하는 방법은?'), (17, 1, 5, 'gpt', 'Node.js에서 AWS Lambda와 연동하여 서버리스(Serverless) 애플리케이션을 만드는 방법은?'), (17, 1, 5, 'gpt', 'Node.js에서 캐싱을 구현하여 성능을 향상시키는 방법은?'),
    (17, 1, 5, 'gpt', 'Node.js에서 GraphQL을 사용하여 API를 구현하는 방법은?'), (17, 1, 5, 'gpt', 'Node.js와 Express.js에서 로깅(logging)과 모니터링(monitoring)을 어떻게 수행하나요?'), (17, 1, 5, 'gpt', 'Node.js에서 도커(Docker)를 사용하여 애플리케이션을 컨테이너화(Containerization)하는 방법은?'), (17, 1, 5, 'gpt', 'Node.js에서 AWS, Azure, Google Cloud와 같은 클라우드 플랫폼과의 통합을 어떻게 수행하나요?'), (17, 1, 5, 'gpt', 'Node.js에서 메시징 큐(Message Queue)를 사용하여 비동기 작업을 처리하는 방법은?'),
    -- be (msa 18, 50 ea)
    (18, 1, 5, 'gpt', 'MSA가 무엇인가요?'), (18, 1, 5, 'gpt', 'MSA와 모놀리식 아키텍처의 차이점은 무엇인가요?'), (18, 1, 5, 'gpt', 'MSA의 주요 이점은 무엇인가요?'), (18, 1, 5, 'gpt', 'MSA에서 각 마이크로서비스 간 통신 방법은 어떤 것이 있나요?'), (18, 1, 5, 'gpt', '마이크로서비스 간 통신에 대한 프로토콜 중 어떤 것들이 있나요?'),
    (18, 1, 5, 'gpt', '서비스 디스커버리가 무엇이며 왜 중요한가요?'), (18, 1, 5, 'gpt', 'MSA에서 로드 밸런싱은 왜 필요한가요?'), (18, 1, 5, 'gpt', 'Circuit Breaker 패턴은 무엇이며 어떤 상황에서 사용되나요?'), (18, 1, 5, 'gpt', '마이크로서비스 간의 데이터 일관성을 어떻게 유지하나요?'), (18, 1, 5, 'gpt', 'MSA에서 트랜잭션 관리가 어떻게 이루어지나요?'),
    (18, 1, 5, 'gpt', '마이크로서비스 간 보안을 어떻게 구현하나요?'), (18, 1, 5, 'gpt', '마이크로서비스에서 어떻게 분산 로깅을 수행하나요?'), (18, 1, 5, 'gpt', '마이크로서비스에서 어떻게 분산 추적을 수행하나요?'), (18, 1, 5, 'gpt', '마이크로서비스에서 어떻게 모니터링을 수행하나요?'), (18, 1, 5, 'gpt', 'MSA에서 서비스 메시와 API 게이트웨이의 차이는 무엇인가요?'),
    (18, 1, 5, 'gpt', '서비스 메시 패턴의 장점은 무엇인가요?'), (18, 1, 5, 'gpt', '마이크로서비스 간의 통신 시, 동기식과 비동기식 통신의 차이점은 무엇인가요?'), (18, 1, 5, 'gpt', 'Saga 패턴이 무엇이며 어떤 상황에서 사용되나요?'), (18, 1, 5, 'gpt', '서비스 임계치는 무엇이며 어떻게 설정하나요?'), (18, 1, 5, 'gpt', 'MSA에서 어떻게 데이터베이스를 관리하나요?'),
    (18, 1, 5, 'gpt', 'MSA에서 CI/CD (Continuous Integration/Continuous Deployment) 파이프라인을 어떻게 구성하나요?'), (18, 1, 5, 'gpt', 'Docker와 Kubernetes의 역할은 무엇인가요?'), (18, 1, 5, 'gpt', 'Kubernetes에서 Pod이 무엇이며 왜 사용되나요?'), (18, 1, 5, 'gpt', '마이크로서비스에서 어떤 모니터링 도구들이 많이 사용되나요?'), (18, 1, 5, 'gpt', '서비스 메시에서 어떤 도구들이 사용되나요?'),
    (18, 1, 5, 'gpt', '서비스 디스커버리를 위한 도구들은 어떤 것들이 있나요?'), (18, 1, 5, 'gpt', 'Helm이 무엇이며 어떤 기능을 제공하나요?'), (18, 1, 5, 'gpt', '마이크로서비스 간의 테스트 전략은 무엇인가요?'), (18, 1, 5, 'gpt', 'Blue-Green 배포와 Canary 배포의 차이는 무엇인가요?'), (18, 1, 5, 'gpt', 'A/B 테스팅이 무엇이며 어떤 상황에서 사용되나요?'),
    (18, 1, 5, 'gpt', 'MSA에서 서버리스 아키텍처의 장점은 무엇인가요?'), (18, 1, 5, 'gpt', 'MSA에서 보안 측면에서 주의해야 할 사항은 무엇인가요?'), (18, 1, 5, 'gpt', '서비스 간의 인증과 권한 부여를 어떻게 관리하나요?'), (18, 1, 5, 'gpt', '서비스 간의 트랜잭션을 어떻게 관리하나요?'), (18, 1, 5, 'gpt', '마이크로서비스에서 실패 상황을 어떻게 처리하나요?'),
    (18, 1, 5, 'gpt', 'MSA에서 데이터 마이그레이션을 어떻게 처리하나요?'), (18, 1, 5, 'gpt', '마이크로서비스에서 API 버전 관리를 어떻게 수행하나요?'), (18, 1, 5, 'gpt', '서비스 메시에서 트래픽 관리를 어떻게 할 수 있나요?'), (18, 1, 5, 'gpt', 'MSA에서의 테스트 자동화 전략은 무엇인가요?'), (18, 1, 5, 'gpt', '마이크로서비스에서의 데이터 보안을 위한 기술은 무엇인가요?'),
    (18, 1, 5, 'gpt', '서비스 간의 비동기 통신에서 발생할 수 있는 문제들은 무엇인가요?'), (18, 1, 5, 'gpt', 'MSA에서의 서비스 간의 의사소통을 어떻게 보장하나요?'), (18, 1, 5, 'gpt', '마이크로서비스에서의 유지보수 전략은 무엇인가요?'), (18, 1, 5, 'gpt', '서비스 메시에서의 부하 분산을 위한 전략은 어떤 것이 있나요?'), (18, 1, 5, 'gpt', 'MSA에서의 서비스 디스커버리 패턴은 어떤 것들이 있나요?'),
    (18, 1, 5, 'gpt', '마이크로서비스에서의 스케일 아웃과 스케일 업의 차이는 무엇인가요?'), (18, 1, 5, 'gpt', '서비스 메시에서의 승인 및 권한 부여를 어떻게 관리하나요?'), (18, 1, 5, 'gpt', 'MSA에서의 코드 배포 전략은 어떤 것이 있나요?'), (18, 1, 5, 'gpt', '마이크로서비스에서의 롤링 업데이트 전략은 어떤 것이 좋은가요?'), (18, 1, 5, 'gpt', '서비스 메시에서의 서비스 디스커버리 구현 방법은 무엇이 있나요?'),
    -- be (rebbitmq 19, 77 ea)
    (19, 1, 5, 'gpt', 'RabbitMQ란 무엇인가요?'), (19, 1, 5, 'gpt', '메시징 시스템의 중요성은 무엇인가요?'), (19, 1, 5, 'gpt', 'RabbitMQ의 핵심 개념에 대해 설명해보세요.'), (19, 1, 5, 'gpt', 'RabbitMQ와 대안 메시지 브로커의 차이는 무엇인가요?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 프로듀서(Producer)와 컨슈머(Consumer)의 역할은 무엇인가요?'),
    (19, 1, 5, 'gpt', 'RabbitMQ에서 메시지(Message)의 생명주기에 대해 설명해보세요.'), (19, 1, 5, 'gpt', 'RabbitMQ에서 큐(Queue)는 어떻게 정의하고 사용하나요?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 교환(Exchange)은 어떤 역할을 하는가요?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 라우팅(Routing) 키는 어떻게 동작하나요?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 패턴(Pattern) 기반 메시지 라우팅은 무엇인가요?'),
    (19, 1, 5, 'gpt', 'RabbitMQ에서 다이렉트(Direct) 교환과 팬아웃(Fanout) 교환의 차이는 무엇인가요?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 토픽(Topic) 교환은 어떤 경우에 사용하나요?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 메시지의 지속성(Durability)은 어떻게 보장되나요?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 클러스터링(Clustering)은 어떻게 설정하고 동작하나요?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 가용성(Availability)과 페더링(Federation)에 대해 설명해보세요.'),
    (19, 1, 5, 'gpt', 'RabbitMQ에서 ACK(확인 응답)은 어떤 역할을 하는가요?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 재시도 및 실패 대처를 어떻게 구현하나요?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 배치(Batching) 메시지 처리는 어떻게 이루어지나요?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 트랜잭션(Transaction)을 사용하여 메시지 처리하는 방법은?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 고장 내성(Fault Tolerance)을 어떻게 구현하나요?'),
    (19, 1, 5, 'gpt', 'RabbitMQ에서 메시지 필터링(Filtering)을 어떻게 수행하나요?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 데드 레터(DLX) 교환에 대해 설명해보세요.'), (19, 1, 5, 'gpt', 'RabbitMQ에서 우선 순위(Priority) 큐를 구현하는 방법은?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 연시(Time-to-Live)와 메시지 만료에 대해 설명해보세요.'), (19, 1, 5, 'gpt', 'RabbitMQ에서 사용자 정의 플러그인(Custom Plugin)을 작성하는 방법은?'),
    (19, 1, 5, 'gpt', 'RabbitMQ에서 스케쥴링(Scheduling) 메시지를 처리하는 방법은?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 클라이언트 라이브러리(예: AMQP, Pika)를 사용하는 방법은?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 메시지 압축(Compression)을 적용하는 방법은?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 로깅(logging) 및 모니터링(monitoring)을 설정하는 방법은?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 가비지 컬렉션(Garbage Collection)에 대한 영향을 설명해보세요.'),
    (19, 1, 5, 'gpt', 'RabbitMQ에서 개별 메시지의 상태 추적(State Tracking)을 구현하는 방법은?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 스케일 아웃(Scale Out)을 위한 적절한 전략은?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 고려해야 할 보안 사항은 무엇인가요?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 메시지 크기 제한과 성능 최적화를 어떻게 다루나요?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 최소/최대 확장성을 보장하기 위한 방법은?'),
    (19, 1, 5, 'gpt', 'RabbitMQ에서 메시지 복제(Replication)를 구현하여 신뢰성을 확보하는 방법은?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 최적화된 메시지 전달을 위한 방법은?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 스케쥴링(Scheduling) 메시지를 처리하는 방법은?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 사용자 정의 교환(Exchange)을 구현하는 방법은?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 실시간 대시보드 또는 모니터링 애플리케이션을 만드는 방법은?'),
    (19, 1, 5, 'gpt', 'RabbitMQ에서 메시지 중복 제거(Deduplication)를 처리하는 방법은?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 클라이언트와 서버 간의 연결 관리를 어떻게 수행하나요?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 관리 및 모니터링 도구(예: RabbitMQ Management Plugin)를 설정하는 방법은?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 서로 다른 언어로 작성된 서비스 간 통합을 구현하는 방법은?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 최대 처리량(Max Throughput)을 향상시키는 방법은?'),
    (19, 1, 5, 'gpt', 'RabbitMQ에서 메시지 흐름 제어(Flow Control)을 설정하는 방법은?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 메시지의 직렬화와 역직렬화에 관한 고려사항은 무엇인가요?'), (19, 1, 5, 'gpt', 'RabbitMQ에서 다중 프로듀서와 다중 컨슈머 간의 조율(Coordination) 방법은?'), (19, 1, 5, 'gpt', 'RabbitMQ의 장단점에 대해 설명하세요.'), (19, 1, 5, 'gpt', 'RabbitMQ의 구조와 구성 요소에 대해 설명하세요.'),
    (19, 1, 5, 'gpt', 'RabbitMQ의 메시징 모델에 대해 설명하세요.'), (19, 1, 5, 'gpt', 'RabbitMQ의 Exchange, Queue, Binding에 대해 설명하세요.'), (19, 1, 5, 'gpt', 'RabbitMQ의 Publisher, Consumer에 대해 설명하세요.'), (19, 1, 5, 'gpt', 'RabbitMQ의 QoS(Quality of Service)에 대해 설명하세요.'), (19, 1, 5, 'gpt', 'RabbitMQ의 HA(High Availability)에 대해 설명하세요.'),
    (19, 1, 5, 'gpt', 'RabbitMQ의 SSL/TLS에 대해 설명하세요.'), (19, 1, 5, 'gpt', 'RabbitMQ의 다양한 버전에 대해 설명하세요.'), (19, 1, 5, 'gpt', 'RabbitMQ의 Direct Exchange에 대해 설명하세요.'), (19, 1, 5, 'gpt', 'RabbitMQ의 Topic Exchange에 대해 설명하세요.'), (19, 1, 5, 'gpt', 'RabbitMQ의 Fanout Exchange에 대해 설명하세요.'),
    (19, 1, 5, 'gpt', 'RabbitMQ의 Headers Exchange에 대해 설명하세요.'), (19, 1, 5, 'gpt', 'RabbitMQ의 Durable Queue에 대해 설명하세요.'), (19, 1, 5, 'gpt', 'RabbitMQ의 AutoDelete Queue에 대해 설명하세요.'), (19, 1, 5, 'gpt', 'RabbitMQ의 Exclusive Queue에 대해 설명하세요.'), (19, 1, 5, 'gpt', 'RabbitMQ의 Prefetch Count에 대해 설명하세요.'),
    (19, 1, 5, 'gpt', 'RabbitMQ의 Delivery Mode에 대해 설명하세요.'), (19, 1, 5, 'gpt', 'RabbitMQ의 TTL(Time To Live)에 대해 설명하세요.'), (19, 1, 5, 'gpt', 'RabbitMQ의 Dead Letter Exchange에 대해 설명하세요.'), (19, 1, 5, 'gpt', 'RabbitMQ의 HTTP API에 대해 설명하세요.'), (19, 1, 5, 'gpt', 'RabbitMQ의 CLI에 대해 설명하세요.'),
    (19, 1, 5, 'gpt', 'RabbitMQ의 Management Plugin에 대해 설명하세요.'), (19, 1, 5, 'gpt', 'RabbitMQ의 AMQP(Advanced Message Queuing Protocol)에 대해 설명하세요.'), (19, 1, 5, 'gpt', 'RabbitMQ를 사용하여 만든 웹 애플리케이션의 예를 들어 설명하세요.'), (19, 1, 5, 'gpt', 'RabbitMQ를 사용하여 만든 모바일 애플리케이션의 예를 들어 설명하세요.'), (19, 1, 5, 'gpt', 'RabbitMQ를 사용하여 만든 IoT 애플리케이션의 예를 들어 설명하세요.'),
    (19, 1, 5, 'gpt', 'RabbitMQ를 사용하여 만든 클라우드 애플리케이션의 예를 들어 설명하세요.'), (19, 1, 5, 'gpt', 'RabbitMQ를 사용하여 만든 대규모 시스템의 예를 들어 설명하세요.'),
    -- be (redis 20, 68 ea)
    (20, 1, 5, 'gpt', 'Redis란 무엇인가요?'), (20, 1, 5, 'gpt', 'Redis의 주요 사용 사례는 어떤 것이 있나요?'), (20, 1, 5, 'gpt', 'Redis와 관계형 데이터베이스의 차이점은 무엇인가요?'), (20, 1, 5, 'gpt', 'Redis의 데이터 구조는 어떤 것이 있나요?'), (20, 1, 5, 'gpt', 'Redis의 데이터 영속성(Persistence)에 대해 설명해보세요.'),
    (20, 1, 5, 'gpt', 'Redis의 메모리 저장 방식은 어떻게 동작하나요?'), (20, 1, 5, 'gpt', 'Redis에서 문자열(String) 데이터 타입을 어떻게 사용하나요?'), (20, 1, 5, 'gpt', 'Redis에서 해시(Hash) 데이터 타입을 어떻게 사용하나요?'), (20, 1, 5, 'gpt', 'Redis에서 리스트(List) 데이터 타입을 어떻게 사용하나요?'), (20, 1, 5, 'gpt', 'Redis에서 셋(Set) 데이터 타입을 어떻게 사용하나요?'),
    (20, 1, 5, 'gpt', 'Redis에서 정렬된 셋(Sorted Set) 데이터 타입을 어떻게 사용하나요?'), (20, 1, 5, 'gpt', 'Redis에서 비트맵(Bitmap) 데이터 타입을 어떻게 사용하나요?'), (20, 1, 5, 'gpt', 'Redis에서 데이터 만료 및 TTL(Time to Live)을 설정하는 방법은?'), (20, 1, 5, 'gpt', 'Redis에서 데이터의 수명주기(Expiration)에 대해 설명해보세요.'), (20, 1, 5, 'gpt', 'Redis의 데이터 삭제 및 만료 메커니즘에 대해 설명해보세요.'),
    (20, 1, 5, 'gpt', 'Redis에서 데이터 조회와 검색을 어떻게 수행하나요?'), (20, 1, 5, 'gpt', 'Redis에서 데이터 변경 및 업데이트를 어떻게 수행하나요?'), (20, 1, 5, 'gpt', 'Redis에서 트랜잭션(Transaction)을 어떻게 사용하나요?'), (20, 1, 5, 'gpt', 'Redis에서 Pub-Sub(Publish-Subscribe) 모델을 설명해보세요.'), (20, 1, 5, 'gpt', 'Redis에서 파이프라이닝(Pipelining)을 어떻게 활용하나요?'),
    (20, 1, 5, 'gpt', 'Redis에서 Lua 스크립트를 실행하는 방법은?'), (20, 1, 5, 'gpt', 'Redis의 멀티스레딩(Multi-threading) 및 멀티프로세싱(Multi-processing)에 대한 이해를 설명해보세요.'), (20, 1, 5, 'gpt', 'Redis의 클러스터링(Clustering)을 어떻게 설정하고 사용하나요?'), (20, 1, 5, 'gpt', 'Redis의 스냅샷(Snapshot)과 AOF(Append-Only File) 로그에 대해 설명해보세요.'), (20, 1, 5, 'gpt', 'Redis에서 슬레이브(Replica)와 마스터(Master) 역할의 차이는 무엇인가요?'),
    (20, 1, 5, 'gpt', 'Redis에서 데이터 베이스 선택 및 사용에 대해 설명해보세요.'), (20, 1, 5, 'gpt', 'Redis에서 데이터 일괄 처리(Batch Processing)를 수행하는 방법은?'), (20, 1, 5, 'gpt', 'Redis에서 데이터를 백업하고 복원하는 방법은?'), (20, 1, 5, 'gpt', 'Redis에서 공간 복잡도(Space Complexity)에 대한 이해를 설명해보세요.'), (20, 1, 5, 'gpt', 'Redis에서 성능 최적화 및 병목현상(Bottleneck) 해결을 어떻게 수행하나요?'),
    (20, 1, 5, 'gpt', 'Redis에서 명령어와 클라이언트 라이브러리의 관계에 대해 설명해보세요.'), (20, 1, 5, 'gpt', 'Redis에서 서버 측 플러그인(Server-side Plugin)을 개발하는 방법은?'), (20, 1, 5, 'gpt', 'Redis에서 스케쥴링(Scheduling)을 어떻게 구현하나요?'), (20, 1, 5, 'gpt', 'Redis에서 데이터베이스 및 키 공간(Key Space) 관리를 어떻게 수행하나요?'), (20, 1, 5, 'gpt', 'Redis에서 분산 락(Distributed Locking)을 구현하는 방법은?'),
    (20, 1, 5, 'gpt', 'Redis에서 크로스 데이터베이스 및 데이터 세그먼트 연결을 어떻게 처리하나요?'), (20, 1, 5, 'gpt', 'Redis에서 스케일 아웃(Scale Out) 및 샤딩(Sharding)을 어떻게 구현하나요?'), (20, 1, 5, 'gpt', 'Redis에서 메모리 효율적 관리 및 최적화를 어떻게 수행하나요?'), (20, 1, 5, 'gpt', 'Redis에서 주요 용도 및 사례에 대해 설명해보세요.'), (20, 1, 5, 'gpt', 'Redis에서 보안 설정과 접근 제어를 어떻게 수행하나요?'),
    (20, 1, 5, 'gpt', 'Redis에서 클라이언트와 서버 간의 연결 관리를 어떻게 수행하나요?'), (20, 1, 5, 'gpt', 'Redis에서 라우팅(Routing) 및 분산 패턴을 어떻게 처리하나요?'), (20, 1, 5, 'gpt', 'Redis에서 서로 다른 언어로 작성된 서비스 간 통합을 구현하는 방법은?'), (20, 1, 5, 'gpt', 'Redis에서 보안 취약점 및 예방책에 대해 설명해보세요.'), (20, 1, 5, 'gpt', 'Redis에서 최적화된 데이터 타입 및 쿼리를 사용하여 복잡한 연산을 어떻게 수행하나요?'),
    (20, 1, 5, 'gpt', 'Redis에서 데이터 압축(Compression) 및 역압축(Decompression)을 처리하는 방법은?'), (20, 1, 5, 'gpt', 'Redis에서 주요 버전 및 릴리스 변경 사항을 파악하고 적용하는 방법은?'), (20, 1, 5, 'gpt', 'Redis에서 다른 데이터베이스와의 동기화 및 데이터 이전을 어떻게 수행하나요?'), (20, 1, 5, 'gpt', 'Redis에서 피크(Peak) 및 부하(Load) 관리 전략을 어떻게 구현하나요?'), (20, 1, 5, 'gpt', 'Redis의 장단점에 대해 설명하세요.'),
    (20, 1, 5, 'gpt', 'Redis의 구조와 구성 요소에 대해 설명하세요.'), (20, 1, 5, 'gpt', 'Redis의 데이터 모델에 대해 설명하세요.'), (20, 1, 5, 'gpt', 'Redis의 데이터 구조에 대해 설명하세요.'), (20, 1, 5, 'gpt', 'Redis의 명령어에 대해 설명하세요.'), (20, 1, 5, 'gpt', 'Redis의 프로세스 모델에 대해 설명하세요.'),
    (20, 1, 5, 'gpt', 'Redis의 클러스터링에 대해 설명하세요.'), (20, 1, 5, 'gpt', 'Redis의 복제에 대해 설명하세요.'), (20, 1, 5, 'gpt', 'Redis의 다양한 버전에 대해 설명하세요.'), (20, 1, 5, 'gpt', 'Redis의 Key-value 저장소에 대해 설명하세요.'), (20, 1, 5, 'gpt', 'Redis의 자료구조에 대해 설명하세요.'),
    (20, 1, 5, 'gpt', 'Redis의 캐싱에 대해 설명하세요.'), (20, 1, 5, 'gpt', 'Redis의 스트림 처리에 대해 설명하세요.'), (20, 1, 5, 'gpt', 'Redis의 Pub/Sub에 대해 설명하세요.'), (20, 1, 5, 'gpt', 'Redis의 스크립팅에 대해 설명하세요.'), (20, 1, 5, 'gpt', 'Redis의 비동기 처리에 대해 설명하세요.'),
    (20, 1, 5, 'gpt', 'Redis의 모니터링에 대해 설명하세요.'), (20, 1, 5, 'gpt', 'Redis의 보안에 대해 설명하세요.'), (20, 1, 5, 'gpt', 'Redis의 다양한 활용 사례에 대해 설명하세요.'),
    
    
    -- check
    -- language (java 21, 50 ea)
    (21, 1, 5, 'gpt', 'Java란 무엇이며, 특징과 장점은 무엇인가요?'), (21, 1, 5, 'gpt', 'Java의 기본 데이터 타입과 참조 데이터 타입에 대해 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 객체 지향 프로그래밍의 개념과 중요성을 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 클래스(Class)와 객체(Object)의 차이를 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 상속(Inheritance)과 다형성(Polymorphism)에 대해 설명해주세요.'),
    (21, 1, 5, 'gpt', 'Java에서의 인터페이스(Interface)와 추상 클래스(Abstract Class)의 차이를 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 예외 처리(Exception Handling) 방법과 중요성을 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 스레드(Thread)와 멀티스레딩(Multithreading)의 개념을 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 컬렉션(Collection) 프레임워크의 종류와 각각의 특징을 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 제네릭스(Generics)의 개념과 사용 방법을 설명해주세요.'),
    (21, 1, 5, 'gpt', 'Java에서의 파일 입출력(File I/O) 방법과 주요 클래스들을 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 접근 제한자(Access Modifier)와 그 종류에 대해 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 내부 클래스(Inner Class)와 사용하는 이유에 대해 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 정적(Static) 멤버와 인스턴스(Instance) 멤버의 차이를 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 스트림(Stream) API와 사용하는 이유에 대해 설명해주세요.'),
    (21, 1, 5, 'gpt', 'Java에서의 람다 표현식(Lambda Expression)과 함수형 인터페이스(Functional Interface)에 대해 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 메모리 관리와 가비지 컬렉션(Garbage Collection)의 동작 원리를 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 애노테이션(Annotation)의 개념과 사용 방법을 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 String 클래스와 StringBuffer, StringBuilder의 차이를 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 데이터베이스 연동 방법과 JDBC(Java Database Connectivity)에 대해 설명해주세요.'),
    (21, 1, 5, 'gpt', 'Java에서의 컴파일과 인터프리터의 역할과 차이점을 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 열거형(Enum)의 개념과 사용 방법을 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 제네릭 메서드(Generic Method)와 제네릭 클래스(Generic Class)의 차이를 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 자료구조(Data Structure)와 해당 클래스들의 사용 방법을 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 패키지(Package)와 모듈(Module)의 차이를 설명해주세요.'),
    (21, 1, 5, 'gpt', 'Java에서의 스레드 동기화(Thread Synchronization)와 스레드 안전성(Thread Safety)에 대해 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 래퍼 클래스(Wrapper Class)와 언박싱(Unboxing), 오토박싱(Auto-boxing)에 대해 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 오버로딩(Overloading)과 오버라이딩(Overriding)의 차이를 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 컬렉션 프레임워크(Collection Framework)의 구조와 핵심 인터페이스들을 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 프로세스(Process)와 쓰레드(Thread)의 차이를 설명해주세요.'),
    (21, 1, 5, 'gpt', 'Java에서의 스택(Stack)과 힙(Heap) 메모리의 차이를 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 직렬화(Serialization)와 역직렬화(Deserialization)의 개념과 사용 방법을 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 와일드카드(Wildcard) 타입과 제한된 와일드카드 제네릭스(Bounded Wildcards)의 사용 방법을 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 암시적 형변환(Implicit Casting)과 명시적 형변환(Explicit Casting)의 차이를 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 스택 메모리(Stack Memory)와 힙 메모리(Heap Memory)의 역할과 특징을 설명해주세요.'),
    (21, 1, 5, 'gpt', 'Java에서의 비동기 프로그래밍과 Callable, Future 인터페이스의 사용 방법을 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 람다(Lambda)와 함수형 인터페이스(Functional Interface)의 필요성과 활용 방법을 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 멀티쓰레딩(Multithreading)에서 동기화(Synchronization)의 필요성과 사용 방법을 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 ConcurrentHashMap과 HashMap의 차이를 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 내장된 정렬 알고리즘과 사용 방법을 설명해주세요.'),
    (21, 1, 5, 'gpt', 'Java에서의 자바빈즈(JavaBeans)와 POJO(Plain Old Java Object)의 차이를 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 디자인 패턴(Design Patterns)과 주요 패턴들을 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 함수형 프로그래밍(Functional Programming)과 객체 지향 프로그래밍(Object-Oriented Programming)의 차이를 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 퍼포먼스 최적화(Performance Optimization)를 위한 방법과 주의할 점을 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 String Pool과 Heap의 메모리 할당 방식에 대해 설명해주세요.'),
    (21, 1, 5, 'gpt', 'Java에서의 컬렉션(Collection)을 사용하여 요소 추가, 삭제, 검색하는 방법을 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 디폴트 인터페이스(Default Interface)와 사용하는 이유에 대해 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 함수형 인터페이스(Functional Interface)를 활용한 람다 표현식과 활용성을 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 함수형 인터페이스(Functional Interface)를 사용한 람다 표현식의 장점과 활용 사례를 설명해주세요.'), (21, 1, 5, 'gpt', 'Java에서의 제네릭 메서드(Generic Method)와 제네릭 클래스(Generic Class)의 사용 범위와 장단점을 설명해주세요.'),
    -- language (kotlin 22, 50 ea)
    (22, 1, 5, 'gpt', 'Kotlin이란 무엇이며, 주요 특징과 장점은 무엇인가요?'), (22, 1, 5, 'gpt', 'Kotlin과 Java의 주요 차이점은 무엇인가요?'), (22, 1, 5, 'gpt', 'Kotlin에서의 널 안전성(Null Safety)과 관련된 기능을 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 변수 선언 방법과 타입 추론(Type Inference)에 대해 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 함수(Function)와 확장 함수(Extension Function)의 개념과 활용 방법을 설명해주세요.'),
    (22, 1, 5, 'gpt', 'Kotlin에서의 클래스(Class)와 객체(Object)의 관계를 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 람다(Lambda)와 고차 함수(Higher-Order Function)의 개념을 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 데이터 클래스(Data Class)와 주 생성자(Primary Constructor)의 역할을 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 코루틴(Coroutine)과 비동기 프로그래밍의 관련성에 대해 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 컬렉션(Collection)과 관련된 주요 기능들을 설명해주세요.'),
    (22, 1, 5, 'gpt', 'Kotlin에서의 when 식과 사용 예시를 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 클래스(Class) 상속과 오버라이딩(Overriding)에 대해 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 스마트 캐스트(Smart Cast)와 타입 검사(Type Check)의 역할을 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 불변성(Immutability)과 변경 가능성(Mutability)에 대해 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 코틀린 스크립트(Kotlin Script)의 개념과 사용 방법을 설명해주세요.'),
    (22, 1, 5, 'gpt', 'Kotlin에서의 접근 제어자(Access Modifier)와 그 종류에 대해 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 컴패니언 객체(Companion Object)와 정적 멤버의 관계를 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 디스트럭처링(Destructuring)과 사용 방법을 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 확장 함수(Extension Function)과 유용성에 대해 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 타입 안전성(Type Safety)과 보호 수준의 중요성을 설명해주세요.'),
    (22, 1, 5, 'gpt', 'Kotlin에서의 타입 변환(Type Casting)과 안전한 변환의 중요성을 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 애노테이션(Annotation)과 사용 방법을 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 sealed 클래스(Sealed Class)와 사용 사례를 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 Infix 함수와 사용 방법에 대해 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 열거형(Enum)과 사용 방법을 설명해주세요.'),
    (22, 1, 5, 'gpt', 'Kotlin에서의 inline 함수와 사용하는 이유에 대해 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 모듈(Module)과 패키지(Package)의 관계와 차이점을 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 리스트와 배열의 차이점을 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 순수 함수(Pure Function)의 특징과 중요성을 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 함수형 프로그래밍과 객체 지향 프로그래밍의 차이점을 설명해주세요.'),
    (22, 1, 5, 'gpt', 'Kotlin에서의 스코프 함수(Scope Functions)의 종류와 사용 방법을 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 lazy 초기화(Lazy Initialization)와 사용하는 이유에 대해 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 타입 별칭(Type Alias)과 사용하는 이유를 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 함수형 인터페이스(Functional Interface)와 사용 방법을 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 컬렉션 연산자와 함수형 연산자의 차이점을 설명해주세요.'),
    (22, 1, 5, 'gpt', 'Kotlin에서의 예외 처리(Exception Handling) 방법과 주요 예외 처리 기술을 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 객체 선언(Object Declaration)과 싱글톤(Singleton)의 관계를 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 모듈(Module) 간 상호 작용과 의존성 주입(Dependency Injection)에 대해 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 코드 최적화와 효율성에 대한 고려 사항을 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 런타임과 컴파일 타임에 대한 이해와 활용 방법을 설명해주세요.'),
    (22, 1, 5, 'gpt', 'Kotlin에서의 타입 검사(Type Check)와 타입 캐스트(Type Cast)의 차이를 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 멤버 함수와 확장 함수의 우선 순위와 차이를 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 공변성(Contravariance)과 반변성(Covariance)의 개념과 사용 방법을 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 sealed 클래스와 사용하는 이유에 대해 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 인라인 클래스(Inline Class)와 사용 사례를 설명해주세요.'),
    (22, 1, 5, 'gpt', 'Kotlin에서의 안드로이드 앱 개발과 관련된 Kotlin의 주요 장점에 대해 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 고차 함수와 클로저(Closure)의 관계를 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 스트림(Stream)과 컬렉션 처리의 관련성과 차이를 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 열거형(Enum) 클래스와 상수의 관계를 설명해주세요.'), (22, 1, 5, 'gpt', 'Kotlin에서의 트랜스파일링(Transpiling)과 컴파일링(Compiling)의 차이와 의미를 설명해주세요.'),
    -- language (typescript 23, 50 ea)
    (23, 1, 5, 'gpt', 'TypeScript란 무엇이며, JavaScript와의 주요 차이점은 무엇인가요?'), (23, 1, 5, 'gpt', 'TypeScript의 주요 장점과 언어 특징은 무엇인가요?'), (23, 1, 5, 'gpt', 'TypeScript에서의 타입(Type) 시스템의 역할과 중요성을 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 변수 선언 방법과 타입 어노테이션(Type Annotation)의 사용 방법을 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 인터페이스(Interface)의 개념과 사용 방법을 설명해주세요.'),
    (23, 1, 5, 'gpt', 'TypeScript에서의 클래스(Class)의 개념과 상속(Inheritance)에 대해 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 제네릭(Generic)의 개념과 활용 방법을 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 열거형(Enum)의 사용 방법과 역할을 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 함수(Function)와 화살표 함수(Arrow Function)의 차이점을 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 모듈(Module) 시스템의 구조와 사용 방법을 설명해주세요.'),
    (23, 1, 5, 'gpt', 'TypeScript에서의 접근 제한자(Access Modifiers)와 그 역할에 대해 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 추상 클래스(Abstract Class)와 인터페이스(Interface)의 차이를 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 타입 가드(Type Guards)의 개념과 사용 방법을 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 널 병합 연산자(Nullish Coalescing Operator)와 옵셔널 체이닝 연산자(Optional Chaining Operator)에 대해 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 타입 별칭(Type Alias)과 사용 방법을 설명해주세요.'),
    (23, 1, 5, 'gpt', 'TypeScript에서의 추상화(Abstraction)와 캡슐화(Encapsulation)에 대해 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 타입 추론(Type Inference)의 원리와 활용 방법을 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 타입 변환(Type Casting)의 방법과 유의할 점을 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 클래스 데코레이터(Class Decorator)와 메서드 데코레이터(Method Decorator)의 역할을 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 비동기 프로그래밍과 Promise, Async/Await의 사용 방법을 설명해주세요.'),
    (23, 1, 5, 'gpt', 'TypeScript에서의 타입 유니언(Type Union)과 타입 인터섹션(Type Intersection)의 차이를 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 타입 스크립트(TypeScript)와 자바스크립트(JavaScript)의 혼용과 호환성에 대해 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 코드 리팩토링과 관련된 주요 기법들을 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 에러 처리(Error Handling) 방법과 주요 예외 처리 기술을 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 모듈(Module) 시스템과 네임스페이스(Namespace)의 차이를 설명해주세요.'),
    (23, 1, 5, 'gpt', 'TypeScript에서의 공변성(Contravariance)과 반변성(Covariance)의 개념과 차이를 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 클래스(Class)의 생성자(Constructor)와 초기화(Initialization) 방법을 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 열거형(Enum)의 사용 사례와 장단점에 대해 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 모듈(Module)을 사용한 코드 분리와 재사용성에 대해 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 타입 가드(Type Guards)의 필요성과 사용 예시를 설명해주세요.'),
    (23, 1, 5, 'gpt', 'TypeScript에서의 JSX와 함께 사용되는 타입 시스템에 대해 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 접근 제한자(Access Modifiers)의 종류와 사용 방법을 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 타입을 활용한 코드 최적화와 효율성에 대해 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 추상 클래스(Abstract Class)와 인터페이스(Interface)의 활용성과 차이를 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 타입 안전성(Type Safety)의 개념과 중요성을 설명해주세요.'),
    (23, 1, 5, 'gpt', 'TypeScript에서의 타입 스크립트(TypeScript)의 컴파일러 설정과 주요 옵션에 대해 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 타입 별칭(Type Alias)과 인터페이스(Interface)의 선택 기준에 대해 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 함수 오버로딩(Function Overloading)과 다형성(Polymorphism)에 대해 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 데코레이터(Decorator)의 역할과 사용 사례에 대해 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 클래스(Class) 상속과 구현(Implements)의 차이를 설명해주세요.'),
    (23, 1, 5, 'gpt', 'TypeScript에서의 고급 타입(Advanced Types)을 활용한 코드 설계와 유지보수에 대해 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 옵셔널(Optional)과 필수(Required) 타입의 사용 방법과 필요성을 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 모듈(Module)과 네임스페이스(Namespace)의 모듈화 기능과 관리성에 대해 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 추상화(Abstraction)와 은닉화(Encapsulation)의 중요성과 활용 방법을 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 타입 스크립트(TypeScript)의 타입 시스템을 이용한 버그 방지와 코드 품질 향상에 대해 설명해주세요.'),
    (23, 1, 5, 'gpt', 'TypeScript에서의 타입 안전성(Type Safety)과 동적 타입 언어와의 차이를 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 접근 제어(Access Control)를 이용한 보안성 향상에 대해 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 라이브러리 타이핑(Library Typing)과 외부 라이브러리 타입 정의의 필요성을 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 객체 지향 프로그래밍과 함수형 프로그래밍의 융합과 장단점을 설명해주세요.'), (23, 1, 5, 'gpt', 'TypeScript에서의 타입 지정(Type Inference)과 타입 어노테이션(Type Annotation)의 사용 사례와 선택 기준에 대해 설명해주세요.'),
    -- language (javascript 24, 66 ea)
    (24, 1, 5, 'gpt', '자바스크립트란 무엇인가요?'), (24, 1, 5, 'gpt', '변수를 선언하는 방법에는 어떤 것들이 있나요?'), (24, 1, 5, 'gpt', '자바스크립트의 데이터 타입에는 어떤 것들이 있나요?'), (24, 1, 5, 'gpt', '클로저(Closure)란 무엇인가요?'), (24, 1, 5, 'gpt', '프로토타입(Prototype)이란 무엇인가요?'),
    (24, 1, 5, 'gpt', '콜백 함수(Callback Function)와 프로미스(Promise)의 차이는 무엇인가요?'), (24, 1, 5, 'gpt', 'ES6에서 추가된 let과 const의 특징은 무엇인가요?'), (24, 1, 5, 'gpt', '자바스크립트에서의 this 키워드 동작 방식은 무엇인가요?'), (24, 1, 5, 'gpt', '호이스팅(Hoisting)이란 무엇인가요?'), (24, 1, 5, 'gpt', '클로저를 사용하는 예시를 들어보세요.'),
    (24, 1, 5, 'gpt', '이벤트 루프(Event Loop)에 대해 설명해보세요.'), (24, 1, 5, 'gpt', 'ES6의 화살표 함수(Arrow Function)와 일반 함수의 차이는 무엇인가요?'), (24, 1, 5, 'gpt', '자바스크립트에서의 비동기 프로그래밍 방법에 대해 설명해보세요.'), (24, 1, 5, 'gpt', '배열의 내장 함수 중 map과 forEach의 차이점은 무엇인가요?'), (24, 1, 5, 'gpt', '프로토타입 상속(Prototype Inheritance)이란 무엇인가요?'),
    (24, 1, 5, 'gpt', 'Promise의 상태에는 어떤 것들이 있나요?'), (24, 1, 5, 'gpt', 'call, apply, bind 메서드의 차이점은 무엇인가요?'), (24, 1, 5, 'gpt', '자바스크립트에서의 REST 파라미터와 스프레드 연산자의 차이는 무엇인가요?'), (24, 1, 5, 'gpt', '자바스크립트의 이벤트 위임(Event Delegation)에 대해 설명해보세요.'), (24, 1, 5, 'gpt', '자바스크립트에서의 "strict mode"는 무엇이며 어떻게 사용하나요?'),
    (24, 1, 5, 'gpt', 'RESTful API와 GraphQL의 차이점은 무엇인가요?'), (24, 1, 5, 'gpt', '자바스크립트에서의 동기(Synchronous)와 비동기(Asynchronous)의 차이는 무엇인가요?'), (24, 1, 5, 'gpt', '프로미스 체이닝(Promise Chaining)이란 무엇인가요?'), (24, 1, 5, 'gpt', '자바스크립트에서의 "map" 함수와 "filter" 함수의 차이는 무엇인가요?'), (24, 1, 5, 'gpt', '자바스크립트에서의 "event loop"의 역할은 무엇인가요?'),
    (24, 1, 5, 'gpt', 'let과 "var"의 차이점은 무엇인가요?'), (24, 1, 5, 'gpt', '콜백 지옥(Callback Hell)이란 무엇이며 어떻게 해결할 수 있나요?'), (24, 1, 5, 'gpt', '자바스크립트에서의 클래식 상속(Classical Inheritance)과 프로토타입 상속(Prototype Inheritance)의 차이는 무엇인가요?'), (24, 1, 5, 'gpt', 'ES6의 클래스(Class) 문법에 대해 설명해보세요.'), (24, 1, 5, 'gpt', '객체의 불변성(Immutability)을 유지하는 방법은 무엇인가요?'),
    (24, 1, 5, 'gpt', '자바스크립트에서의 스코프(Scope)와 클로저(Closure)의 관계는 무엇인가요?'), (24, 1, 5, 'gpt', '자바스크립트에서의 비동기 프로그래밍을 위해 사용되는 패턴들에 대해 설명해보세요.'), (24, 1, 5, 'gpt', '프로토타입 체인(Prototype Chain)에 대해 설명해보세요.'), (24, 1, 5, 'gpt', '자바스크립트의 삼항 연산자(Ternary Operator)에 대해 설명해보세요.'), (24, 1, 5, 'gpt', 'use strict 모드를 사용하는 이유는 무엇인가요?'),
    (24, 1, 5, 'gpt', '자바스크립트에서의 클로저(Closure)를 사용하여 private 변수를 구현하는 방법을 보여주세요.'), (24, 1, 5, 'gpt', '자바스크립트에서의 순수 함수(Pure Function)란 무엇인가요?'), (24, 1, 5, 'gpt', '자바스크립트의 비동기 프로그래밍에서 콜백(Callback)과 프로미스(Promise)의 장단점은 무엇인가요?'), (24, 1, 5, 'gpt', '자바스크립트의 비동기 처리를 위한 setTimeout 함수의 동작 방식에 대해 설명해보세요.'), (24, 1, 5, 'gpt', '자바스크립트에서의 이벤트 버블링(Event Bubbling)과 이벤트 캡처(Event Capturing)에 대해 설명해보세요.'),
    (24, 1, 5, 'gpt', '자바스크립트에서의 전역 변수(Global Variable)와 지역 변수(Local Variable)의 차이는 무엇인가요?'), (24, 1, 5, 'gpt', '자바스크립트에서의 비동기 처리 패턴 중 콜백(Callback)과 프로미스(Promise)의 장단점은 무엇인가요?'), (24, 1, 5, 'gpt', '자바스크립트에서의 객체(Object)와 배열(Array)의 차이는 무엇인가요?'), (24, 1, 5, 'gpt', '자바스크립트의 "new" 키워드의 역할은 무엇인가요?'), (24, 1, 5, 'gpt', '클로저를 사용하여 private 메서드를 구현하는 예시를 보여주세요.'),
    (24, 1, 5, 'gpt', '자바스크립트에서의 클래스(Class) 상속 방법에 대해 설명해보세요.'), (24, 1, 5, 'gpt', '객체의 얕은 복사(Shallow Copy)와 깊은 복사(Deep Copy)의 차이는 무엇인가요?'), (24, 1, 5, 'gpt', '자바스크립트에서의 "bind" 메서드의 역할은 무엇인가요?'), (24, 1, 5, 'gpt', '자바스크립트에서의 비동기 프로그래밍을 위해 사용되는 패턴 중 "async/await"의 장점은 무엇인가요?'), (24, 1, 5, 'gpt', '자바스크립트에서의 프로토타입 상속(Prototype Inheritance)을 사용하는 예시를 보여주세요.'),
    (24, 1, 5, 'gpt', '자바스크립트에서의 객체의 불변성(Immutability)을 유지하는 방법에 대해 설명해보세요.'), (24, 1, 5, 'gpt', '자바스크립트에서의 "apply"와 "call" 메서드의 차이는 무엇인가요?'), (24, 1, 5, 'gpt', 'Event.preventDefault() 메서드의 역할은 무엇인가요?'), (24, 1, 5, 'gpt', '자바스크립트에서의 "localStorage"와 "sessionStorage"의 차이는 무엇인가요?'), (24, 1, 5, 'gpt', '자바스크립트에서의 "this" 바인딩이 어떻게 결정되나요?'),
    (24, 1, 5, 'gpt', 'Event.stopPropagation() 메서드의 역할은 무엇인가요?'), (24, 1, 5, 'gpt', '자바스크립트에서의 "setTimeout" 함수와 "setInterval" 함수의 차이는 무엇인가요?'), (24, 1, 5, 'gpt', '자바스크립트의 비동기 처리를 위해 사용되는 "Promise.all()" 메서드의 역할은 무엇인가요?'), (24, 1, 5, 'gpt', '자바스크립트에서의 "Module Pattern"이란 무엇인가요?'), (24, 1, 5, 'gpt', 'Event.target과 "Event.currentTarget"의 차이는 무엇인가요?'),
    (24, 1, 5, 'gpt', '자바스크립트에서의 "use strict" 모드를 사용하지 않았을 때 발생할 수 있는 문제는 무엇인가요?'), (24, 1, 5, 'gpt', '자바스크립트의 "closures"를 사용하여 어떤 상황에서 코드를 간결하게 만들 수 있는지 설명해보세요.'), (24, 1, 5, 'gpt', 'use strict 모드를 사용할 때 어떤 장점이 있나요?'), (24, 1, 5, 'gpt', 'NaN이란 무엇이며 어떻게 확인할 수 있나요?'), (24, 1, 5, 'gpt', '자바스크립트에서의 "JSON.parse()"와 "JSON.stringify()"의 차이는 무엇인가요?'),
	-- language (delphi 25, 30 ea)
    (25, 1, 5, 'gpt', 'Delphi란 무엇이며, 주요 특징은 무엇인가요?'), (25, 1, 5, 'gpt', 'Delphi에서의 객체 지향 프로그래밍의 개념과 사용 방법을 설명해주세요.'), (25, 1, 5, 'gpt', 'Delphi에서의 이벤트 핸들러(Event Handler)의 개념과 활용 방법을 설명해주세요.'), (25, 1, 5, 'gpt', 'Delphi에서의 컴포넌트(Component)와 컨트롤(Control)의 차이는 무엇인가요?'), (25, 1, 5, 'gpt', 'Delphi에서의 윈도우즈 프로그래밍과 관련된 주요 라이브러리에 대해 설명해주세요.'),
    (25, 1, 5, 'gpt', 'Delphi에서의 스트링(String)과 문자열 처리 방법을 설명해주세요.'), (25, 1, 5, 'gpt', 'Delphi에서의 예외 처리(Exception Handling) 방법과 역할을 설명해주세요.'), (25, 1, 5, 'gpt', 'Delphi에서의 데이터베이스 연동 방법과 주요 구성 요소에 대해 설명해주세요.'), (25, 1, 5, 'gpt', 'Delphi에서의 컴포넌트 상속(Component Inheritance)의 개념과 사용 방법을 설명해주세요.'), (25, 1, 5, 'gpt', 'Delphi에서의 멀티 스레딩(Multi-Threading)과 동기화(Synchronization) 방법을 설명해주세요.'),
    (25, 1, 5, 'gpt', 'Delphi에서의 GUI(Graphical User Interface) 디자인과 개발 방법을 설명해주세요.'), (25, 1, 5, 'gpt', 'Delphi에서의 메모리 관리 방식과 중요성을 설명해주세요.'), (25, 1, 5, 'gpt', 'Delphi에서의 파일 입출력(File I/O) 방법과 사용되는 함수들을 설명해주세요.'), (25, 1, 5, 'gpt', 'Delphi에서의 컴포넌트 이벤트 처리와 사용 예시를 설명해주세요.'), (25, 1, 5, 'gpt', 'Delphi에서의 컴포넌트와 객체(Object)의 관계를 설명해주세요.'),
    (25, 1, 5, 'gpt', 'Delphi에서의 트랩 코드(Trap Code)와 트랩 핸들러(Trap Handler)의 차이를 설명해주세요.'), (25, 1, 5, 'gpt', 'Delphi에서의 데이터베이스 연결과 관련된 주요 컴포넌트들을 설명해주세요.'), (25, 1, 5, 'gpt', 'Delphi에서의 레코드(Record)와 클래스(Class)의 차이를 설명해주세요.'), (25, 1, 5, 'gpt', 'Delphi에서의 이벤트(Event)와 델리게이트(Delegate) 패턴의 관계를 설명해주세요.'), (25, 1, 5, 'gpt', ''),
    (25, 1, 5, 'gpt', 'Delphi에서의 유니코드(Unicode) 문자열 처리와 관련된 주요 함수들을 설명해주세요.'), (25, 1, 5, 'gpt', 'Delphi에서의 컴포넌트와 데이터베이스 연결의 라이브 바인딩(Live Binding)의 개념과 사용 방법을 설명해주세요.'), (25, 1, 5, 'gpt', 'Delphi에서의 인터페이스(Interface)의 역할과 활용 방법을 설명해주세요.'), (25, 1, 5, 'gpt', 'Delphi에서의 메모리 누수(Memory Leak) 방지를 위한 방법을 설명해주세요.'), (25, 1, 5, 'gpt', 'Delphi에서의 컴포넌트 상속과 재사용성에 대해 설명해주세요.'),
    (25, 1, 5, 'gpt', 'Delphi에서의 데이터베이스 쿼리(Query) 작성 방법과 주요 컴포넌트를 설명해주세요.'), (25, 1, 5, 'gpt', 'Delphi에서의 테스팅(Test)과 디버깅(Debug) 방법을 설명해주세요.'), (25, 1, 5, 'gpt', 'Delphi에서의 통신 프로토콜(Communication Protocol)과 관련된 주요 기능을 설명해주세요.'), (25, 1, 5, 'gpt', 'Delphi에서의 컴포넌트와 컨트롤의 차이점과 사용 사례에 대해 설명해주세요.'), (25, 1, 5, 'gpt', 'Delphi에서의 비동기 프로그래밍과 관련된 주요 개념과 사용 방법을 설명해주세요.'),
    -- language (c c++ 26, 40 ea)
    (26, 1, 5, 'gpt', 'C++ 언어의 특징과 C와의 주요 차이점은 무엇인가요?'), (26, 1, 5, 'gpt', '클래스(Class)와 객체(Object)의 개념과 사용 방법을 설명해주세요.'), (26, 1, 5, 'gpt', '상속(Inheritance)의 종류와 다중 상속(Multiple Inheritance)에 대해 설명해주세요.'), (26, 1, 5, 'gpt', '가상 함수(Virtual Function)와 순수 가상 함수(Pure Virtual Function)의 차이를 설명해주세요.'), (26, 1, 5, 'gpt', '다형성(Polymorphism)과 가상 함수(Virtual Function)의 관계를 설명해주세요.'),
    (26, 1, 5, 'gpt', '템플릿(Template)과 제네릭 프로그래밍(Generic Programming)에 대해 설명해주세요.'), (26, 1, 5, 'gpt', '예외 처리(Exception Handling) 방법과 try-catch 구문의 역할을 설명해주세요.'), (26, 1, 5, 'gpt', '스마트 포인터(Smart Pointers)의 종류와 사용 방법을 설명해주세요.'), (26, 1, 5, 'gpt', 'STL(Standard Template Library)과 주요 컨테이너(Container)에 대해 설명해주세요.'), (26, 1, 5, 'gpt', '람다 함수(Lambda Function)의 개념과 사용 방법을 설명해주세요.'),
    (26, 1, 5, 'gpt', '클래스와 구조체의 차이점은 무엇인가요?'), (26, 1, 5, 'gpt', 'C++에서의 참조자(Reference)와 포인터의 차이를 설명해주세요.'), (26, 1, 5, 'gpt', 'C++에서의 생성자(Constructor)와 소멸자(Destructor)의 역할을 설명해주세요.'), (26, 1, 5, 'gpt', '연산자 오버로딩(Operator Overloading)의 개념과 사용 방법을 설명해주세요.'), (26, 1, 5, 'gpt', '네임스페이스(Namespace)의 역할과 사용 방법을 설명해주세요.'),
    (26, 1, 5, 'gpt', '템플릿 클래스와 일반 클래스의 차이점에 대해 설명해주세요.'), (26, 1, 5, 'gpt', '다형성(Polymorphism)을 사용한 예시를 들어 설명해주세요.'), (26, 1, 5, 'gpt', 'C++에서의 상속과 가상 함수의 관계를 설명해주세요.'), (26, 1, 5, 'gpt', 'C++에서의 다중 상속(Multiple Inheritance)의 장단점은 무엇인가요?'), (26, 1, 5, 'gpt', 'C++의 move semantics와 왜 사용하는지에 대해 설명해주세요.'),
    (26, 1, 5, 'gpt', 'C 언어의 특징과 장점은 무엇인가요?'), (26, 1, 5, 'gpt', '포인터(Pointer)의 개념과 포인터 산술 연산에 대해 설명해주세요.'), (26, 1, 5, 'gpt', '배열(Array)과 포인터(Pointer)의 차이점은 무엇인가요?'), (26, 1, 5, 'gpt', '구조체(Structure)와 유니언(Union)의 차이를 설명해주세요.'), (26, 1, 5, 'gpt', '동적 메모리 할당(Dynamic Memory Allocation)과 malloc, free 함수의 역할에 대해 설명해주세요.'),
    (26, 1, 5, 'gpt', '파일 입출력(File I/O) 방법과 사용되는 함수들을 설명해주세요.'), (26, 1, 5, 'gpt', '함수 포인터(Function Pointer)의 개념과 활용 방법을 설명해주세요.'), (26, 1, 5, 'gpt', '문자열(String)과 문자열 처리 방법에 대해 설명해주세요.'), (26, 1, 5, 'gpt', '전처리기(Preprocessor)의 역할과 사용 방법을 설명해주세요.'), (26, 1, 5, 'gpt', '구조체 포인터(Structure Pointer)의 사용 방법과 예시를 들어 설명해주세요.'),
    (26, 1, 5, 'gpt', '포인터와 배열의 관계에 대해 설명해주세요.'), (26, 1, 5, 'gpt', 'C언어의 메모리 구조와 스택, 힙의 차이점을 설명해주세요.'), (26, 1, 5, 'gpt', '함수 포인터가 어떤 상황에서 유용하게 사용될 수 있는지 예시를 들어 설명해주세요.'), (26, 1, 5, 'gpt', 'C언어에서의 데이터 타입(Type)과 사이즈에 대해 설명해주세요.'), (26, 1, 5, 'gpt', '더블 포인터(Double Pointer)의 개념과 사용처를 설명해주세요.'),
    (26, 1, 5, 'gpt', '배열과 포인터의 유사성과 차이점에 대해 설명해주세요.'), (26, 1, 5, 'gpt', 'C언어에서의 동적 할당과 정적 할당의 차이점은 무엇인가요?'), (26, 1, 5, 'gpt', '파일 입출력 시 사용되는 fopen과 fclose의 역할에 대해 설명해주세요.'), (26, 1, 5, 'gpt', 'C언어에서의 비트 연산자와 비트 시프트 연산에 대해 설명해주세요.'), (26, 1, 5, 'gpt', 'C언어에서의 포인터와 메모리 주소에 대한 이해를 설명해주세요.'),
    -- language (c# 27, 30 ea)
    (27, 1, 5, 'gpt', 'C# 언어의 특징과 장점은 무엇인가요?'), (27, 1, 5, 'gpt', 'C#에서의 클래스(Class)와 구조체(Struct)의 차이점은 무엇인가요?'), (27, 1, 5, 'gpt', 'C#에서의 상속(Inheritance)과 다형성(Polymorphism)에 대해 설명해주세요.'), (27, 1, 5, 'gpt', 'C#에서의 인터페이스(Interface)의 역할과 사용 방법을 설명해주세요.'), (27, 1, 5, 'gpt', 'C#에서의 델리게이트(Delegate)와 이벤트(Event)의 차이는 무엇인가요?'),
    (27, 1, 5, 'gpt', 'C#에서의 제네릭(Generic)의 개념과 활용 방법을 설명해주세요.'), (27, 1, 5, 'gpt', 'C#에서의 예외 처리(Exception Handling) 방법과 try-catch 구문의 역할을 설명해주세요.'), (27, 1, 5, 'gpt', 'C#에서의 LINQ(Language Integrated Query)의 개념과 사용 방법을 설명해주세요.'), (27, 1, 5, 'gpt', 'C#에서의 async-await 키워드의 역할과 비동기 프로그래밍에 대해 설명해주세요.'), (27, 1, 5, 'gpt', 'C#에서의 속성(Properties)과 인덱서(Indexers)의 차이를 설명해주세요.'),
    (27, 1, 5, 'gpt', 'C#에서의 열거형(Enum)의 사용 방법과 활용 예시를 설명해주세요.'), (27, 1, 5, 'gpt', 'C#에서의 컬렉션(Collection)과 제네릭 컬렉션(Generic Collection)의 차이는 무엇인가요?'), (27, 1, 5, 'gpt', 'C#에서의 데이터 타입(Data Types)과 값 타입(Value Types)의 차이를 설명해주세요.'), (27, 1, 5, 'gpt', 'C#에서의 암시적 형식 변환(Implicit Type Conversion)과 명시적 형식 변환(Explicit Type Conversion)의 차이는 무엇인가요?'), (27, 1, 5, 'gpt', 'C#에서의 IDisposable 인터페이스의 역할과 Dispose 메서드의 중요성에 대해 설명해주세요.'),
    (27, 1, 5, 'gpt', 'C#에서의 다중 스레딩(Multithreading)과 동기화(Synchronization) 방법을 설명해주세요.'), (27, 1, 5, 'gpt', 'C#에서의 네임스페이스(Namespace)의 역할과 사용 방법을 설명해주세요.'), (27, 1, 5, 'gpt', 'C#에서의 파일 입출력(File I/O) 방법과 사용되는 클래스들을 설명해주세요.'), (27, 1, 5, 'gpt', 'C#에서의 소켓 프로그래밍(Socket Programming)에 대해 설명해주세요.'), (27, 1, 5, 'gpt', 'C#에서의 컴파일러(Compiler)와 인터프리터(Interpreter)의 차이점은 무엇인가요?'),
    (27, 1, 5, 'gpt', 'C#에서의 람다식(Lambda Expressions)의 개념과 사용 방법을 설명해주세요.'), (27, 1, 5, 'gpt', 'C#에서의 속성(Properties)의 get과 set 접근자의 역할과 차이를 설명해주세요.'), (27, 1, 5, 'gpt', 'C#에서의 이벤트(Event)와 델리게이트(Delegate)의 관계와 활용 방법을 설명해주세요.'), (27, 1, 5, 'gpt', 'C#에서의 인터페이스(Interface)를 사용한 다중 상속(Multiple Inheritance)의 구현 방법은 무엇인가요?'), (27, 1, 5, 'gpt', 'C#에서의 직렬화(Serialization)와 역직렬화(Deserialization)의 개념과 사용 방법을 설명해주세요.'),
    (27, 1, 5, 'gpt', 'C#에서의 LINQ(Language Integrated Query)와 메서드 체이닝(Method Chaining)의 차이를 설명해주세요.'), (27, 1, 5, 'gpt', 'C#에서의 예외 처리(Exception Handling)에서 finally 블록의 역할은 무엇인가요?'), (27, 1, 5, 'gpt', 'C#에서의 프로퍼티(Properties)와 필드(Fields)의 차이를 설명해주세요.'), (27, 1, 5, 'gpt', 'C#에서의 추상 클래스(Abstract Class)와 인터페이스(Interface)의 차이점은 무엇인가요?'), (27, 1, 5, 'gpt', 'C#에서의 C# 8.0, 9.0의 새로운 기능들에 대해 설명해주세요.'),
    -- language (golang 28, 30 ea)
    (28, 1, 5, 'gpt', 'GoLang의 특징과 장점은 무엇인가요?'), (28, 1, 5, 'gpt', 'GoLang에서의 고루틴(Goroutine)의 개념과 사용 방법을 설명해주세요.'), (28, 1, 5, 'gpt', 'GoLang에서의 채널(Channel)의 역할과 특징은 무엇인가요?'), (28, 1, 5, 'gpt', 'GoLang에서의 인터페이스(Interface)와 구조체(Struct)의 활용 방법을 설명해주세요.'), (28, 1, 5, 'gpt', 'GoLang에서의 defer 키워드의 역할과 사용 예시를 설명해주세요.'),
    (28, 1, 5, 'gpt', 'GoLang에서의 맵(Map)과 슬라이스(Slice)의 차이점은 무엇인가요?'), (28, 1, 5, 'gpt', 'GoLang에서의 패키지(Package)의 역할과 구조를 설명해주세요.'), (28, 1, 5, 'gpt', 'GoLang의 메서드(Method)와 함수(Function)의 차이는 무엇인가요?'), (28, 1, 5, 'gpt', 'GoLang의 채널(Channel)과 동기화(Synchronization)에 대해 설명해주세요.'), (28, 1, 5, 'gpt', 'GoLang에서의 에러 처리(Error Handling) 방식과 관례를 설명해주세요.'),
    (28, 1, 5, 'gpt', 'GoLang에서의 포인터(Pointer)의 역할과 활용 방법을 설명해주세요.'), (28, 1, 5, 'gpt', 'GoLang에서의 클로저(Closure)의 개념과 활용 방법을 설명해주세요.'), (28, 1, 5, 'gpt', 'GoLang에서의 웹 서버 구축과 HTTP 핸들러(Handler)의 구현 방법을 설명해주세요.'), (28, 1, 5, 'gpt', 'GoLang에서의 동시성(Concurrency)과 병렬성(Parallelism)의 차이를 설명해주세요.'), (28, 1, 5, 'gpt', 'GoLang에서의 JSON 처리(JSON Handling) 방법과 관련된 라이브러리는 무엇이 있나요?'),
    (28, 1, 5, 'gpt', 'GoLang에서의 defer, panic, recover의 동작 방식과 사용 사례를 설명해주세요.'), (28, 1, 5, 'gpt', 'GoLang에서의 인터페이스(Interface)를 활용한 다형성(Polymorphism)에 대해 설명해주세요.'), (28, 1, 5, 'gpt', 'GoLang에서의 벤치마크(Benchmark) 테스트를 수행하는 방법은 무엇인가요?'), (28, 1, 5, 'gpt', 'GoLang에서의 클로저(Closure)의 사용과 예시를 설명해주세요.'), (28, 1, 5, 'gpt', 'GoLang에서의 메모리 할당(Memory Allocation)과 GC(Garbage Collection)의 동작 방식을 설명해주세요.'),
    (28, 1, 5, 'gpt', 'GoLang에서의 모듈(Module) 시스템과 패키지(Package) 관리 방법을 설명해주세요.'), (28, 1, 5, 'gpt', 'GoLang에서의 패닉(Panic)과 리커버(Recover)의 사용 방법과 주의할 점을 설명해주세요.'), (28, 1, 5, 'gpt', 'GoLang에서의 채널(Channel) 버퍼링(Buffering)과 언버퍼링(Unbuffering)의 차이는 무엇인가요?'), (28, 1, 5, 'gpt', 'GoLang에서의 워크스페이스(Workspace)와 GOPATH의 역할과 차이를 설명해주세요.'), (28, 1, 5, 'gpt', 'GoLang의 슬라이스(Slice)의 내부 구조와 동작 방식을 설명해주세요.'),
    (28, 1, 5, 'gpt', 'GoLang에서의 동시성(Concurrency)을 위한 Mutex와 RWMutex의 차이는 무엇인가요?'), (28, 1, 5, 'gpt', 'GoLang에서의 웹 프레임워크(예: Gin, Echo)의 특징과 사용법에 대해 설명해주세요.'), (28, 1, 5, 'gpt', 'GoLang에서의 테스팅(Test)과 관련된 라이브러리 및 테스팅 방법을 소개해주세요.'), (28, 1, 5, 'gpt', 'GoLang에서의 모듈(Module)을 활용한 패키지(Package) 버전 관리 방법을 설명해주세요.'), (28, 1, 5, 'gpt', 'GoLang에서의 인터페이스(Interface)와 구조체(Struct)의 활용 방법을 예시와 함께 설명해주세요.'),
    -- language (swift 29, 40 ea)
    (29, 1, 5, 'gpt', 'Swift 언어의 주요 특징과 장점은 무엇인가요?'), (29, 1, 5, 'gpt', '옵셔널(Optional)이 Swift에서 어떻게 사용되나요?'), (29, 1, 5, 'gpt', 'Swift의 강한 타입(Type Safety)이란 무엇인가요?'), (29, 1, 5, 'gpt', 'Swift에서의 튜플(Tuple)의 역할과 사용 방법을 설명해주세요.'), (29, 1, 5, 'gpt', 'Swift에서의 함수(Function)와 클로저(Closure)의 차이점은 무엇인가요?'),
    (29, 1, 5, 'gpt', 'Swift에서의 가변(Variable)과 불변(Constant) 변수의 차이는 무엇인가요?'), (29, 1, 5, 'gpt', 'Swift에서의 배열(Array)과 집합(Set)의 차이를 설명해주세요.'), (29, 1, 5, 'gpt', 'Swift에서의 딕셔너리(Dictionary)의 사용 방법과 특징은 무엇인가요?'), (29, 1, 5, 'gpt', 'Swift에서의 프로토콜(Protocol)의 역할과 활용 방법을 설명해주세요.'), (29, 1, 5, 'gpt', 'Swift에서의 옵셔널 체이닝(Optional Chaining)의 개념과 사용법을 설명해주세요.'),
    (29, 1, 5, 'gpt', 'Swift에서의 상속(Inheritance)과 다형성(Polymorphism)에 대해 설명해주세요.'), (29, 1, 5, 'gpt', 'Swift에서의 열거형(Enum)의 사용 방법과 활용 예시를 설명해주세요.'), (29, 1, 5, 'gpt', 'Swift에서의 구조체(Struct)와 클래스(Class)의 차이는 무엇인가요?'), (29, 1, 5, 'gpt', 'Swift에서의 프로퍼티 감시자(Property Observer)의 역할과 활용 방법을 설명해주세요.'), (29, 1, 5, 'gpt', 'Swift에서의 메모리 관리 방법과 ARC(Automatic Reference Counting)에 대해 설명해주세요.'),
    (29, 1, 5, 'gpt', 'Swift에서의 옵셔널 타입 강제 해제(Forced Unwrapping)와 선택적 해제(Optinal Unwrapping)의 차이는 무엇인가요?'), (29, 1, 5, 'gpt', 'Swift에서의 확장(Extension)의 개념과 사용 방법을 설명해주세요.'), (29, 1, 5, 'gpt', 'Swift에서의 고차 함수(Higher-order Functions)의 개념과 예시를 설명해주세요.'), (29, 1, 5, 'gpt', 'Swift에서의 초기화(Initialization)와 소멸화(Deinitialization)에 대해 설명해주세요.'), (29, 1, 5, 'gpt', 'Swift에서의 가변 인자 함수(Variadic Parameters)의 사용 방법을 설명해주세요.'),
    (29, 1, 5, 'gpt', 'Swift에서의 에러 처리(Error Handling) 방법과 예외 처리(Exception Handling)의 차이는 무엇인가요?'), (29, 1, 5, 'gpt', 'Swift에서의 속성(Properties)과 계산된 속성(Computed Properties)의 차이를 설명해주세요.'), (29, 1, 5, 'gpt', 'Swift에서의 guard 문의 사용 목적과 특징은 무엇인가요?'), (29, 1, 5, 'gpt', 'Swift에서의 클로저(Closure) 캡쳐(Capturing)의 개념과 주의사항은 무엇인가요?'), (29, 1, 5, 'gpt', 'Swift에서의 프로토콜 지향 프로그래밍(Protocol-oriented Programming)의 장점은 무엇인가요?'),
    (29, 1, 5, 'gpt', 'Swift에서의 문자열 처리 방법과 유니코드 지원에 대해 설명해주세요.'), (29, 1, 5, 'gpt', 'Swift에서의 옵셔널 체인(Optional Chaining)과 널 병합 연산자(Nil Coalescing Operator)의 차이는 무엇인가요?'), (29, 1, 5, 'gpt', 'Swift에서의 연산자 우선순위와 결합성에 대해 설명해주세요.'), (29, 1, 5, 'gpt', 'Swift에서의 클로저(Closure)의 캡쳐 주기(Capture Cycle)를 해결하는 방법은 무엇인가요?'), (29, 1, 5, 'gpt', 'Swift에서의 타입캐스팅(Type Casting)의 방법과 사용 사례를 설명해주세요.'),
    (29, 1, 5, 'gpt', 'Swift에서의 옵셔널 매핑(Optional Mapping)과 flatMap의 차이는 무엇인가요?'), (29, 1, 5, 'gpt', 'Swift에서의 네트워크 요청 처리 방법과 비동기(Asynchronous) 프로그래밍에 대해 설명해주세요.'), (29, 1, 5, 'gpt', 'Swift에서의 Codable 프로토콜의 역할과 사용 방법을 설명해주세요.'), (29, 1, 5, 'gpt', 'Swift에서의 연산자 오버로딩(Operator Overloading)의 개념과 활용 방법을 설명해주세요.'), (29, 1, 5, 'gpt', 'Swift에서의 프로토콜(Portocol)의 상속과 채택의 차이는 무엇인가요?'),
    (29, 1, 5, 'gpt', 'Swift에서의 뮤텍스(Mutex)와 동기화(Synchronization)의 개념과 차이를 설명해주세요.'), (29, 1, 5, 'gpt', 'Swift에서의 리소스 관리 및 해제를 위한 메모리 관리 방식은 무엇인가요?'), (29, 1, 5, 'gpt', 'Swift에서의 디버깅(Debugging) 방법과 툴에 대해 설명해주세요.'), (29, 1, 5, 'gpt', 'Swift에서의 함수 파라미터의 레이블과 인자명의 차이는 무엇인가요?'), (29, 1, 5, 'gpt', 'Swift에서의 클로저(Closure)의 탈출(escaping)과 비탈출(non-escaping)의 차이는 무엇인가요?'),
    -- language (objective-c 30, 30 ea)
    (30, 1, 5, 'gpt', 'Objective-C의 특징과 Swift와의 주요 차이점은 무엇인가요?'), (30, 1, 5, 'gpt', 'Objective-C에서의 메시지 전달(Message Passing) 방식과 메시지 동적 해석(Dynamic Message Resolution)에 대해 설명해주세요.'), (30, 1, 5, 'gpt', 'Objective-C에서의 클래스(Class)와 객체(Object)의 차이는 무엇인가요?'), (30, 1, 5, 'gpt', 'Objective-C의 메모리 관리 방식과 ARC(Automatic Reference Counting)의 역할을 설명해주세요.'), (30, 1, 5, 'gpt', 'Objective-C에서의 프로퍼티(Property)와 인스턴스 변수(Instance Variable)의 차이를 설명해주세요.'),
    (30, 1, 5, 'gpt', 'Objective-C에서의 프로토콜(Protocol)의 역할과 사용 방법을 설명해주세요.'), (30, 1, 5, 'gpt', 'Objective-C에서의 델리게이트(Delegate) 패턴의 개념과 활용 방법을 설명해주세요.'), (30, 1, 5, 'gpt', 'Objective-C에서의 카테고리(Category)의 역할과 활용 방법을 설명해주세요.'), (30, 1, 5, 'gpt', 'Objective-C에서의 블록(Block)과 블록 문법의 사용 방법을 설명해주세요.'), (30, 1, 5, 'gpt', 'Objective-C에서의 동적(Dynamic) 및 정적(Static) 바인딩의 차이점은 무엇인가요?'),
    (30, 1, 5, 'gpt', 'Objective-C에서의 프로퍼티(Attribute)와 메서드(Method)의 접근 지정자(Access Modifier)에 대해 설명해주세요.'), (30, 1, 5, 'gpt', 'Objective-C에서의 SEL과 IMP의 역할과 차이를 설명해주세요.'), (30, 1, 5, 'gpt', 'Objective-C에서의 KVC(Key-Value Coding)와 KVO(Key-Value Observing)의 개념과 활용 방법을 설명해주세요.'), (30, 1, 5, 'gpt', 'Objective-C에서의 다형성(Polymorphism)의 개념과 예시를 들어 설명해주세요.'), (30, 1, 5, 'gpt', 'Objective-C에서의 타입(Type)과 타입 지정(Type Specification)에 대해 설명해주세요.'),
    (30, 1, 5, 'gpt', 'Objective-C에서의 메모리 관리 방식과 ARC(Automatic Reference Counting)의 원리를 설명해주세요.'), (30, 1, 5, 'gpt', 'Objective-C에서의 메모리 누수(Memory Leak)를 방지하기 위한 방법은 무엇인가요?'), (30, 1, 5, 'gpt', 'Objective-C에서의 NSNotification 및 NSNotificationCenter의 사용 방법을 설명해주세요.'), (30, 1, 5, 'gpt', 'Objective-C에서의 초기화(Initialization)와 해제(Deallocation) 메서드의 역할을 설명해주세요.'), (30, 1, 5, 'gpt', 'Objective-C에서의 메시지와 함수 호출의 차이점은 무엇인가요?'),
    (30, 1, 5, 'gpt', 'Objective-C에서의 클래스 상속(Inheritance)의 개념과 사용 방법을 설명해주세요.'), (30, 1, 5, 'gpt', 'Objective-C에서의 객체 복사(Object Copy)와 객체 분류(Object Cloning)의 차이를 설명해주세요.'), (30, 1, 5, 'gpt', 'Objective-C에서의 프로토콜과 델리게이트 패턴의 관계에 대해 설명해주세요.'), (30, 1, 5, 'gpt', 'Objective-C에서의 메모리 관리 방식과 오너쉽(Ownership) 개념을 설명해주세요.'), (30, 1, 5, 'gpt', 'Objective-C에서의 NSOperationQueue와 Grand Central Dispatch(GCD)의 차이를 설명해주세요.'),
    (30, 1, 5, 'gpt', 'Objective-C에서의 메서드(Method) 오버로딩과 오버라이딩의 차이점은 무엇인가요?'), (30, 1, 5, 'gpt', 'Objective-C에서의 동적(Dynamic) 메서드 해결(Method Resolution)에 대해 설명해주세요.'), (30, 1, 5, 'gpt', 'Objective-C에서의 다형성(Polymorphism)을 사용한 예시를 들어 설명해주세요.'), (30, 1, 5, 'gpt', 'Objective-C에서의 블록(Block)과 델리게이트(Delegate) 패턴의 차이는 무엇인가요?'), (30, 1, 5, 'gpt', 'Objective-C에서의 메모리 관리를 위한 객체 소멸 방법에 대해 설명해주세요.'),
    
    
    -- check
    -- mobile (aos 31, 24 ea)
    (31, 1, 5, 'gpt', '안드로이드의 4대 컴포넌트에 대해 설명해주세요.'), (31, 1, 5, 'gpt', '액티비티(Activity)의 생명주기(Lifecycle)에 대해 설명하고, 각 단계에서 어떤 작업을 수행하는 것이 좋은지 말씀해주세요.'), (31, 1, 5, 'gpt', '프래그먼트(Fragment)는 왜 사용하나요?'), (31, 1, 5, 'gpt', '프래그먼트의 생명주기와 액티비티의 생명주기를 비교해주세요.'), (31, 1, 5, 'gpt', '인텐트(Intent)란 무엇이고, 명시적 인텐트와 암시적 인텐트의 차이를 설명해주세요.'),
    (31, 1, 5, 'gpt', '브로드캐스트 리시버(Broadcast Receiver)와 서비스(Service)의 차이점과 사용 사례를 설명해주세요.'), (31, 1, 5, 'gpt', '안드로이드의 퍼미션 시스템에 대해 설명하고, 사용자에게 퍼미션을 요청하는 방법을 설명해주세요.'), (31, 1, 5, 'gpt', '안드로이드에서의 백그라운드 작업 처리 방법에 대해 설명해주세요.'), (31, 1, 5, 'gpt', 'WorkManager, JobScheduler, AlarmManager 등에 대한 경험이나 지식이 있다면 같이 공유해주세요.'), (31, 1, 5, 'gpt', '안드로이드 메모리 누수(memory leak)의 원인과 이를 방지하는 방법에 대해 설명해주세요.'),
    (31, 1, 5, 'gpt', '안드로이드에서 UI 작업을 위해 어떤 스레드를 사용하나요?'), (31, 1, 5, 'gpt', '메인 스레드와 백그라운드 스레드의 차이점에 대해 설명해주세요.'), (31, 1, 5, 'gpt', '뷰(View)와 뷰그룹(ViewGroup)에 대한 차이점과 예를 들어 설명해주세요.'), (31, 1, 5, 'gpt', '레이아웃 인플레이터(LayoutInflater)란 무엇이며 언제 사용하는지 설명해주세요.'), (31, 1, 5, 'gpt', 'RecyclerView와 ListView의 차이점과 성능상의 이점을 설명해주세요.'),
    (31, 1, 5, 'gpt', '안드로이드에서 데이터 저장을 위한 여러 방법에 대해 설명하고, 각 방법의 장단점을 비교해주세요.'), (31, 1, 5, 'gpt', '안드로이드의 테스트 방법론에 대해 설명해주세요.'), (31, 1, 5, 'gpt', '단위 테스트(Unit Test)와 UI 테스트(UI Test)의 차이점에 대해 설명해주세요.'), (31, 1, 5, 'gpt', '안드로이드에서 의존성 주입(Dependency Injection)을 사용하는 이유와 사용해본 라이브러리나 툴을 소개해주세요.'), (31, 1, 5, 'gpt', 'MVVM, MVP, MVI 등의 아키텍처 패턴에 대해 알고 있나요?'),
    (31, 1, 5, 'gpt', '안드로이드에서의 멀티스레딩 처리 방법과 관련된 경험을 공유해주세요.'), (31, 1, 5, 'gpt', 'ANR(Application Not Responding)이란 무엇이고, 원인 및 해결 방법에 대해 설명해주세요.v'), (31, 1, 5, 'gpt', '안드로이드 앱의 성능 최적화를 위한 경험 또는 지식을 공유해주세요.'), (31, 1, 5, 'gpt', '최근 Android Jetpack 라이브러리에 대해 어떤 것을 사용해보았는지, 그리고 그 중에서 특히 유용하다고 생각하는 것은 무엇인지 설명해주세요.'),
    -- mobile (ios 32, 20 ea)
    (32, 1, 5, 'gpt', 'MVC, MVP, MVVM, VIPER 등의 디자인 패턴에 대해 설명해주세요. iOS에서는 어떤 패턴이 주로 사용되나요?'), (32, 1, 5, 'gpt', 'Autolayout이란 무엇이며, 어떻게 동작하는지 설명해주세요.'), (32, 1, 5, 'gpt', 'Swift와 Objective-C의 주요 차이점은 무엇인가요?'), (32, 1, 5, 'gpt', 'ARC (Automatic Reference Counting)**란 무엇이며, 어떻게 메모리 관리에 도움을 주나요?'), (32, 1, 5, 'gpt', 'GCD (Grand Central Dispatch)**와 OperationQueue의 차이와 사용 시나리오에 대해 설명해주세요.'),
    (32, 1, 5, 'gpt', 'UIKit과 SwiftUI의 차이점은 무엇인가요?'), (32, 1, 5, 'gpt', 'Delegation 패턴에 대해 설명하고, NotificationCenter와 어떻게 다른지 비교해주세요.'), (32, 1, 5, 'gpt', 'Singleton 디자인 패턴의 장단점과 iOS에서의 활용 예시를 들어주세요.'), (32, 1, 5, 'gpt', 'CocoaPods, Carthage, Swift Package Manager 등의 의존성 관리 도구들의 차이점에 대해 설명해주세요.'), (32, 1, 5, 'gpt', 'App Lifecycle과 ViewController Lifecycle에 대해 설명해주세요.'),
    (32, 1, 5, 'gpt', 'Core Data를 사용할 때의 장단점은 무엇인가요?'), (32, 1, 5, 'gpt', 'RESTful API와 iOS 앱 간의 통신에서 Alamofire나 URLSession의 사용 이유와 장점을 설명해주세요.'), (32, 1, 5, 'gpt', 'Lazy loading이란 무엇이며, 어떻게 구현하나요?'), (32, 1, 5, 'gpt', 'Push Notification의 동작 원리와 구현 과정을 설명해주세요.'), (32, 1, 5, 'gpt', 'Thread-safe하다는 것은 무엇을 의미하며, iOS에서 이를 어떻게 보장하나요?'),
    (32, 1, 5, 'gpt', 'App Thinning이란 무엇이고, 왜 중요한가요?'), (32, 1, 5, 'gpt', 'KVO (Key-Value Observing)**와 **KVC (Key-Value Coding)**에 대해 설명해주세요.'), (32, 1, 5, 'gpt', 'Memory leak이 발생하는 경우와 이를 찾아 해결하는 방법은 무엇인가요?'), (32, 1, 5, 'gpt', 'Animations in iOS: UIView.animate와 Core Animation의 차이점에 대해 설명해주세요.'), (32, 1, 5, 'gpt', 'UI Testing과 Unit Testing의 차이와 iOS에서의 적용 방법에 대해 설명해주세요.'),
    -- mobile (flutter 33, 20 ea)
    (33, 1, 5, 'gpt', '플러터란? Flutter의 주요 특징과 장점은 무엇인가요?'), (33, 1, 5, 'gpt', 'Dart 언어: Flutter에서 사용하는 Dart 언어의 특징은 무엇인가요?'), (33, 1, 5, 'gpt', 'Hot Reload vs. Hot Restart: 두 기능의 차이점과 사용 시나리오는 무엇인가요?'), (33, 1, 5, 'gpt', 'StatelessWidget vs. StatefulWidget: 두 위젯의 차이점과 사용 시나리오를 설명해주세요.'), (33, 1, 5, 'gpt', 'BuildContext: 이것은 무엇이며 왜 중요한가요?'),
    (33, 1, 5, 'gpt', 'Flutter의 렌더링 엔진에 대해 설명해주세요. 왜 Flutter는 자체 렌더링 엔진을 사용하나요?'), (33, 1, 5, 'gpt', '플러터의 위젯 트리: 위젯 트리의 개념과 그 중요성에 대해 설명해주세요.'), (33, 1, 5, 'gpt', 'State 관리: Flutter에서 State를 관리하기 위한 다양한 방법들과 그 차이점에 대해 설명해주세요.'), (33, 1, 5, 'gpt', 'Provider 패턴: 이 패턴의 목적과 동작 방식을 설명해주세요.'), (33, 1, 5, 'gpt', '플러터에서의 애니메이션: Flutter에서 어떻게 애니메이션을 구현하나요?'),
    (33, 1, 5, 'gpt', 'Rive를 사용하는 이유와 장점은 무엇인가요?'), (33, 1, 5, 'gpt', 'Custom Painter: 이것은 무엇이며, 언제 사용하나요?'), (33, 1, 5, 'gpt', '플러터의 패키지 관리: pubspec.yaml 파일의 역할은 무엇인가요?'), (33, 1, 5, 'gpt', 'Platform Channels: 이것은 무엇이며, 왜 필요한가요?'), (33, 1, 5, 'gpt', '플러터의 성능 최적화: 어떤 전략들을 사용해서 플러터 앱의 성능을 최적화하나요?'),
    (33, 1, 5, 'gpt', '플러터 웹: Flutter 2.0에서의 웹 지원의 특징과 한계는 무엇인가요?'), (33, 1, 5, 'gpt', '플러터를 사용한 다양한 플랫폼 개발: Flutter를 사용하여 iOS, Android 외에 어떤 플랫폼의 앱을 개발할 수 있나요?'), (33, 1, 5, 'gpt', '테스트: Flutter에서 어떻게 단위 테스트와 위젯 테스트를 수행하나요?'), (33, 1, 5, 'gpt', '플러터의 쓰레드 모델: Flutter에서 UI와 로직을 처리하는 쓰레드는 어떻게 동작하나요?'), (33, 1, 5, 'gpt', '플러터의 종속성 해결: 플러터에서의 종속성 충돌이 발생했을 때, 어떻게 해결하나요?'),
    -- mobile (react native 34, 23 ea)
    (34, 1, 5, 'gpt', '리액트 네이티브란 무엇인가요?'), (34, 1, 5, 'gpt', '목적과 주요 특징에 대해 설명하세요.'), (34, 1, 5, 'gpt', '리액트 네이티브와 네이티브 앱의 주요 차이점은 무엇인가요?'), (34, 1, 5, 'gpt', '리액트 네이티브의 브릿지(Bridge) 기술에 대해 설명할 수 있나요?'), (34, 1, 5, 'gpt', '리액트 네이티브에서의 상태 관리를 어떻게 합니까?'),
    (34, 1, 5, 'gpt', '예를 들어, Redux나 MobX 같은 라이브러리를 사용하는 이유는 무엇인가요?'), (34, 1, 5, 'gpt', '리액트 네이티브의 생명주기 메서드에 대해 설명해주세요.'), (34, 1, 5, 'gpt', '리액트 네이티브에서의 성능 최적화 방법에는 어떤 것들이 있나요?'), (34, 1, 5, 'gpt', '리액트 네이티브에서 네이티브 모듈을 어떻게 연동하나요?'), (34, 1, 5, 'gpt', 'Expo와 리액트 네이티브 CLI 중 어떤 것을 선호하나요?'),
    (34, 1, 5, 'gpt', '리액트 네이티브의 Flexbox 레이아웃에 대해 설명해주세요.'), (34, 1, 5, 'gpt', '리액트 네이티브에서 애니메이션을 구현하는 방법에는 어떤 것들이 있나요?'), (34, 1, 5, 'gpt', '리액트 네이티브에서 네비게이션을 어떻게 처리하나요?'), (34, 1, 5, 'gpt', '사용해본 네비게이션 라이브러리는 무엇인가요?'), (34, 1, 5, 'gpt', '리액트 네이티브에서의 오류 처리 방법에는 어떤 것들이 있나요?'),
    (34, 1, 5, 'gpt', 'useState와 useReducer 훅 중 어느 것을 언제 사용하나요?'), (32, 1, 5, 'gpt', '리액트 네이티브에서의 메모리 누수를 방지하기 위한 방법은 무엇인가요?'), (34, 1, 5, 'gpt', 'Hot Reloading과 Live Reloading의 차이점은 무엇인가요?'), (34, 1, 5, 'gpt', '리액트 네이티브에서 사용되는 JSX란 무엇이며, 어떻게 동작하나요?'), (34, 1, 5, 'gpt', '리액트 네이티브에서 플랫폼별 코드를 어떻게 분리하나요?'),
    (34, 1, 5, 'gpt', '리액트 네이티브의 Virtual DOM에 대해 설명해주세요.'), (34, 1, 5, 'gpt', '리액트 네이티브에서 외부 API나 데이터베이스와의 통신을 위해 어떤 방법을 사용하나요?'), (34, 1, 5, 'gpt', '리액트 네이티브의 단점은 무엇이라고 생각하나요?'),


	-- check
	-- etc (git 35, 10 ea)
    (35, 1, 5, 'gpt', '깃(Git)이란 무엇인가요?'), (35, 1, 5, 'gpt', '깃허브(GitHub)란 무엇이며 어떤 기능을 제공하나요?'), (35, 1, 5, 'gpt', '깃과 깃허브의 차이점은 무엇인가요?'), (35, 1, 5, 'gpt', '깃 저장소(Repository)와 워킹 디렉토리(Working Directory)의 차이는 무엇인가요?'), (35, 1, 5, 'gpt', '깃의 주요 명령어 몇 가지를 나열해보세요.'),
    (35, 1, 5, 'gpt', '깃의 커밋(Commit)이란 무엇인가요?'), (35, 1, 5, 'gpt', '깃 브랜치(Branch)와 마스터 브랜치(Master Branch)의 차이는 무엇인가요?'), (35, 1, 5, 'gpt', '깃의 병합(Merge)과 리베이스(Rebase)의 차이는 무엇인가요?'), (35, 1, 5, 'gpt', '깃에서 커밋을 취소하는 방법은 무엇인가요?'), (35, 1, 5, 'gpt', '깃에서 충돌(Conflict)이 발생하는 상황은 어떤 경우인가요?'),
    -- etc (team 36, 10 ea)
    (36, 1, 5, 'gpt', '이전 협업 경험에 대해 이야기해보세요. 특히 프로젝트에서 당신의 역할과 팀과의 상호작용에 중점을 두어 설명해주세요.'), (36, 1, 5, 'gpt', '협업하는 동안 어떻게 의견 충돌을 관리하고 해결했나요?'), (36, 1, 5, 'gpt', '팀원과의 의사소통 방법에 대해 이야기해보세요. 어떤 도구나 기술을 사용했나요?'), (36, 1, 5, 'gpt', '협업 프로젝트에서의 역할 분배에 어떻게 기여했나요? 어떻게 역할을 선택하거나 배정했나요?'), (36, 1, 5, 'gpt', '팀원과의 업무 일정 조율에 어떤 전략을 사용했나요? 어떻게 프로젝트 마감일을 지켰나요?'),
    (36, 1, 5, 'gpt', '다른 개발자가 작성한 코드를 리뷰하거나 리뷰 받은 경험에 대해 언급해보세요. 이 경험에서 얻은 교훈이 무엇이었나요?'), (36, 1, 5, 'gpt', '협업 중에 기술적 민감한 문제나 보안 문제와 같은 어려움을 어떻게 처리했나요?'), (36, 1, 5, 'gpt', '협업 프로젝트에서의 성과나 성공 사례를 공유해주세요. 프로젝트가 어떻게 성공적으로 완료되었나요?'), (36, 1, 5, 'gpt', '다른 팀원의 아이디어나 제안을 수용하거나 반박한 경험에 대해 이야기해보세요.'), (36, 1, 5, 'gpt', '협업과 관련된 자신의 강점과 개선이 필요한 부분을 어떻게 평가하고 있나요? 개발자로서 협업 능력을 향상시키기 위해 어떤 노력을 기울이고 있나요?'),
    -- etc (project 37, 8 ea)
    (37, 1, 5, 'gpt', '프로젝트의 목표와 범위는 무엇이었나요?'), (37, 1, 5, 'gpt', '프로젝트에서 맡은 역할은 무엇이었나요?'), (37, 1, 5, 'gpt', '프로젝트에서 사용한 기술과 도구는 무엇이었나요?'), (37, 1, 5, 'gpt', '프로젝트에서 가장 어려웠던 점은 무엇이었나요?'), (37, 1, 5, 'gpt', '프로젝트에서 가장 보람 있었던 점은 무엇이었나요?'),
    (37, 1, 5, 'gpt', '프로젝트에서 배운 점은 무엇이었나요?'), (37, 1, 5, 'gpt', '프로젝트에서 상태관리는 어떤 것들을 사용하셨나요?'), (37, 1, 5, 'gpt', '프로젝트를 하면서 겪었던 문제와 해결한 경험에 대해서 설명해주세요.'),


	-- check
	-- cs (datastructure algorithm 38, 40 ea)
    (38, 1, 5, 'gpt', '배열과 연결 리스트의 차이점은 무엇인가요?'), (38, 1, 5, 'gpt', '스택과 큐의 기본 개념은 무엇인가요?'), (38, 1, 5, 'gpt', '이진 탐색 트리의 작동 원리를 설명해주세요.'), (38, 1, 5, 'gpt', '해시 테이블의 동작 방식에 대해 설명해주세요.'), (38, 1, 5, 'gpt', '그래프와 트리의 차이는 무엇인가요?'),
    (38, 1, 5, 'gpt', '다양한 정렬 알고리즘의 특징과 각각의 시간 복잡도를 설명해주세요.'), (38, 1, 5, 'gpt', '동적 계획법이 왜 중요한가요? 예시를 들어 설명해주세요.'), (38, 1, 5, 'gpt', '너비 우선 탐색(BFS)과 깊이 우선 탐색(DFS)의 차이점은 무엇인가요?'), (38, 1, 5, 'gpt', '그래프 탐색 알고리즘에 대해 설명해주세요.'), (38, 1, 5, 'gpt', '트리 순회 알고리즘에는 어떤 것들이 있으며 각각의 특징은 무엇인가요?'),
    (38, 1, 5, 'gpt', '이진 트리와 이진 탐색 트리의 차이를 설명해주세요.'), (38, 1, 5, 'gpt', 'AVL 트리와 레드-블랙 트리의 차이점과 각각의 장단점은 무엇인가요?'), (38, 1, 5, 'gpt', '그래프에서 최소 신장 트리를 찾는 알고리즘에 대해 설명해주세요.'), (38, 1, 5, 'gpt', '그래프에서 사이클을 찾는 방법에 대해 말해보세요.'), (38, 1, 5, 'gpt', '트라이(Trie) 자료구조의 사용 사례와 특징을 설명해주세요.'),
    (38, 1, 5, 'gpt', '빅 오 표기법(Big-O notation)이란 무엇이며 왜 중요한가요?'), (38, 1, 5, 'gpt', '그래프에서 위상 정렬을 하는 방법에 대해 설명해주세요.'), (38, 1, 5, 'gpt', '힙 자료구조와 우선순위 큐의 관계를 설명해주세요.'), (38, 1, 5, 'gpt', '다익스트라 알고리즘과 A* 알고리즘의 차이점은 무엇인가요?'), (38, 1, 5, 'gpt', '트리의 균형을 맞추기 위한 자가 균형 트리의 종류와 원리를 설명해주세요.'),
    (38, 1, 5, 'gpt', '퀵 소트 알고리즘의 파티션 기준을 변경했을 때의 영향을 설명해주세요.'), (38, 1, 5, 'gpt', '그래프의 연결 요소를 찾는 알고리즘에 대해 설명해주세요.'), (38, 1, 5, 'gpt', '해시 충돌을 해결하는 방법 중 개별 체이닝과 오픈 어드레싱의 차이는 무엇인가요?'), (38, 1, 5, 'gpt', 'BFS와 DFS를 사용하여 그래프에서 최단 경로를 찾는 방법을 설명해주세요.'), (38, 1, 5, 'gpt', '그래프의 인접 리스트와 인접 행렬의 장단점은 무엇인가요?'),
    (38, 1, 5, 'gpt', '분할 정복 알고리즘이 어떤 상황에서 유용한가요? 예시를 들어 설명해주세요.'), (38, 1, 5, 'gpt', '그래프에서 단일 최단 경로를 찾는 다익스트라 알고리즘의 시간 복잡도는 어떻게 되나요?'), (38, 1, 5, 'gpt', '트리의 너비 우선 순회 방법에 대해 설명해주세요.'), (38, 1, 5, 'gpt', '그래프의 깊이 우선 탐색을 반복적으로 구현하는 방법에 대해 설명해주세요.'), (38, 1, 5, 'gpt', '트리에서 후위 순회를 사용하여 트리를 삭제하는 방법은 무엇인가요?'),
    (38, 1, 5, 'gpt', '힙에서 가장 작은 k개의 요소를 찾는 방법에 대해 설명해주세요.'), (38, 1, 5, 'gpt', '퀵 소트의 최악, 평균, 최선의 경우의 시간 복잡도를 설명해주세요.'), (38, 1, 5, 'gpt', '그래프에서 다익스트라 알고리즘을 사용할 때 음수 가중치가 있는 경우의 처리 방법은 무엇인가요?'), (38, 1, 5, 'gpt', '힙 정렬 알고리즘의 시간 복잡도는 어떻게 되나요?'), (38, 1, 5, 'gpt', '그래프에서 싸이클을 찾는 알고리즘의 시간 복잡도는 어떻게 되나요?'),
    (38, 1, 5, 'gpt', '해시 함수의 요구 사항과 충돌을 해결하는 방법에 대해 설명해주세요.'), (38, 1, 5, 'gpt', '그래프에서 최소 신장 트리를 찾는 Kruskal과 Prim 알고리즘의 차이는 무엇인가요?'), (38, 1, 5, 'gpt', '트리 순회 방법 중 중위 순회를 사용하여 트리를 탐색하는 방법은 무엇인가요?'), (38, 1, 5, 'gpt', '그래프에서 두 정점 간의 모든 경로를 찾는 방법에 대해 설명해주세요.'), (38, 1, 5, 'gpt', '트리의 균형을 유지하기 위한 자가 균형 트리의 장점과 단점은 무엇인가요?'),
    -- cs (operating system 39, 40 ea)
    (39, 1, 5, 'gpt', '운영체제란 무엇인가요? 그 역할과 기능에 대해 설명해주세요.'), (39, 1, 5, 'gpt', '프로세스와 스레드의 차이는 무엇인가요?'), (39, 1, 5, 'gpt', '멀티태스킹과 멀티스레딩의 차이점은 무엇인가요?'), (39, 1, 5, 'gpt', '교착 상태(데드락)란 무엇이며 어떻게 발생하나요? 방지 방법은 무엇인가요?'), (39, 1, 5, 'gpt', '커널과 사용자 공간(User space)의 역할과 차이를 설명해주세요.'),
    (39, 1, 5, 'gpt', 'CPU 스케줄링 알고리즘의 종류와 각각의 특징을 설명해주세요.'), (39, 1, 5, 'gpt', '운영체제에서 메모리 관리의 중요성과 방법에 대해 설명해주세요.'), (39, 1, 5, 'gpt', '가상 메모리란 무엇이며 어떻게 동작하나요? 페이지 교체 알고리즘을 언급해주세요.'), (39, 1, 5, 'gpt', '파일 시스템의 구조와 종류에 대해 설명해주세요.'), (39, 1, 5, 'gpt', '입출력(I/O) 시스템의 동작 방식과 비동기 입출력의 장점은 무엇인가요?'),
    (39, 1, 5, 'gpt', '인터럽트와 특권 명령어의 역할을 설명해주세요.'), (39, 1, 5, 'gpt', '쓰레싱(Thrashing)이란 무엇이며 어떻게 발생하나요? 방지하는 방법은 무엇인가요?'), (39, 1, 5, 'gpt', '스핀락과 뮤텍스의 차이점은 무엇인가요?'), (39, 1, 5, 'gpt', '캐시 메모리와 주 기억장치(RAM)의 차이와 연관성을 설명해주세요.'), (39, 1, 5, 'gpt', 'DMA(Direct Memory Access)의 역할과 장점은 무엇인가요?'),
    (39, 1, 5, 'gpt', '운영체제에서 프로세스 간 통신(IPC) 방법에 대해 설명해주세요.'), (39, 1, 5, 'gpt', '컨텍스트 스위칭(Context Switching)이란 무엇이며 어떻게 작동하나요?'), (39, 1, 5, 'gpt', '스레드 동기화(Synchronization)에 사용되는 기법과 개념을 설명해주세요.'), (39, 1, 5, 'gpt', '운영체제에서의 보안과 보호에 대해 설명해주세요.'), (39, 1, 5, 'gpt', '시스템 호출(System Call)의 개념과 예시를 들어 설명해주세요.'),
    (39, 1, 5, 'gpt', '배치 처리 시스템과 시분할 시스템의 차이점은 무엇인가요?'), (39, 1, 5, 'gpt', '라운드 로빈 스케줄링의 장단점과 주요 파라미터에 대해 설명해주세요.'), (39, 1, 5, 'gpt', '세마포어와 뮤텍스의 비교 및 각각의 사용 사례를 설명해주세요.'), (39, 1, 5, 'gpt', '파일 시스템에서의 디스크 할당 방식과 특징을 설명해주세요.'), (39, 1, 5, 'gpt', '운영체제에서 사용되는 페이지 교체 알고리즘에 대해 설명해주세요.'),
    (39, 1, 5, 'gpt', '가상 메모리와 실제 메모리(RAM) 사이의 매핑 방식을 설명해주세요.'), (39, 1, 5, 'gpt', '프로세스 간 통신(IPC) 방법 중 메시지 큐의 동작 원리를 설명해주세요.'), (39, 1, 5, 'gpt', '운영체제에서의 권한 관리와 접근 제어에 대해 설명해주세요.'), (39, 1, 5, 'gpt', '페이징과 세그멘테이션의 차이와 각각의 장단점은 무엇인가요?'), (39, 1, 5, 'gpt', 'DMA(Direct Memory Access)가 시스템 성능에 미치는 영향을 설명해주세요.'),
    (39, 1, 5, 'gpt', '프로세스 상태(Ready, Running, Blocked) 전이에 대해 설명해주세요.'), (39, 1, 5, 'gpt', '스레드 동기화를 위해 사용되는 뮤텍스와 세마포어의 차이를 설명해주세요.'), (39, 1, 5, 'gpt', '운영체제에서의 캐시 교체 알고리즘에 대해 설명해주세요.'), (39, 1, 5, 'gpt', '사용자 수준 스레드와 커널 수준 스레드의 차이는 무엇인가요?'), (39, 1, 5, 'gpt', '운영체제의 부팅 과정과 각 단계의 역할을 설명해주세요.'),
    (39, 1, 5, 'gpt', '파일 시스템에서의 파일 할당 방식에는 어떤 것들이 있고 각각의 특징은 무엇인가요?'), (39, 1, 5, 'gpt', '인터럽트 처리의 과정과 종류에 대해 설명해주세요.'), (39, 1, 5, 'gpt', '쓰레드 동기화에 사용되는 뮤텍스와 조건 변수의 사용 예시를 들어주세요.'), (39, 1, 5, 'gpt', '가상 메모리와 페이징 기법이 시스템 성능에 미치는 영향을 설명해주세요.'), (39, 1, 5, 'gpt', '시분할 시스템과 실시간 운영체제의 차이와 사용되는 환경에 대해 설명해주세요.'),
    -- cs (docker 40, 30 ea)
    (40, 1, 5, 'gpt', '도커(Docker)가 무엇이며, 그 주요 개념과 목적은 무엇인가요?'), (40, 1, 5, 'gpt', '도커 이미지와 컨테이너의 차이점은 무엇인가요?'), (40, 1, 5, 'gpt', '도커 컨테이너의 생명주기와 각 단계에 대해 설명해주세요.'), (40, 1, 5, 'gpt', '도커 컴포즈(Docker Compose)의 역할과 사용법을 설명해주세요.'), (40, 1, 5, 'gpt', '도커 볼륨(Docker Volume)의 종류와 각각의 특징은 무엇인가요?'),
    (40, 1, 5, 'gpt', '도커 네트워크의 종류와 컨테이너 간 통신 방법을 설명해주세요.'), (40, 1, 5, 'gpt', '도커 스웜(Docker Swarm)과 쿠버네티스(Kubernetes)의 차이점은 무엇인가요?'), (40, 1, 5, 'gpt', '도커 이미지의 레이어(Layer)와 이미지 공유 방식을 설명해주세요.'), (40, 1, 5, 'gpt', '도커 컨테이너와 가상 머신의 성능 비교 및 차이점에 대해 설명해주세요.'), (40, 1, 5, 'gpt', '도커 파일(Dockerfile)의 구조와 주요 명령어를 설명해주세요.'),
    (40, 1, 5, 'gpt', '도커 볼륨과 바인드 마운트(Bind Mount)의 차이점과 사용 사례는 무엇인가요?'), (40, 1, 5, 'gpt', '도커 이미지를 생성하고 배포하는 과정을 설명해주세요.'), (40, 1, 5, 'gpt', '도커 컨테이너의 자동화와 관리를 위한 도구에는 어떤 것들이 있나요?'), (40, 1, 5, 'gpt', '도커 레지스트리(Docker Registry)의 역할과 사용 방법을 설명해주세요.'), (40, 1, 5, 'gpt', '도커 컨테이너에서 환경 변수 설정과 관리 방법을 설명해주세요.'),
    (40, 1, 5, 'gpt', '도커의 보안 이슈와 대응 방안에 대해 설명해주세요.'), (40, 1, 5, 'gpt', '도커 컨테이너의 스케일링과 로드 밸런싱에 대해 설명해주세요.'), (40, 1, 5, 'gpt', '도커 컴포즈를 사용하여 다중 컨테이너 애플리케이션을 관리하는 방법을 설명해주세요.'), (40, 1, 5, 'gpt', '도커 볼륨과 스토리지 드라이버(Storage Driver)의 역할과 차이점은 무엇인가요?'), (40, 1, 5, 'gpt', '도커 컨테이너의 네트워킹 모드에는 어떤 것들이 있으며, 각각의 특징은 무엇인가요?'),
    (40, 1, 5, 'gpt', '도커 컨테이너와 호스트 간 파일 공유 방법을 설명해주세요.'), (40, 1, 5, 'gpt', '도커 데스크톱(Docker Desktop)과 도커 엔진(Docker Engine)의 차이는 무엇인가요?'), (40, 1, 5, 'gpt', '도커 컨테이너의 로그 관리와 모니터링 방법에 대해 설명해주세요.'), (40, 1, 5, 'gpt', '도커 컨테이너의 라이프사이클과 이벤트 흐름을 설명해주세요.'), (40, 1, 5, 'gpt', '도커 컨테이너 내부에서 프로세스 관리와 실행 방법을 설명해주세요.'),
    (40, 1, 5, 'gpt', '도커 컨테이너의 보안 측면에서의 이미지 스캐닝과 관리 방법을 설명해주세요.'), (40, 1, 5, 'gpt', '도커 컨테이너의 네트워킹 모드에는 어떤 것들이 있으며, 각각의 특징은 무엇인가요?'), (40, 1, 5, 'gpt', '도커 컨테이너와 호스트 간 파일 공유 방법을 설명해주세요.'), (40, 1, 5, 'gpt', '도커 데스크톱(Docker Desktop)과 도커 엔진(Docker Engine)의 차이는 무엇인가요?'), (40, 1, 5, 'gpt', '도커 컨테이너의 로그 관리와 모니터링 방법에 대해 설명해주세요.'),
    -- cs (virtual machine 41, 30 ea)
	(41, 1, 5, 'gpt', '가상 머신이란 무엇인가요? 그 동작 원리와 주요 장점은 무엇인가요?'), (41, 1, 5, 'gpt', '호스트 머신과 게스트 머신의 개념을 설명해주세요.'), (41, 1, 5, 'gpt', '하이퍼바이저(Hypervisor)가 무엇이며, 타입 1과 타입 2의 차이는 무엇인가요?'), (41, 1, 5, 'gpt', '가상 머신과 컨테이너의 차이점은 무엇인가요?'), (41, 1, 5, 'gpt', '가상화 기술의 종류와 각각의 특징을 설명해주세요.'),
    (41, 1, 5, 'gpt', '가상 머신을 사용하는 이유와 장점은 무엇인가요?'), (41, 1, 5, 'gpt', '가상화의 오버헤드(Overhead)가 무엇이며, 어떻게 최소화할 수 있나요?'), (41, 1, 5, 'gpt', '가상 머신에서의 스냅샷(Snapshot)이란 무엇이며 어떻게 사용되나요?'), (41, 1, 5, 'gpt', '가상 머신의 네트워킹 방식과 구현에 대해 설명해주세요.'), (41, 1, 5, 'gpt', '가상 머신에서 리소스 할당과 관리를 어떻게 하는지 설명해주세요.'),
    (41, 1, 5, 'gpt', '가상 머신의 종류에는 어떤 것들이 있으며, 각각의 특징을 설명해주세요.'), (41, 1, 5, 'gpt', '가상 머신에서의 가상 CPU와 실제 CPU의 관계를 설명해주세요.'), (41, 1, 5, 'gpt', '가상화 환경에서의 보안 문제와 대응 방안에 대해 설명해주세요.'), (41, 1, 5, 'gpt', '가상 머신에서의 저장 공간 할당과 관리 방법을 설명해주세요.'), (41, 1, 5, 'gpt', '가상 머신에서의 성능 모니터링과 튜닝에 대해 설명해주세요.'),
    (41, 1, 5, 'gpt', '가상 머신의 클러스터링과 고가용성(High Availability)에 대해 설명해주세요.'), (41, 1, 5, 'gpt', '가상 머신에서의 이중화(Duplication)와 백업의 중요성을 설명해주세요.'), (41, 1, 5, 'gpt', '가상 머신 환경에서의 소프트웨어 라이선스 관리 방법에 대해 설명해주세요.'), (41, 1, 5, 'gpt', '가상 머신의 네트워크 보안과 이중화 구성에 대해 설명해주세요.'), (41, 1, 5, 'gpt', '가상 머신 환경에서의 리소스 스케줄링과 부하 분산에 대해 설명해주세요.'),
    (41, 1, 5, 'gpt', '가상 머신에서의 가상화 환경 구축 절차에 대해 설명해주세요.'), (41, 1, 5, 'gpt', '가상 머신에서의 가상화 기술의 발전과 향후 전망은 무엇인가요?'), (41, 1, 5, 'gpt', '가상 머신에서의 클라우드 컴퓨팅과의 관련성에 대해 설명해주세요.'), (41, 1, 5, 'gpt', '가상 머신에서의 병목 현상을 해결하기 위한 방법에 대해 설명해주세요.'), (41, 1, 5, 'gpt', '가상 머신에서의 네트워크 구성 및 가상 네트워크의 구성 방법을 설명해주세요.'),
    (41, 1, 5, 'gpt', '가상 머신에서의 스토리지 관리와 가상 디스크의 운영에 대해 설명해주세요.'), (41, 1, 5, 'gpt', '가상 머신에서의 모니터링 도구 및 리소스 사용량 관리 방법을 설명해주세요.'), (41, 1, 5, 'gpt', '가상 머신에서의 보안 위협과 대응 전략을 설명해주세요.'), (41, 1, 5, 'gpt', '가상 머신에서의 업그레이드와 패치 관리에 대해 설명해주세요.'), (41, 1, 5, 'gpt', '가상 머신 환경에서의 Disaster Recovery 및 복구 전략에 대해 설명해주세요.'),
    -- cs (network 42, 30 ea)
    (42, 1, 5, 'gpt', 'OSI 모델과 TCP/IP 모델의 차이와 각 레이어의 기능을 설명해주세요.'), (42, 1, 5, 'gpt', 'TCP와 UDP의 차이와 각각의 사용 사례는 무엇인가요?'), (42, 1, 5, 'gpt', 'IP 주소와 MAC 주소의 역할과 차이를 설명해주세요.'), (42, 1, 5, 'gpt', '서브넷팅과 슈퍼넷팅(Subnetting, Supernetting)의 개념과 사용 목적을 설명해주세요.'), (42, 1, 5, 'gpt', '라우터와 스위치의 역할과 차이점은 무엇인가요?'),
    (42, 1, 5, 'gpt', 'ARP(Address Resolution Protocol)의 역할과 동작 과정을 설명해주세요.'), (42, 1, 5, 'gpt', 'NAT(Network Address Translation)의 개념과 사용 이유를 설명해주세요.'), (42, 1, 5, 'gpt', 'VLAN(Virtual LAN)의 개념과 장점에 대해 설명해주세요.'), (42, 1, 5, 'gpt', '네트워크 토폴로지(Topology)의 종류와 각각의 특징을 설명해주세요.'), (42, 1, 5, 'gpt', '무선 네트워크에서의 인프라 모드와 어드혹 모드의 차이는 무엇인가요?'),
    (42, 1, 5, 'gpt', 'HTTP와 HTTPS의 차이와 보안 측면에서의 중요성을 설명해주세요.'), (42, 1, 5, 'gpt', 'DNS(Domain Name System)의 역할과 동작 원리를 설명해주세요.'), (42, 1, 5, 'gpt', '네트워크 보안의 주요 위협과 대응 방안에 대해 설명해주세요.'), (42, 1, 5, 'gpt', '패킷(Packet)과 프레임(Frame)의 차이와 의미는 무엇인가요?'), (42, 1, 5, 'gpt', '네트워크 기기 간 통신 시, 데이터 전송의 흐름과 과정을 설명해주세요.'),
    (42, 1, 5, 'gpt', '라우팅(Routing)과 스위칭(Switching)의 차이와 역할을 설명해주세요.'), (42, 1, 5, 'gpt', '네트워크 프로토콜과 표준화의 중요성에 대해 설명해주세요.'), (42, 1, 5, 'gpt', '네트워크 케이블의 종류와 각각의 특징을 설명해주세요.'), (42, 1, 5, 'gpt', 'IEEE 802.11 Wi-Fi 표준과 각 버전의 차이를 설명해주세요.'), (42, 1, 5, 'gpt', '네트워크 라우터의 동작 원리와 패킷 전달 방법을 설명해주세요.'),
    (42, 1, 5, 'gpt', 'ICMP(Internet Control Message Protocol)의 역할과 사용 예시를 들어주세요.'), (42, 1, 5, 'gpt', '네트워크의 성능을 측정하는 방법과 도구에 대해 설명해주세요.'), (42, 1, 5, 'gpt', '네트워크에서의 트래픽 관리와 QoS(Quality of Service)의 중요성을 설명해주세요.'), (42, 1, 5, 'gpt', 'ARP 스푸핑(Arp Spoofing)과 MAC 플러딩(MAC Flooding)에 대해 설명해주세요.'), (42, 1, 5, 'gpt', '네트워크 보안에서의 방화벽(Firewall)의 역할과 종류를 설명해주세요.'),
    (42, 1, 5, 'gpt', 'OSI 모델의 각 계층에서 사용되는 프로토콜과 그 역할을 설명해주세요.'), (42, 1, 5, 'gpt', '네트워크에서의 라우팅 알고리즘의 종류와 각각의 특징을 설명해주세요.'), (42, 1, 5, 'gpt', 'SDN(Software Defined Networking)의 개념과 장점을 설명해주세요.'), (42, 1, 5, 'gpt', '네트워크에서의 데이터 전송 중 발생하는 오류 검출 및 수정 방법을 설명해주세요.'), (42, 1, 5, 'gpt', '네트워크에서의 이더넷 프레임 구조와 헤더 필드의 의미를 설명해주세요.'),
    -- cs (computer architecture 43,  30 ea)
    (43, 1, 5, 'gpt', '폰 노이만 구조와 하버드 구조의 차이점은 무엇인가요?'), (43, 1, 5, 'gpt', 'RISC와 CISC 프로세서의 차이점과 각각의 장단점은 무엇인가요?'), (43, 1, 5, 'gpt', '캐시 메모리의 동작 원리와 역할에 대해 설명해주세요.'), (43, 1, 5, 'gpt', '파이프라이닝(Pipelining)의 개념과 이점, 그리고 한계점은 무엇인가요?'), (43, 1, 5, 'gpt', '슈퍼스칼라(Superscalar)와 VLIW(Very Long Instruction Word)의 차이는 무엇인가요?'),
    (43, 1, 5, 'gpt', '인스트럭션 캐시와 데이터 캐시의 차이와 각각의 기능을 설명해주세요.'), (43, 1, 5, 'gpt', '캐시 일관성(Cache Coherence)의 개념과 해결 방법에 대해 설명해주세요.'), (43, 1, 5, 'gpt', '가상 메모리의 개념과 운영 방식, 그리고 장단점은 무엇인가요?'), (43, 1, 5, 'gpt', '메모리 계층 구조(Memory Hierarchy)의 역할과 중요성을 설명해주세요.'), (43, 1, 5, 'gpt', '메모리 접근 시간과 대역폭(Bandwidth)의 차이와 의미는 무엇인가요?'),
    (43, 1, 5, 'gpt', 'DMA(Direct Memory Access)의 개념과 동작 방식을 설명해주세요.'), (43, 1, 5, 'gpt', 'Von Neumann 아키텍처와 Harvard 아키텍처의 특징과 차이점은 무엇인가요?'), (43, 1, 5, 'gpt', '캐시의 지역성(Locality)에는 어떤 종류가 있으며, 각각의 설명은 무엇인가요?'), (43, 1, 5, 'gpt', '메모리 버스와 I/O 버스의 차이점과 역할을 설명해주세요.'), (43, 1, 5, 'gpt', '플라이트 타임 컴퓨터(Flight-Time Computer)의 특징과 사용 분야는 무엇인가요?'),
    (43, 1, 5, 'gpt', '동기식(Synchronous)과 비동기식(Asynchronous) 시스템의 차이점은 무엇인가요?'), (43, 1, 5, 'gpt', '멀티코어(Multi-core) 프로세서와 멀티프로세서(Multiprocessor)의 차이는 무엇인가요?'), (43, 1, 5, 'gpt', '파이프라인 하절(Pipeline Stall)이 발생하는 이유와 해결 방법은 무엇인가요?'), (43, 1, 5, 'gpt', 'SIMD(Single Instruction, Multiple Data)와 MIMD(Multiple Instruction, Multiple Data)의 차이는 무엇인가요?'), (43, 1, 5, 'gpt', '벡터 프로세서(Vector Processor)의 동작 원리와 활용 방법을 설명해주세요.'),
    (43, 1, 5, 'gpt', '컴퓨터 아키텍처에서의 특수 목적 레지스터(Special Purpose Registers)의 역할은 무엇인가요?'), (43, 1, 5, 'gpt', '인스트럭션 세트 아키텍처(ISA)의 종류와 각각의 특징을 설명해주세요.'), (43, 1, 5, 'gpt', '분기 예측(Branch Prediction)의 개념과 그 중요성을 설명해주세요.'), (43, 1, 5, 'gpt', '스칼라 프로세서(Scalar Processor)와 벡터 프로세서(Vector Processor)의 차이는 무엇인가요?'), (43, 1, 5, 'gpt', '캐시 일관성 문제의 해결을 위한 기법 중 Snooping과 Directory-Based의 차이는 무엇인가요?'),
    (43, 1, 5, 'gpt', '메모리 액세스 시간과 CPU 사이클 시간의 차이와 관계를 설명해주세요.'), (43, 1, 5, 'gpt', '워드 크기(Word Size)와 데이터 버스 폭(Bus Width)의 차이와 의미는 무엇인가요?'), (43, 1, 5, 'gpt', '메모리 주소 지정 방식(Addressing Mode)의 종류와 각각의 특징을 설명해주세요.'), (43, 1, 5, 'gpt', '피터 패턴(Peter Pattern)이란 무엇이며, 컴퓨터 아키텍처에서의 역할은 무엇인가요?'), (43, 1, 5, 'gpt', '아웃 오브 오더 실행(Out-of-Order Execution)의 개념과 이점에 대해 설명해주세요.')
;