
DROP SCHEMA IF EXISTS ministry_health;

CREATE SCHEMA ministry_health COLLATE = utf8_general_ci;

USE ministry_health;

/* *************************************************************** 
***************CREATE TABLES AND ALTER FUNCTİON*******************
**************************************************************** */

CREATE TABLE doctors (
  doctor_id int unsigned NOT NULL,
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  birth_date date NOT NULL,
  gender varchar(50) NOT NULL,
  med_school varchar(50) NOT NULL,
  grad_date date NOT NULL,
  PRIMARY KEY (doctor_id)
);

ALTER TABLE doctors ADD death_date date;

CREATE TABLE patients (
  patient_id int unsigned NOT NULL,
  doctor_id int unsigned NOT NULL,
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  birth_date date NOT NULL,
  gender varchar(50) NOT NULL,
  PRIMARY KEY (patient_id),
  FOREIGN KEY (doctor_id) REFERENCES doctors (doctor_id)
);

ALTER TABLE patients ADD death_date date;

CREATE TABLE drugs (
  drug_id int unsigned NOT NULL,
  drug_name varchar(50) NOT NULL,
  company varchar(50) NOT NULL,
  price int unsigned NOT NULL,
  PRIMARY KEY (drug_id)
);

CREATE TABLE illnesses (
  illness_id int unsigned NOT NULL,
  drug_id int unsigned NOT NULL,
  illness_name varchar(50) NOT NULL,
  drug_name varchar(50) NOT NULL,
  description varchar(50) NOT NULL,
  PRIMARY KEY (illness_id),
  FOREIGN KEY (drug_id) REFERENCES drugs (drug_id)
);

CREATE TABLE prescriptions (
  prescription_id int unsigned NOT NULL,
  drug_id int unsigned NOT NULL,
  prescription varchar(50),
  PRIMARY KEY (prescription_id),
  FOREIGN KEY (drug_id) REFERENCES drugs (drug_id)
);

CREATE TABLE doctor_visits (
  visiting_id int unsigned NOT NULL,
  doctor_id int unsigned NOT NULL,
  patient_id int unsigned NOT NULL,
  diagnosis varchar(50),
  visiting_date datetime NOT NULL,
  prescription_id int unsigned NOT NULL, 
  PRIMARY KEY (visiting_id),
  FOREIGN KEY (doctor_id) REFERENCES doctors (doctor_id),
  FOREIGN KEY (patient_id) REFERENCES patients (patient_id),
  FOREIGN KEY (prescription_id) REFERENCES prescriptions (prescription_id)
);

/* *************************************************************** 
***************INSERT ENTİTY AND UPDATE FUNCTİON******************
**************************************************************** */
insert into doctors(doctor_id, first_name, last_name, birth_date, gender, med_school, grad_date) values(3, "Kadir", "Aksoy", "1986-06-18", "Male", "KU", "2012-06-18");
insert into doctors(doctor_id, first_name, last_name, birth_date, gender, med_school, grad_date) values(4, "Harun", "Ser", "1985-09-13", "Male", "UÜ", "2010-08-14");
insert into doctors(doctor_id, first_name, last_name, birth_date, gender, med_school, grad_date) values(5, "Aliye", "Yılmaz", "1987-02-19", "Female", "ÇÜ", "2013-03-19");
insert into doctors(doctor_id, first_name, last_name, birth_date, gender, med_school, grad_date) values(6, "Zeynep", "Demir", "1982-02-19", "Female", "ZÜ", "2008-09-12");
insert into doctors(doctor_id, first_name, last_name, birth_date, gender, med_school, grad_date) values(7, "Ilgaz", "Küçük", "1989-10-12", "Male", "GÜ", "2014-11-08");
insert into doctors(doctor_id, first_name, last_name, birth_date, gender, med_school, grad_date) values(8, "Ali", "Erkan", "1988-05-06", "Male", "BOUN", "2012-10-07");
insert into doctors(doctor_id, first_name, last_name, birth_date, gender, med_school, grad_date) values(9, "Sedef", "Ev", "1992-01-06", "Female", "İÜ", "2016-12-03");
insert into doctors(doctor_id, first_name, last_name, birth_date, gender, med_school, grad_date) values(10, "Aslı", "Er", "1987-03-08", "Female", "İTÜ", "2013-10-05");
insert into doctors(doctor_id, first_name, last_name, birth_date, gender, med_school, grad_date) values(11, "Ece", "Cin", "1993-03-08", "Female", "MÜ", "2017-07-07");
insert into doctors(doctor_id, first_name, last_name, birth_date, gender, med_school, grad_date) values(12, "Ecenaz", "Seçkin", "1989-05-09", "Female", "RÜ", "2015-01-01");
insert into doctors(doctor_id, first_name, last_name, birth_date, gender, med_school, grad_date) values(13, "Semih", "Sav", "1989-07-07", "Male", "BÜ", "2015-06-11");


