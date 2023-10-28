CREATE TABLE IF NOT EXISTS `member` (
    id varchar(255) PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    thumbnail TEXT,
    login_type varchar(50),
    del_flag boolean not null default false,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `like` (
	`memberId` varchar(255) NOT NULL,
	`questionId` BIGINT NOT NULL,
	 primary key (`memberId`, `questionId`),
	 foreign key (`memberId`) REFERENCES `member`(`id`) ON DELETE CASCADE,
	 foreign key (`questionId`) REFERENCES `question`(`id`) ON DELETE CASCADE
)ENGINE=InnoDB;


CREATE TABLE `question` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `gpt_flag` tinyint(1) NOT NULL,
    `question_level` INT NOT NULL,
    `writer` VARCHAR(255) NOT NULL,
    `question_content` TEXT NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
) ENGINE=InnoDB;

