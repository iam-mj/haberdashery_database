--CERIN??: Selecta?i comenzile care fac parte din tranzac?ii realizate în ultimele 30 de zile ?i care se refer? la un
-- produs de tip "cro?ete".
---------------------------------------------------INI?IAL-------------------------------------------------------------

select c.id_comanda, t.data, s.nume_produs
from comanda c join tranzactii t on (c.id_tranzactie = t.id_tranzactie)
    join stoc s on (s.id_produs = c.id_produs)
    join tipuri_produse tt on (s.id_tip = tt.id_tip)
where (sysdate - t.data) <= 30
    and lower(tt.tip_produs) = 'crosete';

--R1 = JOIN(comanda, tranzactie)
--R2 = JOIN(R1, stoc)
--R3 = JOIN(R2, tipuri_produse)
--R4 = SELECT(R3, sysdate - data <= 30)
--R5 = SELECT(R4, tip_produs = 'crosete')
--REZULTAT = R6 = PROJECT(R5, id_comanda, data, nume_produs)

---------------------------------------------------FINAL---------------------------------------------------------------

select id_comanda, data, nume_produs
from (select id_comanda, id_tranzactie, id_produs
      from comanda) R1,
      (select id_tranzactie, data
       from tranzactii
       where sysdate - data <= 30) R5,
      (select id_produs, id_tip, nume_produs
       from stoc) R3,
      (select id_tip, tip_produs
       from tipuri_produse
       where lower(tip_produs) = 'crosete') R6
where R1.id_tranzactie = R5.id_tranzactie
    and R3.id_tip = R6.id_tip
    and R1.id_produs = R3.id_produs;

--R1 = PROJECT(comanda, id_comanda, id_tranzactie, id_produs)
--R2 = PROJECT(tranzactie, id_tranzactie, data)
--R3 = PROJECT(stoc, id_produs, id_tip, nume_produs)
--R4 = PROJECT(tipuri_produse, id_tip, tip_produs)
--R5 = SELECT(R2, sysdate - data <= 30)
--R6 = SELECT(R4, tip_produs = 'crosete')
--R7 = JOIN(R1, R5) 
--R8 = JOIN(R3, R6)
--REZULTAT = R9 = JOIN(R7, R8)