UPDATE doctors
SET  first_name= 'Cengiz', last_name= "Han"
WHERE doctor_id = 4;



insert into patients(patient_id, first_name, last_name, birth_date, gender, doctor_id) values(31, "Cevat", "Akoy", "1958-06-18", "Male", 3);
insert into patients(patient_id, first_name, last_name, birth_date, gender, doctor_id) values(41, "Karun", "Serhat", "1985-09-13", "Male", 4);
insert into patients(patient_id, first_name, last_name, birth_date, gender, doctor_id) values(51, "Oya", "Yıl", "1949-02-19", "Female", 5);
insert into patients(patient_id, first_name, last_name, birth_date, gender, doctor_id) values(61, "Elif", "Dem", "1977-02-19", "Female", 6);
insert into patients(patient_id, first_name, last_name, birth_date, gender, doctor_id) values(71, "Ilgın", "Küç", "1989-10-12", "Female", 7);
insert into patients(patient_id, first_name, last_name, birth_date, gender, doctor_id) values(81, "Alihan", "Erkol", "1956-05-06", "Male", 8);
insert into patients(patient_id, first_name, last_name, birth_date, gender, doctor_id) values(91, "Sevda", "Evla", "1996-01-06", "Female", 9);
insert into patients(patient_id, first_name, last_name, birth_date, gender, doctor_id) values(101, "Aslınur", "Eren", "1973-03-08", "Female", 10);
insert into patients(patient_id, first_name, last_name, birth_date, gender, doctor_id) values(111, "Şahsene", "Cindoruk", "1965-03-08", "Female", 11);
insert into patients(patient_id, first_name, last_name, birth_date, gender, doctor_id) values(121, "Ece", "Seç", "1985-05-09", "Female", 12);
insert into patients(patient_id, first_name, last_name, birth_date, gender, doctor_id) values(131, "Senih", "Günay", "1987-07-07", "Male", 13);

UPDATE patients
SET  first_name= 'Zehra', last_name= "Çicek"
WHERE patient_id = 101;



insert into drugs(drug_id, drug_name, company, price) values(311, "asiprin", "eczacıbaşı", 30);
insert into drugs(drug_id, drug_name, company, price) values(411, "parol", "bayern", 45);
insert into drugs(drug_id, drug_name, company, price) values(511, "majezik", "bayern", 52);
insert into drugs(drug_id, drug_name, company, price) values(611, "arvales", "bilim ilaç", 63);
insert into drugs(drug_id, drug_name, company, price) values(711, "aferin", "koç ilaç", 56);
insert into drugs(drug_id, drug_name, company, price) values(811, "supradyn", "dimes", 25);
insert into drugs(drug_id, drug_name, company, price) values(911, "pharmaton", "bayern", 96);
insert into drugs(drug_id, drug_name, company, price) values(1011, "dolorex", "eczacıbaşı", 35);
insert into drugs(drug_id, drug_name, company, price) values(1111, "amoklavin", "bayern", 46);
insert into drugs(drug_id, drug_name, company, price) values(1211, "dolphin", "pfizer", 87);
insert into drugs(drug_id, drug_name, company, price) values(1311, "karol", "J and J", 43);



