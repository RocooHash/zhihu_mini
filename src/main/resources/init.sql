create table m_user
(
    user_openid varchar(255) not null,
    user_name varchar(255) not null comment '用户名',
    user_avatar varchar(255) not null comment '用户头像',
    user_gender bit default 0 null comment '用户性别：男1，女0',
    user_grade varchar(255) not null comment '年级',
    user_department int(8) not null comment '院系',
    user_ques int default 0 not null comment '提问数',
    user_ans int default 0 not null comment '回答数',
    user_fav int default 0 not null comment '收藏数',
    user_following int default 0 not null comment '关注数',
    user_follower int default 0 not null comment '被关注数',
    user_intro tinytext comment '简介'
);

create unique index m_user_user_openid_uindex
    on m_user (user_openid);

alter table m_user
    add constraint m_user_pk
        primary key (user_openid);
