USE pizzeria;

INSERT INTO province (province_name)
VALUES ('Barcelona'),
	   ('Lleida'),
	   ('Girona'),
       ('Tarragona');

INSERT INTO locality (locality_name, province_province_id)
VALUES ('Alella', 1),
	   ('Cervera', 2),
       ('Barcelona', 1),
       ('Gavà', 1),
	   ('Banyoles', 3),
       ('Girona', 3);

INSERT INTO customer (customer_name, customer_surnames, customer_address, customer_zipCode, customer_phoneNumber, locality_locality_id)
VALUES ('Anna', 'Pintado Garcia', 'C/ Riera Fosca, 28, 4t 1a', '08328', '638990042', 1),
	   ('Josep', 'Molina Vima', 'C/ Major, 74, 3r 4t', '25213', '619773114', 2),
       ('Carme', 'Esteve Ribalta', 'Gran Via, 1000, 4t 2a', '08018', '615436843', 3),
       ('Mario', 'Martinez Serra', 'C/ Sant Pere, 19, 6è 3a', '08850', '677134522', 4),
       ('Laura', 'Bages Prieto', 'Passeig Lluís Maria Vidal, 1, 4t 1a', '17820', '674352133', 5),
       ('Dídac', 'Soldevila Màrquez', 'C/ Ramon Cantó, 12, 3r 3a', '25200', '619421379', 2),
       ('Alexia', 'Noia Redón', 'Plaça del Vi, 8, 1r 1a', '17004', '669646212', 6);

INSERT INTO store (store_address, store_zipCode, locality_locality_id)
VALUES ('Rambla Àngel Guimerà, 1', '08328', 1),
	   ('Rambla de Lluís Sanpere, 6', '25200', 2),
       ('Plaça de Sant Felip Neri, 2', '08002', 3),
       ('C/ Pedret, 136', '17007', 6);

INSERT INTO storeOrder (storeOrder_datetime, storeOrder_home_or_store, storeOrder_totalPrice, customer_customer_id, store_store_id)
VALUES ('2022-10-12 13:23:18', 'Pick up in store', '14.25', 1, 1),
	   ('2022-12-01 21:35:05', 'Home delivery', '13.25', 1, 1),
       ('2020-05-15 14:22:13', 'Pick up in store', '8.00', 2, 2),
       ('2023-01-09 22:15:47', 'Home delivery', '29.49', 3, 3),
       ('2021-11-21 13:55:31', 'Pick up in store', '10.75', 4, 3),
       ('2019-08-10 20:25:45', 'Pick up in store', '28.50', 5, 4),
	   ('2019-12-22 21:38:01', 'Pick up in store', '7.50', 5, 4),
       ('2021-06-21 12:58:11', 'Home delivery', '35.75', 6, 2),
       ('2023-01-08 15:15:38', 'Home delivery', '30.75', 7, 4);

INSERT INTO employee (employee_name, employee_surnames, employee_nif, employee_phoneNumber, employee_position, store_store_id)
VALUES ('Cristina', 'Reig Piñero', '39387002T', '623377123', 'Cook', 1),
	   ('Eva', 'Benito Gamell', NULL, '657992812', 'Delivery person', 1),
       ('Pau', 'Zanuy Leal', '32127244M', NULL, 'Delivery person', 2),
       ('Eloi', 'Sucarrats Cots', '39345679A', '694734421', 'Cook', 2),
       ('Carles', 'Morata Fernàndez', NULL, NULL, 'Delivery person', 3),
       ('Pilar', 'Valls Llort', '39721332G', NULL, 'Cook', 3),
       ('Lluís', 'Berch Alayo', NULL, '655982311', 'Cook', 4),
       ('Emma', 'Llorenç Vila', '39456712T', '638344091', 'Delivery person', 4);

INSERT INTO home_order_delivery (employee_employee_id, storeOrder_storeOrder_id, home_order_delivery_datetime)
VALUES (2, 2, '2022-12-01 22:02:55'),
	   (5, 4, '2023-01-09 22:42:33'),
       (3, 8, '2021-06-21 13:29:59'),
       (8, 9, '2023-01-08 15:41:27');

INSERT INTO category (category_name)
VALUES ('Classic pizza'),
	   ('Vegan pizza'),
       ('Gourmet pizza'),
       ('Hamburguer'),
       ('Drink');

INSERT INTO product (product_name, product_description, product_image, product_price, category_category_id)
VALUES ('Four cheeses', 'Tomato, mozzarella, goat cheese, gorgonzola and emmental cheese', NULL, 10.25, 1),
	   ('Vegan margherita', 'Tomato, Väcka mözza and basil oil', NULL, 12.50, 2),
       ('American meet', 'Tomato, mozzarella, bacon, pepperoni and beef', NULL, 14.25, 3),
       ('Cheeseleader', 'Beef, battered tomato, bacon and caramelized onions', NULL, 10.75, 4),
       ('Australian', 'Beef, cheedar, bacon, braised beets and BBQ sauce', NULL, 11.99, 4),
       ('Beer', NULL, NULL, 2.50, 5),
       ('Coke', NULL, NULL, 2.00, 5);

INSERT INTO order_has_products (product_product_id, storeOrder_storeOrder_id, order_has_products_amount)
VALUES (1, 1, 1),
	   (7, 1, 2),
	   (4, 2, 1),
       (6, 2, 1),
       (7, 3, 4),
       (2, 4, 1),
       (5, 4, 1),
       (6, 4, 2),
       (4, 5, 1),
       (3, 6, 2),
       (6, 7, 3),
       (3, 8, 1),
       (4, 8, 2),
       (1, 9, 3); 

