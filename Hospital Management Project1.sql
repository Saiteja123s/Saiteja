# Write a query in SQL to find the name of the nurse who are the head of their department.

select * from nurses
where position='Head Nurse';   # here using where clause

# Write a query in SQL to count the number of patients who taken appointment with at least one physician
 
select count(distinct(patient)) from appointment;   # here using count,distinct function

# Write a query in SQL to count the number of unavailable rooms

with avlbl as                  # here using Common table expression
(select count(unavailable)     # here using count function
from room
where unavailable='t')          # here using where clause
select *from avlbl;

# Write a query in SQL to obtain the name of the physicians who are trained for a special treatement

select employeeid,name                       # here using subquery function 
from physician
where employeeid in (select distinct physician     # here using where clause
                     from trained_in);
                     
# method 2 using join

select p.employeeid,p.name,pr.code,pr.name as name_of_procedure   
from physician p
inner join trained_in ti                                           # here using inner join trained_in table p.employeeid=ti.pyhsician
on p.employeeid=ti.physician
inner join procedures pr                                           # here using inner join procedures pr table ti.treatment=pr.code
on ti.treatment=pr.code;
                                        
# Write a query in SQL to find the name of the patients and the number of physicians they have taken appointment

select p.name as patient_name,count(distinct physician) as no_of_phy_tkn_apmnt_frm   # here using count,distinct function
from patient p
inner join appointment a                     # here using inner join
on p.ssn = a.patient
group by p.name;                              # here using group by clause
                    
# Write a query in SQL to count number of unique patients who got an appointment for examination room C.    

select examinationroom,count(distinct patient)        # here using count,distinct function
from appointment
group by examinationroom                               # here using group by clause
having examinationroom='C';                            # here having  clause


# Write a query in SQL to find the name of the patients, their treating physicians and medication

select p.ssn,p.name as patient_name,ph.name as treating_phy_name,m.name as medicine_name
from patient p
inner join undergoes u                                  # here using inner join undergoes table
on p.ssn = u.patient
inner join prescribes pr
on u.patient = pr.patient
inner join medication m
on pr.medication = m.code
inner join physician ph
on pr.physician = ph.employeeid;


# Write a query in SQL to find the name of the patients who taken an advanced appointment, and also display their physicians and medication

select p.ssn,
       p.name as patient_name,
       ph.name as physician_name,
       m.name as medicine_name
from patient p
left outer join appointment a              # here using left outer join appointment table 
on p.ssn = a.patient
left outer join prescribes pr
on a.patient = pr.patient
left outer join physician ph
on pr.physician = ph.employeeid
left outer join medication m
on pr.medication = m.code
;

# Write a query in SQL to find out the floor where the maximum no of rooms are available

select blockfloor,count(unavailable) as available_room    # here using count function
from room
where unavailable='f'                                     # here using where clause
group by blockfloor                                       # here using group by clause
order by count(unavailable) desc;                         # here using order by clause








