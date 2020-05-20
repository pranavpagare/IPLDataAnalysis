select bowler , count(player_dismissed) as wickets_taken
from deliveries
where dismissal_kind="stumped" or dismissal_kind="caught" or dismissal_kind="lbw" or dismissal_kind="caught and bowled" or dismissal_kind = "stumped" or dismissal_kind = "hit wicket" or dismissal_kind = "bowled"
group by bowler
order by wickets_taken desc;
