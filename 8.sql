Select final.batsman, final.count FROM
(SELECT h.batsman, count(h.hundered) as count from 
(Select match_id,batsman,if(sum(batsman_runs)>99,sum(batsman_runs),"NULL") as hundered from deliveries
where wide_runs=0 and legbye_runs=0 and bye_runs=0 and inning<3
group by match_id,batsman
order by hundered DESC) as h 
group by h.batsman
order by COUNT(h.hundered) DESC) as final
where count>0
group by final.batsman
order by count DESC
