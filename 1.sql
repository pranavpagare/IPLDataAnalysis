Select Distinct f.venue, wf.winner_field/f.decided_to_field*100 as win_percentage_field , w.winner_bat/b.decided_to_bat*100 as win_percentage_bat , abs((wf.winner_field/f.decided_to_field*100) - (w.winner_bat/b.decided_to_bat*100)) as diff, f.decided_to_field, wf.winner_field,b.decided_to_bat,w.winner_bat FROM 
(Select venue, count(toss_decision) as decided_to_field from matches
where toss_decision = "field" group by venue) as f
join 
(Select venue, count(toss_decision) as decided_to_bat from matches
where toss_decision = "bat"  group by venue) as b on f.venue=b.venue
JOIN
(Select venue, count(toss_winner) as winner_bat from matches
where toss_decision = "bat" and toss_winner=winner group by venue) as w on f.venue=w.venue
JOIN
(Select venue, count(toss_winner) as winner_field from matches
where toss_decision = "field" and toss_winner=winner group by venue) as wf on f.venue=wf.venue
GROUP by f.venue
order by diff desc;
