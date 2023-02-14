CREATE TABLE `users` (
	`user_id` int(11) NOT NULL AUTO_INCREMENT,
	`user_name` varchar(50) NOT NULL UNIQUE,
	`password` varchar(50) NOT NULL,
	`email` varchar(50) NOT NULL UNIQUE,
	`phone_number` int(50) UNIQUE,
	`address` varchar(255),
	`birth_date` DATE(255),
	`role_id` int(11) NOT NULL,
	`registered_date` TIMESTAMP NOT NULL,
	`last_logined_date` TIMESTAMP NOT NULL,
	`status` bit NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`user_id`)
);

CREATE TABLE `roles` (
	`role_id` int(11) NOT NULL AUTO_INCREMENT,
	`role_name` varchar(50) NOT NULL UNIQUE,
	`description` varchar(255) NOT NULL,
	`group_id` int NOT NULL,
	PRIMARY KEY (`role_id`)
);

CREATE TABLE `roles_to_permission` (
	`role_id` int(11) NOT NULL,
	`permission_id` int(11) NOT NULL,
	`role_permission_id` int(11) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`role_permission_id`)
);

CREATE TABLE `permission` (
	`permission_id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL UNIQUE,
	`description` varchar(255) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`permission_id`)
);

CREATE TABLE `group` (
	`group_id` bit(11) NOT NULL AUTO_INCREMENT,
	`group_name` varchar(255) NOT NULL,
	`description` TEXT NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`deleted_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`group_id`)
);

CREATE TABLE `group_position` (
	`user_id` int(11) NOT NULL,
	`group_id` int(11) NOT NULL,
	`group_position_id` int(11) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`group_id`,`group_position_id`)
);

CREATE TABLE `session` (
	`session_id` int(11) NOT NULL AUTO_INCREMENT,
	`user_id` int(11) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`session_id`)
);

CREATE TABLE `sages` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`seo_alias` varchar(255) NOT NULL,
	`title` varchar(255) NOT NULL,
	`content` TEXT(255) NOT NULL,
	`status` bit NOT NULL,
	`site_title` varchar(255) NOT NULL,
	`meta_key` varchar(255) NOT NULL,
	`meta_description` varchar(255) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`upadated_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `advertisement` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`title` TEXT NOT NULL,
	`position_id` varchar(255) NOT NULL,
	`page_id` int(11) NOT NULL,
	`image` varchar(255) NOT NULL,
	`width` int NOT NULL,
	`height` int NOT NULL,
	`click_count` int NOT NULL,
	`from_date` TIMESTAMP NOT NULL,
	`to_date` TIMESTAMP NOT NULL,
	`status` bit NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `advertisement_position` (
	`adv_position_id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`adv_position`)
);

