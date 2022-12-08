create or replace trigger disease_trig
before insert on Donar
for each row when (NEW.donar_id > 0)
BEGIN
	if :NEW.disease = 'Cancer' then
		dbms_output.put_line('Donar with fatal disease!!');
		delete from Donar where donar_id = :NEW.donar_id;
	end if;
END;
create or replace trigger address_change
before update on Donar
for each row when (.NEW.donar_address != OLD.donar_address)
begin 
	dbms_output.put_line('Old Address: '||:OLD.donar_address);
	dbms_output.put_line('NEW Address: '||:.NEW.donar_address);
end;
create or replace trigger blood_recieved
before update on Donate
for each row when (.NEW.flag != OLD.flag)
begin 
	dbms_output.put_line('BLood Bag given to patient');
end;