insert into illnesses(illness_id, illness_name, drug_name, description, drug_id) values(3111, "Kör", "asiprin", "Göz görmüyor", 311);
insert into illnesses(illness_id, illness_name, drug_name, description, drug_id) values(4111, "Depresyon", "parol", "Psikolojik zorluk", 411);
insert into illnesses(illness_id, illness_name, drug_name, description, drug_id) values(5111, "Sıtma", "majezik", "titreme", 511);
insert into illnesses(illness_id, illness_name, drug_name, description, drug_id) values(6111, "Korona", "arvales", "Pandemi", 611);
insert into illnesses(illness_id, illness_name, drug_name, description, drug_id) values(7111, "Böbrek yetmezliği", "aferin","Böbrek yetersiz", 711);
insert into illnesses(illness_id, illness_name, drug_name, description, drug_id) values(8111, "Siroz", "supradyn", "Karaciğer yetersiz", 811);
insert into illnesses(illness_id, illness_name, drug_name, description, drug_id) values(9111, "Tansiyon", "pharmaton", "Tansiyon yüksek", 911);
insert into illnesses(illness_id, illness_name, drug_name, description, drug_id) values(10111, "Şeker", "dolorex", "İnsülin direnci zayıf", 1011);
insert into illnesses(illness_id, illness_name, drug_name, description, drug_id) values(11111, "Uçuk", "amoklavin", "Virüs", 1111);
insert into illnesses(illness_id, illness_name, drug_name, description, drug_id) values(12111, "Zatürre", "dolphin", "Soğukta kalmış", 1211);
insert into illnesses(illness_id, illness_name, drug_name, description, drug_id) values(13111, "Basur", "karol", "Dış sindirim yolu rahatsızlığı", 1311);


insert into prescriptions(prescription_id, drug_id, prescription) values(311111, 311, "asiprin");
insert into prescriptions(prescription_id, drug_id, prescription) values(411111, 411, "parol");
insert into prescriptions(prescription_id, drug_id, prescription) values(511111, 511, "majezik");
insert into prescriptions(prescription_id, drug_id, prescription) values(611111, 611, "arvales");
insert into prescriptions(prescription_id, drug_id, prescription) values(711111, 711, "aferin");
insert into prescriptions(prescription_id, drug_id, prescription) values(811111, 811, "supradyn");
insert into prescriptions(prescription_id, drug_id, prescription) values(911111, 911, "pharmaton");
insert into prescriptions(prescription_id, drug_id, prescription) values(1011111, 1011, "dolorex");
insert into prescriptions(prescription_id, drug_id, prescription) values(1111111, 1111, "amoklavin");
insert into prescriptions(prescription_id, drug_id, prescription) values(1211111, 1211, "dolphin");
insert into prescriptions(prescription_id, drug_id, prescription) values(1311111, 1311, "karol");