CREATE TABLE `slides` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`slide_name` varchar(255) NOT NULL,
	`image` varchar(255) NOT NULL,
	`sort_order_id` int NOT NULL,
	`url` varchar(255) NOT NULL,
	`status` bit NOT NULL,
	`target` varchar(50) NOT NULL,
	`page_id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `catalog` (
	`id` int NOT NULL AUTO_INCREMENT,
	`catalog_name` varchar(255) NOT NULL,
	`meta_keyword` varchar(255) NOT NULL,
	`meta_description` varchar(255) NOT NULL,
	`parent_id` int NOT NULL,
	`sort_order` int NOT NULL,
	`visibility` bit NOT NULL,
	`seo_alias` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `banners` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`size` int(255) NOT NULL,
	`title` int(255) NOT NULL,
	`image_url` varchar(255) NOT NULL,
	`page_id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `product` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`type` varchar(255) NOT NULL,
	`description` varchar(255) NOT NULL,
	`content` TEXT NOT NULL,
	`quanity` int NOT NULL DEFAULT '0',
	`vat` bit NOT NULL DEFAULT '0',
	`price` DECIMAL NOT NULL DEFAULT '0',
	`promition_price` DECIMAL NOT NULL DEFAULT '0',
	`image` varchar(255) NOT NULL,
	`thumbnail_image` varchar(255) NOT NULL,
	`image_list` varchar NOT NULL,
	`meta_description` varchar NOT NULL,
	`meta_key` varchar(255) NOT NULL,
	`meta_description` varchar(255) NOT NULL,
	`warranty` int NOT NULL DEFAULT '0',
	`hot` DATETIME NOT NULL,
	`data_modified` DATETIME NOT NULL,
	`status` bit NOT NULL,
	`viewcount` int NOT NULL,
	`created_date` DATETIME NOT NULL,
	`cate_id` int(11) NOT NULL,
	`brand` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `product_category` (
	`cate_id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`seo_title` varchar(255) NOT NULL,
	`status` bit NOT NULL,
	`sort` int NOT NULL,
	`parent_id` int NOT NULL,
	`meta_keywords` varchar(255) NOT NULL,
	`meta_description` varchar(255) NOT NULL,
	`created_by` int NOT NULL,
	`created_date` TIMESTAMP NOT NULL,
	`updated_by` int NOT NULL,
	`updated_at` DATETIME NOT NULL,
	PRIMARY KEY (`cate_id`)
);

CREATE TABLE `product_comment` (
	`comment_id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`detail` varchar(255) NOT NULL,
	`status` bit NOT NULL,
	`product_id` int NOT NULL,
	`created_date` TIMESTAMP NOT NULL,
	`updated_by` int NOT NULL,
	PRIMARY KEY (`comment_id`)
);

CREATE TABLE `supplier` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`supplier_name` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`phone` varchar(255) NOT NULL,
	`address` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `invoice` (
	`invoice_id` int(11) NOT NULL AUTO_INCREMENT,
	`status` int NOT NULL,
	`supplier_id` int(11) NOT NULL,
	`created_by` int NOT NULL,
	`created_date` TIMESTAMP NOT NULL,
	`updated_date` TIMESTAMP NOT NULL,
	`updated_by` int NOT NULL,
	`deleted_by` int NOT NULL,
	`deleted_date` TIMESTAMP NOT NULL,
	PRIMARY KEY (`invoice_id`)
);

CREATE TABLE `invoice_detail` (
	`invoice_id` int(11) NOT NULL AUTO_INCREMENT,
	`product_id` int(11) NOT NULL AUTO_INCREMENT,
	`product_name` varchar(255) NOT NULL,
	`quantity` int NOT NULL,
	`price` DECIMAL NOT NULL,
	PRIMARY KEY (`invoice_id`,`product_id`)
);

CREATE TABLE `orders` (
	`order_id` int(11) NOT NULL AUTO_INCREMENT,
	`order_date` DATETIME NOT NULL,
	`status` int NOT NULL,
	`total_amount` DECIMAL NOT NULL DEFAULT '0',
	`customer_id` DECIMAL NOT NULL DEFAULT '0',
	PRIMARY KEY (`order_id`)
);

CREATE TABLE `order_detail` (
	`order_id` int(11) NOT NULL AUTO_INCREMENT,
	`product_id` int(11) NOT NULL AUTO_INCREMENT,
	`quantity` int NOT NULL DEFAULT '0',
	`product_name` varchar(255) NOT NULL,
	`price` DECIMAL NOT NULL DEFAULT '0',
	`quantity` int NOT NULL DEFAULT '0',
	`delivered_date` TIMESTAMP NOT NULL,
	`discount` int NOT NULL
);

