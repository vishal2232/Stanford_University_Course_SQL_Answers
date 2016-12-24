--Q1:Find the names of all reviewers who rated Gone with the Wind. 
Query:
Select distinct R.name from Movie M, Reviewer R, Rating Rat
where M.mID = Rat.mID and R.rID = Rat.rID
and Rat.mID = 101;

--Q2:Find the names of all reviewers who rated Gone with the Wind. 
Query:
Select  R.name, M.title, Rat.stars
from Movie M, Reviewer R, Rating Rat
where M.mID = Rat.mID and Rat.rID = R.rID and R.name = M.director;

--Q3: Return all reviewer names and movie names together in a single list, alphabetized. (Sorting by the first name of the reviewer and first word in the title is fine; no need for special processing on last names or removing "The".) 
Query:
SELECT title FROM Movie
UNION
SELECT name FROM Reviewer
ORDER BY name, title;

--Q4: Find the titles of all movies not reviewed by Chris Jackson. 
Query:
SELECT title
FROM Movie
WHERE mId NOT IN (
  SELECT R.mId
  FROM Rating R, Reviewer Rev
  WHERE R.rid = Rev.rid and Rev.name = "Chris Jackson"
);
