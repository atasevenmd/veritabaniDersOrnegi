use Kutuphane

create table adresler(
adres_no int primary key identity(1,1),
cadde varchar(20),
mahalle varchar(25),
sehir varchar(25),
posta_kodu int
)

create table uyeler(
u_no int primary key identity(1,1),
adsoyad varchar(40),
cinsiyet varchar(5),
telefon varchar(15),
e_posta varchar(50),
adres_no int,
constraint fk_adresu foreign key(adres_no) references adresler(adres_no)
)

create table kitaplar(
isbn varchar(30) primary key,
kitap_adi varchar(50),
sayfa_sayisi int,
yayin_tarihi datetime
)

create table kutuphane(
k_no int primary key identity(1,1),
k_ismi varchar(50),
adres_no int,
constraint fk_adresk foreign key(adres_no) references adresler(adres_no)
)

create table yazarlar(
yazar_no int primary key identity(1,1),
yazar_adsoyad varchar(50)
)

create table kategoriler(
kat_no int primary key identity(1,1),
kat_adi varchar(50)
)

create table kitap_kategori(
isbn varchar(30) not null,
kat_no int not null,
constraint fk_kitapkkat foreign key(isbn) references kitaplar(isbn),
constraint fk_kategori foreign key(kat_no) references kategoriler(kat_no)
)

create table kitap_yazar(
isbn varchar(30) not null,
yazar_no int not null,
constraint fk_kitapkyaz foreign key(isbn) references kitaplar(isbn),
constraint fk_yazar foreign key(yazar_no) references yazarlar(yazar_no)
)

create table kitap_kutuphane(
isbn varchar(30) not null,
kut_no int not null,
miktar int,
constraint fk_kitapkkut foreign key(isbn) references kitaplar(isbn),
constraint fk_kutuphane foreign key(kut_no) references kutuphane(k_no)
)

create table emanet(
emanet_no int primary key identity(1,1),
u_no int not null,
isbn varchar(30) not null,
kut_no int not null,
emanet_tarihi datetime,
teslim_tarihi datetime,
constraint fk_uyeler foreign key(u_no) references uyeler(u_no),
constraint fk_kitap foreign key(isbn) references kitaplar(isbn),
constraint fk_ktphane foreign key(kut_no) references kutuphane(k_no)
)