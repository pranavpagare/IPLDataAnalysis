SELECT final.venue, final.batsman , count(runs) FROM
(
SELECT m.venue,d.batsman,d.match_id,sum(batsman_runs) as runs
from deliveries as d
join matches as m  on d.match_id=m.id
where wide_runs=0 and legbye_runs=0 and bye_runs=0
group by m.venue,d.batsman,d.match_id
order by runs desc ) as final
where final.runs>49
group by final.venue, final.batsman
order by count(runs) DESC
Limit 20;
