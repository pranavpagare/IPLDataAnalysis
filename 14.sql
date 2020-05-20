Select final.batsman, balls_six , balls , final.sixes from 
(Select d.batsman,Count(d.batsman)/sixes.sixes as balls_boundary, count(d.batsman_runs) as balls , sixes.sixes as sixes from deliveries as d
join matches as m on d.match_id=m.id
join 
(Select d.batsman, count(d.batsman) as sixes from deliveries as d
join matches as m on d.match_id=m.id
where (d.batsman_runs=6) and (wide_runs=0 and legbye_runs=0 and bye_runs=0) 
group by d.batsman) as sixes on d.batsman=sixes.batsman
where (wide_runs=0 and legbye_runs=0 and bye_runs=0)
group by d.batsman) as final
where balls>499
order by balls_boundary;
