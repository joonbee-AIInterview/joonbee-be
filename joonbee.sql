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

create table if not exists `like` (
	`member_id` varchar(255) not null,
	`interview_id` BIGINT not null,
	 primary key (`member_id`, `interview_id`),
	 foreign key (`member_id`) REFERENCES `member`(`id`) on delete cascade,
	 foreign key (`interview_id`) REFERENCES `interview`(`id`) on delete CASCADE
)ENGINE=InnoDB;

CREATE TABLE `question` (
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


CREATE TABLE `interview` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `question_id` bigint NOT NULL,
  `question_content` text NOT NULL,
  `count_flag` int not NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `interview_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE,
  CONSTRAINT `interview_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci