SET SERVEROUTPUT ON
declare
f utl_file.file_type;
num integer;
cnt integer;
d_id integer;
d_blood Donar.blood_group%type;
type don_blood is varray(11) of BloodBank.blood_bank_address%type;
dbl_list don_blood := don_blood()
begin 
	num := 1;
	cnt := 1;
	dbl_list.extend(11);
	FOR cursor1 IN (select distinct(blood_bank_address) as address from BloodBank)
		loop
			dbl_list(num) := cursor1.address;
			num := num + 1;
		end loop;
	while cnt <= num
		loop
			f := utl_file.fopen('BBMS', concat(to_char(dbl_list(cnt)), '_blood_bank.csv'), 'w');
			utl_file.put(f, 'id'||','||'name'||','||'place'||','||'contact');
			utl_file.new_line(f);
			for rec in (select * from bloodbank where blood_bank_address = dbl_list(cnt))
				loop
					utl_file.put(f, rec.blood_bank_id||','||rec.blood_bank_name||','||rec.blood_bank_address||','||rec.blood_bank_contact_no);
					utl_file.new_line(f);
				end loop;
			utl_file.fclose(f);
			cnt := cnt + 1;
		end loop;
end;

