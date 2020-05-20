Select m.toss_winner, m.chose_bat, w.won_batting ,w.won_batting/m.chose_bat*100 as win_percentage_when_batting_first, f.chose_field , wf.won_fielding , wf.won_fielding/f.chose_field*100 as win_percentage_when_fielding_first FROM
(Select toss_winner, count(toss_decision) as chose_bat from matches where toss_decision = "bat" group by toss_winner) as m 
JOIN
(Select toss_winner, count(toss_decision) as won_batting from matches where toss_decision = "bat" and winner=toss_winner group by toss_winner) as w on m.toss_winner=w.toss_winner
JOIN
(Select toss_winner, count(toss_decision) as chose_field from matches where toss_decision = "field" group by toss_winner) as f on m.toss_winner = f.toss_winner
JOIN
(Select toss_winner, count(toss_decision) as won_fielding from matches where toss_decision = "field" and winner=toss_winner group by toss_winner) as wf on m.toss_winner = wf.toss_winner
GROUP by m.toss_winner
order by win_percentage_when_batting_first+win_percentage_when_fielding_first DESC;  
