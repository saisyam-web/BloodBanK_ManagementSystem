create table Patient(
patient_id int,
patient_name varchar2(20) not null,
blood_group varchar2(4),
disease varchar2(20),
patient_address varchar2(200),
patient_contact varchar2(15),
primary key (patient_id)
);
create table Donar(
donar_id int,
donar_name varchar2(20),
blood_group varchar2(4),
donar_contact_no varchar2(15),
donar_address varchar2(200),
disease varchar2(20),
primary key (donar_id)
);
create table BloodBank(
blood_bank_id int,
blood_bank_name varchar2(20),
blood_bank_address varchar2(200),
blood_bank_contact_no varchar2(20),
primary key(blood_bank_id)
);
create table donate(
donate_id int,
donar_id int,
date_of_donation date,
blood_bank_id,
flag int default 1,
primary key(donate_id),
foreign key(donar_id) references Donar(donar_id),
foreign key(blood_bank_id) references BloodBank(blood_bank_id)
);
insert into Patient (patient_id, patient_name, blood_group, disease, patient_address, patient_contact)
values (100, 'PA', 'A-', 'N/A', 'Kolkata', '90341');

insert into Patient (patient_id, patient_name, blood_group, disease, patient_address, patient_contact)
values (101, 'PB', 'A+', 'N/A', 'Delhi', '08762');

insert into Patient (patient_id, patient_name, blood_group, disease, patient_address, patient_contact)
values (102, 'PC', 'B-', 'N/A', 'Pune', '12345');

insert into Patient (patient_id, patient_name, blood_group, disease, patient_address, patient_contact)
values (103, 'PC', 'B+', 'N/A', 'Himachal', '91341');

insert into Patient (patient_id, patient_name, blood_group, disease, patient_address, patient_contact)
values (104, 'PD', 'O+', 'N/A', 'Kolkata', '93341');

insert into Patient (patient_id, patient_name, blood_group, disease, patient_address, patient_contact)
values (105, 'PE', 'A-', 'N/A', 'Jaipur', '92341');

insert into Patient (patient_id, patient_name, blood_group, disease, patient_address, patient_contact)
values (106, 'PF', 'A+', 'N/A', 'Kolkata', '91141');

insert into Patient (patient_id, patient_name, blood_group, disease, patient_address, patient_contact)
values (107, 'PG', 'A-', 'N/A', 'Gujrat', '76541');

insert into Patient (patient_id, patient_name, blood_group, disease, patient_address, patient_contact)
values (108, 'PH', 'A+', 'N/A', 'Delhi', '34678');

insert into Patient (patient_id, patient_name, blood_group, disease, patient_address, patient_contact)
values (109, 'PI', 'B+', 'N/A', 'Andra', '15678');

insert into Patient (patient_id, patient_name, blood_group, disease, patient_address, patient_contact)
values (110, 'PJ', 'AB+', 'N/A', 'Jammu', '19087');

-- Insertion in BloodBank

insert into BloodBank (blood_bank_id, blood_bank_name, blood_bank_contact_no, blood_bank_address)
values (1000, 'BA', '1111', 'Kolkata');

insert into BloodBank (blood_bank_id, blood_bank_name, blood_bank_contact_no, blood_bank_address)
values (1001, 'BB', '1112', 'Delhi');

insert into BloodBank (blood_bank_id, blood_bank_name, blood_bank_contact_no, blood_bank_address)
values (1002, 'BC', '1113', 'Himachal');

insert into BloodBank (blood_bank_id, blood_bank_name, blood_bank_contact_no, blood_bank_address)
values (1003, 'BD', '1114', 'Kolkata');

insert into BloodBank (blood_bank_id, blood_bank_name, blood_bank_contact_no, blood_bank_address)
values (1004, 'BE', '1115', 'Delhi');

insert into BloodBank (blood_bank_id, blood_bank_name, blood_bank_contact_no, blood_bank_address)
values (1005, 'BF', '1116', 'Himachal');

insert into BloodBank (blood_bank_id, blood_bank_name, blood_bank_contact_no, blood_bank_address)
values (1006, 'BG', '1117', 'Kolkata');

