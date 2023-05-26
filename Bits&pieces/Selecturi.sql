-----------------------------------------------------1-----------------------------------------------
--CERIN??: Pentru fiecare cursant, s? i se afi?eze id-ul, numele complet ?i media final? ob?inut? la fiecare curs pe care l-a absolvit, 
--împreun? cu id-ul ?i descrierea cursului (tipul nivelul cursului), dar ?i starea de promovabilitate a cursantului la cursul respectiv. 
--Rezultatele vor fi ordonate dup? id-ul cursantului.

--FOLOSIM: clauza WITH, CASE, ordon?ri si func?iile NVL ?i DECODE (în cadrul aceleia?i cereri), 
--2 func?ii pe date calendaristice (sysdate ?i least), 1 func?ie pentru ?iruri de caractere (concat) 

with curs_finalizat as (
    select id_curs cursid, tip, nivel, data_inceput, durata, data_inceput + durata * 7 data_final
    from curs
    where data_inceput + durata * 7 < sysdate
)
select c2.id_cursant cursant, concat(concat(c2.nume_cursant, ' '), c2.prenume_cursant) nume_cursant, c.id_curs curs,
        c.tip || ' ' || c.nivel descriere_curs, 
        avg(nvl(decode(least(cpc.data_predare, cpc.termen_limita), cpc.data_predare, nota), 0)) medie,
        case 
        when avg(nvl(decode(least(cpc.data_predare, cpc.termen_limita), cpc.data_predare, nota), 0)) > 5 
            then 'promovat' 
        else 'nepromovat' 
            end promovare
from curs c, cursant c2, curs_proiect_cursant cpc
where cpc.id_cursant = c2.id_cursant 
    and cpc.id_curs = c.id_curs
    and c.id_curs in (select cursid
                    from curs_finalizat)
group by c2.id_cursant, c2.nume_cursant || ' ' || c2.prenume_cursant, c.id_curs, c.tip || ' ' || c.nivel
order by cursant; 


-------------------------------------------------2---------------------------------------------------------
--CERIN??: S? se afi?eze suma total? a celei mai costisitoare tranzac?ii, împreun? cu id-ul ?i data la care a 
--fost realizat?, dar ?i id-ul ?i numele complet al vânz?torului care a realizat-o.

--FOLOSIM: clauza WITH

with cost_tranzactie as (select t.id_tranzactie, t.data, sum(preturi_comenzi.pret_comanda) total_tranzactie
                        from tranzactii t, comanda c, (select c2.id_comanda, sum(c2.cantitate * s.pret) pret_comanda
                                                       from comanda c2, stoc s
                                                       where c2.id_produs = s.id_produs
                                                       group by c2.id_comanda) preturi_comenzi
                        where t.id_tranzactie = c.id_tranzactie and c.id_comanda = preturi_comenzi.id_comanda
                        group by t.id_tranzactie, t.data)
select a.id_angajat, a.nume || ' ' || a.prenume nume_vanzator, ct.id_tranzactie, ct.data, ct.total_tranzactie
from cost_tranzactie ct, tranzactii t, angajati a
where ct.total_tranzactie = (select max(c2.total_tranzactie)
                            from cost_tranzactie c2)
    and ct.id_tranzactie = t.id_tranzactie 
    and t.id_angajat = a.id_angajat;


------------------------------------------------3------------------------------------------------------------
--CERIN??: S? se afi?eze id-ul, descrierea (tipul concatenat cu nivelul), numele instructorului, num?rul de 
--cursan?i ?i ora?ul în care se organizeaz? cursurile de avansa?i ce au loc în ora?e în care se organizeaz? cel pu?in 2 cursuri.

--FOLOSIM: subcerere nesincronizat? în clauza FROM, clauza WITH, o func?ie pentru ?iruri de caractere (lower)

with numar_cursuri_oras as (select s.oras oras_potrivit, count(distinct oc.id_curs) numar_cursuri
                            from organizare_curs oc, sedii s
                            where oc.id_sediu = s.id_sediu
                            group by s.oras
                            having count(distinct oc.id_curs) > 1)
select aux.curs, aux.descriere_curs, aux.nume, numar_cursanti.numar numar_cursanti, aux.oras
from (select distinct c.id_curs curs, c.tip || ' ' || c.nivel descriere_curs,
                      a.nume || ' ' || a.prenume nume, s.oras
      from curs c, angajati a, organizare_curs oc, sedii s
      where c.id_curs = oc.id_curs 
            and oc.id_sediu = s.id_sediu
            and c.id_angajat = a.id_angajat
            and lower(c.nivel) = 'avansati') aux,
    (select id_curs cursid, count(distinct id_cursant) numar
    from curs_proiect_cursant
    group by id_curs) numar_cursanti
