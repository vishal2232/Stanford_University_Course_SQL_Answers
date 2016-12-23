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