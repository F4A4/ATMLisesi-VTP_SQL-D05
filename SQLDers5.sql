/* VERÝ TABANI  DERSÝ SORGULAR MODÜLÜ ÖRNEK ÇALIÞMALARI */
--VERÝ TABANI OLUÞTURMA
create database Pazarlama
--Veritabanýný Silme
--drop database Pazarlama

--Kullanýlacak Veritabaný Belirleme
use Pazarlama

--Tablo Oluþturma
create table tblMusteri(
ID int primary key identity(1,1),
AdSoyad nvarchar(50),
DogumTarihi date,
Tel varchar(20),
Adres nvarchar(150),
) 
--Tablo Silme
--drop table tblMusteri

--Tablo Kayýt Ekleme
insert into tblMusteri(AdSoyad,DogumTarihi,Tel,Adres)
values('Fatma Altay','1996-04-29','322 678 89 99','Ahmet Özcan Cad.'),
('Aynur Uluþan','1996-04-29','322 678 89 99','Nalçacý Cad.'),
('Hafize Güngör','1996-04-29','322 678 89 99','Alaadin  Cad.'),
('Kübra D. Kahya','1996-04-29','322 678 89 99','LaleBahçe Cad.'),
('Emine Kamacý','1996-04-29','322 678 89 99','Muhacir Cad.')

------ÝLÝÞKÝSEL TABLO YAPMA-----

create table tblBirim(
ID int primary key identity(1,1),
BirimAd nvarchar (20)

)
insert into tblBirim values('Satýþ')
,('Depo')
,('Muhasebe')
,('Bilgi Ýþlem')
,('Ýdare')

create table tblPersonel(
ID int primary key identity(1,1),
Ad nvarchar(30),
Soyad nvarchar(20),
Maas money,
Eposta nvarchar(150),
BirimID int references tblBirim(ID) 
)

insert into tblPersonel
values('Adem',' Yerebakan',2200,'aa@hotmail.com',1)
,('Ece',' Gün',1500,'aa@hotmail.com',3)
,('Murat',' Apak',3000,'aa@hotmail.com',5)
,('Deniz',' Gece',2400,'aa@hotmail.com',4)
,('Melek',' Kader',1800,'aa@hotmail.com',2)
,('Emre',' Çalan',2100,'aa@hotmail.com',1)


--Seçme Sorgusu----
select * from tblMusteri
select * from tblBirim
select * from tblPersonel
-------------------------------------
--Tek Bir Alan Seçme
select AdSoyad from tblMusteri
--Birden Alaný Seçme
select AdSoyad,DogumTarihi from tblMusteri
--Birden Alaný Yer Deðiþtirerek Seçme 
select DogumTarihi,AdSoyad from tblMusteri

--Ýstenilen Kaydý veya Kayýtlarý Getirme

--Id'si 1 olan kaydý getirir
select * from tblMusteri
where ID=18

--Id'si 3 ve 2 olan kayýtlarý getirir
select * from tblMusteri
where ID=18 or ID=17

--AdSoyadý 'Fatma Altay' olaný getirir
select *from tblMusteri
where AdSoyad='Fatma Altay'

--Id'si 1 olan kaydý siler
delete from tblMusteri
where ID=19

--Kayýt Güncelleme
update tblMusteri
set AdSoyad='Arif UYSAL'
where ID=16

select * from tblMusteri
update tblMusteri
set AdSoyad='Arif UYSAL',DogumTarihi='1976-10-01',Adres='Mut Mersin'
where ID=16
select * from tblMusteri


--tblPersonel de bulunan maaþý 2000 den düþük kayýtlarý getirir
select * from tblPersonel
where Maas<=2000

--tblPersonel de bulunan maaþý 2000 den yüksek ve 2500 den düþük kayýtlarý getirir
select * from tblPersonel
where Maas>2000 and Maas<2500

--tblPersonel de bulunan maaþý 2000 den yüksek ve 2500 den düþük kayýtlarý getirir
select * from tblPersonel
where Maas between 2000 and 2500

select * from tblMusteri
where DogumTarihi>'1900-1-1'

select Ad+''+Soyad as 'Personel Adý Soyadý',Maas
from tblPersonel 
where Maas between 1500 and 2500

