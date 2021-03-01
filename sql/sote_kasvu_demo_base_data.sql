-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 25.02.2021 klo 14:39
-- Palvelimen versio: 10.3.27-MariaDB-0+deb10u1
-- PHP Version: 7.3.19-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sote_kasvu`
--

-- --------------------------------------------------------

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`module_id`, `name`) VALUES
(1, 'Kasvun ja osallisuuden edistäminen'),
(2, 'Hyvinvoinnin ja toimintakyvyn edistäminen');


-- --------------------------------------------------------

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `module_id`, `name`) VALUES
(1, 1, 'Opiskelija työskentelee kasvatus-, sosiaali- ja terveysalan työn säädösten, määräysten, toimintaperiaatteiden, arvojen ja ammattieettisten ohjeiden mukaan.'),
(2, 1, 'Opiskelija suunnittelee työtään ja tekee yhteistyötä työryhmän kanssa.'),
(3, 1, 'Opiskelija suunnittelee, toteuttaa ja arvioi kasvun ja osallisuuden edistämistä.'),
(4, 1, 'Opiskelija toimii vuorovaikutuksessa asiakkaan kanssa.'),
(5, 1, 'Opiskelija edistää kasvua ja osallisuutta käyttäen alan työmenetelmiä, -välineitä ja materiaaleja.'),
(6, 1, 'Opiskelija ohjaa ja avustaa päivittäisissä toiminnoissa.'),
(7, 1, 'Opiskelija huolehtii asiakkaan hyvinvoinnista, terveydestä ja turvallisuudesta.'),
(8, 1, 'Opiskelija antaa tietoa palveluista.'),
(9, 1, 'Opiskelija ylläpitää turvallisuutta, työkykyään ja työhyvinvointiaan.'),
(10, 1, 'Opiskelija arvioi ja kehittää toimintaansa.'),
(11, 2, 'Opiskelija työskentelee lähihoitajan työtä ohjaavien säädösten ja ohjeiden mukaan.'),
(12, 2, 'Opiskelija suunnittelee työtään.'),
(13, 2, 'Opiskelija toimii vuorovaikutuksessa asiakkaan kanssa.'),
(14, 2, 'Opiskelija käyttää asiakkaan toimintakykyä edistävää ja voimavaralähtöistä työotetta.'),
(15, 2, 'Opiskelija motivoi asiakasta terveyttä ja hyvinvointia edistävään omahoitoon ja ehkäisemään riskejä.'),
(16, 2, 'Opiskelija ohjaa asiakasta toiminnallisuuteen.'),
(17, 2, 'Opiskelija käyttää alan työmenetelmiä, -välineitä ja materiaaleja asiakkaan perushoidossa ja huolenpidossa, saattohoidossa ja lääkehoidossa.'),
(18, 2, 'Opiskelija antaa tietoa palveluista.'),
(19, 2, 'Opiskelija ohjaa apuvälineiden ja hyvinvointia tukevan teknologian käytössä ja huollossa.'),
(20, 2, 'Opiskelija ylläpitää turvallisuutta, työkykyään ja työhyvinvointiaan.'),
(21, 2, 'Opiskelija kehittää toimintaansa ja perustelee ratkaisujaan ammatillisella tiedolla.');

-- --------------------------------------------------------

--
-- Dumping data for table `criteria`
--

INSERT INTO `criteria` (`criteria_id`, `category_id`, `text`) VALUES

/* module 1 - Kasvun ja osallisuuden edistäminen */

(1, 1, 'toimii asiakkaan perus- ja ihmisoikeuksia kunnioittaen\n'),
(2, 1, 'noudattaa kasvatus-, sosiaali- ja terveysalan lainsäädäntöä, määräyksiä, toimintaperiaatteita ja työpaikan ohjeita työryhmän kanssa\r\n'),
(3, 1, 'toimii kasvatus-, sosiaali- ja terveysalan työn arvojen ja lähihoitajan ammattieettisten ohjeiden mukaan\r\n'),
(4, 1, 'noudattaa tietosuojaa ja salassapitoa\r\n'),
(5, 1, 'työskentelee laatusuositusten ja omavalvontamääräysten mukaan työryhmän ohjaamana\r\n'),
(6, 1, 'toimii kestävän kehityksen periaatteiden mukaan\r\n'),

(7, 2, 'suunnittelee työtehtäviään työpaikan toiminnan mukaan\r\n'),
(8, 2, 'tekee yhteistyötä työryhmän kanssa'),
(9, 2, 'viestii ja dokumentoi työpaikan käytäntöjen mukaisesti työryhmän ohjaamana'),

(10, 3, 'hankkii tietoa asiakkaan kasvusta ja kehityksestä eri tiedonkeruumenetelmiä käyttäen'),
(11, 3, 'hankkii tietoa asiakkaan toimintakyvystä ja voimavaroista sekä toiveista ja kiinnostuksen kohteista\r\n'),
(12, 3, 'hankkii tietoa asiakkaan toimintakyvystä ja voimavaroista sekä toiveista ja kiinnostuksen kohteista'),
(13, 3, 'asettaa asiakkaan kasvua ja osallisuutta edistäviä tavoitteita'),
(14, 3, 'hankkii tietoa asiakkaan toimintakyvystä ja voimavaroista sekä toiveista ja kiinnostuksen kohteista'),
(15, 3, 'asettaa asiakkaan kasvua ja osallisuutta edistäviä tavoitteita'),
(16, 3, 'osallistuu työryhmässä asiakastyön suunnitteluun'),
(17, 3, 'työskentelee suunnitelman mukaan ja arvioi toiminnan toteutumista'),

(18, 4, 'kohtaa asiakkaan ja läheiset arvostavasti, huomioi yksilölliset tilanteet ja luo myönteisen vuorovaikutustilanteen edistäen yhdessä toimimista'),
(19, 4, 'on läsnä ja saatavilla osoittaen eri tavoin kiinnostusta asiakasta kohtaan ja käyttää läsnäoloa tavoitteellisesti'),
(20, 4, 'havaitsee asiakkaan vuorovaikutusaloitteita, tunnistaa ilmaisun eri muotoja, vastaa niihin ja tukee asiakasta ilmaisussa'),
(21, 4, 'ottaa huomioon asiakkaan kielen, kulttuurin ja katsomuksen yksilöllisesti vuorovaikutustilanteissa'),
(22, 4, 'mukauttaa vuorovaikutustaan asiakkaan tarpeita vastaavaksi hyödyntäen monipuolisesti puhetta tukevia ja korvaavia kommunikointikeinoja ja selkokieltä.'),

(23, 5, 'käyttää työssään monipuolisesti tietoa ihmisen fyysisestä, psyykkisestä ja sosiaalisesta kehityksestä elämänkulun eri vaiheissa soveltaen tietoa yksilöllisesti'),
(24, 5, 'tunnistaa vahvuuksia ja tuen tarpeita fyysisen, tiedollisen, taidollisen, tunne-elämän ja sosiaalisen kehityksen osa-alueilla ja soveltaa tietoa yksilöllisesti työssään'),
(25, 5, 'tunnistaa ihmisen toimintaan vaikuttavia psykologisia tekijöitä ja ja hyödyntää tietoa työssään perustellen toimintaansa'),
(26, 5, 'mahdollistaa asiakkaalle monipuolisia onnistumisen kokemuksia ja tukee asiakkaan myönteistä käsitystä itsestään eri tilanteissa'),
(27, 5, 'käyttää voimavara- ja asiakaslähtöisesti toiminnallisia menetelmiä kasvun ja oppimisen edistämisessä'),
(28, 5, 'hyödyntää ympäristön tarjoamia mahdollisuuksia toiminnassa monipuolisesti ja asiakaslähtöisesti'),
(29, 5, 'luo monipuolisia mahdollisuuksia oppimiseen ja taitojen vahvistamiseen arjen tilanteissa ja kannustaa oppimiseen'),
(30, 5, 'työskentelee varhaisen tuen ja ehkäisevän työn periaatteiden mukaisesti perustellen toimintaansa.'),
(31, 5, 'tukee asiakkaan toimijuutta ja valintojen tekemistä eri tilanteissa hyödyntäen tietoa osallisuudesta'),
(32, 5, 'ohjaa tavoitteellisesti yhdessä toimimista ja ryhmän toimintaa tunnistaen ryhmäilmiöitä'),
(33, 5, 'huolehtii asiakkaan mahdollisuudesta osallistua toimintaan edellytystensä ja kiinnostuksensa mukaisesti'),
(34, 5, 'käyttää toiminnallisia menetelmiä asiakaslähtöisesti ja hyödyntää taiteen tai kulttuurin mahdollisuuksia osallisuuden edistämisessä'),
(35, 5, 'toimii haasteellisissa ja ristiriitatilanteissa rakentavasti yhdessä toimimista edistäen'),

(36, 6, 'ohjaa ja avustaa asiakkaita päivittäisissä toiminnoissa voimavaralähtöisesti ja omatoimisuutta edistäen sekä perustelee toimintaansa'),
(37, 6, 'järjestää toimintaympäristöä esteettömäksi ja omatoimisuutta motivoivaksi ja edistäväksi yhdessä asiakkaan kanssa'),
(38, 6, 'ohjaa ja luo monipuolisia mahdollisuuksia turvalliseen ja säännölliseen liikkumiseen'),
(39, 6, 'hyödyntää apuvälineitä ja teknologiaa turvallisesti ja asiakaslähtöisesti perustellen toimintaansa.'),

(40, 7, 'havainnoi monipuolisesti asiakkaan vointia ja terveydentilaa ja toimii tilanteen vaatimalla tavalla hyödyntäen näyttöön perustuvaa tietoa'),
(41, 7, 'tunnistaa monipuolisesti asiakkaan turvallisuuteen vaikuttavia tekijöitä, ennakoi turvallisuusriskejä ja vaaratilanteita sekä huolehtii turvallisuudesta yhdessä asiakkaan kanssa'),
(42, 7, 'huolehtii ja ohjaa asiakasta huolehtimaan ympäristönsä puhtaudesta, viihtyisyydestä ja toimivuudesta huomioiden asiakkaan toiveita ja tarpeita'),
(43, 7, 'tukee monipuolisesti asiakkaan positiivista mielenterveyttä ja ohjaa havainnoimaan hyvinvointia edistäviä tekijöitä'),
(44, 7, 'edistää asiakkaan kykyä huolehtia itsestään sekä tukee asiakaslähtöisesti valinnoissa ja päätöksenteossa huomioiden asiakkaan itsemääräämisoikeuden'),
(45, 7, 'ohjaa ja avustaa asiakasta ruokailussa perustellen monipuolisesti toimintaansa tiedolla suun terveydestä, ravitsemussuosituksista, erityisruokavalioista sekä uskonnollisista ja eettisistä ruokavalioista.'),

(46, 8, 'antaa asiakkaalle ja lähiverkostolle monipuolisesti tietoa kasvatus-, sosiaali- ja terveysalan palveluista ja etuuksista'),
(47, 8, 'ohjaa ja tukee asiakasta ja hänen läheisiään palveluita koskevassa päätöksenteossa ja palveluiden käytössä'),
(48, 8, 'osallistuu työryhmässä sosiaali- ja terveydenhuollon ohjaus-, yhteydenotto- ja ilmoitusvelvollisuuden toteuttamiseen.'),

(49, 9, 'noudattaa työturvallisuusohjeita'),
(50, 9, 'toimii hygienia- ja aseptiikkaohjeistuksen mukaisesti'),
(51, 9, 'huolehtii työkyvystään ja tunnistaa omien valintojensa vaikutuksia työkykyynsä'),
(52, 9, 'edistää toiminnallaan myönteistä työilmapiiriä'),
(53, 9, 'työskentelee huomioiden työn riski- ja kuormitustekijöitä'),
(54, 9, 'toimii ergonomian periaatteiden mukaisesti vaihtelevissa työtilanteissa'),

(55, 10, 'arvioi realistisesti ja monipuolisesti omaa oppimistaan ja osaamistaan'),
(56, 10, 'tunnistaa omia vahvuuksiaan ja kehittämisalueitaan sekä asettaa tavoitteita ammatilliselle kasvulleen hyödyntäen monipuolisesti työpaikan tarjoamia oppimismahdollisuuksia'),
(57, 10, 'arvioi ja kehittää työtään oma-aloitteisesti saamansa palautteen perusteella'),
(58, 10, 'tekee työssään valintoja ja ratkaisee ongelmia joustavasti erilaisissa tilanteissa työryhmän jäsenenä'),
(59, 10, 'ylläpitää ja kehittää aktiivisesti ammatin edellyttämiä tietoja ja taitoja.'),

/* module 2 - Hyvinvoinnin ja toimintakyvyn edistäminen */

(60, 11, 'noudattaa sosiaali- ja terveysalan säädöksiä, säännöksiä, määräyksiä ja eettisiä periaatteita muuttuvissa tilanteissa.\r\n'),
(61, 11, 'toimii kestävän kehityksen periaatteiden mukaisesti ja perustelee toimintaansa.\r\n'),

(62, 12, 'asettaa tavoitteita työlleen yhdessä asiakkaiden kanssa tarve- ja kulttuurilähtöisesti ja suunnittelee työtään sen pohjalta.\r\n'),
(63, 12, 'esittää vaihtoehtoisia toimintatapoja ja tekee työtä asiakaslähtöisesti perustellen toimintaansa.\r\n'),
(64, 12, 'suunnittelee päivittäiset ja viikoittaiset työtehtävänsä ja ottaa huomioon työpaikan muut toiminnan suunnitelmat.\r\n'),
(65, 12, 'toimii moniammatillisen työryhmän jäsenenä lähihoitajan vastuualueella.\r\n'),
(66, 12, 'osallistuu asiakkaalle tehtävän terveyttä ja hyvinvointia edistävän suunnitelman laatimiseen yhdessä asiakkaan ja läheistensä kanssa.\r\n'),
(67, 12, 'toteuttaa suunnitelmaa yhdessä työryhmän kanssa.\r\n'),
(68, 12, 'perehtyy työpaikan eri omavalvontasuunnitelmiin ja toteuttaa yksikön omavalvontaa osana työryhmää.\r\n'),
(69, 12, 'työskentelee omavalvontamääräysten mukaisesti.\r\n'),

(70, 13, 'toimii ammatillisesti vuorovaikutustilanteissa osana työryhmää.\r\n'),
(71, 13, 'huomioi oman käyttäytymisensä vaikutukset vuorovaikutustilanteissa.\r\n'),
(72, 13, 'ohjaa asiakasta toistuvissa päivittäisissä tilanteissa hyödyntäen selkokieltä ja puhetta tukevia ja korvaavia kommunikointikeinoja.\r\n'),
(73, 13, 'kohtaa asiakkaan ja tämän lähiverkoston työryhmän jäsenenä.\r\n'),
(74, 13, 'huomioi asiakkaan eleet ja ilmeet.\r\n'),
(75, 13, 'käyttää kosketusta vuorovaikutuksen tukena.\r\n'),

(76, 14, 'arvioi asiakkaan voimavarat hyödyntäen havainnointia sekä asiakkaan ja omaisten haastattelua.\r\n'),
(77, 14, 'käyttää suunnitelmallisesti, tavoitteellisesti ja joustavasti asiakkaan toimintakykyä edistävää voimavaralähtöistä työotetta.\r\n'),
(78, 14, 'kuulee asiakkaan mielipiteitä ja toiveita tukien monipuolisesti asiakkaan osallisuutta ja elämän merkityksellisyyttä.\r\n'),
(79, 14, 'huomioi asiakkaan läheiset ja sosiaalisen hyvinvoinnin verkostot.\r\n'),

(80, 15, 'motivoi itsenäisesti asiakasta terveyttä ja hyvinvointia edistävään omahoitoon sekä elämäntapamuutoksiin.\r\n'),
(81, 15, 'edistää monipuolisesti erilaisten ja eri-ikäisten asiakkaiden fyysistä ja psyykkistä terveyttä sekä turvallisuutta ja hyvinvointia muuttuvissa tilanteissa.\r\n'),
(82, 15, 'tunnistaa perhe- ja lähisuhdeväkivallan uhkan ja kaltoinkohtelun ja ottaa sen puheeksi työryhmässä.\r\n'),
(83, 15, 'tunnistaa, ehkäisee ja ohjaa asiakasta välttämään kansanterveydellisiä riskejä ja tapaturmia.\r\n'),
(84, 15, 'tarjoaa asiakkaalle mahdollisuuksia selviytyä päivittäisissä toiminnoissa hyödyntäen asiakkaan omaa verkostoa ja ympäristön tarjoamia mahdollisuuksia.\r\n'),

(85, 16, 'ohjaa ja kannustaa asiakasta toiminnallisuuteen päivittäisissä toiminnoissa.\r\n'),
(86, 16, 'mahdollistaa asiakkaalle soveltuvan liikunnan ja ulkoilun.\r\n'),
(87, 16, 'tarjoaa asiakkaalle toimintaa käyttäen eri toiminnallisia menetelmiä.\r\n'),
(88, 16, 'huomioi asiakkaan mielenkiinnon kohteet ohjatessaan asiakasta sosiaaliseen toimintaan sekä tarjoaa uusia osallistumisen mahdollisuuksia.\r\n'),

(89, 17, 'tukee, ohjaa ja motivoi asiakkaita selviytymään päivittäisissä toiminnoissa voimavaralähtöisesti toistuvissa työtilanteissa.\r\n'),
(90, 17, 'havaitsee joitakin asiakkaan sosiaalisen tuen tarpeita tai ongelmia ja tiedottaa havainnoistaan työryhmälle.\r\n'),
(91, 17, 'huomioi asiakkaan seksuaali- ja lisääntymisterveyden.\r\n'),
(92, 17, 'huomioi asiakkaan seksuaalisen suuntautumisen moninaisuuden osana työryhmää.\r\n'),
(93, 17, 'huomioi asiakkaan kulttuurin osana työryhmää.\r\n'),
(94, 17, 'huomioi asiakkaan unen ja levon tarpeen.\r\n'),
(95, 17, 'hyödyntää työssään tietoa saattohoidosta ja kuolevan potilaan hoidosta.\r\n'),
(96, 17, 'huomioi asiakkaan ja omaiset saattohoidossa.\r\n'),
(97, 17, 'osallistuu työryhmän jäsenenä saattohoitoon ja kuolevan potilaan hoitoon.\r\n'),
(98, 17, 'toteuttaa mielenterveys- ja päihdesairauksia sairastavien hoitoa ja edistää toimintakykyisyyttä työryhmän ohjeiden mukaan.\r\n'),
(99, 17, 'toteuttaa kivunhoitoa käyttäen erilaisia kivunlievitysmenetelmiä työryhmän jäsenenä.\r\n'),
(100, 17, 'toimii oman vastuualueensa mukaisesti sekä turvallisesti yksikön ja asiakkaan lääkehoitosuunnitelmaa noudattaen.\r\n'),
(101, 17, 'tietää yleisimpien lääketietokantojen toimintaperiaatteet ja hyödyntää niitä työssään.\r\n'),
(102, 17, 'käsittelee ja annostelee lääkkeet aseptisesti, virheettömästi ja turvallisesti.\r\n'),
(103, 17, 'tekee virheettömästi annoslaskut sekä yksikönmuunnokset.\r\n'),
(104, 17, 'tunnistaa asiakkaan lääkehoidon tarpeen ja muutostarpeen, tarkistaa asiakkaan lääkityslistan ajantasaisuuden ja selvittää mahdolliset riskitiedot kuten lääkeaineallergiat.\r\n'),
(105, 17, 'antaa lääkkeet luonnollista tietä, injektiona ihon alle ja lihakseen ja hengitettynä ohjeiden mukaan.\r\n'),
(106, 17, 'tietää ja tarkkailee tavallisimpien muisti-, pitkäaikais- ja kansansairauksissa sekä mielenterveys- ja päihdesairauksissa käytettävien lääkkeiden vaikutuksia, yhteisvaikutuksia ja monilääkityksiä, tunnistaa yleisimpiä haitta- ja sivuvaikutuksia sekä huomioi mahdollisia lääkkeiden väärinkäytön ilmiöitä ja tiedottaa niistä työryhmässä.\r\n'),
(107, 17, 'ohjaa asiakasta ja hänen lähiverkostoaan työyksikön ohjeiden mukaisesti sähköisen lääkemääräyksen tulkinnassa ja voimassaoloajassa, lääkkeiden käytössä, säilyttämisessä ja hävittämisessä sekä hallitsee tavallisimpien muisti-, pitkäaikais- ja kansansairauksien sekä mielenterveys- ja päihdesairauksien lääkehoidon.\r\n'),
(108, 17, 'tietää työyksikön lääkityspoikkeamien raportointimenetelmän ja toimii ohjeiden mukaisesti sekä ilmoittaa lääkityspoikkeamasta.\r\n'),
(109, 17, 'osallistuu työryhmän jäsenenä saattohoitoon ja kuolevan potilaan hoitoon.\r\n'),
(110, 17, 'arvioi ja huomioi kokonaisvaltaisesti asiakkaan ravitsemuksen tarpeen ja suun terveyden sekä varmistaa ruoan saannin moniammatillisena yhteistyönä.\r\n'),
(111, 17, 'motivoi ja ohjaa monipuolisesti asiakasta ravitsemuksessa huomioiden ravitsemussuositukset ja erityisruokavaliot, uskonnolliset ja eettiset ruokavaliot sekä suun terveyden.\r\n'),
(112, 17, 'toteuttaa asiakkaan ravitsemushoitoa.\r\n'),
(113, 17, 'huomioi monipuolisesti esteettisyyden ravitsemuksessa.\r\n'),
(114, 17, 'ohjaa aktiivisesti asiakasta ja hänen lähiverkostoaan työyksikön ohjeiden mukaisesti sähköisen lääkemääräyksen tulkinnassa, voimassaoloajassa, lääkkeiden käytössä, säilyttämisessä ja hävittämisessä sekä hallitsee tavallisimpien muisti-, pitkäaikais- ja kansansairauksien sekä mielenterveys- ja päihdesairauksien lääkehoidon.\r\n'),
(115, 17, 'tietää työyksikön lääkityspoikkeamien raportointimenetelmän ja toimii ohjeiden mukaisesti ja ilmoittaa lääkityspoikkeamasta.\r\n'),
(116, 17, 'arvioi ja huomioi kokonaisvaltaisesti asiakkaan ravitsemuksen tarpeen ja suun terveyden sekä varmistaa ruoan saannin moniammatillisena yhteistyönä.\r\n'),
(117, 17, 'motivoi ja ohjaa monipuolisesti asiakasta ravitsemuksessa huomioiden ravitsemussuositukset ja erityisruokavaliot, uskonnolliset ja eettiset ruokavaliot sekä suun terveyden.\r\n'),
(118, 17, 'toteuttaa asiakkaan ravitsemushoitoa.\r\n'),
(119, 17, 'huomioi monipuolisesti esteettisyyden ravitsemuksessa.\r\n'),
(120, 17, 'toteuttaa asiakkaan ravitsemushoitoa.\r\n'),
(121, 17, 'huomioi monipuolisesti esteettisyyden ravitsemuksessa.\r\n'),
(122, 17, 'huomioi monipuolisesti esteettisyyden ravitsemuksessa.\r\n'),

(123, 18, 'tuntee palveluohjauksen prosessin ja antaa asiakkaalle ja lähiverkostolle monipuolista tietoa sosiaali- ja terveysalan palveluista ja etuuksista.\r\n'),
(124, 18, 'ohjaa asiakasta tarvittavien palveluiden piiriin huomioiden asiakkaan ja lähiverkoston tarpeet ja perustelee toimintaansa.\r\n'),
(125, 18, 'tuo esille erilaisia asiakasta vahvistavia palveluita ja tarjoaa vaihtoehtoja asiakkaalle ja tämän lähiverkostolle.\r\n'),
(126, 18, 'tukee asiakasta ja hänen lähiverkostoaan päätöksenteossa.\r\n'),

(127, 19, 'ohjaa monipuolisesti hyvinvointia ja toimintakykyä tukevan teknologian käytössä.\r\n'),
(128, 19, 'kartoittaa asiakkaan apuvälinetarpeen ja hyödyntää apuvälineiden ja hyvinvointiteknologian jakelukanavia.\r\n'),
(129, 19, 'ohjaa monipuolisesti apuvälineiden käytössä ja huollossa ja ehkäisee toiminnallaan laitteisiin liittyvien vaaratilanteiden syntymistä.\r\n'),
(130, 19, 'ohjaa ja käyttää asiakkaan liikkumisen ja siirtymisen apuvälineitä turvallisesti.\r\n'),

(131, 20, 'noudattaa työhyvinvointi- ja työturvallisuusohjeita sekä -määräyksiä.\r\n'),
(132, 20, 'tuntee työpaikan turvallisuussuunnitelman.\r\n'),
(133, 20, 'tuntee vaaratilanteiden ilmoittamisen käytännöt ja toimii osana työryhmää tilanteen edellyttämällä tavalla.\r\n'),
(134, 20, 'ylläpitää työkykyään ja työssä jaksamistaan.\r\n'),
(135, 20, 'hyödyntää terveysliikuntaa sekä ehkäisee työtapaturmia.\r\n'),
(136, 20, 'työskentelee turvallisesti soveltaen työryhmän jäsenenä ergonomian ja työturvallisuuden periaatteita ja ehkäisten työstä aiheutuvia tapaturmia ja haittoja.\r\n'),
(137, 20, 'arvioi ja huomioi työskentelyssään hoitotyön fyysiset ja psyykkiset kuormitustekijät.\r\n'),
(138, 20, 'ymmärtää ergonomian ja asiakkaan toimintakyvyn ylläpitämisen merkityksen tuki- ja liikuntaelinongelmien ennaltaehkäisyssä ja hoidon laadussa.\r\n'),
(139, 20, 'arvioi asiakkaan toimintakyvyn ja valitsee hänen toimintakykyään tukevan auttamistavan ja apuvälineen.\r\n'),
(140, 20, 'huomioi potilasasiakirjojen käsittelyyn liittyvän tietoturvan ja toimii salassapito-ohjeiden mukaan.\r\n'),
(141, 20, 'toimii aseptisen työskentelyn periaatteiden mukaan.\r\n'),
(142, 20, 'huomioi tartuntatautien torjuntatyön säädökset ja estää toiminnallaan tartuntojen leviämisen.\r\n'),
(143, 20, 'käyttää turvallisesti ja sujuvasti apuvälineitä avustustilanteissa.\r\n'),
(144, 20, 'kohtaa haasteellisesti käyttäytyvän asiakkaan ja huomioi työpaikan turvallisuuskäytännöt.\r\n'),

(145, 21, 'arvioi omaa toimintaansa ja ammatillista kehittymistään sekä antaa palautetta ja hyödyntää saamaansa palautetta monipuolisesti.\r\n'),
(146, 21, 'ylläpitää ja kehittää ammatin edellyttämiä tietoja ja taitoja.\r\n'),
(147, 21, 'perustelee monipuolisesti työhönsä liittyviä ratkaisuja näyttöön perustuvalla tiedolla ja hakee tietoa luotettavista lähteistä.\r\n'),
(148, 21, 'tekee itsenäisiä päätöksiä lähihoitajan vastuualueella yhteistyössä asiakkaan sekä tämän läheisten ja verkoston kanssa.\r\n'),
(149, 21, 'tekee realistisia kehittämisehdotuksia asiakkaan terveyden ja hyvinvoinnin lisäämiseksi ja toimii aktiivisesti hyvinvointia edistäen.\r\n');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
