# We want to reward the user who has been around the longest, Find the 5 oldest users.
select * from users;                # TO GET ID,USERNAME,CREATED_AT #
with cte as                         #---USING COMMON TABLE EXPRESSION
(select id,username,created_at      #---WRITING CTE QUERY
from users
)
select id,username,created_at,     # ---USING CASE STATEMENT
case id
when 80 then 'reward'
when 67 then 'reward'
when 63 then 'reward'
when 95 then 'reward'
when 38 then 'reward'
else 'nonreward'
end reward_list
from cte order by created_at
limit 5;                           # ---LIMITING THE RESULT BY 5 AS PER QUESTION ASKED --

# 3.To understand when to run the ad campaign, figure out the day of the week most users register on? 
select count(id) as maxregistration ,dayname(created_at) as day
from users
where dayname(created_at) = 'sunday'or             -- USING WHERE CALUSE WITH OR OPERATOR --
dayname(created_at) ='monday'or 
dayname(created_at) ='tuesday'or 
dayname(created_at) ='wednesday'or 
dayname(created_at) ='thursday'or 
dayname(created_at) ='friday'or 
dayname(created_at) ='saturday'
group by dayname(created_at);                     -- USING GROUP BY CLAUSE --

# HERE ON THE SUNDAY AS WELL AS THURSDAY MOST USERS REGISTER ON, HENCE WE WILL RUN CAMPAGIN ON BOTH OF THESE DAYS #

# 4. To target inactive users in an email ad campaign, find the users who have never posted a photo.?

select * from photos;        # TO GET THE USER_ID,IMAGE_URL #
select * from users;         #TO GET THE ID,USERNAME # 

select * from photos group by user_id;                       -- for checking the number of inactive number of users --

select distinct photos.user_id,users.id, username,image_url
from photos
right join users on users.id=photos.user_id         # JOINING PHOTOS AND USERS TABLE WITH users.id AND photos.user_id #
where photos.user_id is null;                        # USING WHERE CONDITION #





# 5. Suppose you are running a contest to find out who got the most likes on a photo. Find out who won?

select * from likes;    # TO GET PHOTO_ID,USER_ID #
select * from users;    # TO GET USERNAME #
select * from photos;   # TO GET ID #

select count(user_id) ,photo_id from likes group by photo_id order by count(user_id) desc;   -- TO CHECK THE HIGHEST LIKES --

with cte as                                                                                 -- USING COMMON TABLE EXPRESSION --
(
select likes.photo_id,users.id,count(likes.user_id) total_likes,username from likes
join photos on likes.photo_id=photos.id                                                   #JOINING LIKES AND PHOTOS TABEL WITH likes.photo_id AND photos.id  #
join users on photos.user_id=users.id                                                     # JOINING PHOTOS AND USERS TABEL WITH photos.user_id AND users.id #
group by photo_id order by count(likes.user_id) desc)
select photo_id,id, total_likes,username,                                                    -- USING CASE STATEMENT --
case total_likes
when 48 then 'won' 
else 'loose' 
end verdict
from cte
limit 1;                                                    -- LIMITING THE RESULT BY 1 AS PER QUESTION ASKED --                                      





# 6.The investors want to know how many times does the average user post.?

select * from photos;

 select count(image_url) no_of_posts,user_id from photos          -- USING SUBQUERIES --
 where user_id =(select round(avg(user_id)) from photos);
 
 
 
 
 
 
 # 7. A brand wants to know which hashtag to use on a post, and find the top 5 most used hashtags.
 
select * from tags;                                          #TO GET TAG_NAME #
select * from photo_tags;                                    # TAG_ID ,PHOTO_ID #

select tag_id,count(photo_id) from photo_tags group by tag_id order by tag_id desc limit 5;   -- TO CHECK THE MAXIMUM PHOTO_ID COUNTS --

with cte as                                                    -- USING COMMON TABLE EXPRESSION --
(
select tag_id,tag_name,count(photo_id) as max_count
from photo_tags
join tags on tags.id=photo_tags.tag_id               # PERFORMING JOIN BETWEEN TAGS AND PHOTO_TAGS TABLE # 
group by tag_id                                               -- USING GROUP BY CALUSE --
order by tag_id desc                                          -- USIGN ORDER BY CLAUSE --
limit 5)                                                      -- LIMITNG RESULTS BY 5 AS PER QUESTION AKSED --
select tag_id,tag_name,max_count,                             -- USING CASE STATEMENT --
case tag_id
when 21 then 'most used hastag'
when 20 then 'most used hastag'
when 19 then 'most used hastag'
when 18 then 'most used hastag'
when 17 then 'most used hastag'
else 'null'
end hastag_type
from cte; 





# 8. To find out if there are bots, find users who have liked every single photo on the site.

select * from likes;           # TO GET USER_ID,PHOTO_ID #
select * from users;           # TO GET USERNAME #
select count(id) from photos;  # TO GET NUMBER OF TOTAL PHOTOS #               


with cte as                                                     -- USING COMMON TABLE EXPRESSION --
(
select user_id, username, COUNT(photo_id) max_likes from users    
join likes on users.id=likes.user_id                             # JOIN USERS AND LIKES TABLES WITH users.id AND likes.user_id #
group by user_id                                                 -- USING GROUP BY CALUSE --
having COUNT(photo_id)=257                                       -- USING HAVING CLAUSE --
order by COUNT(photo_id) desc)                                   -- USING ORDER BY CLAUSE --

select user_id, username, max_likes,                               -- USING CASE STATEMENT --
case max_likes
when 257 then 'BOT'
else 'user'
end identity
from cte ;





# 9. To know who the celebrities are, find users who have never commented on a photo.

select * from comments;        # TO GET USER_ID,COMMENT_TEXT #
select * from users;           # TO GET ID,USERNAME #

select * from comments group by user_id;                -- TO KNOW NUMBER OF USERS NEVER COMMENTD

select distinct comments.user_id,users.id,username,comment_text
from comments
right join users on users.id=comments.user_id              # JOIN COMMENTS AND USERS TABLE WITH users.id AND comments.user_id #
where comments.user_id is null;                            -- USING WHERE CONDITON --






# 10. Now it's time to find both of them together, find the users who have never commented on any photo or have commented on every photo.

select * from users;           # TO GET USERNAME,ID #
select * from comments;        # TO GET COMMENT_TEXT #
select distinct photo_id from comments;                -- to check the total photos commented.


with cte as                                             -- USING COMMON TABLE EXPRESSION --
(
select distinct users.id,username,comment_text
from comments
right join users on users.id=comments.user_id                   # PERFORMING RIGHT JOIN ON COMMENTS AND USERS TABLE #
where comments.user_id is null
union all                                                       -- USING UNION CALUSE SINCE BOTH STATEMENTS HAS SAME NUMBER OF COLUMNS --
select user_id,username,count(photo_id) max_comments from users
join comments on users.id=comments.user_id                      # PERFORMING JOINS ON COMMENTS AND USERS TABLE #
group by user_id                                                -- USING GROUP BY CALUSE --
having count(photo_id)= 257)                                    -- USING HAVING CONDITION --
select id,username,comment_text,                                -- USING CASE STATEMENT --
case comment_text                            
when 257 then 'always commented'
else 'never commented'
end Status
from cte;

