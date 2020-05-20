Select  d.over, sum(d.total_runs) as runs, COUNT(d.player_dismissed) as wickets from deliveries as d 
join matches as m on d.match_id=m.id
where season = "IPL-2019"
group by d.over
order by runs DESC , wickets Desc;
