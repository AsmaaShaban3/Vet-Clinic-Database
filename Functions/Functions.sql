create function fn_get_animal_info (@id int)
returns varchar(50)
as 
begin
        declare @info varchar (50)
		select @info=_name+' '+_type  
		from Animal where AnimalId=@id
		return @info
end

 select dbo.fn_get_animal_info (1)

create function fn_animal_visitcount (@id int)
returns int
as
begin
      declare @visitcount int
	  select @visitcount= count(v.visitid)
	  from Animal a join Visit v on a.AnimalId=v.AnimalId
	  where a.AnimalId= @id
	  return @visitcount
end

create function fn_animal_medications (@id int)
returns table
as
return(
       select m._name,
	          doseunit,
			  doseamount,
			  instruction,
			  v._date
        from Medication m 
		join Visit_Medication vm on m.MedId=vm.MedId
		join Visit v  on v.VisitId=vm.VisitId
		join Animal a on a.AnimalId=v.VisitId
		where a.AnimalId=@id
		);

create function fn_animals_by_type (@type varchar(50))
returns table
as
return(
       select _name as animalname,
	          gender,
			  BD,
			  f_name+' '+l_name as ownername
	  from Animal a 
	  join _Owner o on o.OwnerId=a.OwnerId
	  where _type=@type
);

select * from dbo.fn_animals_by_type('cat')

