DROP TABLE IF EXISTS nilai_mahasiswa;
CREATE TABLE nilai_mahasiswa (
nim CHAR(8) PRIMARY KEY,
nama VARCHAR(50),
semester_1 DECIMAL(4,2),
semester_2 DECIMAL(4,2),
semester_3 DECIMAL(4,2)
) ENGINE = INNODB;
-- Query OK, 0 rows affected (0.24 sec)
INSERT INTO nilai_mahasiswa VALUES
('17090113', 'Riana Putria', 3.12, 2.98, 3.45),
('17140143', 'Rudi Permana', 2.56, 3.14, 3.22),
('17080305', 'Rina Kumala Sari', 3.45, 2.56, 3.67),
('17140119', 'Sandri Fatmala', 2.12, 2.78, 2.56),
('17090308', 'Christine Wijaya', 3.78, 3.23, 3.11);

CREATE
   VIEW `day26`.`nilai_ipk` 
    AS
(SELECT
    `nim`
    , `nama`
    ,ROUND((`semester_1`+`semester_2`+`semester_3`)/3,2) AS "ipk"
FROM
    `day26`.`nilai_mahasiswa`);
  
CREATE
   VIEW `day26`.`nilai_ipk_format` 
    AS  
  (SELECT CONCAT(
  `nama`,"(",ipk,")") AS "Nama dan IPK" FROM `day26`.`nilai_ipk` ORDER BY `ipk` DESC);
  
  
  SELECT*FROM `nilai_ipk_format` WHERE `nilai_ipk_format`.`Nama dan IPK` LIKE "R%";