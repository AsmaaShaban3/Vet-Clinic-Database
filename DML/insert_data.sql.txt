insert into _Owner (F_name, L_name, Email, Phone) 
values
('ahmed', 'ali', 'ahmed.ali@email.com', '01011111111'),
('sara', 'hassan', 'sara.hassan@email.com', '01022222222'),
('mona', 'kamal', 'mona.kamal@email.com', '01033333333'),
('omar', 'yousef', 'omar.yousef@email.com', '01044444444'),
('nour', 'adel', 'nour.adel@email.com', '01055555555'),
('hany', 'ibrahim', 'hany.ibrahim@email.com', '01066666666'),
('dina', 'fouad', 'dina.fouad@email.com', '01077777777'),
('tarek', 'nabil', 'tarek.nabil@email.com', '01088888888'),
('aya', 'mostafa', 'aya.mostafa@email.com', '01099999999'),
('hossam', 'shaker', 'hossam.shaker@email.com', '01000000000');

insert into owneraddress (_address, OwnerId) 
values
('nasr city', 1),
('dokki', 2),
('maadi', 3),
('heliopolis', 4),
('mohandessin', 5),
('shoubra', 6),
('6th october', 7),
('new cairo', 8),
('zamalek', 9),
('abbassia', 10);

insert into Animal (_name, _type, Gender, BD, OwnerId) 
values
('lucky', 'dog', 'm', '2021-05-10', 1),
('snowy', 'cat', 'f', '2022-03-15', 2),
('toto', 'rabbit', 'm', '2023-01-01', 3),
('bella', 'dog', 'f', '2020-07-20', 4),
('koki', 'bird', 'f', '2021-11-11', 5),
('snoopy', 'cat', 'm', '2022-09-09', 6),
('chico', 'turtle', 'm', '2020-01-01', 7),
('bobo', 'rabbit', 'f', '2023-04-04', 8),
('max', 'dog', 'm', '2021-02-02', 9),
('lola', 'cat', 'f', '2022-06-06', 10);

insert into Vet (Fullname, Phone, specialty) 
values
('dr. reda', '01012345601', 'surgery'),
('dr. rana', '01012345602', 'dentistry'),
('dr. khaled', '01012345603', 'dermatology'),
('dr. laila', '01012345604', 'ophthalmology'),
('dr. hany', '01012345605', 'general'),
('dr. salma', '01012345606', 'nutrition'),
('dr. mohamed', '01012345607', 'surgery'),
('dr. nada', '01012345608', 'diagnosis'),
('dr. youmna', '01012345609', 'cardiology'),
('dr. tarek', '01012345610', 'emergency');

insert into Visit (VisitId, Diagnosis, Reason, animalid)
values
(1, 'ear infection', 'scratching', 1),
(2, 'checkup', 'routine', 2),
(3, 'fever', 'tiredness', 3),
(4, 'vomiting', 'unknown', 4),
(5, 'skin rash', 'itching', 5),
(6, 'eye infection', 'redness', 6),
(7, 'fracture', 'injury', 7),
(8, 'hair loss', 'allergy', 8),
(9, 'dental issue', 'bad breath', 9),
(10, 'diarrhea', 'food issue', 10);

insert into Medication (MedId, _name, DoseUnit, Instruction, DoseAmount) 
values
(1, 'amoxicillin', 'mg', 'twice daily for 5 days', 250),
(2, 'ivermectin', 'ml', 'single dose', 0.5),
(3, 'eye drops', 'drops', '3 times a day', 2),
(4, 'paracetamol', 'mg', 'once daily', 100),
(5, 'antibiotic cream', 'g', 'apply twice daily', 10),
(6, 'vitamin c', 'ml', 'once daily', 1),
(7, 'painkiller', 'mg', 'after meals', 150),
(8, 'antihistamine', 'ml', 'as needed', 0.8),
(9, 'anti-inflammatory', 'mg', 'twice daily', 200),
(10, 'multivitamin', 'ml', 'once per week', 2);

insert into Appointment (Appointid, _date, _status, Animalid, VetId)
values
(1, '2025-06-10', 'completed', 1, 1),
(2, '2025-06-12', 'scheduled', 2, 2),
(3, '2025-06-14', 'cancelled', 3, 3),
(4, '2025-06-16', 'completed', 4, 4),
(5, '2025-06-18', 'scheduled', 5, 5),
(6, '2025-06-20', 'completed', 6, 6),
(7, '2025-06-22', 'scheduled', 7, 7),
(8, '2025-06-24', 'completed', 8, 8),
(9, '2025-06-26', 'scheduled', 9, 9),
(10, '2025-06-28', 'completed', 10, 10);

insert into AnimalHistory (Animalid, Historyid, EventDate, EventDescription) 
values
(1, 1, '2024-10-15', 'vaccination'),
(1, 2, '2025-02-20', 'routine check'),
(2, 1, '2025-03-10', 'spay surgery'),
(3, 1, '2025-04-01', 'ear cleaning'),
(4, 1, '2025-01-25', 'skin allergy'),
(5, 1, '2025-02-14', 'tooth extraction'),
(6, 1, '2025-03-02', 'wing injury'),
(7, 1, '2025-03-15', 'vitamin deficiency'),
(8, 1, '2025-04-10', 'limping'),
(9, 1, '2025-04-20', 'eye infection');

insert into Visit_Medication (VisitId, MedId)
values
(1, 1),
(2, 3),
(3, 2),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);