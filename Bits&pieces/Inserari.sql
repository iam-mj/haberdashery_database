insert into angajati 
values (seq_ang.nextval, 'Verdes', 'Maria', '0748239832', 'maria@gmail.com');
insert into angajati 
values (seq_ang.nextval, 'Bing', 'Chandler', '0734213422', 'friends14@gmail.com');
insert into angajati 
values (seq_ang.nextval, 'Geller', 'Monica', '0748453212', 'friends23@gmail.com');
insert into angajati 
values (seq_ang.nextval, 'Geller', 'Ross', '0748232432', 'friends24@gmail.com');
insert into angajati 
values (seq_ang.nextval, 'Green', 'Rachel', '0756234231', 'friends34@gmail.com');
insert into angajati 
values (seq_ang.nextval, 'Tribbiani', 'Joey', '0745534345', 'friends@gmail.com');
insert into angajati 
values (seq_ang.nextval, 'Buffay', 'Phoebe', '0734456456', 'friends32@gmail.com');
insert into angajati 
values (seq_ang.nextval, 'Cozma', 'Irinel', '0734452356', 'ico@gmail.com');
insert into angajati 
values (seq_ang.nextval, 'Asavinei', 'Maria', '0724321234', null);
insert into angajati 
values (seq_ang.nextval, 'Leahu', 'Silvia-Ioana', '0749229329', 'yoana@gmail.com');

select *
from angajati;

insert into instructor 
values (1000, to_date('13-10-2019', 'dd-mm-yyyy'));
insert into instructor
values (1007, to_date('27-02-2020', 'dd-mm-yyyy'));
insert into instructor
values (1008, to_date('18-06-2021', 'dd-mm-yyyy'));
insert into instructor (id_angajat)
values (1009);
insert into instructor
values (1006, to_date('29-03-2020', 'dd-mm-yyyy'));

select *
from instructor;

insert into vanzator
values (1001, 'dupa-amiaza');
insert into vanzator
values (1002, 'dimineata');
insert into vanzator
values (1003, 'dimineata');
insert into vanzator
values (1004, 'dupa-amiaza');
insert into vanzator
values (1005, 'seara');

select *
from vanzator;


insert into curs
values (seq_curs_.nextval, 1000, 'crosetat', 'incepatori', to_date('12-09-2021', 'dd-mm-yyyy'), 20);
insert into curs
values (seq_curs_.nextval, 1000, 'crosetat', 'incepatori', to_date('12-09-2022', 'dd-mm-yyyy'), 20);
insert into curs
values (seq_curs_.nextval, 1000, 'crosetat', 'avansati', to_date('14-09-2022', 'dd-mm-yyyy'), 25);
insert into curs
values (seq_curs_.nextval, 1000, 'crosetat', 'avansati', to_date('08-02-2023', 'dd-mm-yyyy'), 25);
insert into curs
values (seq_curs_.nextval, 1006, 'impletit', 'avansati', to_date('16-09-2022', 'dd-mm-yyyy'), 25);
insert into curs
values (seq_curs_.nextval, 1006, 'impletit', 'avansati', to_date('20-02-2023', 'dd-mm-yyyy'), 25);
insert into curs
values (seq_curs_.nextval, 1006, 'crosetat', 'avansati', to_date('10-02-2023', 'dd-mm-yyyy'), 25);
insert into curs
values (seq_curs_.nextval, 1007, 'brodat', 'incepatori', to_date('12-09-2022', 'dd-mm-yyyy'), 20);
insert into curs
values (seq_curs_.nextval, 1008, 'impletit', 'incepatori', to_date('14-09-2022', 'dd-mm-yyyy'), 20);
insert into curs
values (seq_curs_.nextval, 1008, 'impletit', 'incepatori', to_date('16-09-2022', 'dd-mm-yyyy'), 20);
insert into curs
values (seq_curs_.nextval, 1009, 'crosetat', 'incepatori', to_date('08-02-2023', 'dd-mm-yyyy'), 20);

select *
from curs;