insert into BloodBank (blood_bank_id, blood_bank_name, blood_bank_contact_no, blood_bank_address)
values (1007, 'BH', '1118', 'Delhi');

insert into BloodBank (blood_bank_id, blood_bank_name, blood_bank_contact_no, blood_bank_address)
values (1008, 'BI', '1119', 'Kolkata');

insert into BloodBank (blood_bank_id, blood_bank_name, blood_bank_contact_no, blood_bank_address)
values (1009, 'BJ', '2111', 'Himachal');

insert into BloodBank (blood_bank_id, blood_bank_name, blood_bank_contact_no, blood_bank_address)
values (1010, 'BK', '2211', 'Kolkata');

             

-- data insertion of donar

insert into Donar (donar_id, donar_name, blood_group, donar_address, donar_contact_no)
values(100,'DDA','A-','Delhi','01234');

insert into Donar (donar_id, donar_name, blood_group, donar_address, donar_contact_no)
values(101,'DDB','A+','Kolkata','01235');

insert into Donar (donar_id, donar_name, blood_group, donar_address, donar_contact_no)
values(102,'DDC','B+','Kolkata','01236');

insert into Donar (donar_id, donar_name, blood_group, donar_address, donar_contact_no)
values(103,'DDD','A+','Delhi','01237');

insert into Donar (donar_id, donar_name, blood_group, donar_address, donar_contact_no)
values(104,'DDE','A-','Delhi','01238');

insert into Donar (donar_id, donar_name, blood_group, donar_address, donar_contact_no)
values(105,'DDF','A+','Kolkata','01239');

insert into Donar (donar_id, donar_name, blood_group, donar_address, donar_contact_no)
values(106,'DDG','B-','Himachal','12341');

insert into Donar (donar_id, donar_name, blood_group, donar_address, donar_contact_no)
values(107,'DDH','A-','Delhi','12342');

insert into Donar (donar_id, donar_name, blood_group, donar_address, donar_contact_no)
values(108,'DDI','A+','Himachal','12343');

insert into Donar (donar_id, donar_name, blood_group, donar_address, donar_contact_no)
values(109,'DDJ','A+','Delhi','12344');

insert into Donar (donar_id, donar_name, blood_group, donar_address, donar_contact_no)
values(110,'DDK','AB+','Kolkata','12345');

-- Insertion in Donate Table


insert into Donate (donate_id, donar_id, date_of_donation, blood_bank_id)
values(200, 100, TO_DATE('28/02/2021', 'DD/MM/YYYY'), 1000);

insert into Donate (donate_id, donar_id, date_of_donation, blood_bank_id)
values(201, 101, TO_DATE('27/02/2021', 'DD/MM/YYYY'),1001);

insert into Donate (donate_id,donar_id,date_of_donation,blood_bank_id)
values(202,102,TO_DATE('26/02/2021', 'DD/MM/YYYY'),1003);

insert into Donate (donate_id,donar_id,date_of_donation,blood_bank_id)
values(203,106,TO_DATE('25/04/2021', 'DD/MM/YYYY'),1004);

insert into Donate (donate_id,donar_id,date_of_donation,blood_bank_id)
values(204,105,TO_DATE('24/02/2021', 'DD/MM/YYYY'),1005);

insert into Donate (donate_id,donar_id,date_of_donation,blood_bank_id)
values(205,106,TO_DATE('28/02/2021', 'DD/MM/YYYY'),1006);

insert into Donate (donate_id,donar_id,date_of_donation,blood_bank_id)
values(206,107,TO_DATE('27/02/2021', 'DD/MM/YYYY'),1007);

insert into Donate (donate_id,donar_id,date_of_donation,blood_bank_id)
values(207,108,TO_DATE('26/02/2021', 'DD/MM/YYYY'),1008);

insert into Donate (donate_id,donar_id,date_of_donation,blood_bank_id)
values(209,109,TO_DATE('25/02/2021', 'DD/MM/YYYY'),1009);

insert into Donate (donate_id,donar_id,date_of_donation,blood_bank_id)
values(208,110,TO_DATE('24/02/2020', 'DD/MM/YYYY'),1010);

