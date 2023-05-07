-- https://www.hackerrank.com/challenges/full-score/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

-- Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

-- Solution:

select b.hacker_id,b.name from
(select a.hacker_id,a.name, count(a.challenge_id) as chl from
(select s.hacker_id,h.name,s.challenge_id
from 
submissions s
inner join 
hackers h on h.hacker_id=s.hacker_id 
inner join
challenges c on s.challenge_id=c.challenge_id
inner join
difficulty d on  d.difficulty_level=c.difficulty_level
where d.score=s.score
and d.difficulty_level=c.difficulty_level) a
group by a.hacker_id,a.name) b
where b.chl>1
order by b.chl desc, b.hacker_id asc



-- Soultion by Souvik:

SELECT f.hacker_id, f.name
FROM
(SELECT DISTINCT h.hacker_id, h.name, c.challenge_id
FROM hackers h
INNER JOIN submissions s ON s.hacker_id = h.hacker_id
INNER JOIN challenges c ON c.challenge_id = s.challenge_id
INNER JOIN difficulty d ON d.difficulty_level = c.difficulty_level AND d.score = s.score) f
GROUP BY f.hacker_id, f.name
HAVING COUNT(1) > 1
ORDER BY COUNT(1) DESC, f.hacker_id ASC





