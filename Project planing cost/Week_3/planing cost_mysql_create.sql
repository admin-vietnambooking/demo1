CREATE TABLE `Users` (
	`user_id` int NOT NULL AUTO_INCREMENT,
	`user_name` varchar(50) NOT NULL UNIQUE,
	`password` varchar(50) NOT NULL,
	`email` varchar(50) NOT NULL UNIQUE,
	`phone_number` int(50) UNIQUE,
	`address` varchar(255),
	`birthdate` DATE(255),
	`role_Id` int(11) NOT NULL,
	`permison_Id` int(11) NOT NULL,
	`registered_date` DATETIME NOT NULL,
	`lastlogin_date` DATETIME NOT NULL,
	`status` bit NOT NULL,
	`created_at` DATETIME NOT NULL,
	`updated_at` DATETIME NOT NULL,
	PRIMARY KEY (`user_id`)
);

CREATE TABLE `Roles` (
	`role_id` int(11) NOT NULL AUTO_INCREMENT,
	`role_name` varchar(50) NOT NULL,
	`description` varchar(255) NOT NULL,
	`group_id` int NOT NULL,
	PRIMARY KEY (`role_id`)
);

CREATE TABLE `Role_Permission` (
	`role_id` int NOT NULL,
	`permission_id` int NOT NULL,
	PRIMARY KEY (`role_id`,`permission_id`)
);

CREATE TABLE `Permission` (
	`permission_id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`description` varchar(255) NOT NULL,
	PRIMARY KEY (`permission_id`)
);

CREATE TABLE `Group` (
	`group_id` bit NOT NULL AUTO_INCREMENT,
	`group_name` varchar(255) NOT NULL,
	`description` TEXT NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`deleted_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`group_id`)
);

CREATE TABLE `Group_position` (
	`user_id` int NOT NULL AUTO_INCREMENT,
	`group_id` int NOT NULL,
	PRIMARY KEY (`user_id`,`group_id`)
);

CREATE TABLE `Session` (
	`session_id` int NOT NULL AUTO_INCREMENT,
	`user_id` int NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`session_id`)
);

