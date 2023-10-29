/**
테스트 데이터 Member
*/
INSERT INTO member (id, email, password, thumbnail, login_type, del_flag) 
VALUES 
('13b4a', 
'testuser1@example.com', 
'03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4', 
'https://i.ytimg.com/vi/_LVtaiW6j3U/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBN2WG-3sj3NY31Fxp4z0EnzyEnjQ', 
'KAKAO',
 false);

 /**
테스트 데이터 Member
*/
INSERT INTO member (id, email, password, thumbnail, login_type, del_flag) 
VALUES 
('13b4a', 
'testuser1@example.com', 
'03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4', 
'https://i.ytimg.com/vi/_LVtaiW6j3U/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBN2WG-3sj3NY31Fxp4z0EnzyEnjQ', 
'KAKAO',
 false);


/**
테스트 데이터 Category
*/
CREATE TABLE `category` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `category_name` VARCHAR(255) NOT NULL,
    `category_level` tinyint(1) NOT NULL,
    `category_upper_id` INT NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;
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


/**
테스트 데이터 Question
*/
CREATE TABLE `question` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `category_id` INT NOT NULL, 
    `gpt_flag` tinyint(1) NOT NULL,
    `question_level` INT NOT NULL,
    `writer` VARCHAR(255) NOT NULL,
    `question_content` TEXT NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    foreign key (category_id) references category(id)
) ENGINE=InnoDB;
-- Gpt 1
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at) VALUES ( 9, 1, 5, 'gpt', '리엑트 컴포넌트에 대해서 설명해보세요.', NOW(), NOW());
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at) VALUES ( 15, 1, 5, 'gpt', '스프링에 대해서 설명해보세요.', NOW(), NOW());
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at) VALUES ( 21, 1, 5, 'gpt', '객체지향에 대해서 설명해보세요.', NOW(), NOW());
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at) VALUES ( 33, 1, 5, 'gpt', 'flutter가 어떤 언어 기반인지 설명해보세요.', NOW(), NOW());
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at) VALUES ( 37, 1, 5, 'gpt', '팀프로젝트 시 가장 먼저 팀장이 해야할일이 무엇인지 설명해보세요.', NOW(), NOW());
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at) VALUES ( 42, 1, 5, 'gpt', 'docker 컨테이너가 올라가는 원리에 대해서 설명해보세요.', NOW(), NOW());
-- 사람 0
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at)VALUES ( 18, 0, 5, '송재근', 'msa 트랜젝션 과정에 대해 설명해보세요.', NOW(), NOW());
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at)VALUES ( 38, 0, 5, '송재근', '이진탐색을 자바로 구현해보세요.', NOW(), NOW());
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at)VALUES ( 35, 0, 5, '이찬영', '깃허브 사용시 형상관리를 어떻게하는지 예시를 들어주세요.', NOW(), NOW());
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at)VALUES ( 32, 0, 5, '권범준', 'ios constuctor에대해서 설명해보세요.', NOW(), NOW());
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at)VALUES ( 21, 0, 5, '김재우', '코틀린의 DI에대해서 설명해보세요.', NOW(), NOW());
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at)VALUES ( 14, 0, 5, '김재우', 'RDBMS와 NoSQL 차이에 대해서 설명해보세요.', NOW(), NOW());
INSERT INTO question (category_id, gpt_flag, question_level, writer, question_content, created_at, updated_at)VALUES ( 12, 0, 5, '권범준', 'vue 컴포넌트에 대해서 설명해보세요.', NOW(), NOW());
