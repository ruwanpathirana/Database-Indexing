EXPLAIN ANALYZE SELECT * FROM playset WHERE year =2020 AND price = 9.99;

-- '-> Filter: ((playset.`year` = 2020) and (playset.price = 9.99))  
-- (cost=11.15 rows=1) (actual time=0.121..0.179 rows=30 loops=1)\n  
--  -> Table scan on playset  (cost=11.15 rows=109) (actual time=0.111..0.159 rows=109 loops=1)\n'

CREATE INDEX idx_year_price ON playset(year, price);

EXPLAIN ANALYZE SELECT * FROM playset WHERE year =2020 AND price = 9.99;

-- '-> Index lookup on playset using idx_year_price (year=2020, price=9.99)  
-- (cost=3.75 rows=30) (actual time=0.101..0.114 rows=30 loops=1)\n'


EXPLAIN ANALYZE SELECT set_name, year, price
FROM playset WHERE year = 2020
AND price < 10.00;

-- '-> Filter: ((playset.`year` = 2020) and (playset.price < 10)) 
-- (cost=11.15 rows=44) (actual time=0.078..0.129 rows=44 loops=1)\n   
-- -> Table scan on playset  (cost=11.15 rows=109) (actual time=0.071..0.108 rows=109 loops=1)\n'


