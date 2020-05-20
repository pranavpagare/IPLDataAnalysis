select c.fielder , c.caught , s.stumped FROM
(select fielder, count(player_dismissed) as caught from deliveries 
where dismissal_kind = "caught" or dismissal_kind = "caught and bowled" group by fielder) as c
LEFT JOIN
(select fielder, count(player_dismissed) as stumped from deliveries 
where dismissal_kind = "stumped" group by fielder) as s on c.fielder=s.fielder
group by c.fielder
order by caught DESC
LIMIT 10;
