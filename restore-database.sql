CREATE DATABASE my_db;
USE my_db;
-- Import to Database

SHOW TABLES;

-- Verifique WP_ 
SELECT * FROM wp_options;

-- Remplace URL's
UPDATE wp_options SET option_value = replace(option_value, 'oldurl.com', 'newurl.com') WHERE option_name = 'home' OR option_name = 'siteurl';
UPDATE wp_posts SET guid = replace(guid, 'oldurl.com','newurl.com');UPDATE wp_posts SET post_content = replace(post_content, 'oldurl.com', 'newurl.com');
UPDATE wp_postmeta SET meta_value = replace(meta_value,'oldurl.com','newurl.com');

-- Create User Admin
INSERT INTO wp_users (user_login, user_pass, user_nicename, user_email, user_url, user_registered, user_activation_key, user_status, display_name)
VALUES ('admin', MD5('admin'), 'admin', 'admin@website.com', 'http://www.website.com/', '2023-02-02 00:00:00', '', '0', 'admin');

SELECT * FROM wp_users; -- Verifique the ID User

INSERT INTO wp_usermeta (umeta_id, user_id, meta_key, meta_value) VALUES (NULL, '2', 'wp_capabilities', 'a:1:{s:13:"administrator";s:1:"1";}');
INSERT INTO wp_usermeta (umeta_id, user_id, meta_key, meta_value) VALUES (NULL, '2', 'wp_user_level', '10');