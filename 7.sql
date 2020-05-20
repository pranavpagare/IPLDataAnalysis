Select d.batting_team, sum(d.total_runs)/count(distinct d.match_id)/4 as runs , count(d.player_dismissed)/count(distinct d.match_id) as wickets from deliveries as d 
join matches as m on d.match_id=m.id
where d.over >16 and m.season = "IPL-2019"
GROUP by d.batting_team;
