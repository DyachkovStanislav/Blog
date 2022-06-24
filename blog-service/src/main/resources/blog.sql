DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS post_tag;
DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS post;

CREATE TABLE post (
    post_id bigserial PRIMARY KEY,
    user_id varchar(50) NOT NULL,
    title varchar(100) NOT NULL,
    content text NOT NULL,
    dt_created timestamp NOT NULL,
    dt_updated timestamp
);

CREATE TABLE tag (
    tag_id bigserial PRIMARY KEY,
    name varchar(50) NOT NULL
);


CREATE TABLE post_tag (
    post_id bigint REFERENCES post(post_id) ON DELETE CASCADE NOT NULL,
    tag_id bigint REFERENCES tag(tag_id) ON DELETE CASCADE NOT NULL,
    PRIMARY KEY (post_id, tag_id)
);

CREATE TABLE comment (
    comment_id bigserial PRIMARY KEY,
    user_id varchar(50) NOT NULL,
    post_id bigint REFERENCES post(post_id) ON DELETE CASCADE NOT NULL,
    content text,
    dt_created timestamp NOT NULL,
    dt_updated timestamp
);




--Data
insert into post (user_id, title, content, dt_created, dt_updated)
	values ('393873c7-a23c-44a0-8d2a-b9f1d9ea705d', 'Day 1', 'It''s all good!', to_timestamp('2022-05-14 18:05:50', 'yyyy-MM-dd HH24:mm:ss'), null);
insert into post (user_id, title, content, dt_created, dt_updated)
	values ('393873c7-a23c-44a0-8d2a-b9f1d9ea705d', 'Day 2', 'It''s all ok!', to_timestamp('2022-05-15 18:05:50', 'yyyy-MM-dd HH24:mm:ss'), null);
insert into post (user_id, title, content, dt_created, dt_updated)
	values ('14c52ea6-24b8-4b86-953e-3cf346287617', 'Day 3', 'It''s all bad!', to_timestamp('2022-05-16 18:05:50', 'yyyy-MM-dd HH24:mm:ss'), null);

insert into tag (name) values ('news');
insert into tag (name) values ('life');
insert into tag (name) values ('day');
insert into tag (name) values ('mood');
insert into tag (name) values ('ideas');
insert into tag (name) values ('thoughts');

insert into post_tag(post_id, tag_id) values (1, 1);
insert into post_tag(post_id, tag_id) values (1, 2);
insert into post_tag(post_id, tag_id) values (2, 3);
insert into post_tag(post_id, tag_id) values (2, 2);
insert into post_tag(post_id, tag_id) values (2, 1);
insert into post_tag(post_id, tag_id) values (2, 5);
insert into post_tag(post_id, tag_id) values (3, 3);
insert into post_tag(post_id, tag_id) values (3, 2);
insert into post_tag(post_id, tag_id) values (3, 6);

insert into comment(user_id, post_id, content, dt_created)
    values('393873c7-a23c-44a0-8d2a-b9f1d9ea705d', 2, 'Nice!', to_timestamp('2022-05-14 18:05:50', 'yyyy-MM-dd HH24:mm:ss'));
insert into comment(user_id, post_id, content, dt_created)
    values('14c52ea6-24b8-4b86-953e-3cf346287617', 1, 'Awesome!', to_timestamp('2022-05-15 18:05:50', 'yyyy-MM-dd HH24:mm:ss'));
insert into comment(user_id, post_id, content, dt_created)
    values('14c52ea6-24b8-4b86-953e-3cf346287617', 1, 'Excellent!', to_timestamp('2022-05-16 18:05:50', 'yyyy-MM-dd HH24:mm:ss'));
insert into comment(user_id, post_id, content, dt_created)
    values('393873c7-a23c-44a0-8d2a-b9f1d9ea705d', 1, 'Wonderful!', to_timestamp('2022-05-17 18:05:50', 'yyyy-MM-dd HH24:mm:ss'));
insert into comment(user_id, post_id, content, dt_created)
    values('14c52ea6-24b8-4b86-953e-3cf346287617', 3, 'Disgusting!', to_timestamp('2022-05-18 18:05:50', 'yyyy-MM-dd HH24:mm:ss'));
insert into comment(user_id, post_id, content, dt_created)
    values('14c52ea6-24b8-4b86-953e-3cf346287617', 3, 'Atrocious!', to_timestamp('2022-05-19 18:05:50', 'yyyy-MM-dd HH24:mm:ss'));