insert into sedii
values (seq_sedii.nextval, 'Anton Vorel 4', 'Piatra Neamt', 'sediuPiatra@gmail.com');
insert into sedii
values (seq_sedii.nextval, 'Traian Popovici 130', 'Bucuresti', 'sediuDristor@gmail.com');
insert into sedii
values (seq_sedii.nextval, 'Constantin Nacu 9', 'Bucuresti', 'sediuUni@gmail.com');
insert into sedii
values (seq_sedii.nextval, 'Splaiul Independentei', 'Bucuresti', 'sediuRegie@gmail.com');
insert into sedii
values (seq_sedii.nextval, 'Pictor Arthur Verona', 'Bucuresti', 'sediuRomana@gmail.com');

select *
from sedii;

insert into organizare_curs
values (100, 203, 'luni');
insert into organizare_curs
values (100, 205, 'miercuri');
insert into organizare_curs
values (101, 203, 'luni');
insert into organizare_curs
values (102, 207, 'miercuri');
insert into organizare_curs
values (103, 206, 'joi');
insert into organizare_curs
values (103, 206, 'sambata');
insert into organizare_curs
values (104, 205, 'vineri');
insert into organizare_curs
values (104, 207, 'luni');
insert into organizare_curs
values (105, 203, 'marti');
insert into organizare_curs
values (106, 206, 'luni');
insert into organizare_curs
values (106, 206, 'marti');
insert into organizare_curs
values (107, 202, 'miercuri');
insert into organizare_curs
values (108, 205, 'vineri');
insert into organizare_curs
values (109, 207, 'joi');
insert into organizare_curs
values (109, 207, 'marti');
insert into organizare_curs
values (110, 206, 'miercuri');

select *
from organizare_curs;

insert into proiect
values (seq_proiect.nextval, 'Tote bag', 3);
insert into proiect
values(seq_proiect.nextval, 'Girafa amigurumi', 4);
insert into proiect
values(seq_proiect.nextval, 'Top cu maneci bufante', 5);
insert into proiect
values(seq_proiect.nextval, 'Vesta', 3);
insert into proiect
values(seq_proiect.nextval, 'Bandana', 2);
insert into proiect
values(seq_proiect.nextval, 'Fular', 1);
insert into proiect
values(seq_proiect.nextval, 'Caciula', 2);
insert into proiect
values(seq_proiect.nextval, 'Manusi', 2);
insert into proiect
values(seq_proiect.nextval, 'Pulover', 4);
insert into proiect
values(seq_proiect.nextval, 'Flori de primavara', 2);

select *
from proiect;

insert into cursant
values (seq_cursant.nextval, 'Sima', 'Alexandra', to_date('10.09.2022', 'dd.mm.yyyy'), '0732822383', null);
insert into cursant
values (seq_cursant.nextval, 'Loboda', 'Ilinca', to_date('01.09.2022', 'dd.mm.yyyy'), '0743827123', 'ili@gmail.com');
insert into cursant
values (seq_cursant.nextval, 'Tofan', 'Ruxandra', to_date('11.09.2022', 'dd.mm.yyyy'), '0767431213', 'ruxit@gmail.com');
insert into cursant
values (seq_cursant.nextval, 'Corfu', 'Denisa', to_date('10.09.2021', 'dd.mm.yyyy'), '0732823455', 'denyiubi@gmail.com');
insert into cursant
values (seq_cursant.nextval, 'Miron', 'Marta', to_date('05.01.2023', 'dd.mm.yyyy'), '0733214231', 'martuta@gmail.com');
insert into cursant
values (seq_cursant.nextval, 'Grigore', 'Ana', to_date('07.09.2022', 'dd.mm.yyyy'), '0724256345', 'ana@gmail.com');
insert into cursant
values (seq_cursant.nextval, 'Grigore', 'Ioana', to_date('11.08.2022', 'dd.mm.yyyy'), '0742027676', 'grioana@gmail.com');
insert into cursant
values (seq_cursant.nextval, 'Savoaia', 'Maria', to_date('01.09.2022', 'dd.mm.yyyy'), '0755684938', 'maria@gmail.com');

select *
from cursant;

