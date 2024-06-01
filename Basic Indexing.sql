USE toys;

SELECT * FROM playset WHERE set_name = "Fire Truck";

CREATE INDEX idx_set_name ON playset(set_name);

SHOW INDEX FROM playset;

DROP INDEX idx_set_name ON playset;

CREATE INDEX idx_year ON playset(year);

SHOW INDEX FROM playset;

DROP INDEX idx_year ON playset;