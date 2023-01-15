SELECT c.customer_id, c.customer_name, g.glasses_brand, g.glasses_price, s.sale_date, s.sale_seller_name
FROM sale AS s
INNER JOIN customer AS c
	ON s.customer_customer_id = c.customer_id
INNER JOIN glasses AS g
	ON g.sale_sale_id = s.sale_id
WHERE c.customer_id = 1 AND s.sale_date >= '2000-01-01';

SELECT s.sale_id, s.sale_seller_name, s.sale_date, g.glasses_brand
FROM sale AS s
INNER JOIN glasses AS g
	ON g.sale_sale_id = s.sale_id
WHERE s.sale_seller_name = 'Victor Ruiz'
	AND s.sale_date BETWEEN '2010-06-15' AND '2011-06-15';
    
SELECT p.provider_name, g.glasses_brand, s.sale_date
FROM glasses AS g
INNER JOIN provider AS p
	ON g.provider_provider_id = p.provider_id
INNER JOIN sale AS s
	ON g.sale_sale_id = s.sale_id;
    
    