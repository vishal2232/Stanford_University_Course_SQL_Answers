--Q1 It's time for the seniors to graduate. Remove all 12th graders from Highschooler. 
Query
delete from Highschooler
where grade = 12;

--Q2 If two students A and B are friends, and A likes B but not vice-versa, remove the Likes tuple.
Query
delete from Likes
where ID2 in (select ID2 from Friend where Likes.ID1 = ID1) and
      ID2 not in (select L.ID1 from Likes L where Likes.ID1 = L.ID2);
