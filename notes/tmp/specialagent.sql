CREATE TABLE "auth_group" (
  "id" integer NOT NULL,
  "name" varchar(80) NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE ("name")
);

--
-- Dumping data for table "auth_group"
--

INSERT INTO auth_group VALUES (1,'basic_subscribers');

--
-- Table structure for table "auth_group_permissions"
--

CREATE TABLE "auth_group_permissions" (
  "id" integer NOT NULL,
  "group_id" integer NOT NULL,
  "permission_id" integer NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE ("group_id","permission_id")
);
CREATE INDEX permission_id_refs_id_a7792de1 ON auth_group_permissions ("permission_id");

--
-- Dumping data for table "auth_group_permissions"
--


--
-- Table structure for table "auth_message"
--

CREATE TABLE "auth_message" (
  "id" integer NOT NULL,
  "user_id" integer NOT NULL,
  "message" text NOT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX auth_message_fbfc09f1 ON auth_message ("user_id");

--
-- Dumping data for table "auth_message"
--


--
-- Table structure for table "auth_permission"
--

CREATE TABLE "auth_permission" (
  "id" integer NOT NULL,
  "name" varchar(50) NOT NULL,
  "content_type_id" integer NOT NULL,
  "codename" varchar(100) NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE ("content_type_id","codename")
);
CREATE INDEX auth_permission_e4470c6e ON auth_permission ("content_type_id");

--
-- Dumping data for table "auth_permission"
--

INSERT INTO auth_permission VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add log entry',8,'add_logentry'),(23,'Can change log entry',8,'change_logentry'),(24,'Can delete log entry',8,'delete_logentry'),(25,'Can add PayPal IPN',9,'add_paypalipn'),(26,'Can change PayPal IPN',9,'change_paypalipn'),(27,'Can delete PayPal IPN',9,'delete_paypalipn'),(28,'Can add user social auth',10,'add_usersocialauth'),(29,'Can change user social auth',10,'change_usersocialauth'),(30,'Can delete user social auth',10,'delete_usersocialauth'),(31,'Can add nonce',11,'add_nonce'),(32,'Can change nonce',11,'change_nonce'),(33,'Can delete nonce',11,'delete_nonce'),(34,'Can add association',12,'add_association'),(35,'Can change association',12,'change_association'),(36,'Can delete association',12,'delete_association'),(37,'Can add migration history',13,'add_migrationhistory'),(38,'Can change migration history',13,'change_migrationhistory'),(39,'Can delete migration history',13,'delete_migrationhistory'),(40,'Can add source',14,'add_source'),(41,'Can change source',14,'change_source'),(42,'Can delete source',14,'delete_source'),(43,'Can add thumbnail',15,'add_thumbnail'),(44,'Can change thumbnail',15,'change_thumbnail'),(45,'Can delete thumbnail',15,'delete_thumbnail'),(46,'Can add user profile',16,'add_userprofile'),(47,'Can change user profile',16,'change_userprofile'),(48,'Can delete user profile',16,'delete_userprofile'),(49,'Can add page',17,'add_page'),(50,'Can change page',17,'change_page'),(51,'Can delete page',17,'delete_page'),(52,'Can add invite request',18,'add_inviterequest'),(53,'Can change invite request',18,'change_inviterequest'),(54,'Can delete invite request',18,'delete_inviterequest');

--
-- Table structure for table "auth_user"
--

CREATE TABLE "auth_user" (
  "id" integer NOT NULL,
  "username" varchar(30) NOT NULL,
  "first_name" varchar(30) NOT NULL,
  "last_name" varchar(30) NOT NULL,
  "email" varchar(75) NOT NULL,
  "password" varchar(128) NOT NULL,
  "is_staff" smallint NOT NULL,
  "is_active" smallint NOT NULL,
  "is_superuser" smallint NOT NULL,
  "last_login" timestamp without time zone NOT NULL,
  "date_joined" timestamp without time zone NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE ("username")
);

--
-- Dumping data for table "auth_user"
--

INSERT INTO auth_user VALUES (1,'gmcclure','','','gmcclure@gmail.com','sha1$e1028$f97eb48b4e3e907f778c8e3b1be60ae9d7dc9d6b',1,1,1,'2011-07-20 16:01:21','2011-06-28 17:51:40'),(2,'gmccluree7b2f9e39a624b2a','','','gmcclure@gmail.com','!',0,1,0,'2012-01-25 23:22:01','2011-06-28 17:52:16'),(3,'','','','juan@thirdstone.net','abc123',0,1,0,'2011-07-09 14:38:20','2011-07-09 14:38:20'),(4,'bob@smith.com','','','bob@smith.com','sha1$6066c$11ade1aa9699b4a00cdc3c9a0235300b2d407055',0,1,0,'2011-07-09 17:02:10','2011-07-09 17:02:10'),(5,'boinky@shputz.com','','','boinky@shputz.com','sha1$6145a$d0dc9ec32e57d1d95992e31f778c74490e398c3d',0,1,0,'2011-07-09 17:04:03','2011-07-09 17:04:03'),(6,'stubby@floink.com','','','stubby@floink.com','sha1$e8595$515f648c7ec979a96e508d756cd327fc1e57fd47',0,1,0,'2011-07-09 17:11:22','2011-07-09 17:11:22'),(7,'spattermonkey@winkydoo.com','','','spattermonkey@winkydoo.com','sha1$3716b$e6812535cb9d3748d08724db75cb77adcdea35bd',0,1,0,'2011-07-09 17:14:30','2011-07-09 17:14:30'),(8,'fonk@bing.com','','','fonk@bing.com','sha1$945da$d914b26b3c23ec618afb4d35afe454009ef97a18',0,1,0,'2011-07-09 17:25:21','2011-07-09 17:25:21'),(9,'sho@dog.com','','','sho@dog.com','sha1$260ca$b02ca1d27170f3c6555136b1122e6fbd0c6166fb',0,1,0,'2011-07-09 17:25:51','2011-07-09 17:25:51'),(10,'ringding@boing.com','','','ringding@boing.com','sha1$15dfc$941191c54f6d93f9db4b5b47c0d7ca59804b1784',0,1,0,'2011-07-09 17:26:29','2011-07-09 17:26:29'),(11,'spoink@floo.com','','','spoink@floo.com','sha1$8824b$9e8ca74b8e63bdd20fa3326d6f22242450aae28e',0,1,0,'2011-07-09 17:37:44','2011-07-09 17:37:44'),(12,'flamjam@floo.com','','','flamjam@floo.com','sha1$6defa$9a6f9984edc12b77a35232b58084c0c616e67bd2',0,1,0,'2011-07-09 17:42:10','2011-07-09 17:42:10'),(13,'blobby@foy.com','','','blobby@foy.com','sha1$1f960$ee9010066f3f12c7f1eb7032ddff24d49eabe932',0,1,0,'2011-07-09 18:07:26','2011-07-09 18:07:26'),(14,'choy@bok.com','','','choy@bok.com','sha1$01152$e7b5c181aa74679dbf7a69ec57b836f8131707f8',0,1,0,'2011-07-09 18:08:49','2011-07-09 18:08:49'),(15,'sponge@square.com','','','sponge@square.com','sha1$e6cac$533b07aa3edb6cda98ff9e83ca64b2d3d0d0843f',0,1,0,'2011-07-09 18:09:18','2011-07-09 18:09:18'),(16,'winkydoo@flabbyboy.com','','','winkydoo@flabbyboy.com','sha1$cfe3e$742e6f282babe5dbc26740c901b0d4294135edeb',0,1,0,'2011-07-09 18:10:01','2011-07-09 18:10:01'),(17,'donut@mcclure.com','','','donut@mcclure.com','sha1$b73ce$54f7e19104d9285a73cfc1f16bdc1143313ca84b',0,1,0,'2011-07-09 20:22:43','2011-07-09 20:21:56'),(18,'bean@mcclure.com','','','bean@mcclure.com','sha1$96140$2314cc91cdc246868b39d8a3b26b99ecfa4e2bd3',0,1,0,'2011-07-09 20:33:07','2011-07-09 20:31:47'),(19,'gmcclure@thirdstone.net','','','gmcclure@thirdstone.net','sha1$1b668$4051eebd8b29e01a796e554242c25299cd49b20e',0,1,0,'2011-10-02 12:54:10','2011-08-07 22:48:01');

--
-- Table structure for table "auth_user_groups"
--

CREATE TABLE "auth_user_groups" (
  "id" integer NOT NULL,
  "user_id" integer NOT NULL,
  "group_id" integer NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE ("user_id","group_id")
);
CREATE INDEX group_id_refs_id_f0ee9890 ON auth_user_groups ("group_id");

--
-- Dumping data for table "auth_user_groups"
--


--
-- Table structure for table "auth_user_user_permissions"
--

CREATE TABLE "auth_user_user_permissions" (
  "id" integer NOT NULL,
  "user_id" integer NOT NULL,
  "permission_id" integer NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE ("user_id","permission_id")
);
CREATE INDEX permission_id_refs_id_67e79cb ON auth_user_user_permissions ("permission_id");

--
-- Dumping data for table "auth_user_user_permissions"
--


--
-- Table structure for table "django_admin_log"
--

CREATE TABLE "django_admin_log" (
  "id" integer NOT NULL,
  "action_time" timestamp without time zone NOT NULL,
  "user_id" integer NOT NULL,
  "content_type_id" integer DEFAULT NULL,
  "object_id" text,
  "object_repr" varchar(200) NOT NULL,
  "action_flag" smallint NOT NULL,
  "change_message" text NOT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX django_admin_log_fbfc09f1 ON django_admin_log ("user_id");
CREATE INDEX "django_admin_log_e4470c6e" ON django_admin_log ("content_type_id");

--
-- Dumping data for table "django_admin_log"
--


--
-- Table structure for table "django_content_type"
--

CREATE TABLE "django_content_type" (
  "id" integer NOT NULL,
  "name" varchar(100) NOT NULL,
  "app_label" varchar(100) NOT NULL,
  "model" varchar(100) NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE ("app_label","model")
);

--
-- Dumping data for table "django_content_type"
--

INSERT INTO django_content_type VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'site','sites','site'),(8,'log entry','admin','logentry'),(9,'PayPal IPN','ipn','paypalipn'),(10,'user social auth','social_auth','usersocialauth'),(11,'nonce','social_auth','nonce'),(12,'association','social_auth','association'),(13,'migration history','south','migrationhistory'),(14,'source','easy_thumbnails','source'),(15,'thumbnail','easy_thumbnails','thumbnail'),(16,'user profile','precis','userprofile'),(17,'page','precis','page'),(18,'invite request','privatebeta','inviterequest');

--
-- Table structure for table "django_session"
--

CREATE TABLE "django_session" (
  "session_key" varchar(40) NOT NULL,
  "session_data" text NOT NULL,
  "expire_date" timestamp without time zone NOT NULL,
  PRIMARY KEY ("session_key")
);
CREATE INDEX django_session_c25c2c28 ON django_session ("expire_date");

--
-- Dumping data for table "django_session"
--

INSERT INTO django_session VALUES ('04c6a9cdf9d2277c271dd80112119d49','ZjBkODlmYzU2ZGExZTNhYzA2Mjk1NzBjYTJjZTQ1OWY4Zjc0MmY4MTqAAn1xAShVI2dvb2dsZS1v\nYXV0aHVuYXV0aG9yaXplZF90b2tlbl9uYW1lVXZvYXV0aF90b2tlbl9zZWNyZXQ9VzRrSm1MLVBL\nSWJkb090UGlLRVBUTlF0Jm9hdXRoX3Rva2VuPTQlMkZQTElqZkI2YnBEdU94blBQU0pDX01QT0Ni\nLWlmJm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUu\nc29jaWFsX2F1dGguYmFja2VuZHMuZ29vZ2xlLkdvb2dsZU9BdXRoQmFja2VuZHEDVQ1fYXV0aF91\nc2VyX2lkcQSKAQJ1Lg==\n','2011-07-12 23:49:09'),('b0eb746546be82e56d9b4c983f15cda1','NmJiMDYzNTM5NDNiMzdkMzdhNGZkMmY2MjAwNjk1MGQ0YjMwZGIyZDqAAn1xAShVI2dvb2dsZS1v\nYXV0aHVuYXV0aG9yaXplZF90b2tlbl9uYW1lVXZvYXV0aF90b2tlbl9zZWNyZXQ9Z0p4c3NTWkpr\nNFYydTZoc1VVV1ZCaEgzJm9hdXRoX3Rva2VuPTQlMkZQaVRPbmhmVll6MXdOSFg2d0REUzhBaVRy\nVnU4Jm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlVQp0ZXN0Y29va2llVQZ3b3JrZWRVEl9h\ndXRoX3VzZXJfYmFja2VuZHECVS5zb2NpYWxfYXV0aC5iYWNrZW5kcy5nb29nbGUuR29vZ2xlT0F1\ndGhCYWNrZW5kcQNVDV9hdXRoX3VzZXJfaWRxBIoBAnUu\n','2011-07-24 21:44:03'),('59553b5898733c353cc3fa3003f40da9','M2Q5NTNhYzBkZWUwMDdmZDM3MzZkN2Y3OGY4NTA5NWNhZWIyMjk2ZTqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZHECVRJfYXV0aF91c2VyX2JhY2tlbmRVKWRqYW5nby5jb250cmliLmF1dGguYmFj\na2VuZHMuTW9kZWxCYWNrZW5kVQ1fYXV0aF91c2VyX2lkigEBdS4=\n','2011-08-03 16:28:16'),('734d4ecc3f3c0d8b4ab28e016b64b942','NWVhMzkxZmEyNTJiOGFmMWJkMzM0N2NlMzdmNzMxZDUzZGFhZjQ5ODqAAn1xAS4=\n','2011-08-02 17:46:49'),('233e1a8cd9158e0e5086895b0d86b65a','MDViZDU2YWM1YjM0YmUxZjU3ZGU5Yjg5MzcyYjUxN2E4N2YyZDNkODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2011-07-28 10:25:49'),('093a584f9908852b8164477fe2214f67','ZTU0NzQxNGJhYzNhNjQ0Y2NjN2M0ZDMyZDJlNjQ4MmY3ODQwNjYyNjqAAn1xAShVDV9hdXRoX3Vz\nZXJfaWRxAooBAlUec29jaWFsX2F1dGhfbGFzdF9sb2dpbl9iYWNrZW5kcQNYDAAAAGdvb2dsZS1v\nYXV0aHEEVQp0ZXN0Y29va2llVQZ3b3JrZWRVEl9hdXRoX3VzZXJfYmFja2VuZHEFVS5zb2NpYWxf\nYXV0aC5iYWNrZW5kcy5nb29nbGUuR29vZ2xlT0F1dGhCYWNrZW5kcQZVI2dvb2dsZS1vYXV0aHVu\nYXV0aG9yaXplZF90b2tlbl9uYW1lVXZvYXV0aF90b2tlbl9zZWNyZXQ9YmtDU1hHZVk2S0padU5W\nRUxxQzFRSWVVJm9hdXRoX3Rva2VuPTQlMkZwVU82TlBoU0FxSWp0bHUwUlZ5RGJmcFVOYTNzJm9h\ndXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVldS4=\n','2012-02-08 23:22:01'),('2a736d7fa1dfbfa2fc48b6ed50b3ba61','ZjI5N2Q2NmIwMzE4M2ZjYTdiMmM5MWM4ZWJhMDM5MWVkNGIyNWNmOTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKARN1Lg==\n','2011-08-22 22:44:05'),('c8d68cc91898b939f1b33c1cbb6a6831','NWVhMzkxZmEyNTJiOGFmMWJkMzM0N2NlMzdmNzMxZDUzZGFhZjQ5ODqAAn1xAS4=\n','2011-10-16 12:56:00'),('12e136cc0f194e5187ca0c7c32fdb37f','ZjI5N2Q2NmIwMzE4M2ZjYTdiMmM5MWM4ZWJhMDM5MWVkNGIyNWNmOTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKARN1Lg==\n','2011-08-22 22:32:40'),('7c7da80f24b6e74a582978bec3106e10','OTNiYTdhNWRiM2QyMWJjZWE0Zjk1MDAzNzEwZjQ0ZDM0ZTgxNTRlMTqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-08-28 00:10:33');

--
-- Table structure for table "django_site"
--

CREATE TABLE "django_site" (
  "id" integer NOT NULL,
  "domain" varchar(100) NOT NULL,
  "name" varchar(50) NOT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table "django_site"
--

INSERT INTO django_site VALUES (1,'example.com','example.com');

--
-- Table structure for table "easy_thumbnails_source"
--

CREATE TABLE "easy_thumbnails_source" (
  "id" integer NOT NULL,
  "storage_hash" varchar(40) NOT NULL,
  "name" varchar(255) NOT NULL,
  "modified" timestamp without time zone NOT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX easy_thumbnails_source_3a997c55 ON easy_thumbnails_source ("storage_hash");
CREATE INDEX "easy_thumbnails_source_52094d6e" ON easy_thumbnails_source ("name");

--
-- Dumping data for table "easy_thumbnails_source"
--

INSERT INTO easy_thumbnails_source VALUES (1,'76156c19336a8fd65e7cb37a1cc6345f','public/2/bgs/background.jpg','2011-06-28 23:14:28'),(2,'76156c19336a8fd65e7cb37a1cc6345f','public/1/bgs/background.jpg','2011-07-14 10:06:58');

--
-- Table structure for table "easy_thumbnails_thumbnail"
--

CREATE TABLE "easy_thumbnails_thumbnail" (
  "id" integer NOT NULL,
  "storage_hash" varchar(40) NOT NULL,
  "name" varchar(255) NOT NULL,
  "modified" timestamp without time zone NOT NULL,
  "source_id" integer NOT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX easy_thumbnails_thumbnail_3a997c55 ON easy_thumbnails_thumbnail ("storage_hash");
CREATE INDEX easy_thumbnails_thumbnail_52094d6e ON easy_thumbnails_thumbnail ("name");
CREATE INDEX easy_thumbnails_thumbnail_89f89e85 ON easy_thumbnails_thumbnail ("source_id");

--
-- Dumping data for table "easy_thumbnails_thumbnail"
--

INSERT INTO easy_thumbnails_thumbnail VALUES (1,'d26becbf46ac48eda79c7a39a13a02dd','public/2/bgs/background.jpg.120x90_q85.jpg','2011-06-28 23:14:29',1),(2,'d26becbf46ac48eda79c7a39a13a02dd','public/1/bgs/background.jpg.120x90_q85.jpg','2011-07-14 10:06:59',2);

--
-- Table structure for table "paypal_ipn"
--

CREATE TABLE "paypal_ipn" (
  "id" integer NOT NULL,
  "business" varchar(127) NOT NULL,
  "charset" varchar(32) NOT NULL,
  "custom" varchar(255) NOT NULL,
  "notify_version" decimal(64,2) DEFAULT NULL,
  "parent_txn_id" varchar(19) NOT NULL,
  "receiver_email" varchar(127) NOT NULL,
  "receiver_id" varchar(127) NOT NULL,
  "residence_country" varchar(2) NOT NULL,
  "test_ipn" smallint NOT NULL,
  "txn_id" varchar(19) NOT NULL,
  "txn_type" varchar(128) NOT NULL,
  "verify_sign" varchar(255) NOT NULL,
  "address_country" varchar(64) NOT NULL,
  "address_city" varchar(40) NOT NULL,
  "address_country_code" varchar(64) NOT NULL,
  "address_name" varchar(128) NOT NULL,
  "address_state" varchar(40) NOT NULL,
  "address_status" varchar(11) NOT NULL,
  "address_street" varchar(200) NOT NULL,
  "address_zip" varchar(20) NOT NULL,
  "contact_phone" varchar(20) NOT NULL,
  "first_name" varchar(64) NOT NULL,
  "last_name" varchar(64) NOT NULL,
  "payer_business_name" varchar(127) NOT NULL,
  "payer_email" varchar(127) NOT NULL,
  "payer_id" varchar(13) NOT NULL,
  "auth_amount" decimal(64,2) DEFAULT NULL,
  "auth_exp" varchar(28) NOT NULL,
  "auth_id" varchar(19) NOT NULL,
  "auth_status" varchar(9) NOT NULL,
  "exchange_rate" decimal(64,16) DEFAULT NULL,
  "invoice" varchar(127) NOT NULL,
  "item_name" varchar(127) NOT NULL,
  "item_number" varchar(127) NOT NULL,
  "mc_currency" varchar(32) NOT NULL,
  "mc_fee" decimal(64,2) DEFAULT NULL,
  "mc_gross" decimal(64,2) DEFAULT NULL,
  "mc_handling" decimal(64,2) DEFAULT NULL,
  "mc_shipping" decimal(64,2) DEFAULT NULL,
  "memo" varchar(255) NOT NULL,
  "num_cart_items" integer DEFAULT NULL,
  "option_name1" varchar(64) NOT NULL,
  "option_name2" varchar(64) NOT NULL,
  "payer_status" varchar(10) NOT NULL,
  "payment_date" timestamp without time zone DEFAULT NULL,
  "payment_gross" decimal(64,2) DEFAULT NULL,
  "payment_status" varchar(9) NOT NULL,
  "payment_type" varchar(7) NOT NULL,
  "pending_reason" varchar(14) NOT NULL,
  "protection_eligibility" varchar(32) NOT NULL,
  "quantity" integer DEFAULT NULL,
  "reason_code" varchar(15) NOT NULL,
  "remaining_settle" decimal(64,2) DEFAULT NULL,
  "settle_amount" decimal(64,2) DEFAULT NULL,
  "settle_currency" varchar(32) NOT NULL,
  "shipping" decimal(64,2) DEFAULT NULL,
  "shipping_method" varchar(255) NOT NULL,
  "tax" decimal(64,2) DEFAULT NULL,
  "transaction_entity" varchar(7) NOT NULL,
  "auction_buyer_id" varchar(64) NOT NULL,
  "auction_closing_date" timestamp without time zone DEFAULT NULL,
  "auction_multi_item" integer DEFAULT NULL,
  "for_auction" decimal(64,2) DEFAULT NULL,
  "amount" decimal(64,2) DEFAULT NULL,
  "amount_per_cycle" decimal(64,2) DEFAULT NULL,
  "initial_payment_amount" decimal(64,2) DEFAULT NULL,
  "next_payment_date" timestamp without time zone DEFAULT NULL,
  "outstanding_balance" decimal(64,2) DEFAULT NULL,
  "payment_cycle" varchar(32) NOT NULL,
  "period_type" varchar(32) NOT NULL,
  "product_name" varchar(128) NOT NULL,
  "product_type" varchar(128) NOT NULL,
  "profile_status" varchar(32) NOT NULL,
  "recurring_payment_id" varchar(128) NOT NULL,
  "rp_invoice_id" varchar(127) NOT NULL,
  "time_created" timestamp without time zone DEFAULT NULL,
  "amount1" decimal(64,2) DEFAULT NULL,
  "amount2" decimal(64,2) DEFAULT NULL,
  "amount3" decimal(64,2) DEFAULT NULL,
  "mc_amount1" decimal(64,2) DEFAULT NULL,
  "mc_amount2" decimal(64,2) DEFAULT NULL,
  "mc_amount3" decimal(64,2) DEFAULT NULL,
  "password" varchar(24) NOT NULL,
  "period1" varchar(32) NOT NULL,
  "period2" varchar(32) NOT NULL,
  "period3" varchar(32) NOT NULL,
  "reattempt" varchar(1) NOT NULL,
  "recur_times" integer DEFAULT NULL,
  "recurring" varchar(1) NOT NULL,
  "retry_at" timestamp without time zone DEFAULT NULL,
  "subscr_date" timestamp without time zone DEFAULT NULL,
  "subscr_effective" timestamp without time zone DEFAULT NULL,
  "subscr_id" varchar(19) NOT NULL,
  "username" varchar(64) NOT NULL,
  "case_creation_date" timestamp without time zone DEFAULT NULL,
  "case_id" varchar(14) NOT NULL,
  "case_type" varchar(24) NOT NULL,
  "receipt_id" varchar(64) NOT NULL,
  "currency_code" varchar(32) NOT NULL,
  "handling_amount" decimal(64,2) DEFAULT NULL,
  "transaction_subject" varchar(255) NOT NULL,
  "ipaddress" char(15) NOT NULL,
  "flag" smallint NOT NULL,
  "flag_code" varchar(16) NOT NULL,
  "flag_info" text NOT NULL,
  "query" text NOT NULL,
  "response" text NOT NULL,
  "created_at" timestamp without time zone NOT NULL,
  "updated_at" timestamp without time zone NOT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table "paypal_ipn"
--


--
-- Table structure for table "precis_page"
--

CREATE TABLE "precis_page" (
  "profile_id" integer NOT NULL,
  "bg_color" varchar(7) NOT NULL,
  "bg_image" varchar(200) NOT NULL DEFAULT '',
  "bg_disabled" smallint NOT NULL,
  "headline_text" varchar(100) NOT NULL,
  "headline_top" varchar(40) NOT NULL,
  "headline_left" varchar(40) NOT NULL,
  "headline_color" varchar(7) NOT NULL,
  "headline_pixel_size" varchar(3) NOT NULL,
  "headline_fontclass" varchar(200) NOT NULL,
  "story_text" text NOT NULL,
  "story_top" varchar(40) NOT NULL,
  "story_left" varchar(40) NOT NULL,
  "story_color" varchar(7) NOT NULL,
  "story_pixel_size" varchar(3) NOT NULL,
  "story_fontclass" varchar(200) NOT NULL,
  "status_text" varchar(100) NOT NULL,
  "status_top" varchar(40) NOT NULL,
  "status_left" varchar(40) NOT NULL,
  "status_color" varchar(7) NOT NULL,
  "status_pixel_size" varchar(3) NOT NULL,
  "status_fontclass" varchar(200) NOT NULL,
  "linkbox_top" varchar(40) NOT NULL,
  "linkbox_left" varchar(400) NOT NULL,
  "linkbox_enabled" smallint NOT NULL,
  "slug" varchar(100) NOT NULL,
  PRIMARY KEY ("profile_id")
);
CREATE INDEX precis_page_a951d5d6 ON precis_page ("slug");

--
-- Dumping data for table "precis_page"
--

INSERT INTO precis_page VALUES (1,'#fff','public/1/bgs/background.jpg',0,'Greg McClure, Real Estate God','35','17','#faf0f0','28','typeface-sfwondercomic','This is your story.\n\nWhich we''re very excited about.\n\nIn fact, we can''t wait to see what you''re going to put here ...\n\nIt''s going to be amazing.','152','17','#f2e4e4','26','typeface-soucisans','Hello America!','90','18','#f7aaaa','22','typeface-sfwondercomic','414','17',1,'gmcclure'),(2,'#776bff','public/2/bgs/background.jpg',0,'This is your headline.','19.6833343506','14','#ffffff','28','typeface-bebasneue','This is your story.\n\nThis is the thing ...\n','119','16','#38bce0','18','typeface-destroy','This is your status.','71','15','#ffffff','22','typeface-devroye','219.199996948','17',1,''),(3,'#fff','',0,'This is your headline.','45','18','#000','28','typeface-default','This is your story.','5','18','#000','18','typeface-default','This is your status.','90','18','#000','22','typeface-default','30','18',0,''),(4,'#fff','',0,'This is your headline.','45','18','#000','28','typeface-default','This is your story.','5','18','#000','18','typeface-default','This is your status.','90','18','#000','22','typeface-default','30','18',0,''),(5,'#fff','',0,'This is your headline.','45','18','#000','28','typeface-default','This is your story.','5','18','#000','18','typeface-default','This is your status.','90','18','#000','22','typeface-default','30','18',0,''),(6,'#fff','',0,'This is your headline.','45','18','#000','28','typeface-default','This is your story.','5','18','#000','18','typeface-default','This is your status.','90','18','#000','22','typeface-default','30','18',0,''),(7,'#fff','',0,'This is your headline.','45','18','#000','28','typeface-default','This is your story.','5','18','#000','18','typeface-default','This is your status.','90','18','#000','22','typeface-default','30','18',0,''),(8,'#fff','',0,'This is your headline.','45','18','#000','28','typeface-default','This is your story.','5','18','#000','18','typeface-default','This is your status.','90','18','#000','22','typeface-default','30','18',0,''),(9,'#fff','',0,'This is your headline.','45','18','#000','28','typeface-default','This is your story.','5','18','#000','18','typeface-default','This is your status.','90','18','#000','22','typeface-default','30','18',0,''),(10,'#fff','',0,'This is your headline.','45','18','#000','28','typeface-default','This is your story.','5','18','#000','18','typeface-default','This is your status.','90','18','#000','22','typeface-default','30','18',0,''),(11,'#fff','',0,'This is your headline.','45','18','#000','28','typeface-default','This is your story.','5','18','#000','18','typeface-default','This is your status.','90','18','#000','22','typeface-default','30','18',0,''),(12,'#fff','',0,'This is your headline.','45','18','#000','28','typeface-default','This is your story.','5','18','#000','18','typeface-default','This is your status.','90','18','#000','22','typeface-default','30','18',0,''),(13,'#fff','',0,'This is your headline.','45','18','#000','28','typeface-default','This is your story.','5','18','#000','18','typeface-default','This is your status.','90','18','#000','22','typeface-default','30','18',0,''),(14,'#fff','',0,'This is your headline.','45','18','#000','28','typeface-default','This is your story.','5','18','#000','18','typeface-default','This is your status.','90','18','#000','22','typeface-default','30','18',0,''),(15,'#fff','',0,'This is your headline.','45','18','#000','28','typeface-default','This is your story.','5','18','#000','18','typeface-default','This is your status.','90','18','#000','22','typeface-default','30','18',0,''),(16,'#fff','',0,'This is your headline.','45','18','#000','28','typeface-default','This is your story.','5','18','#000','18','typeface-default','This is your status.','90','18','#000','22','typeface-default','30','18',0,''),(17,'#fff','',0,'This is your headline.','45','18','#000','28','typeface-default','This is your story.','5','18','#000','18','typeface-default','This is your status.','90','18','#000','22','typeface-default','30','18',0,''),(18,'#fff','',0,'Bean McClure, Tiny Monster','45','18','#000','28','typeface-default','As a tiny dog, you might not think I could sell houses. But I can. Woof.','132','19','#000','18','typeface-default','I am a widget.','90','18','#000','22','typeface-default','262','14',1,''),(19,'#fff','',0,'This is your headline.','25','18','#000','28','typeface-default','This is your story.','105','18','#000','18','typeface-default','This is your status.','70','18','#000','22','typeface-default','30','18',0,'');

--
-- Table structure for table "precis_userprofile"
--

CREATE TABLE "precis_userprofile" (
  "id" integer NOT NULL,
  "user_id" integer NOT NULL,
  "first_name" varchar(100) NOT NULL,
  "last_name" varchar(100) NOT NULL,
  "is_subscriber" smallint NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE ("user_id")
);

--
-- Dumping data for table "precis_userprofile"
--

INSERT INTO precis_userprofile VALUES (1,1,'','',0),(2,2,'','',0),(3,3,'','',0),(4,4,'','',0),(5,5,'','',0),(6,6,'','',0),(7,7,'','',0),(8,8,'','',0),(9,9,'','',0),(10,10,'','',0),(11,11,'','',0),(12,12,'','',0),(13,13,'','',0),(14,14,'','',0),(15,15,'','',0),(16,16,'','',0),(17,17,'','',0),(18,18,'','',0),(19,19,'','',0);

--
-- Table structure for table "privatebeta_inviterequest"
--

CREATE TABLE "privatebeta_inviterequest" (
  "id" integer NOT NULL,
  "email" varchar(75) NOT NULL,
  "created" timestamp without time zone NOT NULL DEFAULT '2011-07-13 18:19:27',
  "invited" smallint NOT NULL DEFAULT '0',
  PRIMARY KEY ("id"),
  UNIQUE ("email")
);

--
-- Dumping data for table "privatebeta_inviterequest"
--

INSERT INTO privatebeta_inviterequest VALUES (1,'gmcclure@thirdstone.net','2011-07-13 20:03:15',0),(2,'shotzy@pigbutt.com','2011-07-13 20:36:15',0),(3,'flooby@smuk.com','2011-07-13 20:44:43',0),(4,'buttercup@flub.com','2011-07-13 20:47:29',0),(5,'ban@foo.com','2011-07-13 20:50:43',0),(6,'foo@buger.com','2011-07-13 21:10:50',0),(7,'spongebob@squarepants.com','2011-07-13 21:15:30',0),(8,'smuk@joker.com','2011-07-13 21:20:19',0),(9,'foo@job.com','2011-07-13 21:25:38',0),(10,'funkydoo@shmaltz.com','2011-07-13 21:30:07',0),(11,'foo@bar.com','2011-07-13 21:38:44',0),(12,'spankytherocket@boosh.com','2011-07-13 22:19:36',0),(13,'remembering@gmail.com','2011-07-13 22:27:53',0);

--
-- Table structure for table "social_auth_association"
--

CREATE TABLE "social_auth_association" (
  "id" integer NOT NULL,
  "server_url" varchar(255) NOT NULL,
  "handle" varchar(255) NOT NULL,
  "secret" varchar(255) NOT NULL,
  "issued" integer NOT NULL,
  "lifetime" integer NOT NULL,
  "assoc_type" varchar(64) NOT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table "social_auth_association"
--


--
-- Table structure for table "social_auth_nonce"
--

CREATE TABLE "social_auth_nonce" (
  "id" integer NOT NULL,
  "server_url" varchar(255) NOT NULL,
  "timestamp" integer NOT NULL,
  "salt" varchar(40) NOT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table "social_auth_nonce"
--


--
-- Table structure for table "social_auth_usersocialauth"
--

CREATE TABLE "social_auth_usersocialauth" (
  "id" integer NOT NULL,
  "user_id" integer NOT NULL,
  "provider" varchar(32) NOT NULL,
  "uid" varchar(255) NOT NULL,
  "extra_data" text NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE ("provider","uid")
);
CREATE INDEX social_auth_usersocialauth_fbfc09f1 ON social_auth_usersocialauth ("user_id");

--
-- Dumping data for table "social_auth_usersocialauth"
--

INSERT INTO social_auth_usersocialauth VALUES (1,2,'google-oauth','gmcclure@gmail.com','{\"access_token\": \"oauth_token_secret=A0NbNlkss7op-nYnONxB2NhA&oauth_token=1%2Fexk109Y-DDXfyRN5-BCo22NMgUeAVXvYuPuY8WV1qfw\"}');

--
-- Table structure for table "south_migrationhistory"
--

CREATE TABLE "south_migrationhistory" (
  "id" integer NOT NULL,
  "app_name" varchar(255) NOT NULL,
  "migration" varchar(255) NOT NULL,
  "applied" timestamp without time zone NOT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table "south_migrationhistory"
--

INSERT INTO south_migrationhistory VALUES (1,'precis','0001_initial','2011-07-01 19:55:05'),(2,'precis','0002_auto__add_field_page_linkbox_top__add_field_page_linkbox_left','2011-07-01 19:55:37'),(3,'precis','0003_auto__add_field_page_linkbox_enabled__chg_field_page_linkbox_left','2011-07-02 00:22:45'),(5,'precis','0004_auto__add_field_page_slug','2011-07-10 16:01:56'),(6,'privatebeta','0001_initial','2011-07-14 01:19:28'),(7,'privatebeta','0002_add_invited_field','2011-07-14 01:19:29');

