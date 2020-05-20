Select batsman, bowler , sum(batsman_runs) as runs_scored , count(batsman_runs) as balls_faced from deliveries
WHERE (wide_runs=0 and legbye_runs=0 and bye_runs=0 ) 
GROUP by batsman, bowler
order by runs_scored desc
LIMIT 10;
