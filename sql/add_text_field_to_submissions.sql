ALTER TABLE `problem_assignment` CHANGE `submission` `submission_file` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL;
ALTER TABLE `problem_assignment` ADD `submission_text` TEXT NULL AFTER `submission_file`;
ALTER TABLE `theory_assignment` CHANGE `submission` `submission_file` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL;
ALTER TABLE `theory_assignment` ADD `submission_text` TEXT NULL AFTER `submission_file`;