insert into doctor_visits(visiting_id, doctor_id, patient_id, diagnosis, visiting_date, prescription_id) values(31111, 3, 31, "Kör", "2020-07-19 12:45:56", 311111);
insert into doctor_visits(visiting_id, doctor_id, patient_id, diagnosis, visiting_date, prescription_id) values(41111, 4, 41, "Depresyon", "2021-03-12 13:45:56", 411111);
insert into doctor_visits(visiting_id, doctor_id, patient_id, diagnosis, visiting_date, prescription_id) values(51111, 5, 51, "Sıtma", "2020-06-13 15:45:56 12:45:56", 511111);
insert into doctor_visits(visiting_id, doctor_id, patient_id, diagnosis, visiting_date, prescription_id) values(61111, 6, 61, "Korona", "2021-07-11 13:45:56", 611111);
insert into doctor_visits(visiting_id, doctor_id, patient_id, diagnosis, visiting_date, prescription_id) values(71111, 7, 71, "Böbrek yetmezliği","2020-04-03 11:45:56", 711111);
insert into doctor_visits(visiting_id, doctor_id, patient_id, diagnosis, visiting_date, prescription_id) values(81111, 8, 81, "Siroz", "2021-06-18 17:45:56", 811111);
insert into doctor_visits(visiting_id, doctor_id, patient_id, diagnosis, visiting_date, prescription_id) values(91111, 9, 91, "Tansiyon", "2021-07-19 15:45:56", 911111);
insert into doctor_visits(visiting_id, doctor_id, patient_id, diagnosis, visiting_date, prescription_id) values(101111, 10, 101, "Şeker", "2021-01-11 17:45:56", 1011111);
insert into doctor_visits(visiting_id, doctor_id, patient_id, diagnosis, visiting_date, prescription_id) values(111111, 11, 111, "Uçuk","2021-05-15 19:45:56", 1111111);
insert into doctor_visits(visiting_id, doctor_id, patient_id, diagnosis, visiting_date, prescription_id) values(121111, 12, 121, "Zatürre", "2019-03-18 13:45:56", 1211111);
insert into doctor_visits(visiting_id, doctor_id, patient_id, diagnosis, visiting_date, prescription_id) values(131111, 13, 131, "Basur", "2021-09-15 14:45:56", 1311111);


/* *************************************************************** 
**************************CONSTRAİNTS*****************************
**************************************************************** */


ALTER TABLE doctors ADD CHECK(birth_date < grad_date);
ALTER TABLE doctors ADD CHECK(birth_date < death_date);
ALTER TABLE patients ADD CHECK(birth_date < death_date);
ALTER TABLE doctors ADD CHECK(gender = 'Female' or gender = 'Male');
ALTER TABLE patients ADD CHECK(gender = 'Female' or gender = 'Male');


/* *************************************************************** 
***********ANSWERS OF 7,8,9,10 QUESTİONS WİTH SELECT**************
**************************************************************** */


/* **************ANSWERS OF 7. QUESTİONS WİTH SELECT********* */
SELECT p.patient_id, p.first_name, p.last_name , d.price
	FROM patients p NATURAL JOIN doctor_visits v NATURAL JOIN prescriptions r NATURAL JOIN drugs d;

/* **************ANSWERS OF 8. QUESTİONS WİTH SELECT********* */

SELECT      k.doctor_id
           ,k.first_name
           ,k.last_name
           , COUNT(p.doctor_id ) AS   num_patients
           , COUNT(v.doctor_id ) AS   num_visits
FROM doctors k 
LEFT OUTER JOIN patients p
ON  k.doctor_id = p.doctor_id
LEFT OUTER JOIN doctor_visits v 
ON k.doctor_id = v.doctor_id
GROUP BY k.doctor_id, k.first_name

/* **************ANSWERS OF 9. QUESTİONS WİTH SELECT********* */

SELECT v.diagnosis, d.price AS costs, COUNT(v.patient_id ) AS num_patients
FROM doctor_visits v
LEFT OUTER JOIN prescriptions pr
ON  v.prescription_id = pr.prescription_id
LEFT OUTER JOIN drugs d 
ON pr.drug_id = d.drug_id
GROUP BY v.diagnosis

/* **************ANSWERS OF 10. QUESTİONS WİTH SELECT********* */

SELECT       d.company
           , COUNT(i.drug_id ) AS   different_drugs
           , COUNT(i.illness_id ) AS   different_illness
FROM illnesses i 
LEFT OUTER JOIN drugs d
ON  d.drug_id = i.drug_id
GROUP BY d.company
