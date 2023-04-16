#List k=5 most retweeted tweets in a given month = 1 and a given year = 2016;
# show the retweet count, the tweet text, the posting user’s screen name, the posting user’s category, the posting user’s sub-category in descending order of the retweet count values

#q1
select retweet_count, textbody ,username,category,sub_category
 from tweet NATURAL JOIN users 
 where month_posted =1 and year_posted = 2016 
 ORDER BY retweet_count DESC
 LIMIT 5;
#------------------------------------

#Find k=5 hashtags that appeared in the most number of states in a given year = 2016; 
#list the total number of states the hashtag appeared, the list of the distinct states it appeared (FL is the same as Florida*),
# and the hashtag itself in descending order of the number of states the hashtag appeared.
# Hint: Use group_concat() function to create a list

#q2
drop table if exists 2016tweet;
create table 2016tweet
select * from tweet natural join tagged
where year_posted=2016;
 
drop table if exists hashtag_by_state_unsorted;
create table hashtag_by_state_unsorted
select hashtag,
group_concat( distinct ofState), (LENGTH(group_concat( distinct ofState)) - LENGTH(REPLACE(group_concat( distinct ofState),",","")) + 1) as "no_of_state"
from 2016tweet natural join users
group by hashtag
order by count(*) desc;

select * from hashtag_by_state_unsorted
order by no_of_state desc
limit 5;
#---------------------------------------

/*
Find k=12 users who used at least one of the hashtags in a given list of hashtags = [HappyNewYear,NewYear,NewYears,NewYearsDay] in their tweets. 
Show the user’s screen name and the state the user lives in descending order of the number of this user’s followers.
*/
#q3
drop table if exists q3table;
create table q3table
select username,name, ofState from 
users Natural join (tagged Natural join tweet) 
where hashtag = "HappyNewYear" or hashtag = "NewYear" or hashtag = "NewYears" or hashtag = "NewYearsDay" 
Order by numFollowers
desc limit 12; 
 
 select * from q3table;
#-----------------------------------------------------------------------

/*
Find top k=5 most followed users in a given party. 
Show the user’s screen name, the user’s party,
 and the number of followers in descending order of the 
 number of followers. Show your results with subcategory 
 to be 'GOP' and 'Democrat'
*/
  #q4
    drop table if exists q4table_g;
  create table q4table_g
  select username, sub_category,numFollowers 
  from users
  where sub_category =  "GOP"
  order by numFollowers desc;
  
  drop table if exists q4table_d;
create table q4table_d
select username, sub_category,numFollowers 
from users
where sub_category =  "Democrat"
order by numFollowers desc;

select * from q4table_d limit 5;
select * from q4table_g limit 5;
#-------------------------------------------------------------------

/*
Find the list of distinct hashtags that appeared in one of the 
states in a given list = [Ohio, Alaska, Alabama] in a 
given month = 1 of a given year = 2016; 
show the list of the hashtags and the names of the states
 in which they appeared
*/
  #q5
drop table if exists 2016tweet_1month;
create table 2016tweet_1month
select * from tweet natural join tagged
where year_posted=2016 and month_posted =1;
 
drop table if exists state_by_hashtag;
create table state_by_hashtag
select *,count(*),
group_concat( distinct hashtag) as "hashtag_list"
from 2016tweet_1month natural join users
where ofState = "Ohio" or ofState = "Alaska" or ofState = "Alabama"
group by ofState
order by count(*) desc;

select ofState,hashtag_list from state_by_hashtag;
#-------------------------------------------------------------------
/*
Find k=5 tweets (with the given hashtag = Ohio) 
posted by republican (GOP) or democrat members
 of a given state = Ohio in a given month = 1 
 of a given year = 2016. 
 Show the tweet text, the hashtag, 
 the screen name of the posting user,
 and the users’ party
*/
 #q6 
drop table if exists 2016tweet_1month_Ohio;
create table 2016tweet_1month_Ohio
select * from tweet natural join tagged
where year_posted=2016 and month_posted =1 and hashtag = "Ohio" ;

drop table if exists q6table;
create table q6table
select textbody,hashtag,username,sub_category 
from 2016tweet_1month_Ohio natural join users 
where ofState = "Ohio" and (sub_category = "GOP" or sub_category = "democrat");

select * from q6table limit 5;
#----------------------------------------------------------------------

/*
Find users in a given sub-category = ‘GOP’ along with the
 list of URLs used in the user’s tweets in a given month = 1 
 of a given year = 2016.
 Show the user’s screen name, the state the user lives, 
 and the list of URLs
*/
#q7
drop table if exists 2016tweet_1month_url;
create table 2016tweet_1month_url
select * from tweet natural join urlused
where year_posted=2016 and month_posted =1;

drop table if exists GOP_users;
create table GOP_users
select * from users 
where sub_category = "GOP" ;


#not distinct
select username,ofState ,group_concat(url) as "url_list"
from 2016tweet_1month_url natural join GOP_users
group by username ;

#distinct 
select username,ofState ,group_concat(distinct url) as "url_list"
from 2016tweet_1month_url natural join GOP_users
group by username ;
#----------------------------------------------------------------------

 
/*
Find k=5 users who were mentioned the most in tweets of users of a given party = ‘GOP’ in a 
given month = 1 of a given year = 2016. Show the user’s 
screen name, user’s state, and the list of the screen name of the user(s) 
who mentioned this user in descending order of the number of tweets mentioning this user.
*/

#q8
drop table if exists q81;
create table q81
select * from tweet natural join users
where sub_category = 'GOP' and year_posted=2016 and month_posted=1;




drop table if exists q82;
create table q82
select  mentioned_user, ofState from (select mentioned_user ,count(*) from q81 join mentioned using(tid)
group by mentioned_user
order by count(*) desc
limit 5 ) as O join users where(O.mentioned_user =username);


#not distinct
select mentioned_user ,users.ofState, group_concat(q81.username) as 'mentioning_users'
from (q81 join mentioned using(tid)) join users where( mentioned_user =users.username)
group by mentioned_user
 order by count(*) 
 desc limit 5;

#distinct
select mentioned_user ,users.ofState, group_concat(distinct q81.username) as 'mentioning_users'
from (q81 join mentioned using(tid)) join users where( mentioned_user =users.username)
group by mentioned_user
 order by count(*) desc 
 limit 5;

#q9
/*

Find k=5 most used hashtags with the count of tweets it appeared posted by a given sub-category = ‘GOP’ of users in a list of months = [1, 2, 3] 
of a given year = 2016. Show the hashtag name and the count in descending order of the count.

*/


drop table if exists  q9table ;
create table q9table
select hashtag , count(*)
from (tweet natural join tagged) natural join users
where (month_posted =1 or month_posted= 2 or month_posted =3 and year_posted=2016) and sub_category = "GOP" 
group by (hashtag)
order by count(*) desc
limit 5;

select * from q9table;
#-








