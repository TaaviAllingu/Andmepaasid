CREATE TABLE `group`(
    `teachers` VARCHAR(255) NOT NULL,
    `group` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`teachers`)
);
CREATE TABLE `comment`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `studentid` BIGINT NULL,
    `comment` VARCHAR(255) NOT NULL
);
CREATE TABLE `student`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `firstname` VARCHAR(255) NOT NULL,
    `lastname` VARCHAR(255) NOT NULL,
    `birthdate` VARCHAR(255) NOT NULL,
    `groupcode` VARCHAR(255) NOT NULL
);
CREATE TABLE `stgroup`(
    `code` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`code`)
);
CREATE TABLE `teacher`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `firstname` VARCHAR(255) NOT NULL,
    `lastname` VARCHAR(255) NOT NULL,
    `comments` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `teacher` ADD CONSTRAINT `teacher_comments_foreign` FOREIGN KEY(`comments`) REFERENCES `comment`(`comment`);
ALTER TABLE
    `group` ADD CONSTRAINT `group_group_foreign` FOREIGN KEY(`group`) REFERENCES `stgroup`(`code`);
ALTER TABLE
    `student` ADD CONSTRAINT `student_groupcode_foreign` FOREIGN KEY(`groupcode`) REFERENCES `stgroup`(`code`);
ALTER TABLE
    `group` ADD CONSTRAINT `group_teachers_foreign` FOREIGN KEY(`teachers`) REFERENCES `teacher`(`id`);
ALTER TABLE
    `comment` ADD CONSTRAINT `comment_studentid_foreign` FOREIGN KEY(`studentid`) REFERENCES `student`(`id`);