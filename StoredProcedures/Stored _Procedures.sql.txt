create proc sp_animal_summary @animalid int
as
begin
     select
        a._name as animalname,
        a._type as animaltype,
        count(v.visitid) as totalvisits,
        max(v._date) as lastvisit,
        count(vm.medid) as totalmedications
    from animal a
         join visit v on v.animalid = a.animalid
         join visit_medication vm on vm.visitid = v.visitid
    where a.animalid = @animalid
    group by a._name, a._type;
end

exec sp_animal_summary 1


create proc sp_add_visit
    @visitid int,
    @diagnosis varchar(50),
    @reason varchar(50),
	@animalid int
as
begin  
    insert into visit (visitid, _date, diagnosis, reason, animalid)
    values (@visitid, getdate(), @diagnosis, @reason, @animalid)
end

create proc sp_update_owner_contact
    @ownerid int,
    @new_email varchar(50),
    @new_phone varchar(20)
as
begin
    update _owner
    set email = @new_email,
        phone = @new_phone
    where ownerid = @ownerid

    print 'Owner contact updated successfully'
end


create proc sp_add_appointment
    @animalid int,
    @vetid int,
    @date date,
    @status varchar(50)
as
begin
    declare @new_appointid int
    select @new_appointid = isnull(max(appointid), 0) + 1 from appointment
    insert into appointment (appointid, _date, _status, animalid, vetid)
    values (@new_appointid, @date, @status, @animalid, @vetid)
    print 'Appointment added successfully'
end

create proc sp_delete_appointment
    @appointid int
as
begin
    if exists (select * from appointment where appointid = @appointid)
    begin
    delete from appointment where appointid = @appointid
       print 'Appointment deleted successfully.'
    end
    else
    begin
        print 'No appointment found with the given ID.'
    end
end