CREATE TABLE `customer` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`first_name` varchar(255) NOT NULL,
	`last_name` varchar(255) NOT NULL,
	`email` varchar(100) NOT NULL UNIQUE,
	`address` varchar(100) NOT NULL,
	`city` varchar(50) NOT NULL,
	`zip` varchar(20) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`phone` varchar(50) NOT NULL,
	`role_id` int(50) NOT NULL,
	`country` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `contact` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`customer_ID` int(11) NOT NULL,
	`note` TEXT NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `payment_unit` (
	`unit_id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`description` TEXT NOT NULL,
	`fee` DECIMAL NOT NULL DEFAULT '0',
	PRIMARY KEY (`unit_id`)
);

CREATE TABLE `transaction` (
	`transaction_id` int(11) NOT NULL AUTO_INCREMENT,
	`unit_id` int(11) NOT NULL,
	`amount` int NOT NULL,
	`date_created` DATETIME NOT NULL,
	`status` bit NOT NULL,
	PRIMARY KEY (`transaction_ID`)
);

CREATE TABLE `payment_unit_detail` (
	`unit_id` int(11) NOT NULL,
	`detail_name` varchar(255) NOT NULL,
	`detail_value` DECIMAL NOT NULL DEFAULT '0'
);

CREATE TABLE `static_payment_unit` (
	`unit_id` int(11) NOT NULL,
	`transcation_id` int(11) NOT NULL,
	`description` TEXT NOT NULL,
	`amount` int NOT NULL
);

CREATE TABLE `package_service` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name_service` varchar(255) NOT NULL,
	`type` varchar NOT NULL,
	`num_of_use` int NOT NULL,
	`price` DECIMAL NOT NULL DEFAULT '0',
	`status` bit NOT NULL DEFAULT '0',
	`add_service_id` int NOT NULL,
	`updated_by` int NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`deleted_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `add_package_service` (
	`add_service_id` int(11) NOT NULL AUTO_INCREMENT,
	`type_service` varchar(255) NOT NULL,
	`name` varchar(255) NOT NULL,
	`group_service` varchar(255) NOT NULL,
	`num_of_use` int NOT NULL,
	`experied_date` DATETIME NOT NULL,
	`price` DECIMAL NOT NULL DEFAULT '0',
	`created_by` int NOT NULL,
	`created_date` TIMESTAMP NOT NULL,
	`updated_date` TIMESTAMP NOT NULL,
	`updated_by` int NOT NULL,
	PRIMARY KEY (`add_service_id`)
);

CREATE TABLE `edit_package_service` (
	`service_id` int(11) NOT NULL AUTO_INCREMENT,
	`add_service_id` int(11) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`service_id`,`add_service_id`)
);

CREATE TABLE `post_category` (
	`cate_id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`seo_title` varchar(255) NOT NULL,
	`sort` int NOT NULL,
	`parent_id` int NOT NULL,
	`meta_keywords` varchar(255) NOT NULL,
	`meta_description` varchar(255) NOT NULL,
	`created_by` int NOT NULL,
	`created_date` TIMESTAMP NOT NULL,
	`updated_by` int NOT NULL,
	`updated_date` TIMESTAMP NOT NULL,
	`thumbnail_image` varchar(255) NOT NULL,
	PRIMARY KEY (`cate_id`)
);

CREATE TABLE `posts` (
	`post_id` int(11) NOT NULL AUTO_INCREMENT,
	`title` varchar(255) NOT NULL,
	`description` TEXT NOT NULL,
	`content` TEXT NOT NULL,
	`thumbnail` varchar(255) NOT NULL,
	`created_date` TIMESTAMP NOT NULL,
	`published_date` TIMESTAMP NOT NULL,
	`cate_id` int NOT NULL,
	`status` bit NOT NULL,
	`seo_alias` varchar(255) NOT NULL,
	`seo_title` varchar(255) NOT NULL,
	`meta_keywords` varchar(255) NOT NULL,
	`hot_date` DATETIME NOT NULL,
	`new_date` DATETIME NOT NULL,
	`meta_description` varchar(255) NOT NULL,
	PRIMARY KEY (`post_id`)
);

