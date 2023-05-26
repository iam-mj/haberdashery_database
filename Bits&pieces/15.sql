------------------------------------------------OUTER-JOIN-----------------------------------------------------------
--CERIN??: Afi?a?i pentru fiecare furnizor tipurile de produse pe care le furnizeaz?, num?rul de produse de tipul 
--respectiv din stoc ?i num?rul de comenzi în care se reg?sesc produse din fiecare tip inclusiv pentru produsele 
--care nu se reg?sesc în nicio comand?. Ordona?i rezultatele dup? numele furnizorului.

select f.nume_furnizor, t.tip_produs, count(distinct s.id_produs), count(distinct c.id_comanda)
from furnizori f, tipuri_produse t, stoc s, comanda c
where f.id_furnizor = t.id_furnizor(+)
    and t.id_tip = s.id_tip(+)
    and s.id_produs = c.id_produs(+)
group by t.tip_produs, f.nume_furnizor
order by f.nume_furnizor;


------------------------------------------------DIVISION-------------------------------------------------------------
--CERIN??: S? se afi?eze id-ul ?i numele cursan?ilor care au realizat toate proiectele din cadrul unui curs la care au 
--participat, împreun? cu id-ul cursului respectiv ?i num?rul de proiecte. Ordona?i rezultatele dup? id-urile cursurilor.

select c.id_cursant, c.nume_cursant, cpc.id_curs, count(cpc.id_proiect) nr_proiecte
from cursant c, curs_proiect_cursant cpc
where c.id_cursant = cpc.id_cursant
group by c.id_cursant, c.nume_cursant, cpc.id_curs
having count(cpc.id_proiect) = (select count(distinct cpc2.id_proiect)
                                from curs_proiect_cursant cpc2
                                where cpc2.id_curs = cpc.id_curs)
order by 3;

--------------------------------------------------TOP-N----------------------------------------------------------------
--CERIN??: 	S? se afi?eze cele top 3 sedii care g?zduiesc cei mai mul?i cursan?i.

with curs_cursanti as (select id_curs, count(distinct id_cursant) nr_cursanti
                        from curs_proiect_cursant
                        group by id_curs)
select *
from (select s.id_sediu, concat(concat(strada, ' '), s.oras) adresa, sum(cc.nr_cursanti) total_cursanti
        from sedii s, organizare_curs oc, curs_cursanti cc
        where s.id_sediu = oc.id_sediu
            and oc.id_curs = cc.id_curs
        group by s.id_sediu, concat(concat(strada, ' '), s.oras)
        order by total_cursanti desc) top
where rownum <= 3;