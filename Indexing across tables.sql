CREATE INDEX idx_hobbyist_name ON hobbyist(hobbyist_name);

EXPLAIN ANALYZE
SELECT set_name, hobbyist_name, country
FROM playset
USE INDEX(idx_set_name)
JOIN
hobbyist
USE INDEX(idx_hobbyist_name)
ON playset.item_number = hobbyist.item_number
WHERE set_name = "Fire Truck" AND hobbyist_name = "Harrison Kong";

-- '-> Nested loop inner join  (cost=0.70 rows=1) (actual time=0.042..0.044 rows=1 loops=1)\n
--    -> Index lookup on hobbyist using idx_hobbyist_name (hobbyist_name=\'Harrison Kong\')  
-- (cost=0.35 rows=1) (actual time=0.026..0.028 rows=1 loops=1)\n  
--  -> Filter: (playset.item_number = hobbyist.item_number)  (cost=0.35 rows=1) (actual time=0.014..0.014 rows=1 loops=1)\n    
--   -> Single-row index lookup on playset using idx_set_name (set_name=\'Fire Truck\', item_number=hobbyist.item_number) 
-- (cost=0.35 rows=1) (actual time=0.011..0.011 rows=1 loops=1)\n'


