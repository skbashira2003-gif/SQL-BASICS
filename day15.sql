create database  if not exists instaproject;
use instaproject;

create table Users(id int primary key auto_increment,
			user_name varchar(300) not null unique,
			email varchar(250) not null,
			mobile varchar(10) not null check(length(mobile) = 10),
			created_at timestamp default now());
          
create table Photos(id int primary key auto_increment,
			image_url varchar(250) not null unique,
			user_id int not null,
			created_at timestamp default now(),
			foreign key(user_id) references users(id));

create table likes(user_id int not null,
			photo_id int not null,
			created_at timestamp default now(),
			foreign key(user_id) references users(id),
			foreign key(photo_id) references photos(id),
			primary key(user_id,photo_id));
			
			
create table comments(id int primary key auto_increment,
			c_text text not null,
			photo_id int not null,
			user_id int not null,
			created_at timestamp default now(),
			foreign key(photo_id) references photos(id),
			foreign key(user_id) references users(id));

create table follows(follower_id int not null,
			followee_id int not null,
			created_at timestamp default now(),
			foreign key(follower_id) references users(id),
			foreign key(followee_id) references users(id),
			primary key(follower_id,followee_id));
            
            SELECT * FROM users;
SELECT * FROM follows;
SELECT * FROM photos;
SELECT * FROM likes;
SELECT * FROM comments;
USE instaproject;

INSERT INTO users (user_name, email, mobile) VALUES
('sky_basha01', 'skybasha01@gmail.com', '8801001001'),
('coding_queen02', 'codingqueen02@gmail.com', '8801001002'),
('tech_gowri03', 'techgowri03@gmail.com', '8801001003'),
('rebel_rocky04', 'rebelrocky04@gmail.com', '8801001004'),
('little_star05', 'littlestar05@gmail.com', '8801001005'),
('prince_arjun06', 'princearjun06@gmail.com', '8801001006'),
('happy_hari07', 'happyhari07@gmail.com', '8801001007'),
('simha_power08', 'simhapower08@gmail.com', '8801001008'),
('trendy_rahul09', 'trendyrahul09@gmail.com', '8801001009'),
('tiger_king10', 'tigerking10@gmail.com', '8801001010');

insert into follows(follower_id, followee_id) values
(6,4),(6,3),(6,7),(6,2),
(4,10),(4,9),(4,5),(4,1),(4,7),
(1,4),(1,6),
(5,3),(5,6),(5,10),
(2,3),(2,5),(2,6),(2,9),
(9,6),(9,4),(9,5);


#1 Number of followers of all users
SELECT u.id, u.user_name, COUNT(f.follower_id) AS total_followers
FROM users u
LEFT JOIN follows f ON u.id = f.followee_id
GROUP BY u.id, u.user_name;


#2 Number of following of all users
SELECT u.id, u.user_name, COUNT(f.followee_id) AS total_following
FROM users u
LEFT JOIN follows f ON u.id = f.follower_id
GROUP BY u.id, u.user_name;


#3 Number of users with zero followers
SELECT COUNT(*) AS zero_followers
FROM users u
LEFT JOIN follows f ON u.id = f.followee_id
WHERE f.follower_id IS NULL;


#4 Number of users having at least 1 follower
SELECT COUNT(DISTINCT u.id) AS users_with_followers
FROM users u
JOIN follows f ON u.id = f.followee_id;


#5 Number of users not following anyone
SELECT COUNT(*) AS users_not_following
FROM users u
LEFT JOIN follows f ON u.id = f.follower_id
WHERE f.follower_id IS NULL;


#6 Number of users following at least 1 person
SELECT COUNT(DISTINCT u.id) AS users_following
FROM users u
JOIN follows f ON u.id = f.follower_id;


#7 Number of followers and following of all users
SELECT u.id, u.user_name,
       COUNT(DISTINCT f1.follower_id) AS total_followers,
       COUNT(DISTINCT f2.followee_id) AS total_following
FROM users u
LEFT JOIN follows f1 ON u.id = f1.followee_id
LEFT JOIN follows f2 ON u.id = f2.follower_id
GROUP BY u.id, u.user_name;


#8 Count photos uploaded by each user
SELECT u.id, u.user_name, COUNT(p.id) AS total_photos
FROM users u
LEFT JOIN photos p ON u.id = p.user_id
GROUP BY u.id, u.user_name;


#9 Users who uploaded at least one photo
SELECT DISTINCT u.id, u.user_name
FROM users u
JOIN photos p ON u.id = p.user_id;


#10 Users who have not uploaded any photos
SELECT u.id, u.user_name
FROM users u
LEFT JOIN photos p ON u.id = p.user_id
WHERE p.id IS NULL;


#11 Count likes for each photo
SELECT p.id AS photo_id, p.image_url,
       COUNT(l.photo_id) AS total_likes
FROM photos p
LEFT JOIN likes l ON p.id = l.photo_id
GROUP BY p.id, p.image_url;


#12 Photos having zero likes
SELECT p.id, p.image_url
FROM photos p
LEFT JOIN likes l ON p.id = l.photo_id
WHERE l.photo_id IS NULL;


#13 Photos having at least one like
SELECT p.id, p.image_url, COUNT(l.user_id) AS total_likes
FROM photos p
JOIN likes l ON p.id = l.photo_id
GROUP BY p.id, p.image_url;


#14 Count likes given by each user
SELECT u.id, u.user_name, COUNT(l.photo_id) AS total_likes
FROM users u
LEFT JOIN likes l ON u.id = l.user_id
GROUP BY u.id, u.user_name;


#15 Users who have not liked any photo
SELECT u.id, u.user_name
FROM users u
LEFT JOIN likes l ON u.id = l.user_id
WHERE l.user_id IS NULL;


#16 Users who liked at least one photo
SELECT u.id, u.user_name, COUNT(l.photo_id) AS total_likes
FROM users u
JOIN likes l ON u.id = l.user_id
GROUP BY u.id, u.user_name;


#17 Count comments posted by each user
SELECT u.id, u.user_name, COUNT(c.id) AS total_comments
FROM users u
LEFT JOIN comments c ON u.id = c.user_id
GROUP BY u.id, u.user_name;


#18 Count comments received by each photo
SELECT p.id AS photo_id, p.image_url,
       COUNT(c.id) AS total_comments
FROM photos p
LEFT JOIN comments c ON p.id = c.photo_id
GROUP BY p.id, p.image_url;


#19 Users who have not commented
SELECT u.id, u.user_name
FROM users u
LEFT JOIN comments c ON u.id = c.user_id
WHERE c.id IS NULL;


#20 Photos that have not received any comments
SELECT p.id, p.image_url
FROM photos p
LEFT JOIN comments c ON p.id = c.photo_id
WHERE c.id IS NULL;


#21 Photos that received at least 3 comments
SELECT p.id, p.image_url, COUNT(c.id) AS total_comments
FROM photos p
JOIN comments c ON p.id = c.photo_id
GROUP BY p.id, p.image_url
HAVING COUNT(c.id) >= 3;


#22 Users who commented at least twice
SELECT u.id, u.user_name, COUNT(c.id) AS total_comments
FROM users u
JOIN comments c ON u.id = c.user_id
GROUP BY u.id, u.user_name
HAVING COUNT(c.id) >= 2;