CREATE TABLE `Pages` (
	`id` int NOT NULL AUTO_INCREMENT,
	`seo_alias` varchar(255) NOT NULL,
	`title` varchar(255) NOT NULL,
	`content` TEXT(255) NOT NULL,
	`status` bit NOT NULL,
	`site_title` varchar(255) NOT NULL,
	`meta_key` varchar(255) NOT NULL,
	`meta_description` varchar(255) NOT NULL,
	`meta_description` varchar(255) NOT NULL,
	`created_at` DATETIME NOT NULL,
	`upadated_at` DATETIME NOT NULL,
	`slideID` DATETIME NOT NULL,
	`bannerID` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Advertisement` (
	`id` int NOT NULL AUTO_INCREMENT,
	`title` TEXT NOT NULL,
	`positionID` varchar(255) NOT NULL,
	`pageID` int(11) NOT NULL,
	`image` varchar(255) NOT NULL,
	`width` int NOT NULL,
	`height` int NOT NULL,
	`click_count` int NOT NULL,
	`from_date` DATETIME NOT NULL,
	`to_date` DATETIME NOT NULL,
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
	`sort_orderID` int NOT NULL,
	`url` varchar(255) NOT NULL,
	`status` bit NOT NULL,
	`target` varchar(50) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Catalog` (
	`id` int NOT NULL AUTO_INCREMENT,
	`catalog_name` varchar(255) NOT NULL,
	`meta_keyword` varchar(255) NOT NULL,
	`meta_description` varchar(255) NOT NULL,
	`parentID` int NOT NULL,
	`sort_order` int NOT NULL,
	`visibility` bit NOT NULL,
	`seo_alias` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Banners` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`size` int(255) NOT NULL,
	`size` int(255) NOT NULL,
	`image_url` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Product` (
	`id` int NOT NULL AUTO_INCREMENT,
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
	`cate_ID` DATETIME NOT NULL,
	`brand` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Product_category` (
	`cate_ID` bit NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`seo_title` varchar(255) NOT NULL,
	`status` bit NOT NULL,
	`sort` int NOT NULL,
	`parentID` int NOT NULL,
	`meta_keywords` varchar(255) NOT NULL,
	`meta_description` varchar(255) NOT NULL,
	`created_by` int NOT NULL,
	`created_date` TIMESTAMP NOT NULL,
	`updated_by` int NOT NULL,
	`updated_at` DATETIME NOT NULL,
	PRIMARY KEY (`cate_ID`)
);

CREATE TABLE `Product_comment` (
	`comment_ID` int NOT NULL,
	`name` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`detail` varchar(255) NOT NULL,
	`status` bit NOT NULL,
	`product_ID` int NOT NULL,
	`created_date` DATETIME NOT NULL,
	`updated_by` int NOT NULL
);

CREATE TABLE `Supplier` (
	`id` int NOT NULL AUTO_INCREMENT,
	`supplier_name` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`phone` varchar(255) NOT NULL,
	`address` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Invoice` (
	`invoice_id` int NOT NULL AUTO_INCREMENT,
	`status` int NOT NULL,
	`supplier_ID` int NOT NULL,
	`created_by` int NOT NULL,
	`created_date` DATETIME NOT NULL,
	`updated_date` DATETIME NOT NULL,
	`updated_by` int NOT NULL,
	`deleted_by` int NOT NULL,
	`deleted_date` DATETIME NOT NULL,
	PRIMARY KEY (`invoice_id`)
);

CREATE TABLE `invoice_detail` (
	`invoice_ID` int NOT NULL AUTO_INCREMENT,
	`product_ID` int NOT NULL AUTO_INCREMENT,
	`product_name` varchar(255) NOT NULL,
	`quantity` int NOT NULL,
	`price` DECIMAL NOT NULL,
	PRIMARY KEY (`invoice_ID`,`product_ID`)
);

CREATE TABLE `Orders` (
	`order_ID` int NOT NULL AUTO_INCREMENT,
	`order_date` DATETIME NOT NULL,
	`customer_ID` int NOT NULL,
	`status` int NOT NULL,
	PRIMARY KEY (`order_ID`)
);

CREATE TABLE `Order_detail` (
	`order_ID` int NOT NULL AUTO_INCREMENT,
	`product_ID` int NOT NULL AUTO_INCREMENT,
	`quantity` int NOT NULL DEFAULT '0',
	`product_name` varchar(255) NOT NULL,
	`price` DECIMAL NOT NULL DEFAULT '0',
	`quantity` int NOT NULL DEFAULT '0',
	`delivered_date` DATETIME NOT NULL,
	`discount` int NOT NULL
);

CREATE TABLE `Customer` (
	`id` int NOT NULL AUTO_INCREMENT,
	`first_name` varchar(255) NOT NULL,
	`last_name` varchar(255) NOT NULL,
	`email` varchar(100) NOT NULL,
	`address` varchar(100) NOT NULL,
	`city` varchar(50) NOT NULL,
	`zip` varchar(20) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`phone` varchar(50) NOT NULL,
	`user_ID` int(50) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Contact` (
	`id` int NOT NULL AUTO_INCREMENT,
	`customer_ID` int NOT NULL,
	`note` TEXT NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Payment_unit` (
	`unit_ID` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`description` TEXT NOT NULL,
	`fee` DECIMAL NOT NULL DEFAULT '0',
	PRIMARY KEY (`unit_ID`)
);

CREATE TABLE `Transaction` (
	`transaction_ID` int NOT NULL AUTO_INCREMENT,
	`unit_ID` int NOT NULL,
	`amount` int NOT NULL,
	`date_created` DATETIME NOT NULL,
	`status` bit NOT NULL,
	PRIMARY KEY (`transaction_ID`)
);

CREATE TABLE `Payment_unit_detail` (
	`unit_ID` int NOT NULL,
	`detail_name` varchar(255) NOT NULL,
	`detail_value` DECIMAL NOT NULL DEFAULT '0'
);

CREATE TABLE `Static_payment_unit` (
	`unit_ID` int NOT NULL,
	`transcation_ID` int NOT NULL,
	`description` TEXT NOT NULL,
	`amount` int NOT NULL
);

CREATE TABLE `Package_service` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name_service` varchar(255) NOT NULL,
	`type` varchar NOT NULL,
	`num_of_use` int NOT NULL,
	`price` DECIMAL NOT NULL DEFAULT '0',
	`status` bit NOT NULL DEFAULT '0',
	`add_serviceID` int NOT NULL DEFAULT '0',
	`updated_by` int NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`deleted_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Add_package_service` (
	`add_service_ID` int NOT NULL AUTO_INCREMENT,
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
	PRIMARY KEY (`add_service_ID`)
);

CREATE TABLE `Edit_package_service` (
	`service_ID` int NOT NULL AUTO_INCREMENT,
	`add_serviceID` int NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`service_ID`,`add_serviceID`)
);

CREATE TABLE `Post_category` (
	`cate_id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`seo_title` varchar(255) NOT NULL,
	`sort` int NOT NULL,
	`parentID` int NOT NULL,
	`meta_keywords` varchar(255) NOT NULL,
	`meta_description` varchar(255) NOT NULL,
	`created_by` int NOT NULL,
	`created_date` DATETIME NOT NULL,
	`updated_by` int NOT NULL,
	`updated_date` DATETIME NOT NULL,
	`thumbnail_image` varchar(255) NOT NULL,
	PRIMARY KEY (`cate_id`)
);

CREATE TABLE `Posts` (
	`post_id` int NOT NULL AUTO_INCREMENT,
	`title` varchar(255) NOT NULL,
	`description` TEXT NOT NULL,
	`content` TEXT NOT NULL,
	`thumbnail` varchar(255) NOT NULL,
	`created_date` DATETIME NOT NULL,
	`published_date` DATETIME NOT NULL,
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
	`tag_id` varchar(255) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`tag_id`)
);

CREATE TABLE `Post_in_tags` (
	`post_id` int NOT NULL AUTO_INCREMENT,
	`tag_id` int AUTO_INCREMENT,
	PRIMARY KEY (`post_id`)
);

CREATE TABLE `Post_comment` (
	`comment_ID` int NOT NULL AUTO_INCREMENT,
	`detail` varchar(255) NOT NULL,
	`name` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`status` bit(255) NOT NULL,
	`post_ID` int NOT NULL,
	`report` int NOT NULL,
	`created_at` DATETIME NOT NULL,
	PRIMARY KEY (`comment_ID`)
);

ALTER TABLE `Users` ADD CONSTRAINT `Users_fk0` FOREIGN KEY (`role_Id`) REFERENCES `Roles`(`role_id`);

ALTER TABLE `Users` ADD CONSTRAINT `Users_fk1` FOREIGN KEY (`permison_Id`) REFERENCES `Permission`(`permission_id`);

ALTER TABLE `Roles` ADD CONSTRAINT `Roles_fk0` FOREIGN KEY (`group_id`) REFERENCES `Group`(`group_id`);

ALTER TABLE `Role_Permission` ADD CONSTRAINT `Role_Permission_fk0` FOREIGN KEY (`role_id`) REFERENCES `Roles`(`role_id`);

ALTER TABLE `Role_Permission` ADD CONSTRAINT `Role_Permission_fk1` FOREIGN KEY (`permission_id`) REFERENCES `Permission`(`permission_id`);

ALTER TABLE `Group_position` ADD CONSTRAINT `Group_position_fk0` FOREIGN KEY (`user_id`) REFERENCES `Users`(`user_id`);

ALTER TABLE `Group_position` ADD CONSTRAINT `Group_position_fk1` FOREIGN KEY (`group_id`) REFERENCES `Group`(`group_id`);

ALTER TABLE `Session` ADD CONSTRAINT `Session_fk0` FOREIGN KEY (`user_id`) REFERENCES `Users`(`user_id`);

ALTER TABLE `Pages` ADD CONSTRAINT `Pages_fk0` FOREIGN KEY (`slideID`) REFERENCES `Slides`(`id`);

ALTER TABLE `Pages` ADD CONSTRAINT `Pages_fk1` FOREIGN KEY (`bannerID`) REFERENCES `Banners`(`id`);

ALTER TABLE `Advertisement` ADD CONSTRAINT `Advertisement_fk0` FOREIGN KEY (`positionID`) REFERENCES `Advertisement_position`(`adv_position`);

ALTER TABLE `Advertisement` ADD CONSTRAINT `Advertisement_fk1` FOREIGN KEY (`pageID`) REFERENCES `Pages`(`id`);

ALTER TABLE `Slides` ADD CONSTRAINT `Slides_fk0` FOREIGN KEY (`sort_orderID`) REFERENCES `Catalog`(`sort_order`);

ALTER TABLE `Product` ADD CONSTRAINT `Product_fk0` FOREIGN KEY (`cate_ID`) REFERENCES `Product_category`(`cate_ID`);

ALTER TABLE `Product_comment` ADD CONSTRAINT `Product_comment_fk0` FOREIGN KEY (`product_ID`) REFERENCES `Product`(`id`);

ALTER TABLE `Invoice` ADD CONSTRAINT `Invoice_fk0` FOREIGN KEY (`supplier_ID`) REFERENCES `Supplier`(`id`);

ALTER TABLE `invoice_detail` ADD CONSTRAINT `invoice_detail_fk0` FOREIGN KEY (`invoice_ID`) REFERENCES `Invoice`(`invoice_id`);

ALTER TABLE `invoice_detail` ADD CONSTRAINT `invoice_detail_fk1` FOREIGN KEY (`product_ID`) REFERENCES `Product`(`id`);

ALTER TABLE `Orders` ADD CONSTRAINT `Orders_fk0` FOREIGN KEY (`customer_ID`) REFERENCES `Customer`(`id`);

ALTER TABLE `Order_detail` ADD CONSTRAINT `Order_detail_fk0` FOREIGN KEY (`order_ID`) REFERENCES `Orders`(`order_ID`);

ALTER TABLE `Order_detail` ADD CONSTRAINT `Order_detail_fk1` FOREIGN KEY (`product_ID`) REFERENCES `Product`(`id`);

ALTER TABLE `Customer` ADD CONSTRAINT `Customer_fk0` FOREIGN KEY (`user_ID`) REFERENCES `Users`(`user_id`);

ALTER TABLE `Contact` ADD CONSTRAINT `Contact_fk0` FOREIGN KEY (`customer_ID`) REFERENCES `Customer`(`id`);

ALTER TABLE `Transaction` ADD CONSTRAINT `Transaction_fk0` FOREIGN KEY (`unit_ID`) REFERENCES `Payment_unit`(`unit_ID`);

ALTER TABLE `Payment_unit_detail` ADD CONSTRAINT `Payment_unit_detail_fk0` FOREIGN KEY (`unit_ID`) REFERENCES `Payment_unit`(`unit_ID`);

ALTER TABLE `Static_payment_unit` ADD CONSTRAINT `Static_payment_unit_fk0` FOREIGN KEY (`unit_ID`) REFERENCES `Payment_unit`(`unit_ID`);

ALTER TABLE `Static_payment_unit` ADD CONSTRAINT `Static_payment_unit_fk1` FOREIGN KEY (`transcation_ID`) REFERENCES `Transaction`(`transaction_ID`);

ALTER TABLE `Package_service` ADD CONSTRAINT `Package_service_fk0` FOREIGN KEY (`add_serviceID`) REFERENCES `Add_package_service`(`add_service_ID`);

ALTER TABLE `Edit_package_service` ADD CONSTRAINT `Edit_package_service_fk0` FOREIGN KEY (`service_ID`) REFERENCES `Package_service`(`id`);

ALTER TABLE `Edit_package_service` ADD CONSTRAINT `Edit_package_service_fk1` FOREIGN KEY (`add_serviceID`) REFERENCES `Add_package_service`(`add_service_ID`);

ALTER TABLE `Posts` ADD CONSTRAINT `Posts_fk0` FOREIGN KEY (`cate_id`) REFERENCES `Post_category`(`cate_id`);

ALTER TABLE `Post_in_tags` ADD CONSTRAINT `Post_in_tags_fk0` FOREIGN KEY (`post_id`) REFERENCES `Posts`(`post_id`);

ALTER TABLE `Post_in_tags` ADD CONSTRAINT `Post_in_tags_fk1` FOREIGN KEY (`tag_id`) REFERENCES `Tags`(`tag_id`);

ALTER TABLE `Post_comment` ADD CONSTRAINT `Post_comment_fk0` FOREIGN KEY (`post_ID`) REFERENCES `Posts`(`post_id`);




