--Adý e harfi ile biten personelin adýný ve soyadýný 
--ayný kolonda getiren sql sorgusu 
select Ad+''+Soyad AdSoyad
from tblPersonel
where Ad Like '%e'

--Adýn içinde  e harfi bulunan personelin adýný ve soyadýný 
--ayný kolonda getiren sql sorgusu 
select Ad+''+Soyad AdSoyad
from tblPersonel
where Ad Like '%e%'

--Adý e harfi ile baþlayan personelin adýný ve soyadýný 
--ayný kolonda getiren sql sorgusu 
select Ad+''+Soyad AdSoyad
from tblPersonel
where Ad Like 'e%'

--Personel Tablosunda maaþý 3000 eþit olaný çaðýrýr.
select * from tblPersonel 
where Maas=3000

--Personel Tablosunda maaþý 3000 eþit olmayanlarý çaðýrýr.
select * from tblPersonel 
where Maas!=3000
--Buda maasýn önüne gelir ve 3000 eþit olmayanlarý çaðýrýr.
select * from tblPersonel
where not Maas=3000

--Maaþý 2000 ýle 3000 arasýnda olmayan
select * from tblPersonel
where Maas not between 2000 and 3000

--Maasý 1500 olan personellerin listesini 1650.50 olarak 
--deðiþtiren sql sorgusunu yazýnýz
select * from tblPersonel
update tblPersonel
set Maas =1650.50
where Maas =1500.00


--Maasý .50 ile biten personellerin listesini veren sql sorgusunu yazýnýz
select * from tblPersonel
where Maas like '%.50'

--Personel Tablosuna Yeni bir Personel eklemek için:
insert into tblPersonel(Ad,Soyad)
values ('Abdurrezzak','Karatoprak')
select * from tblPersonel

--delete from tblPersonel
--where ID between 8 and 19

--PERSONEL TABLOSUNDA NULL YAZAN KAYITLARI GETÝRÝR
select * from tblPersonel 
where Maas is null

--PERSONEL TABLOSUNDA NULL YAZMAYAN KAYITLARI GETÝRÝR
select * from tblPersonel 
where Maas is not null

--KÜÇÜKTEN BÜYÜÐE DOÐRU SIRALAMA
select * from tblPersonel
order by Maas

--BÜYÜKTEN KÜÇÜÐE DOÐRU SIRALAMA
select * from tblPersonel
order by Maas desc

--MAASI AYNI OLANLARI ADLARINA GÖRE SIRALAMA
select * from tblPersonel
order by Maas desc,Ad asc

-----SQL SORGULARI------------

---UPPER()SOYADI BÜYÜK HARFE ÇEVÝRÝR
select p.Ad+' '+UPPER(p.Soyad)
from tblPersonel p

--LOWER()SOYADI KÜÇÜK HARFE ÇEVÝRÝR
select p.Ad+' '+LOWER(p.Soyad)
from tblPersonel p

--SUBSTRÝNG()SOYADIN 1 VE 3. KARAKTERLERÝNÝ ALIR.
select p.Ad+' '+SUBSTRING(p.Soyad,1,3)
from tblPersonel p

--LEFT()SOYADIN ÝLK 3 KARAKTERÝNÝ ALIR.
select p.Ad+' '+LEFT(p.Soyad,3)
from tblPersonel p

--RIGHT()SOYADIN SON 3 KARAKTERÝNÝ ALIR.
select p.Ad+' '+RIGHT(p.Soyad,3)
from tblPersonel p

--COUNT()BÝZE KAÇ KAYIT OLDUÐUNU DÖNDÜRÜR.
select COUNT(p.Soyad)
from tblPersonel p

--LEN()BÝZE KARAKTERLERÝ SAYAR DÖNDÜRÜR
select p.Ad,LEN(p.Soyad) as 'Soyad daki karakter sayýsý'
from tblPersonel p

--CHARINDEX()
select CHARINDEX('@',m.Eposta,1)
from tblPersonel m

----------METOTLARI ÝÇ ÝÇE KULLANMA--------

select UPPER(LEFT(p.Ad,2))
from tblPersonel p

select UPPER(LEFT(p.Ad,2))
from tblPersonel p
