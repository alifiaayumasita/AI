%facts
pria(parasara).
pria(abiyasa).
pria(sentani).
pria(prabu_pandu).
pria(prabu_destra).
pria(dewa_brata).
pria(kunta).
pria(bima).
pria(arjuna).
pria(sadewa).
pria(nakula).
pria(kurawa).
pria(dewa_brata).

wanita(durgandini).
wanita(ambiki).
wanita(dewi_gangga).
wanita(dewi_kunti).
wanita(dewi_gandari).
wanita(citra_wira).
wanita(citra_gada).

menikah(parasara,durgandini).
menikah(abiyasa,ambiki).
menikah(sentani,dewi_gangga).
menikah(prabu_pandu,dewi_kunti).
menikah(prabu_destra,dewi_gandari).

anak(abiyasa,parasara,durgandini).
anak(sentani,parasara,durgandini).
anak(prabu_pandu,abiyasa,ambiki).
anak(prabu_destra,abiyasa,ambiki).
anak(dewa_brata,sentani,dewi_gangga).
anak(citra_wira,sentani,dewi_gangga).
anak(citra_gada,sentani,dewi_gangga).
anak(kunta,prabu_pandu,dewi_kunti).
anak(bima,prabu_pandu,dewi_kunti).
anak(arjuna,prabu_pandu,dewi_kunti).
anak(nakula,prabu_pandu,dewi_kunti).
anak(sadewa,prabu_pandu,dewi_kunti).
anak(kurawa,prabu_destra,dewi_gandari).

%rules
ayah(A,B) :- anak(B,A,C),menikah(A,C),pria(A).
ibu(A,B) :- anak(B,C,A),menikah(C,A),wanita(A).
saudara(A,B) :- anak(A,X,Y),anak(B,X,Y),A\==B.
sepupu(A,B) :- ayah(X,A),ayah(Y,B),saudara(X,Y).
sepupu(A,B) :- ayah(X,A),ibu(Y,B),saudara(X,Y).
sepupu(A,B) :- ibu(X,A),ayah(Y,B),saudara(X,Y).
sepupu(A,B) :- ibu(X,A),ibu(Y,B),saudara(X,Y).
kakekbuyut(A,B) :- ayah(X,B),ayah(Y,X),ayah(A,Y).
kakekbuyut(A,B) :- ibu(X,B),ayah(Y,X),ayah(A,Y).
nenekbuyut(A,B) :- ayah(X,B),ayah(Y,X),ibu(A,Y).
nenekbuyut(A,B) :- ibu(X,B),ibu(Y,X),ibu(A,Y).
cucu(A,B) :- ayah(X,A),ayah(B,X).
cucu(A,B) :- ibu(X,A),ibu(B,X).
cucu(A,B) :- ayah(X,A),ibu(B,X).
cicit(A,B) :- ayah(X,A),ayah(Y,X),ayah(B,Y).
cicit(A,B) :- ayah(X,A),ayah(Y,X),ibu(B,Y).
kakek(A,B) :- ayah(X,B),ayah(A,X).
kakek(A,B) :- ibu(X,B),ayah(A,X).
nenek(A,B) :- ayah(X,B),ibu(A,X).
nenek(A,B) :- ibu(X,B),ibu(A,X).
keponakan(A,B) :- ayah(X,A),saudara(B,X).
keponakan(A,B) :- ayah(X,A),saudara(Y,X),menikah(Y,B).
paman(A,B) :- ayah(X,B),saudara(A,X).
bibi(A,B) :- ayah(X,B),saudara(Y,X),menikah(Y,A).
menantu(A,B,C) :- anak(X,B,C),menikah(X,A).
mertua(A,B,C) :- menikah(X,C),ayah(A,X),ibu(B,X).
ipar(A,B) :- saudara(X,B),menikah(X,A).