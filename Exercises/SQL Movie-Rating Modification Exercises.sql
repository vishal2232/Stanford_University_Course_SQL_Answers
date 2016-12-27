--Q1 Add the reviewer Roger Ebert to your database, with an rID of 209.
insert into Reviewer values ( 209, "Roger Ebert" );

--Q2 Insert 5-star ratings by James Cameron for all movies in the database. Leave the review date as NULL. 
insert into Rating  
select rID,mID,5,null from Reviewer, Movie  
where name="James Cameron";

--Q3 For all movies that have an average rating of 4 stars or higher, add 25 to the release year. (Update the existing tuples; don't insert new tuples.) 
update Movie set year=year+25 where
mID in (select mID from (select Rating.mID,avg(stars) as average  
  from Movie, Rating where Movie.mID=Rating.mID 
  group by Rating.mID, year) where average>=4);