insert into curs_proiect_cursant
values(4001, 102, 301, to_date('14.11.2022', 'dd.mm.yyyy'), to_date('13.11.2022', 'dd.mm.yyyy'), 8.5);
insert into curs_proiect_cursant
values(4001, 102, 302, to_date('12.10.2022', 'dd.mm.yyyy'), to_date('11.10.2022', 'dd.mm.yyyy'), 9.5);
insert into curs_proiect_cursant
values(4001, 102, 303, to_date('15.12.2022', 'dd.mm.yyyy'), to_date('13.12.2022', 'dd.mm.yyyy'), 9);
insert into curs_proiect_cursant
values(4001, 108, 306, to_date('13.10.2022', 'dd.mm.yyyy'), to_date('10.10.2022', 'dd.mm.yyyy'), 10);
insert into curs_proiect_cursant
values(4001, 108, 307, to_date('27.11.2022', 'dd.mm.yyyy'), to_date('21.11.2022', 'dd.mm.yyyy'), 9);
insert into curs_proiect_cursant
values(4002, 102, 301, to_date('14.11.2022', 'dd.mm.yyyy'), to_date('07.11.2022', 'dd.mm.yyyy'), 9.5);
insert into curs_proiect_cursant
values(4002, 102, 302, to_date('12.10.2022', 'dd.mm.yyyy'), to_date('10.10.2022', 'dd.mm.yyyy'), 9);
insert into curs_proiect_cursant
values(4002, 102, 303, to_date('15.12.2022', 'dd.mm.yyyy'), to_date('14.12.2022', 'dd.mm.yyyy'), 10);
insert into curs_proiect_cursant
values(4003, 101, 306, to_date('02.12.2022', 'dd.mm.yyyy'), to_date('29.11.2022', 'dd.mm.yyyy'), 9.3);
insert into curs_proiect_cursant
values(4004, 100, 305, to_date('16.11.2022', 'dd.mm.yyyy'), to_date('13.11.2022', 'dd.mm.yyyy'), 8.7);
insert into curs_proiect_cursant
values(4005, 105, 303, to_date('28.04.2023', 'dd.mm.yyyy'), to_date('23.04.2023', 'dd.mm.yyyy'), 9);
insert into curs_proiect_cursant
values(4005, 106, 309, to_date('27.04.2023', 'dd.mm.yyyy'), to_date('25.04.2022', 'dd.mm.yyyy'), 9.5);
insert into curs_proiect_cursant
values(4006, 107, 310, to_date('18.11.2022', 'dd.mm.yyyy'), to_date('16.11.2022', 'dd.mm.yyyy'), 10);
insert into curs_proiect_cursant
values(4007, 107, 310, to_date('29.11.2022', 'dd.mm.yyyy'), to_date('30.11.2022', 'dd.mm.yyyy'), 9.5);
insert into curs_proiect_cursant
values(4007, 107, 301, to_date('22.10.2022', 'dd.mm.yyyy'), to_date('20.10.2022', 'dd.mm.yyyy'), 9);
insert into curs_proiect_cursant
values(4007, 109, 306, to_date('26.11.2022', 'dd.mm.yyyy'), to_date('23.11.2022', 'dd.mm.yyyy'), 9);
insert into curs_proiect_cursant
values(4007, 109, 308, to_date('29.10.2022', 'dd.mm.yyyy'), to_date('25.10.2022', 'dd.mm.yyyy'), 9.5);
insert into curs_proiect_cursant
values(4008, 104, 304, to_date('25.11.2022', 'dd.mm.yyyy'), to_date('25.11.2022', 'dd.mm.yyyy'), 9.5);

select *
from curs_proiect_cursant;

insert into tranzactii (id_tranzactie, id_angajat)
values (seq_tranz.nextval, 1001);
insert into tranzactii
values (seq_tranz.nextval, 1001, to_date('13.04.2023', 'dd.mm.yyyy'));
insert into tranzactii
values (seq_tranz.nextval, 1002, to_date('13.04.2023', 'dd.mm.yyyy'));
insert into tranzactii
values (seq_tranz.nextval, 1002, to_date('15.04.2023', 'dd.mm.yyyy'));
insert into tranzactii
values (seq_tranz.nextval, 1003, to_date('17.04.2023', 'dd.mm.yyyy'));
insert into tranzactii
values (seq_tranz.nextval, 1003, to_date('18.04.2023', 'dd.mm.yyyy'));
insert into tranzactii
values (seq_tranz.nextval, 1004, to_date('18.04.2023', 'dd.mm.yyyy'));
insert into tranzactii
values (seq_tranz.nextval, 1004, to_date('19.04.2023', 'dd.mm.yyyy'));
insert into tranzactii
values (seq_tranz.nextval, 1005, to_date('20.04.2023', 'dd.mm.yyyy'));
insert into tranzactii
values (seq_tranz.nextval, 1005, to_date('23.04.2023', 'dd.mm.yyyy'));

