# Twitter_SQL_DB
This project uses SQL to study the data on Twitter communications of state legislators and presidential candidates around the 2016 presidential election. 

This project contains :
1) ER diagram of the database.
2) script to design relational schemas to store the data from the csv files and import the data from the csv files into MySQL Server.
3)script with SQL queries(mentioned below)


Database Requirements

•	A tweet has the following properties: id, retweet count (the number of retweets of this tweet), retweeted (whether this tweet has been retweeted), tweet text, created at (timestamp---number of milliseconds since 1/1/1970---in which the tweet was posted), which is converted into the corresponding day, month, and year. The id is unique among all tweets. A tweet must have the user who posted it. If the posting user is deleted, all tweets posted by the user must also be deleted. A retweet has the same tweet text but has a different id from the original tweet. The attribute retweeted is not needed in the database.

•	A tweet may have zero or more hashtag in it. Each hashtag has a unique name and must be used in at least one tweet. A tweet has zero or more URLs. Each URL has a unique URL address and must appear in at least one tweet. If a hashtag is deleted, all tweets that have the deleted hashtag must also be deleted. If a URL is deleted, all the tweets that have the deleted URL must also be deleted.

•	A tweet may mention zero or more user accounts. A user account can be mentioned in zero or more tweets. 

•	A user account has the following properties: name, screen name, followers (indicating the number of followers), following (indicating the number of people this user follows), sub_category, category, location, and the state the user lives. A user lives in at most one state. The sub_category indicates the party to which the user belongs. The values of this attribute are “GOP”, “Democrat”, “na”, or null. The values of the category attribute are senate_group, presidential_candidate, reporter, Senator, General, or null. The name property can be null, but the screen name is unique among all users and cannot be null. Presidential candidate accounts are not associated with any state. Each state can appear as either full name or abbreviation. For example, the state of Florida appears as “Florida” or “FL”. Furthermore, “na” denotes the user account without an associated state. Check the data from the csv files to understand the kind of data to be maintained. The updateStates.sql is provided to make the state name consistent. 

Queries
ID	Description
Q1	List k=5 most retweeted tweets in a given month = 1 and a given year = 2016; show the retweet count, the tweet text, the posting user’s screen name, the posting user’s category, the posting user’s sub-category in descending order of the retweet count values
Rationale: This query finds k most influential tweets in a given time frame and the users who posted them. 
Q2	Find k=5 hashtags that appeared in the most number of states in a given year = 2016; list the total number of states the hashtag appeared, the list of the distinct states it appeared (FL is the same as Florida*), and the hashtag itself in descending order of the number of states the hashtag appeared.
Rationale: This query finds k hashtags that are used across the most number of states, which could indicate a certain agenda (e.g., education, healthcare) that is widely discussed.
*This requires making sure that each state is represented using one name, either FL or Florida, you can use the provided updateStates.sql file to update the states name
Q3	Find k=12 users who used at least one of the hashtags in a given list of hashtags = [HappyNewYear,NewYear,NewYears,NewYearsDay] in their tweets. Show the user’s screen name and the state the user lives in descending order of the number of this user’s followers.
 Rationale: This is to find k users with similar interests.
Q4	Find top k=5 most followed users in a given party. Show the user’s screen name, the user’s party, and the number of followers in descending order of the number of followers. Show your results with subcategory to be 'GOP' and 'Democrat'
Rationale: This query finds the most influential users measured by the number of followers
Q5	Find the list of distinct hashtags that appeared in one of the states in a given list = [Ohio, Alaska, Alabama] in a given month = 1 of a given year = 2016; show the list of the hashtags and the names of the states in which they appeared. 
Rationale: This is to find common interests among the users in the states of interest.
Q6	Find k=5 tweets (with the given hashtag = Ohio) posted by republican (GOP) or democrat members of a given state = Ohio in a given month = 1 of a given year = 2016. Show the tweet text, the hashtag, the screen name of the posting user, and the users’ party
Rationale: This query explores the context in which the hashtag was used
Q7	Find users in a given sub-category = ‘GOP’ along with the list of URLs used in the user’s tweets in a given month = 1 of a given year = 2016. Show the user’s screen name, the state the user lives, and the list of URLs
Rationale: This query finds URLs shared by a party.
Q8	Find k=5 users who were mentioned the most in tweets of users of a given party = ‘GOP’ in a given month = 1 of a given year = 2016. Show the user’s screen name, user’s state, and the list of the screen name of the user(s) who mentioned this user in descending order of the number of tweets mentioning this user.
Q9	Find k=5 most used hashtags with the count of tweets it appeared posted by a given sub-category = ‘GOP’ of users in a list of months = [1, 2, 3] of a given year = 2016. Show the hashtag name and the count in descending order of the count.


