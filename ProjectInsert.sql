USE `test`;

SET GLOBAL local_infile = 'ON';  
LOAD DATA LOCAL INFILE 'C:/Users/Sid Grover/Downloads/FALL 2021/COM S 561- DATABASE/project 1/project 1/dataCSV/user.csv'  
INTO TABLE users 
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES 
(username,name,sub_category,category,ofState,numFollowers,numFollowing) 
; 

LOAD DATA LOCAL INFILE 'C:/Users/Sid Grover/Downloads/FALL 2021/COM S 561- DATABASE/project 1/project 1/dataCSV/tweets.csv'  
INTO TABLE tweet 
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES 
(tid,textbody,retweet_count,retweeted,@col5,username) 
set day_posted= day(str_to_date(@col5, '%Y-%m-%d %H:%i:%s')), 
month_posted= month(str_to_date(@col5, '%Y-%m-%d %H:%i:%s')), 
year_posted= year(str_to_date(@col5, '%Y-%m-%d %H:%i:%s')); 

LOAD DATA LOCAL INFILE 'C:/Users/Sid Grover/Downloads/FALL 2021/COM S 561- DATABASE/project 1/project 1/dataCSV/tagged.csv'  
INTO TABLE tagged
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES 
(tid,hashtag) 
; 

LOAD DATA LOCAL INFILE 'C:/Users/Sid Grover/Downloads/FALL 2021/COM S 561- DATABASE/project 1/project 1/dataCSV/mentioned.csv'  
INTO TABLE mentioned
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES 
(tid,mentioned_user) 
; 

LOAD DATA LOCAL INFILE 'C:/Users/Sid Grover/Downloads/FALL 2021/COM S 561- DATABASE/project 1/project 1/dataCSV/urlused.csv'  
INTO TABLE urlused
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES 
(tid,url) 
; 

set sql_safe_updates = 0;
set sql_safe_updates = 0;
update users set ofState = 'Florida' where ofState = 'FL';
update users set ofState = 'Alabama' where ofState = 'AL';
update users set ofState = 'Alaska' where ofState = 'AK';
update users set ofState = 'Arizona' where ofState = 'AZ';
update users set ofState = 'Arkansas' where ofState = 'AR';
update users set ofState = 'California' where ofState = 'CA';
update users set ofState = 'Connecticut' where ofState = 'CT';
update users set ofState = 'Delaware' where ofState = 'DE';
update users set ofState = 'District of Columbia' where ofState = 'DC';
update users set ofState= 'Florida' where ofState = 'FL';
update users set ofState = 'Georgia' where ofState = 'GA';
update users set ofState = 'Hawaii' where ofState = 'HI';
update users set ofState = 'Idaho' where ofState = 'ID';
update users set ofState = 'Illinois' where ofState = 'IL';
update users set ofState = 'Indiana' where ofState = 'IN';
update users set ofState = 'Iowa' where ofState = 'IA';
update users set ofState = 'Kansas' where ofState = 'KS';
update users set ofState = 'Kentucky' where ofState = 'KY';
update users set ofState = 'Louisiana' where ofState = 'LA';
update users set ofState = 'Maine' where ofState = 'ME';
update users set ofState = 'Maryland' where ofState = 'MD';
update users set ofState = 'Massachusetts' where ofState = 'MA';
update users set ofState = 'Michigan' where ofState = 'MI';
update users set ofState = 'Minnesota' where ofState = 'MN';
update users set ofState = 'Mississippi' where ofState = 'MS';
update users set ofState = 'Missouri' where ofState = 'MO';
update users set ofState = 'Montana' where ofState = 'MT';
update users set ofState= 'Nebraska' where ofState = 'NE';
update users set ofState = 'Nevada' where ofState = 'NV';
update users set ofState= 'New Hampshire' where ofState = 'NH';
update users set ofState = 'New Jersey' where ofState = 'NJ';
update users set ofState = 'New Mexico' where ofState = 'NM';
update users set ofState = 'New York' where ofState = 'NY';
update users set ofState = 'North Carolina' where ofState = 'NC';
update users set ofState = 'North Dakota' where ofState = 'ND';
update users set ofState = 'Ohio' where ofState = 'OH';
update users set ofState = 'Oklahoma' where ofState = 'OK';
update users set ofState = 'Oregon' where ofState = 'OR';
update users set ofState = 'Pennsylvania' where ofState = 'PA';
update users set ofState = 'Rhode Island' where ofState = 'RI';
update users set ofState = 'South Carolina' where ofState = 'SC';
update users set ofState = 'South Dakota' where ofState = 'SD';
update users set ofState = 'Tennessee' where ofState = 'TN';
update users set ofState = 'Texas' where ofState = 'TX';
update users set ofState = 'Utah' where ofState = 'UT';
update users set ofState = 'Vermont' where ofState = 'VT';
update users set ofState = 'Virginia' where ofState = 'VA';
update users set ofState= 'Washington' where ofState = 'WA';
update users set ofState= 'West Virginia' where ofState = 'WV';
update users set ofState = 'Wisconsin' where ofState = 'WI';
update users set ofState = 'Wyoming' where ofState = 'WY';


