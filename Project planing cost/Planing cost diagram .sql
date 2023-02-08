CREATE TABLE `section` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `createSection` varchar(255),
  `updateSection` varchar(255),
  `deleteSection` varchar(255),
  `detailSection` text,
  `create_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `category` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `createCategory` varchar(255),
  `updateCategory` varchar(255),
  `deleteCategory` varchar(255),
  `detailCategory` text,
  `create_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `section_content` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `createSectionContent` varchar(255),
  `updateSectionContent` varchar(255),
  `deleteCategoryContent` varchar(255),
  `detailSectionContent` text,
  `create_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `content` (
  `id` int PRIMARY KEY AUTO_INCREMENT, 
  `name` varchar(255),
  `createContent` varchar(255),
  `updateContent` varchar(255),
  `deleteContent` varchar(255),
  `detailContent` text,
  `create_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `contact_customer` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `createContact` varchar(255),
  `updateContact` varchar(255),
  `deleteContact` varchar(255),
  `detailContact` text,
  `customerId` int,
  `create_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `customer` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `phoneNumber` varchar(255),
  `address` varchar(255),
  `registerCustomer` varchar(255),
  `infoCustomer` text,
  `gradeCustomer` int,
  `staticCustomer` varchar(255),
  `create_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `provider` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `phoneNumber` int,
  `address` varchar(255),
  `detailProvider` text,
  `activateProvider` enum,
  `staticProvider` varchar(255),
  `create_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `block_management` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `createContact` varchar(255),
  `updateContact` varchar(255),
  `deleteContact` varchar(255),
  `create_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `page` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `createPage` varchar(255),
  `updatePage` varchar(255),
  `deletePage` varchar(255),
  `manageBlock` varchar(255),
  `manageSlideBanner` varchar(255),
  `manageWebsite` varchar(255),
  `create_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `slide_banner` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `creatSlideBanner` varchar(255),
  `updateSlideBanner` varchar(255),
  `deleteSlideBanner` varchar(255),
  `create_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `webiste_management` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `updateWebsite` varchar(255),
  `create_at` timestamp,
  `updated_at` timestamp
);

ALTER TABLE `customer` ADD FOREIGN KEY (`id`) REFERENCES `contact_customer` (`customerId`);

ALTER TABLE `page` ADD FOREIGN KEY (`manageSlideBanner`) REFERENCES `website_management` (`id`);

ALTER TABLE `page` ADD FOREIGN KEY (`manageBlock`) REFERENCES `block_Management` (`id`);

ALTER TABLE `page` ADD FOREIGN KEY (`manageSlideBanner`) REFERENCES `slide_banner` (`id`);
