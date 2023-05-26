--------------------15----------------
----------------outer-join-------------------
--prima varianta
select p.id_produs, p.nume_produs, t.tip_produs, f.nume_furnizor, count(id_comanda) nr_comenzi
from stoc p, tipuri_produse t, furnizori f, comanda c
where c.id_produs(+) = p.id_produs
    and p.id_tip(+) = t.id_tip
    and t.id_furnizor(+) = f.id_furnizor
group by p.id_produs, p.nume_produs, t.tip_produs, f.nume_furnizor
order by 5 desc;

------------------division-----------------
--numarul de proiecte realizat de fiecare cursant la fiecare curs
--observam ca 4006 realizeaza cu un proiect mai putin la cursul 107
select c.id_cursant, c.nume_cursant, cpc.id_curs, count(cpc.id_proiect) nr_proiecte
from cursant c, curs_proiect_cursant cpc
where c.id_cursant = cpc.id_cursant
group by c.id_cursant, c.nume_cursant, cpc.id_curs
order by 3;