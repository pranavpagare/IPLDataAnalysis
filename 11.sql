Select final.bowler, final.wickets, final.econ,final.balls_per_wicket FROM
(Select d.bowler, sum(d.total_runs)/count(d.bowler) as econ ,out.out as wickets, count(distinct match_id) as matches , count(d.bowler)/out.out as balls_per_wicket , (sum(d.total_runs)/count(d.bowler))*(count(d.bowler)/out.out) , count(d.bowler) as balls , sum(d.total_runs)/out.out as avg from deliveries as d 
join matches as m on d.match_id=m.id
join 
(Select d.bowler , count(player_dismissed) as out from deliveries as d 
join matches as m on d.match_id=m.id 
where (m.season="IPL-2017" or m.season="IPL-2018"or m.season="IPL-2019")  and  (dismissal_kind="stumped" or dismissal_kind="caught" or dismissal_kind="lbw" or dismissal_kind="caught and bowled" or dismissal_kind = "stumped" or dismissal_kind = "hit wicket" or dismissal_kind = "bowled")
GROUP by d.bowler ) as out on d.bowler=out.bowler
where m.season="IPL-2017" or m.season="IPL-2018"or m.season="IPL-2019" 
GROUP by d.bowler) as final
where final.balls>399
order by final.wickets DESC
LIMIT 20;
