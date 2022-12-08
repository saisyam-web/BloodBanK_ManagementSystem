CREATE OR REPLACE FUNCTION totaldonar
RETURN number IS
	total integer := 0
BEGIN
	select count (*) into total FROM Donar;
	RETURN total;
END;
DECLARE
	val integer;
	tot_row integer;
	count integer;
	ans integer;
	pat_id integer;
	d_id integer;
	dd_id integer;
	d_name Donar.donar_name%type;
	don_blood Donar.blood_group%type;
	d_place Donar.donar_address%type;
	pat_blood Patient.blood_group%type;
	pat_place Patient.patient_address%type;
PROCEDURE no_of_donation (d_name IN Donar.donar_name%type, val OUT integer) IS
BEGIN
	val := 0;
	count := 200;
	while count < 209
	loop
		select donar_id into d_id
		FROM DONAR where donar_name = d_name;
		select donar_id into dd_id
		FROM Donate where donate_id = count;
			if (d_id = dd_id) then
				val := val + 1;
			end if
		count := count + 1;
	end loop
END;
PROCEDURE no_of_donation_available_for_particular_pat (pat_id IN integer, val OUT integer) IS
BEGIN
	val := 0;
	count := 100;
	while count <= 110
	loop
		select blood_group into don_blood
		FROM DONAR where donar_id = count;
		select blood_group into pat_blood
		FROM Patient where patient_id = pat_id;
			if (don_blood = pat_blood) then
				val := val + 1;
			end if
		count := count + 1;
	end loop
END;
PROCEDURE no_of_donation_available (pat_id IN Patient.blood_group%type, val OUT integer) IS
BEGIN
	val := 0;
	count := 100;
	while count <= 110
	loop
		select blood_group into don_blood
		FROM DONAR where donar_id = count;
			if (don_blood = pat_blood) then
				val := val + 1;
			end if
		count := count + 1;
	end loop
END;
PROCEDURE no_of_donation_location(pat_blood IN Patient.blood_group%type, pat_place Patient.patient_address%type, val OUT integer) IS
BEGIN
	val := 0;
	count := 100;
	while count <= 110
	loop
		select blood_group into don_blood
		FROM DONAR where donar_id = count;
		select donar_address into d_place
		FROM DONAR where donar_id = count;
			if (don_blood = pat_blood and pat_place = d_place) then
				val := val + 1;
			end if
		count := count + 1;
	end loop
END;
BEGIN
	update DONAR
	set donar_address = "Kasmir";
	where donar_address = "Jammu";
	if sql%notfound then
		dbms_output.put_line("No Donar Address changed!");
	elsif sql%found then
	total_rows := sql%rowcount;
	dbms_output.put_line(total_rows || 'Donar Address Changed!!');
	end if;
	dbms_output.put_line("Number of Donars: " ||totaldonar());
	pat_blood := "B+";
	pat_place := "Himachal";
	no_of_donation_available(pat_blood, ans);
	dbms_output.put_line("Nmuber of Donar Available for "||pat_blood||"blood:" || ans);\
	no_of_donation_location(pat_blood, pat_place, ans);
	dbms_output.put_line("Nmuber of Donar Available for "||pat_blood||"blood in " || pat_place|| ":" ||ans);
	pat_id = 102;
	no_of_donation_available_for_particular_pat(pat_id, ans);
	dbms_output.put_line("Nmuber of Donar Available for patient id "||pat_id|| ":" ||ans);
	d_name := "DDA";
	no_of_donation(d_name, ans);
	dbms_output.put_line("Nmuber of Donation by donar "||d_name|| ":" ||ans);
END;

