create table SEDII(
    id_sediu number(3) constraint pk_sedii primary key,
    strada varchar2(25),
    oras varchar2(25) constraint null_oras_sedii not null, 
    email varchar2(25) constraint unq_email_sedii unique
);

create table ANGAJATI(
    id_angajat number(4),
    nume varchar2(20) constraint null_nume_ang not null,
    prenume varchar2(20) constraint null_prenume_ang not null,
    numar_de_telefon varchar2(15) constraint null_telefon_ang not null,
    email varchar2(20),
    constraint pk_ang primary key(id_angajat),
    constraint unq_nume_prenume_ang unique (nume, prenume),
    constraint unq_telefon_ang unique(numar_de_telefon),
    constraint unq_email_ang unique(email)
);

create table INSTRUCTOR(
    id_angajat number(4),
    data_angajare date default sysdate,
    constraint pk_instructor primary key(id_angajat),
    constraint fk_ang_instructor foreign key (id_angajat) references angajati(id_angajat) 
        on delete cascade
);

create table VANZATOR (
    id_angajat number(4),
    tura varchar2(15) constraint null_tura_vanzator not null,
    constraint pk_vanzator primary key(id_angajat),
    constraint fk_ang_vanzator foreign key (id_angajat) references angajati(id_angajat)
        on delete cascade
);

create table CURS (
    id_curs number(3),
    id_angajat number(4),
    tip varchar2(15),
    nivel varchar2(15) constraint null_nivel_curs not null,
    data_inceput date default sysdate,
    durata number(2),
    constraint pk_curs primary key(id_curs),
    constraint fk_curs_ang foreign key(id_angajat) references instructor(id_angajat)
        on delete set null,
    constraint ck_durata_curs check(durata > 0)
);

create table ORGANIZARE_CURS (
    id_curs number(3),
    id_sediu number(3),
    ziua_din_saptamana varchar2(15) constraint null_zi_organizare_curs not null,
    constraint pk_organizare_curs primary key (id_curs, id_sediu, ziua_din_saptamana),
    constraint fk_organizare_curs_curs foreign key(id_curs) references curs(id_curs)
        on delete cascade,
    constraint fk_organizare_curs_sedii foreign key(id_sediu) references sedii(id_sediu)
        on delete set null
);

create table CURSANT(
    id_cursant number(4),
    nume_cursant varchar2(20) constraint null_nume_cursant not null,
    prenume_cursant varchar2(20) constraint null_prenume_cursant not null,
    data_inregistrare date default sysdate,
    numar_de_telefon varchar2(20) constraint null_telefon_cursant not null,
    email varchar2(20),
    constraint pk_cursant primary key (id_cursant),
    constraint unq_nume_prenume_cursant unique(nume_cursant, prenume_cursant),
    constraint unq_telefon_cursant unique(numar_de_telefon),
    constraint unq_email_cursant unique(email)
);


create table PROIECT(
    id_proiect number(3),
    nume varchar2(25) constraint null_nume_proiect not null,
    dificultate number(1),
    constraint pk_proiect primary key (id_proiect),
    constraint ck_dificultate_mare_proiect check(dificultate > 0),
    constraint ck_dificultate_mic_proiect check(dificultate < 6)
);

create table CURS_PROIECT_CURSANT (
    id_cursant number(4),
    id_curs number(3),
    id_proiect number(3),
    termen_limita date,
    data_predare date,
    nota number(4, 2),
    constraint pk_curs_proiect_cursant primary key (id_cursant, id_curs, id_proiect),
    constraint fk_cursant_curs_proiect_cursant foreign key (id_cursant) references cursant(id_cursant)
        on delete cascade,
    constraint fk_curs_curs_proiect_cursant foreign key (id_curs) references curs(id_curs)
        on delete set null,
    constraint fk_proiect_curs_proiect_cursant foreign key (id_proiect) references proiect(id_proiect)
        on delete cascade
);

create table TRANZACTII (
    id_tranzactie number(3),
    id_angajat number(4),
    data date default sysdate,
    constraint pk_tranz primary key (id_tranzactie),
    constraint fk_tranz_ang foreign key (id_angajat) references vanzator(id_angajat)
        on delete set null
);

create table FURNIZORI (
    id_furnizor number(4),
    nume_furnizor varchar2(25) constraint null_nume_furnizori not null,
    numar_de_telefon varchar2(20) constraint null_telefon_furnizori not null,
    email varchar2(20),
    constraint pk_furnizori primary key (id_furnizor),
    constraint unq_telefon_furnizori unique (numar_de_telefon),
    constraint unq_email_furnizori unique (email)
);

create table TIPURI_PRODUSE(
    id_tip number(3),
    id_furnizor number(4),
    tip_produs varchar2(25) constraint null_tip_tipuri_prod not null,
    constraint pk_tipuri_prod primary key(id_tip),
    constraint fk_tipuri_prod_furnizori foreign key (id_furnizor) references furnizori(id_furnizor)
        on delete set null
);

create table STOC(
    id_produs number(3),
    id_tip number(3),
    nume_produs varchar2(25) constraint null_nume_stoc not null,
    pret number(5, 2),
    constraint pk_stoc primary key (id_produs),
    constraint fk_stoc_tip foreign key (id_tip) references tipuri_produse(id_tip)
        on delete set null,
    constraint ck_pret_stoc check(pret > 0)
);

create table COMANDA(
    id_comanda number(3),
    id_tranzactie number(3),
    id_produs number(3),
    cantitate number(2),
    constraint pk_comanda primary key (id_comanda, id_tranzactie),
    constraint fk_comanda_tranzactie foreign key (id_tranzactie) references tranzactii(id_tranzactie)
        on delete cascade,
    constraint fk_comanda_produs foreign key (id_produs) references stoc(id_produs)
        on delete set null,
    constraint ck_cantitate_comanda check (cantitate > 0)
);