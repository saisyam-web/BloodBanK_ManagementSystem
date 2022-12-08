PROCEDURE donar_for_particular_pat(p_id IN Patient.patient_id%type) IS
BEGIN
	DBMS_OUTPUT.PUT_LINE('list of donar for particular patient id no '||p_id);
	DBMS_OUTPUT.PUT_LINE("----------------------------------------");
	FOR cursor1 IN (select donar_id, donar_name, blood_group, donar_contact_no from Donar where donar_id in (select donar_id from donate where donar_id in (select donar_id from donar where blood_group in (select blood_group from Patient where patient_id = p_id))))
		loop
			DBMS_OUTPUT.PUT_LINE('donar_name: ' || cursor1.donar_name||
								', blood Group: '|| cursor1.blood_group||
								', contact_no: ' || cursor1.donar_contact_no);
								
		end loop;
		DBMS_OUTPUT.PUT_LINE("__________________________________");
END;
PROCEDURE bank_available_for_pat(p_id IN Patient.patient_id%type) IS
BEGIN
	DBMS_OUTPUT.PUT_LINE('list of Banks for patient id no '||p_id);
	DBMS_OUTPUT.PUT_LINE("-----------------------------------------");
	FOR cursor1 IN (select blood_bank_id, blood_bank_name, blood_bank_contact_no from BloodBank where blood_bank_id in (select blood_bank_id from Donate where donar_id in (select donar_id from donar where blood_group in (select blood_group from Patient where patient_id = 103))))
		loop
			DBMS_OUTPUT.PUT_LINE('id: ' || cursor1.blood_bank_id||
								', blood bank name: '|| cursor1.blood_bank_name||
								', contact_no: ' || cursor1.blood_bank_contact_no);
								
		end loop;
		DBMS_OUTPUT.PUT_LINE("____________________________");
END;
PROCEDURE bank_in_patient_loc(p_id IN Patient.patient_id%type) IS
BEGIN
	DBMS_OUTPUT.PUT_LINE('list of Banks for patient id no '||p_id||'in his/her place');
	DBMS_OUTPUT.PUT_LINE("----------------------------------");
	FOR cursor1 IN (select blood_bank_id, blood_bank_name, blood_bank_contact_no, blood_bank_address from BloodBank where blood_bank_id in (select blood_bank_id from Donate where donar_id in (select donar_id from donar where blood_group = (select blood_group from Patient where patient_id = 103))) and blood_bank_address in (select patient_address from Patient where patient_id = 103))
		loop
			DBMS_OUTPUT.PUT_LINE('id: ' || cursor1.blood_bank_id||
								', blood bank name: '|| cursor1.blood_bank_name||
								', contact_no: ' || cursor1.blood_bank_contact_no);
								
		end loop;
		DBMS_OUTPUT.PUT_LINE("_______________________________");
END;
PROCEDURE bank_having_blood(blood IN donar.blood_group%type) IS
BEGIN
	DBMS_OUTPUT.PUT_LINE('list of Blood Banks having'||blood||'blood');
	DBMS_OUTPUT.PUT_LINE("-------------------------------------");
	FOR cursor1 IN (select blood_bank_id, blood_bank_name, blood_bank_contact_no from BloodBank where blood_bank_id in (select blood_bank_id from Donate where donar_id in (select donar_id from donar where blood_group = blood)))
		loop
			DBMS_OUTPUT.PUT_LINE('id: ' || cursor1.blood_bank_id||
								', blood bank name: '|| cursor1.blood_bank_name||
								', contact_no: ' || cursor1.blood_bank_contact_no);
								
		end loop;
		DBMS_OUTPUT.PUT_LINE("_______________________________");
END;
PROCEDURE quantity_of_blood_in_bank(bank IN donate.blood_bank_id%type, blood IN donar.blood_group%type) IS
BEGIN
	DBMS_OUTPUT.PUT_LINE('Quantity of blood in bank no.'||bank||'of group'||blood);
	DBMS_OUTPUT.PUT_LINE("------------------------------------");
	FOR cursor1 IN (select count(donate_id) as quantity from donate where blood_bank_id = bank and donar_id in (select donar_id from donar where blood_group = blood))
		loop
			DBMS_OUTPUT.PUT_LINE('Quantity of blood:'||cursor1.quantity);					
		end loop;
		DBMS_OUTPUT.PUT_LINE("_____________________________________");
END;
PROCEDURE donar_before_date(date_ IN donate.date_of_donation%type, blood IN donar.blood_group%type) IS
BEGIN
	DBMS_OUTPUT.PUT_LINE('List of donar of '||blood||'blood donated before'||date_);
	DBMS_OUTPUT.PUT_LINE("--------------------------------------------");
	FOR cursor1 IN (select donar_name, blood_group, date_of_donation, donar_contact_no from (select * from donate natural join donar) where date_of_donation < date_ and blood_group = blood)
		loop
			DBMS_OUTPUT.PUT_LINE('donar_name: ' || cursor1.donar_name||
								', blood Group: '|| cursor1.blood_group||
								',date_of_donation:'||cursor1.date_of_donation||
								', contact_no: ' || cursor1.donar_contact_no);					
		end loop;
		DBMS_OUTPUT.PUT_LINE("___________________________________");
END;
BEGIN
	donar_for_particular_pat(103);
	bank_available_for_pat(105);
	bank_in_patient_loc(106);
	bank_having_blood('B+');
	quantity_of_blood_in_bank(1005, 'A+');
	donar_before_date(TO_DATE('26/03/2018', 'DD/MM/YYYY'), 'A+');
END;

	
		