/** İlişkileri sonradan tanımlamak istiyorsak aşağıdaki gibi ilişkilendirebiliriz **/

alter table uyeler add constraint adres_uyeler foreign key(adres_no) references adresler(adres_no)
alter table kutuphane add constraint adres_kutuphane foreign key(adres_no) references adresler(adres_no)
alter table kitap_kategori add constraint fk_kitap foreign key(isbn) references kitaplar(isbn)
alter table kitap_kategori add constraint fk_kat foreign key(kat_no) references kategoriler(kat_no)

/** create, insert, alter gibi diller DDL diller olarak geçiyor **/