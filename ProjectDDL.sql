CREATE DATABASE  IF NOT EXISTS `test`;
USE `test`;

DROP TABLE IF EXISTS `users`;
  CREATE TABLE `users` (
  `username` VARCHAR(500) NOT NULL,
  `name` text,
  `sub_category` text DEFAULT NULL,
  `category` text DEFAULT NULL,
  `ofState` text DEFAULT  NULL,
  `numFollowers` int DEFAULT NULL,
  `numFollowing` int default NULL,
  PRIMARY KEY (`username`))
  ;
  
  DROP TABLE IF EXISTS `tweet`;
  CREATE TABLE `tweet` (
  `tid` bigint NOT NULL,
  `textbody` text,
  `retweet_count` int(11) DEFAULT NULL,
  `retweeted` tinyint(1) DEFAULT NULL,
  `day_posted` int DEFAULT NULL,
  `month_posted` int DEFAULT NULL,
  `year_posted` int default NULL,
  `username` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`tid`),
  FOREIGN KEY (username) REFERENCES users(username)
  )  
  ;
  
  DROP TABLE IF EXISTS `tagged`;
  CREATE TABLE `tagged` (
  `tid` bigint NOT NULL,
  `hashtag` text,
  PRIMARY KEY (`tid`),
 FOREIGN KEY (tid) REFERENCES tweet(tid)
)
  ;
  
  DROP TABLE IF EXISTS `mentioned`;

  CREATE TABLE `mentioned` (
  `tid` bigint NOT NULL,
  `mentioned_user` varchar(500) ,
  PRIMARY KEY (`tid`),
  FOREIGN KEY (tid) REFERENCES tweet(tid),
  FOREIGN KEY (mentioned_user) REFERENCES users(username)
  )
  ;
  
  
  DROP TABLE IF EXISTS `urlused`;
  CREATE TABLE `urlused` (
  `tid` bigint NOT NULL,
  `url` text,
 PRIMARY KEY (`tid`),
 FOREIGN KEY (tid) REFERENCES tweet(tid)
  )
  ;
