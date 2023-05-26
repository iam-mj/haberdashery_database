-------1---------
select id_curs, tip, nivel, data_inceput, durata, data_inceput + durata * 7 data_final
from curs
where data_inceput + durata * 7 < sysdate; --cursurile care s-au terminat


with curs_finalizat as (
    select id_curs cursid, tip, nivel, data_inceput, durata, data_inceput + durata * 7 data_final
    from curs
    where data_inceput + durata * 7 < sysdate
)
select distinct c2.id_cursant cursant, c2.nume_cursant || ' ' || c2.prenume_cursant nume_cursant, c.id_curs curs,
        c.tip || ' ' || c.nivel descriere_curs
from curs c, cursant c2, curs_proiect_cursant cpc
where cpc.id_cursant = c2.id_cursant 
    and cpc.id_curs = c.id_curs
    and c.id_curs in (select cursid
                    from curs_finalizat); --cursantii care au participat la un curs finalizat
                    
------2-------
--vreau sa aflu fiecare cursant la ce curs a participat / participa => pt fiecare cursant vad 
--la ce proiecte a participat in curs_proiect_cursant si dupa iau cursul de acolo

select c2.id_cursant cursant, c2.nume_cursant || ' ' || c2.prenume_cursant nume_cursant, 
        c.id_curs curs, c.tip || ' ' || c.nivel descriere_curs 
from curs c, cursant c2, curs_proiect_cursant cpc
where cpc.id_cursant = c2.id_cursant and cpc.id_curs = c.id_curs;
--la ce curs patricipa fiecare cursant



--numele instructorilor care predau atat cursuri de crosetat cat si de impletit
select a.id_angajat, a.nume || ' ' || a.prenume nume
from instructor i, angajati a
where exists (
    select 'ceva'
    from curs c
    where i.id_angajat = c.id_angajat
        and lower(c.tip) = 'crosetat'
)
intersect
select a.id_angajat, a.nume || ' ' || a.prenume nume
from angajati a, instructor i
where exists (
    select 'altceva'
    from curs c
    where i.id_angajat = c.id_angajat
        and lower(c.tip) = 'impletit'
)
and i.id_angajat = a.id_angajat;


--data in care s-a realizat cea mai scumpa tranzactie + numele angajatului care a realizat-o
--pentru fiecare comanda cat costa
select c.id_comanda, sum(c.cantitate * s.pret) pret_comanda
from comanda c, stoc s
where c.id_produs = s.id_produs
group by c.id_comanda
order by 1;
--totalul tranzactiilor
select t.id_tranzactie, t.data, sum(preturi_comenzi.pret_comanda) total_tranzactie
from tranzactii t, comanda c, (select c2.id_comanda, sum(c2.cantitate * s.pret) pret_comanda
                                from comanda c2, stoc s
                                where c2.id_produs = s.id_produs
                                group by c2.id_comanda) preturi_comenzi
where t.id_tranzactie = c.id_tranzactie and c.id_comanda = preturi_comenzi.id_comanda
group by t.id_tranzactie, t.data;


-----3-----
--pt fiecare curs de avansati in ce oras se tine si profesorul care il preda
select distinct c.id_curs, a.id_angajat, a.nume || ' ' || a.prenume nume, s.oras
from curs c, angajati a, organizare_curs oc, sedii s
where c.id_curs = oc.id_curs 
    and oc.id_sediu = s.id_sediu
    and c.id_angajat = a.id_angajat
    and lower(c.nivel) = 'avansati';
    
--numarul de cursanti care participa la fiecare curs
select id_curs, count(distinct id_cursant)
from curs_proiect_cursant
group by id_curs;

--cate cursuri se tin in fiecare orasele in care se tin macar 2 cursuri
select s.oras, count(distinct oc.id_curs) numar_cursuri
from organizare_curs oc, sedii s
where oc.id_sediu = s.id_sediu
group by s.oras
having count(distinct oc.id_curs) > 1;

-----4-----
--topul tipurilor de produse cumparate
select  tp.id_tip, tp.tip_produs, sum(cantitate)
from comanda c, stoc s, tipuri_produse tp
where c.id_produs = s.id_produs and tp.id_tip = s.id_tip
group by tp.id_tip, tp.tip_produs;

--pentru fiecare tip de curs numele instructorului cu vechimea cea mai mare
select distinct a.nume || ' ' || a.prenume nume, i.data_angajare, c.tip
from angajati a, instructor i, curs c
where a.id_angajat = i.id_angajat and c.id_angajat = i.id_angajat
        and i.data_angajare <= all (select i2.data_angajare
                                    from instructor i2, curs c2
                                    where i2.id_angajat = c2.id_angajat
                                        and c2.tip = c.tip);
                                        
-----5----
--notele tuturor cursantilor la cursurile la care au participat
select c.id_cursant, c.nume_cursant || ' ' || c.prenume_cursant nume_cursant, c2.id_curs,
        avg(decode(least(cpc.data_predare, cpc.termen_limita), cpc.data_predare, nota, 0)) medie
from cursant c, curs_proiect_cursant cpc, curs c2
where c.id_cursant = cpc.id_cursant and cpc.id_curs = c2.id_curs
group by c.id_cursant, c.nume_cursant, c.prenume_cursant, c2.id_curs;
