DROP TABLE IF EXISTS  `m_user`;
create table `m_user`
(
    `user_id` varchar(255) not null,
    `user_name` varchar(255) not null comment '用户名',
    `user_avatar` varchar(255) not null comment '用户头像',
    `user_gender` bit default 0 null comment '用户性别：男1，女0',
    `user_grade` varchar(255) not null comment '年级',
    `user_department` int(8) not null comment '院系',
    `ques` int default 0 not null comment '提问数',
    `ans` int default 0 not null comment '回答数',
    `fav` int default 0 not null comment '收藏数',
    `following` int default 0 not null comment '关注数',
    `follower` int default 0 not null comment '被关注数',
    `intro` tinytext comment '简介',
    PRIMARY KEY (`user_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `m_question`;
CREATE TABLE `m_question`
(
    `id` bigint(8) not null auto_increment,
    `title` varchar(255) not null,
    `content` longtext not null,
    `user_id` varchar(255) not null,
    `created_date` datetime not null on update current_timestamp,
    `comment_count` int not null,
    primary key (`id`),
    foreign key (`user_id`) references m_user(`user_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `m_comment`;
CREATE TABLE `m_comment`
(
    `id` bigint(8) not null auto_increment,
    `wid` int comment '评论原有主键id',
    `user_id` varchar(255) not null,
    `reply_id` int default 0,
    `parent_id` int default 0,
    `ques_id` bigint(8) not null,
    `content` text not null comment '评论',
    `created_time` datetime not null on update current_timestamp,
    primary key (`id`),
    foreign key (`ques_id`) references m_question(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `m_question_box`;
CREATE TABLE `m_question_box`
(
    `id` int not null auto_increment,
    `user_id` varchar(255) not null,
    `ques_id` bigint(8) not null,
    `status` int not null comment '喜欢1，收藏2',
    primary key (`id`),
    foreign key (`ques_id`) references m_question(`id`),
    foreign key (`user_id`) references m_user(`user_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `m_follow`;
CREATE TABLE `m_follow`
(
    `user_id` varchar(255) not null,
    `follow_user_id` varchar(255) not null,
    foreign key (`user_id`) references m_user(`user_id`),
    foreign key (`follow_user_id`) references m_user(`user_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;