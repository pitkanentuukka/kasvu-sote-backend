ALTER TABLE `theory` ADD `file` TEXT NULL AFTER `criteria_Id`;
ALTER TABLE `theory` CHANGE `text` `text` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL;
ALTER TABLE `problem` ADD `file` TEXT NULL AFTER `criteria_Id`;
ALTER TABLE `problem` CHANGE `text` `text` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL;
