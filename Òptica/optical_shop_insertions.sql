USE optical_shop;

INSERT INTO address (address_street, address_number, address_floor, address_door, address_city, address_postal_address, address_country)
VALUES ('Gran Via', '998', '4', '2', 'Barcelona', '08018', 'Espanya'),
	   ('Passeig Pere III', '73', NULL, NULL, 'Manresa', '08242', 'Espanya'),
       ('C/ Concordia', '120', '1', NULL, 'Mataró', '08301', 'Espanya'),
       ('C/ Violinista Vellsola', '37', NULL, NULL, 'Terrassa', '08222', 'Espanya');
       
INSERT INTO provider (provider_name, provider_phone, provider_fax, provider_nif, address_address_id)
VALUES ('Optim S.A', '657992812', '938721332', NULL, 1),
	   ('SoloGafas, S.L', '623377123', NULL, '39387002T', 2),
       ('Creasol S.L', '694734421', '923782173', '32127244M', 3),
       ('Visionlab', '655982311', NULL, NULL, 4);
       
INSERT INTO customer (customer_name, customer_phone, customer_mail, customer_postal_address, customer_registration_data)
VALUES ('Anna Pintado', '638990042', 'annap_92@hotmail,com', '08240', '2022-03-14'),
	   ('Josep Molina', '619773114', 'josepmolina@gmail.com', '08010', '2019-12-24'),
       ('Carme Esteve', '615436843', 'carmenchu13@yahoo.es', '08192', '2011-01-15'),
       ('Mario Martinez', '677134522', 'mmv_1888@gmail,com', '08005', '2005-07-07');
       
UPDATE customer
SET customer_recommendation_id = 1
WHERE customer_id = 2;

UPDATE customer
SET customer_recommendation_id = 2
WHERE customer_id IN (3, 4);

INSERT INTO sale (sale_seller_name, sale_date, customer_customer_id)
VALUES ('Maria Gonzalez', '2022-03-14', 1),
	   ('Victor Ruiz', '2023-01-02', 1), 
       ('Maria Gonzalez', '2019-12-24', 2),
       ('Victor Ruiz', '2011-03-11', 3),
       ('Victor Ruiz', '2010-09-10', 4);

INSERT INTO glasses (glasses_brand, glasses_left_eye_graduation, glasses_right_eye_graduation, glasses_frame_type, glasses_frame_color,
					glasses_glass_color, glasses_price, provider_provider_id, sale_sale_id)
VALUES('Etnia Barcelona', '-2.25', '-3.00', 'Metal', 'Red', 'Grey', '135.50', 1, 1),
	  ('Silhouette', '+0.50', '+0.75', 'Floating', 'Black', 'Brown', '230.00', 1, 2),
      ('Xavier Garcia', '-5.75', '-4.75', 'Pasta', 'Grey', 'Blue', '115.99', 2, 3),
      ('Zen Barcelona', '+3.00', '+3.00', 'Metal', 'Green', 'Brown', '163.75', 3, 4),
      ('Oakley', '-0.75', '-1.00', 'Pasta', 'Black', 'Blue', '99.99', 3, 5);