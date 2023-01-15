SELECT c.category_name, p.product_name, so.storeOrder_datetime, l.locality_name
FROM category AS c
INNER JOIN product AS p
	ON c.category_id = p.category_category_id
INNER JOIN order_has_products AS op
	ON p.product_id = op.product_product_id
INNER JOIN storeOrder AS so
	ON so.storeOrder_id = op.storeOrder_storeOrder_id
INNER JOIN customer AS cu
	ON cu.customer_id = so.customer_customer_id
INNER JOIN locality AS l
	ON l.locality_id = cu.locality_locality_id
WHERE c.category_name LIKE 'Drink' AND l.locality_name LIKE 'Alella';

SELECT e.employee_name, e.employee_surnames, e.employee_position, hod.home_order_delivery_datetime
FROM home_order_delivery AS hod
INNER JOIN employee AS e
	ON e.employee_id = employee_employee_id
WHERE e.employee_name = 'Carles';

