-- Q1:Find the titles of all movies directed by Steven Spielberg. 
Query:
select title from movie
where director = "Steven Spielberg";

-- Q2: Find all years that have a movie that received a rating of 4 or 5, and sort them in increasing order. 
Query:
select Distinct M.year from Movie M, Rating R
where M.mID = R.mID and R.stars IN(4,5)
order by M.year asc;

-- Q3: Find the titles of all movies that have no ratings. 
Query:
select title from movie
where mid not in (select mid from rating);

-- Q4: Some reviewers didn't provide a date with their rating. Find the names of all reviewers who have ratings with a NULL value for the date. 
Query:
select R.name from Reviewer R, Rating Rt
where R.rid = Rt.rid and Rt.ratingDate is NULL;

-- Q5: Write a query to return the ratings data in a more readable format: reviewer name, movie title, stars, and ratingDate. Also, sort the data, first by reviewer name, then by movie title, and lastly by number of stars. 
Query:
select Rv.name as reviewer_name, M.title as movie_title, Rt.stars, Rt.ratingDate from
Movie M, Reviewer Rv, Rating Rt
where M.mid = rt.mid and Rt.rid = Rv.rid
order by Rv.name, M.title, Rt.stars;

--Q6: For all cases where the same reviewer rated the same movie twice and gave it a higher rating the second time, return the reviewer's name and the title of the movie. 
Query:
select name, title FROM
(select name, count(Rating.rID) as cnt, 
Rating.mID, title, stars,ratingDate
from Rating
join Reviewer on Rating.rid = Reviewer.rid
join Movie on Movie.mID = Rating.mID
 group by Rating.rID, Rating.mID) as T
WHERE t.cnt > 1 LIMIT 1;

--Q7: For each movie that has at least one rating, find the highest number of stars that movie received. Return the movie title and number of stars. Sort by movie title. 
Query:
select title, MAX(stars) from Rating
join Movie on Movie.mID=Rating.mID
group by Movie.mID
order by title;

--Q8: For each movie, return the title and the 'rating spread', that is, the difference between highest and lowest ratings given to that movie. Sort by rating spread from highest to lowest, then by movie title. 
Query:
select title,max(stars)-min(stars) as Ratingspread from Movie, Rating 
where Movie.mID=Rating.mID group by title order by Ratingspread desc;
