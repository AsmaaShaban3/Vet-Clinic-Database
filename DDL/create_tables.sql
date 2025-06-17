create table _Owner(
OwnerId  int identity (1,1) primary key,
F_name  varchar(10) not null,
L_name  varchar(10),
Email   varchar(50),
constraint uq_email unique (Email)
);

create table ownerphone(
phone varchar(50),
OwnerId  int ,
constraint owner_fk foreign key (OwnerId) references _Owner (OwnerId)
   on delete cascade
   on update cascade
);

create table Animal(
AnimalId  int  identity (1,1) primary key,
_name  varchar(50),
_type varchar (50) not null,
Gender  varchar(10)not null,
BD   date,
OwnerId int, 
constraint Gender_chk check (Gender='M'or Gender='F'),
constraint owner_fk1 foreign key (OwnerId) references _Owner(OwnerId)
on delete cascade
);

alter table Animal 
add constraint typ_chk check (_type in ('Cat','Dog','Rabbit','Bird','Turtle'));


create table vet (
vetId int identity (1,1) primary key,
Fullname  varchar(50) not null,
Phone     varchar(20)not null,
Specialty varchar(50)
);

create table Visit(
VisitId   int primary key,
_date     date default getdate(),
Diagnosis varchar(50),
Reason    varchar(50),
AnimalId  int,
constraint animal_fk1 foreign key (AnimalId) references Animal(AnimalId)
);


create table Medication(
MedId  int primary key,
_name  varchar(50),
Dose   varchar(50),
Instruction varchar(100)
);

alter table Medication
drop column Dose 

alter table Medication
add DoseUnit varchar(10)

alter table Medication
add DoseAmount decimal(5,2) 


create table Appointment(
Appointid int primary key,
_date    date,
_status  varchar(50),
Animalid int,
VetId    int,
constraint Animalid_fk2 foreign key (AnimalId) references Animal (AnimalId),
constraint vetid_fk  foreign key (VetId) references vet(VetId)
);

create table AnimalHistory (
 AnimalId int,
 Historyid int,
 EventDate date,
 EventDescription TEXT,
constraint AH_pk primary key (AnimalId, Historyid),
constraint Animalid_fk3 foreign key (AnimalId) references Animal (AnimalId)
    on delete cascade 
	on update cascade
);

create table Visit_Medication (
VisitId int,
MedId int,
constraint VM_pk primary key (MedId,VisitId),
constraint M_fk  foreign key (MedId) references Medication (MedId),
constraint v_fk  foreign key (VisitId) references Visit (VisitId)
);