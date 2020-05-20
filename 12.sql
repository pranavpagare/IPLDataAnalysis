Select player_of_match, count(player_of_match) as most 
from matches 
group by player_of_match
order by most DESC
