------------------------------1-------------------------
--id-urile sediilor in care se tin cursurile predate de Asavinei Maria
select distinct oc.id_curs, oc.id_sediu
from organizare_curs oc, curs c, instructor i, angajati a
where oc.id_curs = c.id_curs and c.id_angajat = i.id_angajat and i.id_angajat = a.id_angajat
    and a.nume = 'Asavinei' and a.prenume = 'Maria'; 
    
------------------------------2-----------------------------
--vanzatorul / vanzatorii care au realizat ultimele 3 tranzactii
select id_angajat
from tranzactii
where data >= all (select data
                    from tranzactii);
                    
select * 
from vanzator;

select id_angajat, count(id_tranzactie)
from tranzactii t
group by id_angajat;

select distinct id_angajat
from tranzactii
where id_tranzactie in (select t2.id_tranzactie
                        from tranzactii t2
                        order by t2.data)
and rownum <= 3;
                        
select *
from tranzactii;
                        
select distinct data
from tranzactii
order by data;

select distinct id_angajat
from tranzactii
where data in (select d
                from (select distinct data d
                        from tranzactii
                        order by data)
                where rownum <= 3);

select d
from (select distinct data d
        from tranzactii
        order by data)
where rownum <= 3;

---------------------------------------3-----------------------------
select id_tranzactie, data
from tranzactii
where id_angajat = (select id_angajat
                    from angajati
                    where lower(nume) = 'geller' and lower(prenume) = 'monica');
                    
select id_tranzactie
from tranzactii
where (id_tranzactie, data) in (select t2.id_tranzactie, t2.data 
                                from tranzactii t2
                                where t2.id_angajat = (select a.id_angajat
                                                    from angajati a
                                                    where lower(a.nume) = 'geller' and lower(a.prenume) = 'monica'))
    and data <= all (select t3.data
                    from tranzactii t3
                    where id_angajat = (select a2.id_angajat
                                        from angajati a2
                                        where lower(a2.nume) = 'geller' and lower(a2.prenume) = 'monica'));
                                        
select *
from comanda;