--***** Veritabanı Oluşturma *****--

create database Sinif_101

-- Bu komut ile "Sinif_101" adında bir veritabanı oluşturuluyor --
--*******************************--

--***** "Sinif_101" Veritabanını Kullanma *****--

use Sinif_101

-- Bu komut ile "Sinif_101" veritabanı kullanılmaya başlanıyor --
--*******************************--

--***** Tablo Oluşturma *****--

create table Ogrenciler
(
    ID int Primary key identity(1,1) not null,
    OgrenciAd Nvarchar(35) not null,
    OgrenciSoyad nvarchar(20) not null,
    Adres nvarchar(255) ,
    DogumTarihi datetime ,
    Not1 tinyint not null,
    Not2 tinyint,
)
-- Bu komut ile "Ogrenciler" adında bir tablo oluşturuluyor -- 
--*******************************--

--***** Başka Bir Veritabanı ve Tablo Oluşturma *****--

create database SStok
go
use SStok

create table Kategoriler
(
    KategoriId int primary key identity(1,1) not null,
    KategoriAdi nvarchar(50) not null,
    Aciklama nvarchar(150),
)
go
create table Urunler
(
    UrunID int Primary key identity(1,1) not null,
    KategoriAdi nvarchar(50) not null,
    UrunAdi nvarchar(50) not null,
    Fiyat money not null,
    StokMiktari int not null
)
-- Bu kod bloğu "SStok" adında bir veritabanı oluşturup içinde "Kategoriler" ve "Urunler" adında iki tablo oluşturuyor --
--*******************************--

--***** Kolon Ekleme *****--

Alter Table Ogrenciler add Ogretmen nvarchar(25)

-- Bu komut ile "Ogrenciler" tablosuna "Ogretmen" adında bir kolon ekleniyor -- 
--*******************************--


--***** Kolon Güncelleme *****--

alter table Ogrenciler alter column Ogretmen money not null

-- Bu komut ile "Ogretmen" kolonunun veri tipi "money" olarak güncelleniyor -- 
--*******************************--



--***** Kolon Silme *****--

alter table Ogrenciler drop column Ogretmen

-- Bu komut ile "Ogrenciler" tablosundaki "Ogretmen" kolonu siliniyor --
--*******************************--

--***** Foreign Key Ekleme *****--

alter table Ogrenciler add  OgretmenID int not null 
    Constraint FK_Ogrenci_Ogretmen
    references Ogretmenler(ID)

-- Bu komut ile "Ogrenciler" tablosuna "OgretmenID" adında bir int kolon ekleniyor ve bu kolon "Ogretmenler" tablosundaki "ID" kolonuna referans veriyor --
--*******************************--

--***** Veri Ekleme *****--

insert into Ogretmenler (OgretmenAdi,OgretmenSoyad,Brans) values ('Leyla','Kabakçı','Bilgisayar')

--Bu komut ile "Ogretmenler" tablosuna yeni bir öğretmen ekleniyor --
--*******************************--

--***** Join ile Veri Getirme *****--

select
    OgrenciAd,
    OgrenciSoyad,
    OgretmenAdi,
    OgretmenSoyad,
    Brans
from Ogrenciler inner join Ogretmenler on Ogrenciler.OgretmenID=Ogretmenler.ID

-- Bu sorgu ile "Ogrenciler" ve "Ogretmenler" tablolarını birleştirip belirtilen kolonları seçiyor --
--*******************************--
