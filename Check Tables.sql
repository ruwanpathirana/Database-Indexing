USE toys;
    
SELECT * FROM playset
WHERE set_name = "Fire Truck";

SELECT set_name, year, price
FROM playset
WHERE year = 2020 AND price < 10.00;

SELECT set_name, hobbyist_name, country
FROM playset
JOIN
hobbyist
ON playset.item_number = hobbyist.item_number
WHERE set_name = "Fire Truck" AND hobbyist_name = "Harrison Kong"