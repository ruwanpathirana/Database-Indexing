EXPLAIN ANALYZE SELECT * FROM playset WHERE set_name = "Police%";

-- '-> Filter: (playset.set_name = \'Police%\') 
-- (cost=11.15 rows=11) (actual time=0.184..0.184 rows=0 loops=1)\n    
-- -> Table scan on playset  (cost=11.15 rows=109) (actual time=0.114..0.159 rows=109 loops=1)\n'

CREATE INDEX idx_set_name ON playset(set_name);

EXPLAIN ANALYZE SELECT * FROM playset WHERE set_name = "Police%";

-- '-> Index lookup on playset using idx_set_name (set_name=\'Police%\')  
-- (cost=0.35 rows=1) (actual time=0.025..0.025 rows=0 loops=1)\n'

DROP INDEX idx_set_name ON playset;

-- UNIQUE INDEX

CREATE UNIQUE INDEX idx_set_name ON playset(set_name);

CREATE UNIQUE INDEX idx_item_number_internal_id ON playset(item_number, internal_id);
DROP INDEX idx_item_number_internal_id ON playset;