where aux.curs = numar_cursanti.cursid
      and aux.oras in (select oras_potrivit
                        from numar_cursuri_oras);

-----------------------------------------------4------------------------------------------------------------
--CERIN??: S? se afi?eze pentru fiecare sediu în parte id-ul, strada ?i ora?ul, dar ?i id-ul, numele?i data 
--angaj?rii instructorului cu vechimea cea mai mic?.

--FOLOSIM: subcerere sincronizat? în care intervin cel pu?in 3 tabele

select distinct a.id_angajat, a.nume || ' ' || a.prenume nume, i.data_angajare, s.id_sediu, s.strada, s.oras
from angajati a, instructor i, curs c, organizare_curs oc, sedii s
where a.id_angajat = i.id_angajat and c.id_angajat = i.id_angajat and c.id_curs = oc.id_curs and oc.id_sediu = s.id_sediu
        and i.data_angajare >= all (select i2.data_angajare
                                    from instructor i2, curs c2, organizare_curs oc2, sedii s2
                                    where i2.id_angajat = c2.id_angajat and c2.id_curs = oc2.id_curs
                                        and oc2.id_sediu = s2.id_sediu
                                        and s2.id_sediu = s.id_sediu)
order by s.id_sediu;


------------------------------------------------5----------------------------------------------------------
--CERIN??: S? se afi?eze numele ?i media tuturor cursan?ilor cu medii finale maxime la un curs predat de 
--Verdes Maria, împreun? cu id-ul ?i descrierea (tipul ?i nivelul) cursului respectiv. Rezultatele vor fi 
--ordonate descresc?tor dup? medie.
-------------------------------------------VARIANTA 1------------------------------------------------------
--FOLOSIM: o func?ie de ?iruri de caractere (initcap), clauza WITH

with note as (select c.id_cursant, c.nume_cursant || ' ' || c.prenume_cursant nume_cursant, c2.id_curs,
                    avg(decode(least(cpc.data_predare, cpc.termen_limita), cpc.data_predare, nota, 0)) medie
              from cursant c, curs_proiect_cursant cpc, curs c2
              where c.id_cursant = cpc.id_cursant and cpc.id_curs = c2.id_curs
              group by c.id_cursant, c.nume_cursant, c.prenume_cursant, c2.id_curs)
select distinct note.nume_cursant, note.id_curs, note.medie, c2.tip || ' ' || c2.nivel descriere_curs
from curs c2, instructor i, angajati a, note
where c2.id_angajat = i.id_angajat
    and i.id_angajat = a.id_angajat
    and initcap(a.nume) = 'Verdes' and initcap(a.prenume) = 'Maria'
    and note.id_curs = c2.id_curs
    and note.medie = (select max(medie)
                      from note
                      where note.id_curs = c2.id_curs)
order by note.medie desc;

-------------------------------------------VARIANTA 2------------------------------------------------------- 
--FOLOSIM: o func?ie de ?iruri de caractere (initcap), grup?ri de date cu  subcerere  nesincronizat? în care 
--intervin cel pu?in 3 tabele, func?ii grup, filtrare la nivel de grupuri (în cadrul aceleia?i cereri)

select distinct cc.nume_cursant || ' ' || cc.prenume_cursant nume, c.id_curs, 
                avg(decode(least(cpc.data_predare, cpc.termen_limita), cpc.data_predare, cpc.nota, 0)) medie,
                c.tip || ' ' || c.nivel descriere_curs
from curs c, curs_proiect_cursant cpc, cursant cc
where cc.id_cursant = cpc.id_cursant and cpc.id_curs = c.id_curs
    and c.id_curs in (select id_curs
                      from curs c2, instructor i, angajati a
                      where c2.id_angajat = i.id_angajat
                            and i.id_angajat = a.id_angajat
                            and initcap(a.nume) = 'Verdes' and initcap(a.prenume) = 'Maria')
group by cc.nume_cursant, cc.prenume_cursant, c.id_curs, c.tip, c.nivel
having avg(decode(least(cpc.data_predare, cpc.termen_limita), cpc.data_predare, cpc.nota, 0)) >= all (
        select avg(decode(least(cpc2.data_predare, cpc2.termen_limita), cpc2.data_predare, cpc2.nota, 0))
        from curs_proiect_cursant cpc2
        where cpc2.id_curs = c.id_curs
        group by cpc2.id_cursant
)
order by medie desc;