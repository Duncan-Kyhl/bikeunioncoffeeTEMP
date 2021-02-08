CREATE TABLE IF NOT EXISTS `executive` (
  executive_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  position VARCHAR(50) NOT NULL, 
  description TEXT NOT NULL,
  hire_date DATE NOT NULL,
  compensation DOUBLE(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS `member` (
  member_id		INTEGER	NOT NULL PRIMARY KEY AUTO_INCREMENT,
  first_name	VARCHAR(50)	NOT NULL, 
  last_name		VARCHAR(50)	NOT NULL, 
  email			VARCHAR(50)	NOT NULL, 
  phone			VARCHAR(11)	NOT NULL, 
  linkedin		VARCHAR(250) NULL,
  age			VARCHAR(3) NOT NULL,
  gender			CHAR(1)	NOT NULL, 
  race				VARCHAR(50) NOT NULL, 
  date_joined		DATE NOT NULL, 
  education			VARCHAR(200)NOT NULL, 
  program_level		INTEGER	NOT NULL, 
  wage				FLOAT NOT NULL, 
  date_of_birth		DATE NOT NULL, 
  ethnicity			VARCHAR(200) NOT NULL,
  juvenile_justice_system	CHAR NOT NULL, 
  previous_employement		CHAR(1) NOT NULL,
  single_parent_home		CHAR(1)	NOT NULL, 
  incarcerated_family		CHAR(1)	NOT NULL, 
  homeless					CHAR(1)	NOT NULL, 
  family_substance_abuse	CHAR(1) NOT NULL, 
  disability			CHAR(1) NOT NULL, 
  special_education		CHAR(1) NOT NULL, 
  dropout				CHAR(1) NOT NULL, 
  first_gen_college		CHAR(1) NOT NULL, 
  lgbtq					CHAR(1) NOT NULL, 
  pregnant_teen_parent	char(1) NOT NULL, 
  foster_care			CHAR(1) NOT NULL, 
  military_family 		CHAR(1) NOT NULL, 
  immigrant_refugee		CHAR(1) NOT NULL,
  free_reduced_lunch	CHAR(1) NOT NULL, 
  executive_id 			INTEGER NOT NULL,
  manager_id 			INTEGER,
  CONSTRAINT employee_fk1 FOREIGN KEY (manager_id) REFERENCES member(member_id)  ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT employee_fk2 FOREIGN KEY (executive_id) REFERENCES executive(executive_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `check` (
  check_id		INTEGER		NOT NULL PRIMARY KEY AUTO_INCREMENT,
  member_id		INTEGER		NOT NULL,
  date			DATE		NOT NULL, 
  code			VARCHAR(50)	NOT NULL, 
  type			INTEGER	 NULL, 
  CONSTRAINT check_fk1 FOREIGN KEY (member_id) REFERENCES member(member_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `skill` (
  skill_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  skill_name VARCHAR(50) NOT NULL, 
  skill_task VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS `foundation` (
  foundation_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  foundation VARCHAR(75) NOT NULL,
  contact_first_name VARCHAR(50) NOT NULL,
  contact_last_name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  phone VARCHAR(12) NOT NULL 
);

CREATE TABLE IF NOT EXISTS `business_grant` (
  grant_id INTEGER NOT NULL AUTO_INCREMENT,
  date_issued DATE NOT NULL,
  grant_amount DOUBLE(10,2) NOT NULL,
  application_deadline DATETIME NOT NULL,
  executive_id INTEGER NOT NULL,
  foundation_id INTEGER NOT NULL,
  PRIMARY KEY (`grant_id`, `date_issued`),
  CONSTRAINT business_grant_fk1 FOREIGN KEY (executive_id) REFERENCES executive(executive_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT business_grant_fk2 FOREIGN KEY (foundation_id) REFERENCES foundation(foundation_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `instructor` (
  instructor_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL, 
  last_name VARCHAR(50) NOT NULL,
  organization VARCHAR(100) NOT NULL,
  email VARCHAR(50) NOT NULL,
  phone VARCHAR(12) NOT NULL,
  linkedin VARCHAR(50) NULL
);

CREATE TABLE IF NOT EXISTS `class` (
  class_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  type VARCHAR(50) NOT NULL, 
  goal_description TEXT NOT NULL,
  date DATE NOT NULL,
  instructor_id INTEGER NOT NULL,  
  CONSTRAINT class_fk1 FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `learning_objective` (
  objective_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  learning_objective TEXT NOT NULL, 
  objective_description TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS `member_skill` (
  member_id INTEGER NOT NULL,
  skill_id INTEGER NOT NULL,
  date_acquired DATE NOT NULL,
  PRIMARY KEY (`member_id`, `skill_id`),
  CONSTRAINT member_skill_fk1 FOREIGN KEY (member_id) REFERENCES member(member_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT member_skill_fk2 FOREIGN KEY (skill_id) REFERENCES skill(skill_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `member_class` (
  member_id INTEGER NOT NULL,
  class_id INTEGER NOT NULL,
  date_started DATE NOT NULL,
  date_completed DATE,
  PRIMARY KEY (`member_id`, `class_id`),
  CONSTRAINT member_class_fk1 FOREIGN KEY (member_id) REFERENCES member(member_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT member_class_fk2 FOREIGN KEY (class_id) REFERENCES class(class_id) ON DELETE CASCADE ON UPDATE CASCADE
); 

CREATE TABLE IF NOT EXISTS `executive_skill` (
  skill_id INTEGER NOT NULL,
  executive_id INTEGER NOT NULL,
  PRIMARY KEY (`skill_id`,`executive_id`),
  CONSTRAINT executive_skill_fk1 FOREIGN KEY (skill_id) REFERENCES skill(skill_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT executive_skill_fk2 FOREIGN KEY (executive_id) REFERENCES executive(executive_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `class_objective` (
  objective_id INTEGER NOT NULL,
  class_id INTEGER NOT NULL,
  PRIMARY KEY (`objective_id`, `class_id`),
  CONSTRAINT class_objective_fk1 FOREIGN KEY (objective_id) REFERENCES learning_objective(objective_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT class_objective_fk2 FOREIGN KEY (class_id) REFERENCES class(class_id) ON DELETE CASCADE ON UPDATE CASCADE 
);