---- The pet's name, type, owner's name, number of visits + medications it took
create or alter view v_petsummary
as
select a._name as Animalname,
       _type,
       F_name+' '+L_name as Ownername,
       count (v.visitid) as Totalvisits,
	   count (vm.medid)   as Totalmedications
from  Animal a
join _Owner o on o.OwnerId= a.OwnerId
join Visit v  on a.AnimalId= v.AnimalId
join Visit_Medication vm on v.VisitId=vm.VisitId
group by a._name,_type,F_name,L_name;

--Pet's name due for appointments next week and the doctor who will examine them
create or alter view v_upcoming_app
as
select a._name as Animalname,
       Fullname as Vetname,
	   ap._date 
from Animal a 
join Appointment ap on a.AnimalId=ap.Animalid
join vet v on v.vetId=ap.Appointid
where ap._date between getdate() and dateadd(day,7,getdate());

-- Owners who have more than one Pet and the total number of visits for each of their Pets

create or alter view v_owner_stats 
as
select 
  F_name + ' ' + L_name as Ownername,
  count(distinct a.animalid) as Animalcount,
  count(v.visitid) as Totalvisits
from _Owner o
join Animal a on o.ownerid = a.ownerid
join Visit v on v.animalid = a.animalid
group by f_name,l_name
having count(distinct a.animalid) > 1;

--The number of visits to each doctor according to the animals for which appointments were booked
create or alter view v_vet_visit
as
select
      Fullname as vetname,
	  count(vi.visitid) as Totalvisits
from vet v
join Visit vi on v.vetId=vi.VisitId
join Animal a on a.AnimalId= vi.AnimalId
join Appointment app on a.AnimalId=app.Animalid
group by Fullname;

-- The 5 most common medications used in the clinic
create or alter view v_top_medications
as
select top 5 m._name, 
count(*) as usage_count
from medication m
join visit_medication vm on m.medid = vm.medid
join visit v on v.visitid = vm.visitid
group by m._name
order by usage_count desc;

--Which vet has examined pets the most?

create or alter view v_top_vet as
select v.vetid, 
v.fullname, 
count(ap.appointid) as total_appointments
from vet v
join appointment ap on v.vetid = ap.vetid
group by v.vetid, v.fullname
having count(ap.appointid) = (select top 1 count(appointid)
  from appointment
  group by vetid
  order by count(appointid) desc
);

-- The top three owners have visits with their pets using Rank
create or alter view v_top_owners_by_visits 
as
select * from (
  select 
    o.ownerid,
    o.f_name + ' ' + o.l_name as owner_name,
    count(v.visitid) as total_visits,
    rank() over (order by count(v.visitid) desc) as owner_rank
  from _owner o
  join animal a on a.ownerid = o.ownerid
  join visit v on v.animalid = a.animalid
  group by o.ownerid, o.f_name, o.l_name
) ranked
where owner_rank <= 3;
