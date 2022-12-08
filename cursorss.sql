set serveroutput on;
DECLARE
	total_rows integer;
BEGIN
	update Donar
	set donar_address = 'UP'
	where donar_address = 'Jammu';
	if sql%notfound then
		dbms_output.put_line('No donar address changed');
	elsif sql%found then
		total_rows:= sql%rowcount;
		dbms_output.put_line(total_rows || 'Donar address Changed');
	end if;
END;

