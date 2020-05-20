Select d.batsman, d.bowler ,count(d.batsman_runs) as count FROM deliveries as d
WHERE d.batsman_runs = 6 and (d.wide_runs=0 and d.bye_runs=0 and d.legbye_runs=0) 
group by d.batsman , d.bowler
order by count desc
Limit 10
