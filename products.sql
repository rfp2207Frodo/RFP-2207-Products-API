CREATE DATABASE Products;
\c Products;

DROP TABLE IF EXISTS `Products`;

CREATE TABLE `Products` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL DEFAULT 'NULL',
  `slogan` VARCHAR(150) NOT NULL DEFAULT 'NULL',
  `description` VARCHAR(300) NOT NULL DEFAULT 'NULL',
  `category` VARCHAR(25) NOT NULL DEFAULT 'NULL',
  `default_price` VARCHAR (5) NOT NULL DEFAULT '0',
   PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS 'Features';

CREATE TABLE `Features` (
  `feature_id` INTEGER NOT NULL AUTO_INCREMENT,
  `id` INTEGER NOT NULL AUTO_INCREMENT,
   FOREIGN KEY(`id`)
   REFERENCES `Products(id)`,
  `feature` VARCHAR(50),
  `value` VARCHAR(200),
   PRIMARY KEY(`id`)
);

DROP TABLE IF EXISTS `Results`;

CREATE TABLE `Results` (
  `id` INTEGER NOT NULL,
  `style_id` INTEGER NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL DEFAULT 'NULL',
  `original_price` VARCHAR (5) NOT NULL DEFAULT '0',
  `sale_price` VARCHAR (5) NOT NULL DEFAULT '0',
  `default?` BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY(`id`),
   FOREIGN KEY(`id`)
    REFERENCES `Products (id)`
);

DROP TABLE IF EXISTS `Photos`;

 CREATE TABLE `Photos` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  'style_id' INTEGER NOT NULL,
  `url` VARCHAR(200) NOT NULL DEFAULT 'NULL',
  `thumbnail_url` VARCHAR(200) NOT NULL DEFAULT 'NULL',
   PRIMARY KEY(`id`),
   FOREIGN KEY(`id`)
    REFERENCES `Products(id)`,
   FOREIGN KEY(`style_id`)
    REFERENCES `Results (style_id)`
);

DROP TABLE IF EXISTS `Skus`;

CREATE TABLE `Skus` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `style_id` INTEGER NOT NULL,
  `size` VARCHAR(2) NOT NULL DEFAULT 'NULL',
  `quantity` INTEGER NOT NULL DEFAULT 'NULL',
  PRIMARY KEY(`id`),
   FOREIGN KEY(`id`)
    REFERENCES `Products(id)`,
   FOREIGN KEY(`style_id`)
    REFERENCES `Results (style_id)`
);

DROP TABLE IF EXISTS `Cart`;

CREATE TABLE `Cart` (
  `cart_id` INTEGER NOT NULL AUTO_INCREMENT,
  `user_session` INTEGER NOT NULL,
  `product_id` INTEGER NOT NULL,
  `active` BOOLEAN NOT NULL DEFAULT FALSE,
   FOREIGN KEY(`product_id`)
    REFERENCES `Products (id)`
);

DROP TABLE IF EXISTS `Related` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `current_product_id` INTEGER NOT NULL,
  `related_product_id` INTEGER NOT NULL AUTO_INCREMENT,
   FOREIGN KEY(`related_product_id`)
      REFERENCES `Products(id)`,
   FOREIGN KEY(`current_product_id`)
      REFERENCES `Products(id)`
)

COPY `(id, name, slogan, description, category, default_price)` FROM '/Users/admin/RFP-2207-Products-API/csv/product.csv' TO `Products (id, name, slogan, description, category, default_price)` (DELIMITER ',');

COPY `(id, product_id, feature, value)` FROM ' /Users/admin/RFP-2207-Products-API/csv/features.csv' TO `Features (feature_id, id, feature, value)` (DELIMITER ',');

COPY `(id, styleId, url, thumbnail_url)` FROM '/Users/admin/RFP-2207-Products-API/csv/photos.csv' TO `Photos (id, style_id, url, thumbnail_url)` (DELIMITER ',');

COPY `(id, styleId, style, quantity)` FROM '/Users/admin/RFP-2207-Products-API/csv/skus.csv' TO `Skus (id, style_id, size, quantity)` (DELIMITER ',');

COPY `(cart_id, user_session, product_id, active)` FROM '/Users/admin/RFP-2207-Products-API/csv/cart.csv' TO `Cart (cart_id, user_session, product_id, active)` (DELIMITER ',');

COPY `(id, current_product_id, related_product_id)` FROM '/Users/admin/RFP-2207-Products-API/csv/related.csv' TO `Related (id, current_product_id, related_product_id)` (DELIMITER ',');


