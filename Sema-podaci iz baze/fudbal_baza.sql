
USE `fudbal_sb`;
SET NAMES utf8 ;

LOCK TABLES `fudbal_clanodbora` WRITE;
/*!40000 ALTER TABLE `fudbal_clanodbora` DISABLE KEYS */;
INSERT INTO `fudbal_clanodbora` VALUES (5,'Predsednik','Bakir','Dolovac','',2,''),(6,'Podpresednik','Novi','Dolovac','',2,''),(7,'Sekretar','Bakir','Dolovac','',2,''),(8,'Predsednik','Bakir','Mijailovic','',3,''),(9,'Podpresednik','Novi','Dolovac','',3,''),(10,'Sekretar','Nemanja','Dolovac','',3,''),(11,'Predsednik','Bakir','Markovic','odbor_img/20190509_121044_S1Voh9G.jpg',4,'dasdasdasdas'),(12,'Podpresednik','Bakir','Mijailovic','',4,'fsdfsdfsdfsdfsdsdf'),(13,'Predsednik','Bakir','Markovic','',5,'');
/*!40000 ALTER TABLE `fudbal_clanodbora` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `fudbal_delegat` WRITE;
/*!40000 ALTER TABLE `fudbal_delegat` DISABLE KEYS */;
INSERT INTO `fudbal_delegat` VALUES (1,'Bakir','Markovic','2019-11-03','sudija 2. kat -Srpska liga Istok','sudija.jpg'),(2,'Nemanja','Curic','2019-11-03','sudija 2. kat -Srpska liga Istok','delegat_img/nathan-rogers-I9HyW30buuQ-unsplash_42pdcQ5.jpg'),(3,'Sfklsfkl    Fsdjfklj','Ss',NULL,'sudija 2. kat -Srpska liga Istok','sudija.jpg');
/*!40000 ALTER TABLE `fudbal_delegat` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `fudbal_kazne` WRITE;
/*!40000 ALTER TABLE `fudbal_kazne` DISABLE KEYS */;
INSERT INTO `fudbal_kazne` VALUES (1,3,'Nije je se pojavio na utakmici','2019-11-13',5),(2,2,'sdas','2019-11-13',5),(3,3,'asdasdas','2019-11-13',6),(4,2,'asdasda','2019-11-13',3),(5,3,'asdas','2019-11-13',10),(6,2,'sdsad','2019-11-13',9);
/*!40000 ALTER TABLE `fudbal_kazne` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `fudbal_obavestenja` WRITE;
/*!40000 ALTER TABLE `fudbal_obavestenja` DISABLE KEYS */;
INSERT INTO `fudbal_obavestenja` VALUES (1,'Klub je izbacen iz lige','obavestenja/ФУДБАЛСКИ_САВЕЗ_ОПШТИНЕ_СОКОБАЊА_Искључење_из_лиге.docx');
/*!40000 ALTER TABLE `fudbal_obavestenja` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `fudbal_odbor` WRITE;
/*!40000 ALTER TABLE `fudbal_odbor` DISABLE KEYS */;
INSERT INTO `fudbal_odbor` VALUES (2,'Odbor za hitna pitanja'),(3,'Nadzorni odbor'),(4,'Rukovodstvo'),(5,'nemanja');
/*!40000 ALTER TABLE `fudbal_odbor` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `fudbal_propisi` WRITE;
/*!40000 ALTER TABLE `fudbal_propisi` DISABLE KEYS */;
INSERT INTO `fudbal_propisi` VALUES (1,'Pravila','propisi/ПРОПОЗИЦИЈЕ_ТАКМИЧЕЊА.docx');
/*!40000 ALTER TABLE `fudbal_propisi` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `fudbal_sezona` WRITE;
/*!40000 ALTER TABLE `fudbal_sezona` DISABLE KEYS */;
INSERT INTO `fudbal_sezona` VALUES (3,2000,3),(1,2018,2),(4,2019,2),(5,2019,3);
/*!40000 ALTER TABLE `fudbal_sezona` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `fudbal_slika` WRITE;
/*!40000 ALTER TABLE `fudbal_slika` DISABLE KEYS */;
INSERT INTO `fudbal_slika` VALUES (1,'Milica','2019-12-01 18:12:25.000000','galerija_img/20190509_121044.jpg',1),(2,'Nesto','2019-12-01 18:12:44.000000','galerija_img/CHECK.png',NULL),(3,'Nesto','2019-12-01 18:20:04.000000','galerija_img/20190509_115719_QRS68rZ.jpg',3),(4,'Milica','2019-12-02 00:36:36.000000','galerija_img/20190917_082328.jpg',1),(5,'bakir','2019-12-02 13:43:15.000000','galerija_img/liga_html.png',NULL),(6,'sda','2019-12-02 13:43:31.000000','galerija_img/20190509_121044_XlSo5es.jpg',NULL);
/*!40000 ALTER TABLE `fudbal_slika` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `fudbal_sudija` WRITE;
/*!40000 ALTER TABLE `fudbal_sudija` DISABLE KEYS */;
INSERT INTO `fudbal_sudija` VALUES (1,'Bakir','Curic','sudija 2. kat -Srpska liga Istok','1996-03-05','sudija.jpg'),(2,'Nemanja','Mijailovic','sudija 2. kat -Srpska liga zapad','2019-11-05','delegat_img/lesly-juarez-isWEKdSRCrA-unsplash_Y3Y2NF7.jpg'),(3,'Milica','Miljkov','sudija 3. kat -Srpska liga Istok','2002-11-06','delegat_img/sandro-schuh-HgwY_YQ1m0w-unsplash.jpg'),(4,'Timur','Curic','sudija 2. kat -Srpska liga Istok','2019-11-12','delegat_img/nathan-rogers-I9HyW30buuQ-unsplash.jpg'),(5,'Amra','Curic','sudija 2. kat -Srpska liga Istok',NULL,'sudija.jpg'),(6,'Bakir','Curic','sudija 2. kat -Srpska liga Istok','2019-11-20','delegat_img/20190509_121044.jpg'),(7,'Nemanja','Bole','sudija 2. kat -Srpska liga Istok','2019-11-20','delegat_img/20190509_121044_I8hfSn6.jpg');
/*!40000 ALTER TABLE `fudbal_sudija` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `fudbal_tim` WRITE;
/*!40000 ALTER TABLE `fudbal_tim` DISABLE KEYS */;
INSERT INTO `fudbal_tim` VALUES (1,'Real'),(2,'Barselona'),(3,'Partizan'),(4,'Novi Beograd'),(5,'Zvezda'),(6,'Novi Pazar'),(7,'Prag');
/*!40000 ALTER TABLE `fudbal_tim` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `fudbal_timovisokobanja` WRITE;
/*!40000 ALTER TABLE `fudbal_timovisokobanja` DISABLE KEYS */;
INSERT INTO `fudbal_timovisokobanja` VALUES (1,'KMF Ozren','Regionalna futsal liga - grupa Sever','logo_img/FK_Ozren.png'),(2,'FK Mladost (Resnik)','OFL Sokobanja','logo_img/FK_Mladost.jpg'),(3,'FK Jedinstvo (Mužinac)','OFL Sokobanja','logo_img/FK_Jedinstvo.jpg'),(4,'FK Hajduk (Rujevica)','Zaječarska okružna liga','logo_img/FK_Jedinstvo_25c22LO.jpg');
/*!40000 ALTER TABLE `fudbal_timovisokobanja` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `fudbal_timsezona` WRITE;
/*!40000 ALTER TABLE `fudbal_timsezona` DISABLE KEYS */;
INSERT INTO `fudbal_timsezona` VALUES (2,1,3,2),(3,1,4,3),(4,1,4,2),(5,1,4,1),(6,1,4,4),(7,0,4,6),(8,1,4,5),(9,1,3,1),(10,1,5,3),(11,1,5,1),(16,1,4,7);
/*!40000 ALTER TABLE `fudbal_timsezona` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `fudbal_tipsezone` WRITE;
/*!40000 ALTER TABLE `fudbal_tipsezone` DISABLE KEYS */;
INSERT INTO `fudbal_tipsezone` VALUES (2,'LIGA'),(3,'KUP');
/*!40000 ALTER TABLE `fudbal_tipsezone` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `fudbal_utakmica` WRITE;
/*!40000 ALTER TABLE `fudbal_utakmica` DISABLE KEYS */;
INSERT INTO `fudbal_utakmica` VALUES (27,4,50,0,'beogard','2019-11-22 23:26:01.000000',2,5,5,2,6,1,4),(28,1,2,1,'pozega','2019-11-22 23:44:15.000000',2,1,3,2,2,1,4),(29,3,4,1,'prag','2019-11-22 23:45:42.000000',1,2,4,2,4,1,4),(30,4,3,1,'pozega','2019-11-22 23:46:28.000000',2,1,3,1,5,2,4),(31,1,0,5,'prag','2019-11-22 23:48:25.000000',2,4,4,1,5,2,4),(32,1,NULL,NULL,'pozega','2019-11-22 23:55:15.000000',2,1,3,1,3,2,4),(35,4,1,2,'beogard','2019-12-03 00:26:47.000000',1,2,4,1,3,2,4);
/*!40000 ALTER TABLE `fudbal_utakmica` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `fudbal_vest` WRITE;
/*!40000 ALTER TABLE `fudbal_vest` DISABLE KEYS */;
INSERT INTO `fudbal_vest` VALUES (1,'Amra','dasdla;\'dlasd;\'asld;\'lasdlasld;\'asld;as;dl;\'asld;\'als;\'dla;\'','2019-12-01 18:18:15.000000'),(2,'Nesto','sadasd','2019-12-02 00:30:35.000000'),(3,'sadas','sadasdas','2019-12-02 00:30:45.000000'),(4,'Nemanja','gghghgh','2019-12-02 02:09:57.000000');
/*!40000 ALTER TABLE `fudbal_vest` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `fudbal_video` WRITE;
/*!40000 ALTER TABLE `fudbal_video` DISABLE KEYS */;
INSERT INTO `fudbal_video` VALUES (1,'https://www.youtube.com/embed/FGQTLVJk2es',1),(2,'https://www.youtube.com/embed/FGQTLVJk2es',3);
/*!40000 ALTER TABLE `fudbal_video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
