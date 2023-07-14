%sistem pakar jenis penyakit kucing
%kelompok 5
/*  Alifia Ayu Masita
    Andi Fadgam Izza Rizky
    Ragil Budhi Ajie    

   Link Video : https://drive.google.com/file/d/1ZVAx5RWjLyTI5ZtYDw_3Mqn9xmIoQZ2u/view?usp=sharing
*/

mulai:-
    judul,
    diagnosis,
    aturan(Nomor,Alasan),
    jawaban(Alasan,Jawab),
    write(Jawab),nl,
    retractall(observation(_)).
mulai:-
    write('Gejala tidak ada dalam daftar.'),nl,
    retractall(observation(_)).
judul:-
    write('PROGRAM SISTEM PAKAR PENYAKIT KUCING'),nl,
    write('DIAGNOSA PENYAKIT PADA KUCING ANDA'),nl,nl,
    write('jawab pertanyaan di bawah dengan y. atau t.'),nl,nl.

diagnosis:-
    pertanyaan(Tanya,Obs),
    write(Tanya),nl,
    read(Pilgan),
    Pilgan=y,
    assert(observation(Obs)),
    fail.

diagnosis.
pertanyaan('apakah suhu kucing anda diatas 37°C ?',demam).
pertanyaan('apakah kucing anda mengeluarkan air liur yang berlebihan ?',hipersalivasi).
pertanyaan('apakah pupil kucing anda membesar dan memerah ?',pupil_membesar).
pertanyaan('apakah kucing anda tidak nafsu makan ?',hilang_nafsu_makan).
pertanyaan('apakah kucing anda menjadi lebih agresif ?',agresif).
pertanyaan('apakah mata dan hidung kucing anda berair ?',mathid_berair).
pertanyaan('apakah kucing anda sering bersin ?',bersin).
pertanyaan('apakah kucing anda mengalami diare ?',diare).
pertanyaan('apakah kucing anda muntah ?',muntah).
pertanyaan('apakah kucing anda terlihat lesu ?',lesu).
pertanyaan('apakah kucing anda mengalami dehidrasi ?',dehidrasi).
pertanyaan('apakah kucing anda terlihat kurus ?',anoreksia).
pertanyaan('apakah kucing anda sering batuk ?',batuk).
pertanyaan('apakah ada luka pada lidah kucing anda ?',luka_lidah).

aturan(1,rabies):-
    observation(demam),
    observation(hipersalivasi),
    observation(pupil_membesar),
    observation(hilang_nafsu_makan),
    observation(agresif),
    not(observation(mathid_berair)),
    not(observation(bersin)),
    not(observation(diare)),
    not(observation(muntah)),
    not(observation(lesu)),
    not(observation(dehidrasi)),
    not(observation(anoreksia)),
    not(observation(batuk)),
    not(observation(luka_lidah)).
aturan(2,ispa):-
    observation(demam),
    not(observation(hipersalivasi)),
    observation(pupil_membesar),
    observation(hilang_nafsu_makan),
    not(observation(agresif)),
    observation(mathid_berair),
    observation(bersin),
    not(observation(diare)),
    not(observation(muntah)),
    observation(lesu),
    not(observation(dehidrasi)),
    not(observation(anoreksia)),
    not(observation(batuk)),
    not(observation(luka_lidah)).
aturan(3,panleukopenia):-
    not(observation(demam)),
    not(observation(hipersalivasi)),
    not(observation(pupil_membesar)),
    observation(hilang_nafsu_makan),
    not(observation(agresif)),
    not(observation(mathid_berair)),
    not(observation(bersin)),
    observation(diare),
    observation(muntah),
    observation(lesu),
    not(observation(dehidrasi)),
    not(observation(anoreksia)),
    not(observation(batuk)),
    not(observation(luka_lidah)).
aturan(4,endoparasit):-
    not(observation(demam)),
    not(observation(hipersalivasi)),
    not(observation(pupil_membesar)),
    observation(hilang_nafsu_makan),
    not(observation(agresif)),
    not(observation(mathid_berair)),
    not(observation(bersin)),
    observation(diare),
    not(observation(muntah)),
    observation(lesu),
    observation(dehidrasi),
    not(observation(anoreksia)),
    not(observation(batuk)),
    not(observation(luka_lidah)).
aturan(5,feline_chlamedya):-
    observation(demam),
    not(observation(hipersalivasi)),
    not(observation(pupil_membesar)),
    not(observation(hilang_nafsu_makan)),
    not(observation(agresif)),
    observation(mathid_berair),
    observation(bersin),
    not(observation(diare)),
    not(observation(muntah)),
    not(observation(lesu)),
    observation(dehidrasi),
    observation(anoreksia),
    not(observation(batuk)),
    not(observation(luka_lidah)).
aturan(6,feline_urinary_syndrom):-
    not(observation(demam)),
    not(observation(hipersalivasi)),
    not(observation(pupil_membesar)),
    observation(hilang_nafsu_makan),
    not(observation(agresif)),
    not(observation(mathid_berair)),
    not(observation(bersin)),
    not(observation(diare)),
    observation(muntah),
    observation(lesu),
    observation(dehidrasi),
    not(observation(anoreksia)),
    not(observation(batuk)),
    not(observation(luka_lidah)).
aturan(7,feline_calici_virus):-
    not(observation(demam)),
    not(observation(hipersalivasi)),
    not(observation(pupil_membesar)),
    observation(hilang_nafsu_makan),
    not(observation(agresif)),
    observation(mathid_berair),
    not(observation(bersin)),
    not(observation(diare)),
    not(observation(muntah)),
    not(observation(lesu)),
    not(observation(dehidrasi)),
    not(observation(anoreksia)),
    not(observation(batuk)),
    observation(luka_lidah).

jawaban(rabies, 'Kucing anda terindikasi rabies.').
jawaban(ispa, 'Kucing anda terindikasi ISPA atau Infeksi Saluran Pernafasan Akut.').
jawaban(panleukopenia, 'Kucing anda terindikasi Panleukopenia.').
jawaban(endoparasit, 'Kucing anda terindikasi inveksi endoparasit.').
jawaban(feline_chlamedya, 'Kucing anda terindikasi infeksi bakteri Feline Chlamedya.').
jawaban(feline_urinary_syndrom, 'Kucing anda terindikasi Feline Urinaru Syndrome.').
jawaban(feline_calici_virus, 'Kucing anda terindikasi inveksi Feline Calici Virus.').


