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
	FOR cursor1 IN (select distinct(blood_group) as blood from Donar)
		loop
			dbl_list(num) := cursor1.blood;
			num := num + 1;
		end loop;
	while cnt <= num
		loop
			f := utl_file.fopen('BBMS', concat(to_char(dbl_list(cnt)), '_donar.csv'), 'w');
			utl_file.put(f, 'id'||','||'name'||','||'place'||','||'contact'||','||'blood');
			utl_file.new_line(f);
			for rec in (select donar_id, donar_name, donar_address, donar_contact_no, blood_group from donar where blood_group = dbl_list(cnt))
				loop
					utl_file.put(f, rec.donar_id||','||rec.donar_name||','||rec.donar_address||','||rec.donar_contact_no||','||rec.blood_group);
					utl_file.new_line(f);
				end loop;
			utl_file.fclose(f);
			cnt := cnt + 1;
		end loop;
end;
