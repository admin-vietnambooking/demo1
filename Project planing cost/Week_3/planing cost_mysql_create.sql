CREATE TABLE `Users` (
	`user_id` int(11) NOT NULL AUTO_INCREMENT,
	`user_name` varchar(50) NOT NULL UNIQUE,
	`password` varchar(50) NOT NULL,
	`email` varchar(50) NOT NULL UNIQUE,
	`phone_number` int(50) UNIQUE,
	`address` varchar(255),
	`birthdate` DATE(255),
	`role_id` int(11) NOT NULL,
	`registered_date` TIMESTAMP NOT NULL,
	`last_logined_date` TIMESTAMP NOT NULL,
	`status` bit NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`user_id`)
);

CREATE TABLE `Roles` (
	`role_id` int(11) NOT NULL AUTO_INCREMENT,
	`role_name` varchar(50) NOT NULL UNIQUE,
	`description` varchar(255) NOT NULL,
	`group_id` int NOT NULL,
	PRIMARY KEY (`role_id`)
);

CREATE TABLE `Roles_to_permission` (
	`role_id` int(11) NOT NULL,
	`permission_id` int(11) NOT NULL,
	`role_permission_id` int(11) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`role_permission_id`)
);

CREATE TABLE `Permission` (
	`permission_id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL UNIQUE,
	`description` varchar(255) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`permission_id`)
);

CREATE TABLE `Group` (
	`group_id` bit(11) NOT NULL AUTO_INCREMENT,
	`group_name` varchar(255) NOT NULL,
	`description` TEXT NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`deleted_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`group_id`)
);

CREATE TABLE `Group_position` (
	`user_id` int(11) NOT NULL,
	`group_id` int(11) NOT NULL,
	`group_position_id` int(11) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`group_id`,`group_position_id`)
);

CREATE TABLE `Session` (
	`session_id` int(11) NOT NULL AUTO_INCREMENT,
	`user_id` int(11) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`session_id`)
);

CREATE TABLE `Pages` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`seo_alias` varchar(255) NOT NULL,
	`title` varchar(255) NOT NULL,
	`content` TEXT(255) NOT NULL,
	`status` bit NOT NULL,
	`site_title` varchar(255) NOT NULL,
	`meta_key` varchar(255) NOT NULL,
	`meta_description` varchar(255) NOT NULL,
	`meta_description` varchar(255) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`upadated_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Advertisement` (
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

CREATE TABLE `Advertisement_position` (
	`adv_position` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`adv_position`)
);

