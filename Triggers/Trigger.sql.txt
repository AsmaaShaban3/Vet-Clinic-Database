create table visit_log (
    visitid int,
    log_time date default getdate(),
    log_message varchar(100)
);

create trigger t_insertvisit
on Visit
after insert
as 
begin
     insert into visit_log (visitid,log_message)
	 select Visitid,'visit inserted'
	 from inserted
end

create table appointment_audit (
    appointid int,
    modified_by varchar(100),
    modified_date date default getdate(),
    old_date date,
    new_date date,
);

create trigger trg_appointment_status_update
on appointment
after update
as
begin
    if update (_date)
	begin
	     declare @appid int,@olddate date,@newdate date
		 select @appid=Appointid from Appointment
		 select @olddate from deleted
		 select @newdate from inserted
 insert into appointment_audit
 values(@appid,SUSER_NAME(),GETDATE(),@olddate,@newdate)
	end
end

create table visit_audit (
    visitid int,
    animalid int,
    visit_date date,
    added_by varchar(50),
    added_on date default getdate()
);

create trigger trg_insert_visit
on visit
after insert
as
begin
    insert into visit_audit (visitid, animalid, visit_date, added_by)
    select visitid, animalid, _date, suser_name()
    from inserted;
end;

create table animal_stats (
    animalid int primary key,
    total_visits int default 0
);

create trigger trg_update_animal_visits
on visit
after insert
as
begin
    merge animal_stats as target
    using (select animalid from inserted) as source
    on target.animalid = source.animalid
    when matched then 
        update set total_visits = total_visits + 1
    when not matched then
        insert (animalid, total_visits) values (source.animalid, 1);
end;