select *
from tranzactii;

insert into furnizori
values (seq_furnizori.nextval, 'Andrele', '0747231123', null);
insert into furnizori
values (seq_furnizori.nextval, 'GrannyMary', '0753423123', 'mary@gmail.com');
insert into furnizori
values (seq_furnizori.nextval, 'Nasturel', '0785693231', 'nasturel@gmail.com');
insert into furnizori
values (seq_furnizori.nextval, 'Bobine SRL', '0734122122', 'bobine@gmail.com');
insert into furnizori
values (seq_furnizori.nextval, 'Tesaturi', '0782728273', null);

select *
from furnizori;

insert into tipuri_produse
values (seq_tipuri.nextval, 701, 'andrele');
insert into tipuri_produse
values (seq_tipuri.nextval, 701, 'crosete');
insert into tipuri_produse
values (seq_tipuri.nextval, 702, 'amigurumi');
insert into tipuri_produse
values (seq_tipuri.nextval, 703, 'nasturi');
insert into tipuri_produse
values (seq_tipuri.nextval, 704, 'bobine');
insert into tipuri_produse
values (seq_tipuri.nextval, 705, 'tesaturi');

select *
from tipuri_produse;

insert into stoc
values(seq_produs.nextval, 810, 'andrele 5.0', 8);
insert into stoc
values(seq_produs.nextval, 810, 'andrele 7.0', 9);
insert into stoc
values(seq_produs.nextval, 811, 'croseta ergonomica 3.5', 10);
insert into stoc
values(seq_produs.nextval, 811, 'croseta ergonomica 5.5', 11);
insert into stoc
values(seq_produs.nextval, 811, 'croseta plastic 5.0', 7);
insert into stoc
values(seq_produs.nextval, 812, 'urs plus', 23);
insert into stoc
values(seq_produs.nextval, 812, 'broasca rotunda', 15);
insert into stoc
values(seq_produs.nextval, 813, 'nasture lemn 3mm', 2);
insert into stoc
values(seq_produs.nextval, 813, 'nasture plastic negru 4.5mm', 1.5);
insert into stoc
values(seq_produs.nextval, 814, 'bobina lana alba 5', 17);
insert into stoc
values(seq_produs.nextval, 814, 'bob alize bumbac negru 3', 18);
insert into stoc
values(seq_produs.nextval, 814, 'bob alize acril albstr 4', 15);
insert into stoc
values(seq_produs.nextval, 815, 'dantela neagra 1m', 25);

select *
from stoc;

insert into comanda
values (seq_comanda.nextval, 501, 854, 1);
insert into comanda
values (seq_comanda.nextval, 501, 865, 3);
insert into comanda
values (seq_comanda.nextval, 502, 866, 3);
insert into comanda
values (seq_comanda.nextval, 502, 858, 4);
insert into comanda
values (seq_comanda.nextval, 503, 856, 1);
insert into comanda
values (seq_comanda.nextval, 504, 856, 2);
insert into comanda
values (seq_comanda.nextval, 505, 857, 3);
insert into comanda
values (seq_comanda.nextval, 505, 863, 2);
insert into comanda
values (seq_comanda.nextval, 506, 854, 1);
insert into comanda
values (seq_comanda.nextval, 506, 860, 2);
insert into comanda
values (seq_comanda.nextval, 506, 858, 3);
insert into comanda
values (seq_comanda.nextval, 507, 863, 2);
insert into comanda
values (seq_comanda.nextval, 508, 866, 2);
insert into comanda
values (seq_comanda.nextval, 509, 852, 1);
insert into comanda
values (seq_comanda.nextval, 510, 855, 1);

select *
from comanda;
