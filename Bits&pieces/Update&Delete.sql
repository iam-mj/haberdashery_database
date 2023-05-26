--------------------------------------------1-----------------------------------------------------------------
--CERIN??: S? se seteze sediul cursurilor predate de Asavinei Maria în sediul din Piatra Neam?.

update organizare_curs
set id_sediu = (select id_sediu
                from sedii
                where lower(oras) = 'piatra neamt')
where id_curs in (select c.id_curs
                from curs c, instructor i, angajati a
                where c.id_angajat = i.id_angajat and i.id_angajat = a.id_angajat
                    and lower(a.nume) = 'asavinei' and lower(a.prenume) = 'maria');

--------------------------------------------2-------------------------------------------------------------------
--CERIN??: S? se ?tearg?  acei vânz?tori care au realizat tranzac?ii în cele mai vechi 3 date calendaristice.

delete
from angajati
where id_angajat in (select distinct id_angajat
                    from tranzactii
                    where data in (select d
                                    from (select distinct data d
                                            from tranzactii
                                            order by data)
                                    where rownum <= 3));

--------------------------------------------3------------------------------------------------------------------
--CERIN??: S? se egaleze cantit??ile corespunz?toare comenzilor din prima tranzac?ie realizat? de Monica Geller cu 2.

update comanda
set cantitate = 2
where id_tranzactie = (select id_tranzactie
                        from tranzactii
                        where (id_tranzactie, data) in (select t2.id_tranzactie, t2.data 
                                                        from tranzactii t2
                                                        where t2.id_angajat = (select a.id_angajat
                                                                                from angajati a
                                                                                where lower(a.nume) = 'geller' 
                                                                                and lower(a.prenume) = 'monica'))
                        and data <= all (select t3.data
                                         from tranzactii t3
                                         where id_angajat = (select a2.id_angajat
                                                             from angajati a2
                                                             where lower(a2.nume) = 'geller' 
                                                             and lower(a2.prenume) = 'monica')));