CREATE TABLE `tags` (
	`tag_id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`tag_id`)
);

CREATE TABLE `post_in_tags` (
	`post_id` int(11) NOT NULL AUTO_INCREMENT,
	`tag_id` int(11) AUTO_INCREMENT,
	PRIMARY KEY (`post_id`)
);

CREATE TABLE `post_comment` (
	`comment_id` int(11) NOT NULL AUTO_INCREMENT,
	`detail` varchar(255) NOT NULL,
	`name` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`status` bit(255) NOT NULL,
	`post_id` int NOT NULL,
	`report` int NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`comment_id`)
);

CREATE TABLE `user_position` (
	`user_id` int(11) NOT NULL,
	`position_id` int(11) NOT NULL,
	PRIMARY KEY (`user_id`,`position_id`)
);

CREATE TABLE `positon` (
	`position_id` int(11) NOT NULL AUTO_INCREMENT,
	`position_name` varchar(255) NOT NULL UNIQUE,
	PRIMARY KEY (`position_id`)
);

CREATE TABLE `orders_product` (
	`order_id` int NOT NULL AUTO_INCREMENT,
	`product_id` int NOT NULL AUTO_INCREMENT,
	`quantity` int NOT NULL,
	PRIMARY KEY (`order_id`,`product_id`)
);

CREATE TABLE `block` (
	`block_id` int(11) NOT NULL AUTO_INCREMENT,
	`title` varchar(255) NOT NULL,
	`content` TEXT NOT NULL,
	`type` varchar(255) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`block_id`)
);

CREATE TABLE `page_block_map` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`page_id` int NOT NULL,
	`block_id` int NOT NULL,
	`block_order` int(11) NOT NULL,
	`status` bit NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `roles_to_users` (
	`user_id` int(11) NOT NULL,
	`role_id` int(11) NOT NULL
);

ALTER TABLE `users` ADD CONSTRAINT `ssers_fk0` FOREIGN KEY (`role_id`) REFERENCES `roles`(`role_id`);

ALTER TABLE `roles` ADD CONSTRAINT `roles_fk0` FOREIGN KEY (`group_id`) REFERENCES `group`(`group_id`);

ALTER TABLE `roles_to_permission` ADD CONSTRAINT `roles_to_permission_fk0` FOREIGN KEY (`role_id`) REFERENCES `roles`(`role_id`);

ALTER TABLE `roles_to_permission` ADD CONSTRAINT `roles_to_permission_fk1` FOREIGN KEY (`permission_id`) REFERENCES `permission`(`permission_id`);

ALTER TABLE `group_position` ADD CONSTRAINT `group_position_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`);

ALTER TABLE `group_position` ADD CONSTRAINT `group_position_fk1` FOREIGN KEY (`group_id`) REFERENCES `group`(`group_id`);

ALTER TABLE `session` ADD CONSTRAINT `session_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`);

ALTER TABLE `advertisement` ADD CONSTRAINT `advertisement_fk0` FOREIGN KEY (`position_id`) REFERENCES `advertisement_position`(`adv_position`);

ALTER TABLE `advertisement` ADD CONSTRAINT `advertisement_fk1` FOREIGN KEY (`page_id`) REFERENCES `pages`(`id`);

ALTER TABLE `slides` ADD CONSTRAINT `slides_fk0` FOREIGN KEY (`sort_order_id`) REFERENCES `catalog`(`sort_order`);

ALTER TABLE `slides` ADD CONSTRAINT `slides_fk1` FOREIGN KEY (`page_id`) REFERENCES `pages`(`id`);

ALTER TABLE `banners` ADD CONSTRAINT `banners_fk0` FOREIGN KEY (`page_id`) REFERENCES `pages`(`id`);

ALTER TABLE `product` ADD CONSTRAINT `product_fk0` FOREIGN KEY (`cate_id`) REFERENCES `product_category`(`cate_id`);

ALTER TABLE `product_comment` ADD CONSTRAINT `product_comment_fk0` FOREIGN KEY (`product_id`) REFERENCES `product`(`id`);

ALTER TABLE `invoice` ADD CONSTRAINT `invoice_fk0` FOREIGN KEY (`supplier_id`) REFERENCES `supplier`(`id`);

ALTER TABLE `invoice_detail` ADD CONSTRAINT `invoice_detail_fk0` FOREIGN KEY (`invoice_id`) REFERENCES `invoice`(`invoice_id`);

ALTER TABLE `invoice_detail` ADD CONSTRAINT `invoice_detail_fk1` FOREIGN KEY (`product_id`) REFERENCES `product`(`id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk0` FOREIGN KEY (`customer_id`) REFERENCES `customer`(`id`);

ALTER TABLE `order_detail` ADD CONSTRAINT `order_detail_fk0` FOREIGN KEY (`order_id`) REFERENCES `Orders`(`order_id`);

ALTER TABLE `order_detail` ADD CONSTRAINT `order_detail_fk1` FOREIGN KEY (`product_id`) REFERENCES `product`(`id`);

ALTER TABLE `customer` ADD CONSTRAINT `customer_fk0` FOREIGN KEY (`role_id`) REFERENCES `roles`(`role_id`);

ALTER TABLE `contact` ADD CONSTRAINT `contact_fk0` FOREIGN KEY (`customer_id`) REFERENCES `customer`(`id`);

ALTER TABLE `transaction` ADD CONSTRAINT `transaction_fk0` FOREIGN KEY (`unit_id`) REFERENCES `payment_unit`(`unit_id`);

ALTER TABLE `payment_unit_detail` ADD CONSTRAINT `payment_unit_detail_fk0` FOREIGN KEY (`unit_id`) REFERENCES `payment_unit`(`unit_id`);

ALTER TABLE `static_payment_unit` ADD CONSTRAINT `static_payment_unit_fk0` FOREIGN KEY (`unit_id`) REFERENCES `payment_unit`(`unit_id`);

ALTER TABLE `static_payment_unit` ADD CONSTRAINT `static_payment_unit_fk1` FOREIGN KEY (`transcation_id`) REFERENCES `transaction`(`transaction_id`);

ALTER TABLE `package_service` ADD CONSTRAINT `package_service_fk0` FOREIGN KEY (`add_service_id`) REFERENCES `add_package_service`(`add_service_id`);

ALTER TABLE `edit_package_service` ADD CONSTRAINT `edit_package_service_fk0` FOREIGN KEY (`service_id`) REFERENCES `package_service`(`id`);

ALTER TABLE `edit_package_service` ADD CONSTRAINT `edit_package_service_fk1` FOREIGN KEY (`add_service_id`) REFERENCES `add_package_service`(`add_service_id`);

ALTER TABLE `posts` ADD CONSTRAINT `posts_fk0` FOREIGN KEY (`cate_id`) REFERENCES `post_category`(`cate_id`);

ALTER TABLE `post_in_tags` ADD CONSTRAINT `post_in_tags_fk0` FOREIGN KEY (`post_id`) REFERENCES `posts`(`post_id`);

ALTER TABLE `post_in_tags` ADD CONSTRAINT `post_in_tags_fk1` FOREIGN KEY (`tag_id`) REFERENCES `tags`(`tag_id`);

ALTER TABLE `post_comment` ADD CONSTRAINT `post_comment_fk0` FOREIGN KEY (`post_id`) REFERENCES `posts`(`post_id`);

ALTER TABLE `user_position` ADD CONSTRAINT `user_position_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`);

ALTER TABLE `user_position` ADD CONSTRAINT `user_position_fk1` FOREIGN KEY (`position_id`) REFERENCES `positon`(`position_id`);

ALTER TABLE `orders_product` ADD CONSTRAINT `orders_product_fk0` FOREIGN KEY (`order_id`) REFERENCES `orders`(`order_id`);

ALTER TABLE `orders_product` ADD CONSTRAINT `orders_product_fk1` FOREIGN KEY (`product_id`) REFERENCES `product`(`id`);

ALTER TABLE `page_block_map` ADD CONSTRAINT `page_block_map_fk0` FOREIGN KEY (`page_id`) REFERENCES `pages`(`id`);

ALTER TABLE `page_block_map` ADD CONSTRAINT `page_block_map_fk1` FOREIGN KEY (`block_id`) REFERENCES `block`(`block_id`);

ALTER TABLE `roles_to_users` ADD CONSTRAINT `roles_to_users_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`);

ALTER TABLE `roles_to_users` ADD CONSTRAINT `roles_to_users_fk1` FOREIGN KEY (`role_id`) REFERENCES `roles`(`role_id`);










































