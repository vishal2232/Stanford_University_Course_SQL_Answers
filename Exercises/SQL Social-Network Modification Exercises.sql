--Q1 It's time for the seniors to graduate. Remove all 12th graders from Highschooler. 
Query
delete from Highschooler
where grade = 12;

--Q2 If two students A and B are friends, and A likes B but not vice-versa, remove the Likes tuple.
Query
delete from Likes
where ID2 in (select ID2 from Friend where Likes.ID1 = ID1) and
      ID2 not in (select Lyk.ID1 from Likes Lyk where Likes.ID1 = Lyk.ID2);
--Q3 For all cases where A is friends with B, and B is friends with C, add a new friendship for the pair A and C. Do not add duplicate friendships, friendships that already exist, or friendships with oneself.
