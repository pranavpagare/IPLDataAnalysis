SELECT m.winner, m.win_by_runs, w.win_by_wickets FROM
(Select winner, max(win_by_runs) as win_by_runs FROM matches group by winner) as m
JOIN
(Select winner,max(win_by_wickets) as win_by_wickets from matches group by winner) as w on m.winner=w.winner
 GROUP BY m.winner
 ORDER BY win_by_runs DESC;
