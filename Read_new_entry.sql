declare
	f utl_file.file_type;
	line varchar2(1000);
	id donar.donar_id%type;
	name donar.donar_name%type;
	bd_grp donar.blood_group%type;
	contact donar.donar_contact_no%type;
	loc donar.donar_address%type;
	BEGIN
		f := utl_file.fopen('BBMS', 'entries.csv', 'r');
		if utl_file.isopen(f) then
			loop
				begin
					utl_file.get_line(f, line, 1000);
					if line is null then
						exit;
					end if;
					id := REGEXP_SUBSTR(line, '[^,]+', 1, 1);
					name := REGEXP_SUBSTR(line, '[^,]+', 1, 2);
					bd_grp := REGEXP_SUBSTR(line, '[^,]+', 1, 3);
					contact := REGEXP_SUBSTR(line, '[^,]+', 1, 4);
					loc := REGEXP_SUBSTR(line, '[^,]+', 1, 5);
					insert into donar (donar_id, donar_name, donar_contact_no, donar_address) values (id, name, bd_grp, contact, loc);
					commit;
					Exception
					when no_data found then
						exit;
					end;
			end loop;
		end if;
		utl_file.fclose(f);
	end;
/

	
		