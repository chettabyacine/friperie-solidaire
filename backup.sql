DROP TABLE IF EXISTS PAYMENT_PRODUCTS;
DROP TABLE IF EXISTS PAYMENTFORM;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS products;

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    image VARCHAR(255),
    alt VARCHAR(255),
    price NUMERIC(6, 2) NOT NULL,
    type VARCHAR(50),
    keyword VARCHAR(50),
    color VARCHAR(50),
    sizexs INTEGER DEFAULT 0,
    sizes INTEGER DEFAULT 0,
    sizem INTEGER DEFAULT 0,
    sizel INTEGER DEFAULT 0,
    sizexl INTEGER DEFAULT 0,
    brand VARCHAR(100)
);

CREATE TABLE users (
    user_name VARCHAR(50),
    user_family_name VARCHAR(50),
    email VARCHAR(100) PRIMARY KEY,
    password VARCHAR(50),
    date_of_birth DATE,
    phone_number VARCHAR(20),
    address VARCHAR(100),
    additional_address_information VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50),
    is_admin BOOLEAN
);

CREATE TABLE PAYMENTFORM (
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    user_family_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    address VARCHAR(255) NOT NULL,
    additional_address_information VARCHAR(255),
    city VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    is_send BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE PAYMENT_PRODUCTS (
    payment_id INT NOT NULL,
    product_id INT NOT NULL,
    PRIMARY KEY (payment_id, product_id),
    FOREIGN KEY (payment_id) REFERENCES PAYMENTFORM(id),
    FOREIGN KEY (product_id) REFERENCES PRODUCTS(id)
);



INSERT INTO products (name, description, image, alt, price, type, keyword, color, sizexs, sizes, sizem, sizel, sizexl, brand )
VALUES (
    'Loose Jeans',
    'Cool jeans for summer or spring.',
    'img/pants/1 Loose Jeans.jpeg',
    'Loose Jeans',
    10.99,
    'pants',
    'men',
    'dark blue',
    8, 0, 9, 0, 0,
    'H&M'
),(
    'Regular Jeans',
    'Jeans for summer or spring.',
    'img/pants/2 Regular Jeans.jpeg',
    'Loose Jeans',
    7.99,
    'pants',
    'men women summer',
    'light blue',
    2, 0, 3, 0, 0,
    'H&M'
),
(
    'Regular Jeans',
    'Pair of jeans that''s trending now.',
    'img/pants/3 Regular Jeans.jpeg',
    'Loose Jeans',
    9.99,
    'pants',
    'men',
    'black',
    2, 0, 5, 9, 0,
    'H&M'
),
(
    'Loose Jeans',
    'Pair of loose jeans that''s trending now.',
    'img/pants/4 Loose Jeans.jpeg',
    'Loose Jeans',
    10.99,
    'pants',
    'men',
    'light blue',
    2, 0, 5, 9, 0,
    'H&M'
),
(
    'Swimming shorts',
    'Simple and cool swmimming shorts',
    'img/swimming/1 swimming short.jpeg',
    'Swimming shorts',
    6.99,
    'swimming',
    'men',
    'black',
    2, 0, 5, 9, 0,
    'H&M'
),
(
    'Swimming shorts',
    'Simple and cool swmimming shorts',
    'img/swimming/2 swimming short.jpeg',
    'Swimming shorts',
    9.99,
    'swimming',
    'men',
    'green',
    2, 0, 5, 9, 0,
    'H&M'
),
(
    'Bikini',
    'black sexy bikini top',
    'img/swimming/3 bikini.jpeg',
    'Swimming',
    16.99,
    'swimming',
    'women',
    'black',
    2, 0, 5, 9, 0,
    'H&M'
),
(
    'Bikini',
    'black and white sexy bikini top',
    'img/swimming/4 bikini.jpeg',
    'Swimming shorts',
    12.99,
    'swimming',
    'women',
    'black white',
    2, 0, 5, 9, 0,
    'H&M'
);



INSERT INTO users 
    (user_name, user_family_name, email, password, date_of_birth, phone_number, address, additional_address_information, city, country, is_admin)
VALUES 
    ('Adèle', 'Dubois', 'adele.dubois@example.com', 'password1', '1995-02-15', '+33 6 12 34 56 78', '12 Rue de la Paix', '', 'Paris', 'France', false),
    ('Hugo', 'Leroux', 'hugo.leroux@example.com', 'password2', '1989-07-20', '+33 6 98 76 54 32', '3 Rue du Faubourg Saint-Honoré', '', 'Paris', 'France', false),
    ('Camille', 'Girard', 'camille.girard@example.com', 'password3', '1992-11-01', '+33 6 78 90 12 34', '29 Rue des Francs-Bourgeois', 'Appartement 2', 'Paris', 'France', false),
    ('Giov', 'Sav', 'giov@sav', 'gio', '1992-11-01', '+33 6 78 90 12 34', '29 Rue des Francs-Bourgeois', 'Appartement 2', 'Paris', 'France', true),
    ('Lucas', 'Martin', 'lucas.martin@example.com', 'password4', '1980-05-10', '+33 6 56 78 90 12', '1 Avenue des Champs-Élysées', '', 'Paris', 'France', true);