CREATE TABLE `Slides` (
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

CREATE TABLE `Catalog` (
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

CREATE TABLE `Banners` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`size` int(255) NOT NULL,
	`title` int(255) NOT NULL,
	`image_url` varchar(255) NOT NULL,
	`page_id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Product` (
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

CREATE TABLE `Product_category` (
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

CREATE TABLE `Product_comment` (
	`comment_id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`detail` varchar(255) NOT NULL,
	`status` bit NOT NULL,
	`product_ID` int NOT NULL,
	`created_date` TIMESTAMP NOT NULL,
	`updated_by` int NOT NULL,
	PRIMARY KEY (`comment_id`)
);

CREATE TABLE `Supplier` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`supplier_name` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`phone` varchar(255) NOT NULL,
	`address` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Invoice` (
	`invoice_id` int(11) NOT NULL AUTO_INCREMENT,
	`status` int NOT NULL,
	`supplier_ID` int(11) NOT NULL,
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

CREATE TABLE `Orders` (
	`order_id` int(11) NOT NULL AUTO_INCREMENT,
	`order_date` DATETIME NOT NULL,
	`status` int NOT NULL,
	`total_amount` DECIMAL NOT NULL DEFAULT '0',
	`customer_id` DECIMAL NOT NULL DEFAULT '0',
	PRIMARY KEY (`order_id`)
);

CREATE TABLE `Order_detail` (
	`order_id` int(11) NOT NULL AUTO_INCREMENT,
	`product_id` int(11) NOT NULL AUTO_INCREMENT,
	`quantity` int NOT NULL DEFAULT '0',
	`product_name` varchar(255) NOT NULL,
	`price` DECIMAL NOT NULL DEFAULT '0',
	`quantity` int NOT NULL DEFAULT '0',
	`delivered_date` TIMESTAMP NOT NULL,
	`discount` int NOT NULL
);

CREATE TABLE `Customer` (
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

CREATE TABLE `Contact` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`customer_ID` int(11) NOT NULL,
	`note` TEXT NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Payment_unit` (
	`unit_id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`description` TEXT NOT NULL,
	`fee` DECIMAL NOT NULL DEFAULT '0',
	PRIMARY KEY (`unit_id`)
);

CREATE TABLE `Transaction` (
	`transaction_ID` int(11) NOT NULL AUTO_INCREMENT,
	`unit_id` int(11) NOT NULL,
	`amount` int NOT NULL,
	`date_created` DATETIME NOT NULL,
	`status` bit NOT NULL,
	PRIMARY KEY (`transaction_ID`)
);

CREATE TABLE `Payment_unit_detail` (
	`unit_id` int(11) NOT NULL,
	`detail_name` varchar(255) NOT NULL,
	`detail_value` DECIMAL NOT NULL DEFAULT '0'
);

CREATE TABLE `Static_payment_unit` (
	`unit_id` int(11) NOT NULL,
	`transcation_id` int(11) NOT NULL,
	`description` TEXT NOT NULL,
	`amount` int NOT NULL
);

CREATE TABLE `Package_service` (
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

CREATE TABLE `Add_package_service` (
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

CREATE TABLE `Edit_package_service` (
	`service_id` int(11) NOT NULL AUTO_INCREMENT,
	`add_service_id` int(11) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`service_id`,`add_service_id`)
);

CREATE TABLE `Post_category` (
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

CREATE TABLE `Posts` (
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

CREATE TABLE `Tags` (
	`tag_id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`tag_id`)
);

CREATE TABLE `Post_in_tags` (
	`post_id` int(11) NOT NULL AUTO_INCREMENT,
	`tag_id` int(11) AUTO_INCREMENT,
	PRIMARY KEY (`post_id`)
);

CREATE TABLE `Post_comment` (
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

CREATE TABLE `User_position` (
	`user_id` int(11) NOT NULL,
	`position_id` int(11) NOT NULL,
	PRIMARY KEY (`user_id`,`position_id`)
);

CREATE TABLE `Positon` (
	`position_id` int(11) NOT NULL AUTO_INCREMENT,
	`position_name` varchar(255) NOT NULL UNIQUE,
	PRIMARY KEY (`position_id`)
);

CREATE TABLE `Orders_product` (
	`order_id` int NOT NULL AUTO_INCREMENT,
	`product_id` int NOT NULL AUTO_INCREMENT,
	`quantity` int NOT NULL,
	PRIMARY KEY (`order_id`,`product_id`)
);

CREATE TABLE `Block` (
	`block_id` int(11) NOT NULL AUTO_INCREMENT,
	`title` varchar(255) NOT NULL,
	`content` TEXT NOT NULL,
	`type` varchar(255) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`block_id`)
);

CREATE TABLE `Page_block_map` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`page_id` int NOT NULL,
	`block_id` int NOT NULL,
	`block_order` int(11) NOT NULL,
	`status` bit NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Roles_to_users` (
	`user_id` int(11) NOT NULL,
	`role_id` int(11) NOT NULL
);

ALTER TABLE `Users` ADD CONSTRAINT `Users_fk0` FOREIGN KEY (`role_id`) REFERENCES `Roles`(`role_id`);

ALTER TABLE `Roles` ADD CONSTRAINT `Roles_fk0` FOREIGN KEY (`group_id`) REFERENCES `Group`(`group_id`);

ALTER TABLE `Roles_to_permission` ADD CONSTRAINT `Roles_to_permission_fk0` FOREIGN KEY (`role_id`) REFERENCES `Roles`(`role_id`);

ALTER TABLE `Roles_to_permission` ADD CONSTRAINT `Roles_to_permission_fk1` FOREIGN KEY (`permission_id`) REFERENCES `Permission`(`permission_id`);

ALTER TABLE `Group_position` ADD CONSTRAINT `Group_position_fk0` FOREIGN KEY (`user_id`) REFERENCES `Users`(`user_id`);

ALTER TABLE `Group_position` ADD CONSTRAINT `Group_position_fk1` FOREIGN KEY (`group_id`) REFERENCES `Group`(`group_id`);

ALTER TABLE `Session` ADD CONSTRAINT `Session_fk0` FOREIGN KEY (`user_id`) REFERENCES `Users`(`user_id`);

ALTER TABLE `Advertisement` ADD CONSTRAINT `Advertisement_fk0` FOREIGN KEY (`position_id`) REFERENCES `Advertisement_position`(`adv_position`);

ALTER TABLE `Advertisement` ADD CONSTRAINT `Advertisement_fk1` FOREIGN KEY (`page_id`) REFERENCES `Pages`(`id`);

ALTER TABLE `Slides` ADD CONSTRAINT `Slides_fk0` FOREIGN KEY (`sort_order_id`) REFERENCES `Catalog`(`sort_order`);

ALTER TABLE `Slides` ADD CONSTRAINT `Slides_fk1` FOREIGN KEY (`page_id`) REFERENCES `Pages`(`id`);

ALTER TABLE `Banners` ADD CONSTRAINT `Banners_fk0` FOREIGN KEY (`page_id`) REFERENCES `Pages`(`id`);

ALTER TABLE `Product` ADD CONSTRAINT `Product_fk0` FOREIGN KEY (`cate_id`) REFERENCES `Product_category`(`cate_id`);

ALTER TABLE `Product_comment` ADD CONSTRAINT `Product_comment_fk0` FOREIGN KEY (`product_ID`) REFERENCES `Product`(`id`);

ALTER TABLE `Invoice` ADD CONSTRAINT `Invoice_fk0` FOREIGN KEY (`supplier_ID`) REFERENCES `Supplier`(`id`);

ALTER TABLE `invoice_detail` ADD CONSTRAINT `invoice_detail_fk0` FOREIGN KEY (`invoice_id`) REFERENCES `Invoice`(`invoice_id`);

ALTER TABLE `invoice_detail` ADD CONSTRAINT `invoice_detail_fk1` FOREIGN KEY (`product_id`) REFERENCES `Product`(`id`);

ALTER TABLE `Orders` ADD CONSTRAINT `Orders_fk0` FOREIGN KEY (`customer_id`) REFERENCES `Customer`(`id`);

ALTER TABLE `Order_detail` ADD CONSTRAINT `Order_detail_fk0` FOREIGN KEY (`order_id`) REFERENCES `Orders`(`order_id`);

ALTER TABLE `Order_detail` ADD CONSTRAINT `Order_detail_fk1` FOREIGN KEY (`product_id`) REFERENCES `Product`(`id`);

ALTER TABLE `Customer` ADD CONSTRAINT `Customer_fk0` FOREIGN KEY (`role_id`) REFERENCES `Roles`(`role_id`);

ALTER TABLE `Contact` ADD CONSTRAINT `Contact_fk0` FOREIGN KEY (`customer_ID`) REFERENCES `Customer`(`id`);

ALTER TABLE `Transaction` ADD CONSTRAINT `Transaction_fk0` FOREIGN KEY (`unit_id`) REFERENCES `Payment_unit`(`unit_id`);

ALTER TABLE `Payment_unit_detail` ADD CONSTRAINT `Payment_unit_detail_fk0` FOREIGN KEY (`unit_id`) REFERENCES `Payment_unit`(`unit_id`);

ALTER TABLE `Static_payment_unit` ADD CONSTRAINT `Static_payment_unit_fk0` FOREIGN KEY (`unit_id`) REFERENCES `Payment_unit`(`unit_id`);

ALTER TABLE `Static_payment_unit` ADD CONSTRAINT `Static_payment_unit_fk1` FOREIGN KEY (`transcation_id`) REFERENCES `Transaction`(`transaction_ID`);

ALTER TABLE `Package_service` ADD CONSTRAINT `Package_service_fk0` FOREIGN KEY (`add_service_id`) REFERENCES `Add_package_service`(`add_service_id`);

ALTER TABLE `Edit_package_service` ADD CONSTRAINT `Edit_package_service_fk0` FOREIGN KEY (`service_id`) REFERENCES `Package_service`(`id`);

ALTER TABLE `Edit_package_service` ADD CONSTRAINT `Edit_package_service_fk1` FOREIGN KEY (`add_service_id`) REFERENCES `Add_package_service`(`add_service_id`);

ALTER TABLE `Posts` ADD CONSTRAINT `Posts_fk0` FOREIGN KEY (`cate_id`) REFERENCES `Post_category`(`cate_id`);

ALTER TABLE `Post_in_tags` ADD CONSTRAINT `Post_in_tags_fk0` FOREIGN KEY (`post_id`) REFERENCES `Posts`(`post_id`);

ALTER TABLE `Post_in_tags` ADD CONSTRAINT `Post_in_tags_fk1` FOREIGN KEY (`tag_id`) REFERENCES `Tags`(`tag_id`);

ALTER TABLE `Post_comment` ADD CONSTRAINT `Post_comment_fk0` FOREIGN KEY (`post_id`) REFERENCES `Posts`(`post_id`);

ALTER TABLE `User_position` ADD CONSTRAINT `User_position_fk0` FOREIGN KEY (`user_id`) REFERENCES `Users`(`user_id`);

ALTER TABLE `User_position` ADD CONSTRAINT `User_position_fk1` FOREIGN KEY (`position_id`) REFERENCES `Positon`(`position_id`);

ALTER TABLE `Orders_product` ADD CONSTRAINT `Orders_product_fk0` FOREIGN KEY (`order_id`) REFERENCES `Orders`(`order_id`);

ALTER TABLE `Orders_product` ADD CONSTRAINT `Orders_product_fk1` FOREIGN KEY (`product_id`) REFERENCES `Product`(`id`);

ALTER TABLE `Page_block_map` ADD CONSTRAINT `Page_block_map_fk0` FOREIGN KEY (`page_id`) REFERENCES `Pages`(`id`);

ALTER TABLE `Page_block_map` ADD CONSTRAINT `Page_block_map_fk1` FOREIGN KEY (`block_id`) REFERENCES `Block`(`block_id`);

ALTER TABLE `Roles_to_users` ADD CONSTRAINT `Roles_to_users_fk0` FOREIGN KEY (`user_id`) REFERENCES `Users`(`user_id`);

ALTER TABLE `Roles_to_users` ADD CONSTRAINT `Roles_to_users_fk1` FOREIGN KEY (`role_id`) REFERENCES `Roles`(`role_id`);










































