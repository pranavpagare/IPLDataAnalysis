Select f.batsman , count(f.fifty) FROM
(Select match_id,batsman,if(sum(batsman_runs)>49 and sum(batsman_runs)<100,sum(batsman_runs),"NULL") as fifty from deliveries
where wide_runs=0 and legbye_runs=0 and bye_runs=0 and inning<3
group by match_id,batsman
order by fifty DESC) as f
group by f.batsman
order by count(f.fifty) DESC
Limit 10
