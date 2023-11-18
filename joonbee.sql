CREATE TABLE `category` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `category_name` varchar(255) NOT NULL,
   `category_level` tinyint(1) NOT NULL,
   `category_upper_id` int(11) NOT NULL,
   `created_at` datetime DEFAULT current_timestamp(),
   `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
   PRIMARY KEY (`id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

CREATE TABLE `question` (
   `id` bigint(20) NOT NULL AUTO_INCREMENT,
   `gpt_flag` tinyint(1) NOT NULL,
   `question_level` int(11) NOT NULL,
   `category_id` int(11) NOT NULL,
   `writer` varchar(255) NOT NULL,
   `question_content` text NOT NULL,
   `created_at` datetime DEFAULT current_timestamp(),
   `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
   PRIMARY KEY (`id`),
   KEY `category_id` (`category_id`),
   CONSTRAINT `question_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE
 ) ENGINE=InnoDB AUTO_INCREMENT=4654 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

CREATE TABLE `member` (
   `id` varchar(255) NOT NULL,
   `nick_name` varchar(255) NOT NULL,
   `email` varchar(255) NOT NULL,
   `password` varchar(255) NOT NULL,
   `thumbnail` text DEFAULT NULL,
   `login_type` varchar(50) DEFAULT NULL,
   `del_flag` tinyint(1) NOT NULL DEFAULT 0,
   `created_at` datetime NOT NULL DEFAULT current_timestamp(),
   `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
   PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

CREATE TABLE `interview` (
   `id` bigint(20) NOT NULL AUTO_INCREMENT,
   `member_id` varchar(255) NOT NULL,
   `category_name` varchar(255) NOT NULL,
   `created_at` datetime DEFAULT current_timestamp(),
   `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
   PRIMARY KEY (`id`),
   KEY `member_id` (`member_id`),
   CONSTRAINT `interview_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
 ) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

CREATE TABLE `like` (
   `member_id` varchar(255) NOT NULL,
   `interview_id` bigint(20) NOT NULL,
   PRIMARY KEY (`member_id`,`interview_id`),
   KEY `interview_id` (`interview_id`),
   CONSTRAINT `like_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE,
   CONSTRAINT `like_ibfk_2` FOREIGN KEY (`interview_id`) REFERENCES `interview` (`id`) ON DELETE CASCADE
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

CREATE TABLE `interview_and_question` (
   `interview_id` bigint(20) NOT NULL,
   `question_id` bigint(20) NOT NULL,
   `answer_content` text NOT NULL,
   PRIMARY KEY (`interview_id`,`question_id`),
   KEY `question_id` (`question_id`),
   CONSTRAINT `interview_and_question_ibfk_1` FOREIGN KEY (`interview_id`) REFERENCES `interview` (`id`),
   CONSTRAINT `interview_and_question_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci