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
-- Database: `sote_kasvu_2`
--

--
-- Vedos taulusta `category`
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

--
-- Vedos taulusta `criteria`
--

INSERT INTO `criteria` (`criteria_id`, `category_id`, `text`) VALUES
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
(12, 11, 'noudattaa sosiaali- ja terveysalan säädöksiä, säännöksiä, määräyksiä ja eettisiä periaatteita muuttuvissa tilanteissa.\r\n'),
(13, 11, 'toimii kestävän kehityksen periaatteiden mukaisesti ja perustelee toimintaansa.\r\n'),
(14, 12, 'asettaa tavoitteita työlleen yhdessä asiakkaiden kanssa tarve- ja kulttuurilähtöisesti ja suunnittelee työtään sen pohjalta.\r\n'),
(15, 12, 'esittää vaihtoehtoisia toimintatapoja ja tekee työtä asiakaslähtöisesti perustellen toimintaansa.\r\n'),
(16, 12, 'suunnittelee päivittäiset ja viikoittaiset työtehtävänsä ja ottaa huomioon työpaikan muut toiminnan suunnitelmat.\r\n'),
(17, 12, 'toimii moniammatillisen työryhmän jäsenenä lähihoitajan vastuualueella.\r\n'),
(18, 12, 'osallistuu asiakkaalle tehtävän terveyttä ja hyvinvointia edistävän suunnitelman laatimiseen yhdessä asiakkaan ja läheistensä kanssa.\r\n'),
(19, 12, 'toteuttaa suunnitelmaa yhdessä työryhmän kanssa.\r\n'),
(20, 12, 'perehtyy työpaikan eri omavalvontasuunnitelmiin ja toteuttaa yksikön omavalvontaa osana työryhmää.\r\n'),
(21, 12, 'työskentelee omavalvontamääräysten mukaisesti.\r\n'),
(22, 13, 'toimii ammatillisesti vuorovaikutustilanteissa osana työryhmää.\r\n'),
(23, 13, 'huomioi oman käyttäytymisensä vaikutukset vuorovaikutustilanteissa.\r\n'),
(24, 13, 'ohjaa asiakasta toistuvissa päivittäisissä tilanteissa hyödyntäen selkokieltä ja puhetta tukevia ja korvaavia kommunikointikeinoja.\r\n'),
(25, 13, 'kohtaa asiakkaan ja tämän lähiverkoston työryhmän jäsenenä.\r\n'),
(26, 13, 'huomioi asiakkaan eleet ja ilmeet.\r\n'),
(27, 13, 'käyttää kosketusta vuorovaikutuksen tukena.\r\n'),
(28, 14, 'arvioi asiakkaan voimavarat hyödyntäen havainnointia sekä asiakkaan ja omaisten haastattelua.\r\n'),
(29, 14, 'käyttää suunnitelmallisesti, tavoitteellisesti ja joustavasti asiakkaan toimintakykyä edistävää voimavaralähtöistä työotetta.\r\n'),
(30, 14, 'kuulee asiakkaan mielipiteitä ja toiveita tukien monipuolisesti asiakkaan osallisuutta ja elämän merkityksellisyyttä.\r\n'),
(31, 14, 'huomioi asiakkaan läheiset ja sosiaalisen hyvinvoinnin verkostot.\r\n'),
(32, 15, 'motivoi itsenäisesti asiakasta terveyttä ja hyvinvointia edistävään omahoitoon sekä elämäntapamuutoksiin.\r\n'),
(33, 15, 'edistää monipuolisesti erilaisten ja eri-ikäisten asiakkaiden fyysistä ja psyykkistä terveyttä sekä turvallisuutta ja hyvinvointia muuttuvissa tilanteissa.\r\n'),
(34, 15, 'tunnistaa perhe- ja lähisuhdeväkivallan uhkan ja kaltoinkohtelun ja ottaa sen puheeksi työryhmässä.\r\n'),
(35, 15, 'tunnistaa, ehkäisee ja ohjaa asiakasta välttämään kansanterveydellisiä riskejä ja tapaturmia.\r\n'),
(36, 15, 'tarjoaa asiakkaalle mahdollisuuksia selviytyä päivittäisissä toiminnoissa hyödyntäen asiakkaan omaa verkostoa ja ympäristön tarjoamia mahdollisuuksia.\r\n'),
(37, 16, 'ohjaa ja kannustaa asiakasta toiminnallisuuteen päivittäisissä toiminnoissa.\r\n'),
(38, 16, 'mahdollistaa asiakkaalle soveltuvan liikunnan ja ulkoilun.\r\n'),
(39, 16, 'tarjoaa asiakkaalle toimintaa käyttäen eri toiminnallisia menetelmiä.\r\n'),
(40, 16, 'huomioi asiakkaan mielenkiinnon kohteet ohjatessaan asiakasta sosiaaliseen toimintaan sekä tarjoaa uusia osallistumisen mahdollisuuksia.\r\n'),
(41, 17, 'tukee, ohjaa ja motivoi asiakkaita selviytymään päivittäisissä toiminnoissa voimavaralähtöisesti toistuvissa työtilanteissa.\r\n'),
(42, 17, 'havaitsee joitakin asiakkaan sosiaalisen tuen tarpeita tai ongelmia ja tiedottaa havainnoistaan työryhmälle.\r\n'),
(43, 17, 'huomioi asiakkaan seksuaali- ja lisääntymisterveyden.\r\n'),
(44, 17, 'huomioi asiakkaan seksuaalisen suuntautumisen moninaisuuden osana työryhmää.\r\n'),
(45, 17, 'huomioi asiakkaan kulttuurin osana työryhmää.\r\n'),
(46, 17, 'huomioi asiakkaan unen ja levon tarpeen.\r\n'),
(47, 17, 'hyödyntää työssään tietoa saattohoidosta ja kuolevan potilaan hoidosta.\r\n'),
(48, 17, 'huomioi asiakkaan ja omaiset saattohoidossa.\r\n'),
(49, 17, 'osallistuu työryhmän jäsenenä saattohoitoon ja kuolevan potilaan hoitoon.\r\n'),
(50, 17, 'toteuttaa mielenterveys- ja päihdesairauksia sairastavien hoitoa ja edistää toimintakykyisyyttä työryhmän ohjeiden mukaan.\r\n'),
(51, 17, 'toteuttaa kivunhoitoa käyttäen erilaisia kivunlievitysmenetelmiä työryhmän jäsenenä.\r\n'),
(52, 17, 'toimii oman vastuualueensa mukaisesti sekä turvallisesti yksikön ja asiakkaan lääkehoitosuunnitelmaa noudattaen.\r\n'),
(53, 17, 'tietää yleisimpien lääketietokantojen toimintaperiaatteet ja hyödyntää niitä työssään.\r\n'),
(54, 17, 'käsittelee ja annostelee lääkkeet aseptisesti, virheettömästi ja turvallisesti.\r\n'),
(55, 17, 'tekee virheettömästi annoslaskut sekä yksikönmuunnokset.\r\n'),
(56, 17, 'tunnistaa asiakkaan lääkehoidon tarpeen ja muutostarpeen, tarkistaa asiakkaan lääkityslistan ajantasaisuuden ja selvittää mahdolliset riskitiedot kuten lääkeaineallergiat.\r\n'),
(57, 17, 'antaa lääkkeet luonnollista tietä, injektiona ihon alle ja lihakseen ja hengitettynä ohjeiden mukaan.\r\n'),
(58, 17, 'tietää ja tarkkailee tavallisimpien muisti-, pitkäaikais- ja kansansairauksissa sekä mielenterveys- ja päihdesairauksissa käytettävien lääkkeiden vaikutuksia, yhteisvaikutuksia ja monilääkityksiä, tunnistaa yleisimpiä haitta- ja sivuvaikutuksia sekä huomioi mahdollisia lääkkeiden väärinkäytön ilmiöitä ja tiedottaa niistä työryhmässä.\r\n'),
(59, 17, 'ohjaa asiakasta ja hänen lähiverkostoaan työyksikön ohjeiden mukaisesti sähköisen lääkemääräyksen tulkinnassa ja voimassaoloajassa, lääkkeiden käytössä, säilyttämisessä ja hävittämisessä sekä hallitsee tavallisimpien muisti-, pitkäaikais- ja kansansairauksien sekä mielenterveys- ja päihdesairauksien lääkehoidon.\r\n'),
(60, 17, 'tietää työyksikön lääkityspoikkeamien raportointimenetelmän ja toimii ohjeiden mukaisesti sekä ilmoittaa lääkityspoikkeamasta.\r\n'),
(61, 17, 'osallistuu työryhmän jäsenenä saattohoitoon ja kuolevan potilaan hoitoon.\r\n'),
(62, 17, 'arvioi ja huomioi kokonaisvaltaisesti asiakkaan ravitsemuksen tarpeen ja suun terveyden sekä varmistaa ruoan saannin moniammatillisena yhteistyönä.\r\n'),
(63, 17, 'motivoi ja ohjaa monipuolisesti asiakasta ravitsemuksessa huomioiden ravitsemussuositukset ja erityisruokavaliot, uskonnolliset ja eettiset ruokavaliot sekä suun terveyden.\r\n'),
(64, 17, 'toteuttaa asiakkaan ravitsemushoitoa.\r\n'),
(65, 17, 'huomioi monipuolisesti esteettisyyden ravitsemuksessa.\r\n'),
(66, 17, 'ohjaa aktiivisesti asiakasta ja hänen lähiverkostoaan työyksikön ohjeiden mukaisesti sähköisen lääkemääräyksen tulkinnassa, voimassaoloajassa, lääkkeiden käytössä, säilyttämisessä ja hävittämisessä sekä hallitsee tavallisimpien muisti-, pitkäaikais- ja kansansairauksien sekä mielenterveys- ja päihdesairauksien lääkehoidon.\r\n'),
(67, 17, 'tietää työyksikön lääkityspoikkeamien raportointimenetelmän ja toimii ohjeiden mukaisesti ja ilmoittaa lääkityspoikkeamasta.\r\n'),
(68, 17, 'arvioi ja huomioi kokonaisvaltaisesti asiakkaan ravitsemuksen tarpeen ja suun terveyden sekä varmistaa ruoan saannin moniammatillisena yhteistyönä.\r\n'),
(69, 17, 'motivoi ja ohjaa monipuolisesti asiakasta ravitsemuksessa huomioiden ravitsemussuositukset ja erityisruokavaliot, uskonnolliset ja eettiset ruokavaliot sekä suun terveyden.\r\n'),
(70, 17, 'toteuttaa asiakkaan ravitsemushoitoa.\r\n'),
(71, 17, 'huomioi monipuolisesti esteettisyyden ravitsemuksessa.\r\n'),
(72, 17, 'toteuttaa asiakkaan ravitsemushoitoa.\r\n'),
(73, 17, 'huomioi monipuolisesti esteettisyyden ravitsemuksessa.\r\n'),
(74, 17, 'huomioi monipuolisesti esteettisyyden ravitsemuksessa.\r\n'),
(75, 18, 'tuntee palveluohjauksen prosessin ja antaa asiakkaalle ja lähiverkostolle monipuolista tietoa sosiaali- ja terveysalan palveluista ja etuuksista.\r\n'),
(76, 18, 'ohjaa asiakasta tarvittavien palveluiden piiriin huomioiden asiakkaan ja lähiverkoston tarpeet ja perustelee toimintaansa.\r\n'),
(77, 18, 'tuo esille erilaisia asiakasta vahvistavia palveluita ja tarjoaa vaihtoehtoja asiakkaalle ja tämän lähiverkostolle.\r\n'),
(78, 18, 'tukee asiakasta ja hänen lähiverkostoaan päätöksenteossa.\r\n'),
(79, 19, 'ohjaa monipuolisesti hyvinvointia ja toimintakykyä tukevan teknologian käytössä.\r\n'),
(80, 19, 'kartoittaa asiakkaan apuvälinetarpeen ja hyödyntää apuvälineiden ja hyvinvointiteknologian jakelukanavia.\r\n'),
(81, 19, 'ohjaa monipuolisesti apuvälineiden käytössä ja huollossa ja ehkäisee toiminnallaan laitteisiin liittyvien vaaratilanteiden syntymistä.\r\n'),
(82, 19, 'ohjaa ja käyttää asiakkaan liikkumisen ja siirtymisen apuvälineitä turvallisesti.\r\n'),
(83, 20, 'noudattaa työhyvinvointi- ja työturvallisuusohjeita sekä -määräyksiä.\r\n'),
(84, 20, 'tuntee työpaikan turvallisuussuunnitelman.\r\n'),
(85, 20, 'tuntee vaaratilanteiden ilmoittamisen käytännöt ja toimii osana työryhmää tilanteen edellyttämällä tavalla.\r\n'),
(86, 20, 'ylläpitää työkykyään ja työssä jaksamistaan.\r\n'),
(87, 20, 'hyödyntää terveysliikuntaa sekä ehkäisee työtapaturmia.\r\n'),
(88, 20, 'työskentelee turvallisesti soveltaen työryhmän jäsenenä ergonomian ja työturvallisuuden periaatteita ja ehkäisten työstä aiheutuvia tapaturmia ja haittoja.\r\n'),
(89, 20, 'arvioi ja huomioi työskentelyssään hoitotyön fyysiset ja psyykkiset kuormitustekijät.\r\n'),
(90, 20, 'ymmärtää ergonomian ja asiakkaan toimintakyvyn ylläpitämisen merkityksen tuki- ja liikuntaelinongelmien ennaltaehkäisyssä ja hoidon laadussa.\r\n'),
(91, 20, 'arvioi asiakkaan toimintakyvyn ja valitsee hänen toimintakykyään tukevan auttamistavan ja apuvälineen.\r\n'),
(92, 20, 'huomioi potilasasiakirjojen käsittelyyn liittyvän tietoturvan ja toimii salassapito-ohjeiden mukaan.\r\n'),
(93, 20, 'toimii aseptisen työskentelyn periaatteiden mukaan.\r\n'),
(94, 20, 'huomioi tartuntatautien torjuntatyön säädökset ja estää toiminnallaan tartuntojen leviämisen.\r\n'),
(95, 20, 'käyttää turvallisesti ja sujuvasti apuvälineitä avustustilanteissa.\r\n'),
(96, 20, 'kohtaa haasteellisesti käyttäytyvän asiakkaan ja huomioi työpaikan turvallisuuskäytännöt.\r\n'),
(97, 21, 'arvioi omaa toimintaansa ja ammatillista kehittymistään sekä antaa palautetta ja hyödyntää saamaansa palautetta monipuolisesti.\r\n'),
(98, 21, 'ylläpitää ja kehittää ammatin edellyttämiä tietoja ja taitoja.\r\n'),
(99, 21, 'perustelee monipuolisesti työhönsä liittyviä ratkaisuja näyttöön perustuvalla tiedolla ja hakee tietoa luotettavista lähteistä.\r\n'),
(100, 21, 'tekee itsenäisiä päätöksiä lähihoitajan vastuualueella yhteistyössä asiakkaan sekä tämän läheisten ja verkoston kanssa.\r\n'),
(101, 21, 'tekee realistisia kehittämisehdotuksia asiakkaan terveyden ja hyvinvoinnin lisäämiseksi ja toimii aktiivisesti hyvinvointia edistäen.\r\n'),
(102, 3, 'hankkii tietoa asiakkaan toimintakyvystä ja voimavaroista sekä toiveista ja kiinnostuksen kohteista'),
(103, 3, 'asettaa asiakkaan kasvua ja osallisuutta edistäviä tavoitteita'),
(104, 3, 'hankkii tietoa asiakkaan toimintakyvystä ja voimavaroista sekä toiveista ja kiinnostuksen kohteista'),
(105, 3, 'asettaa asiakkaan kasvua ja osallisuutta edistäviä tavoitteita'),
(108, 3, 'osallistuu työryhmässä asiakastyön suunnitteluun'),
(109, 3, 'työskentelee suunnitelman mukaan ja arvioi toiminnan toteutumista'),
(110, 4, 'kohtaa asiakkaan ja läheiset arvostavasti, huomioi yksilölliset tilanteet ja luo myönteisen vuorovaikutustilanteen edistäen yhdessä toimimista'),
(111, 4, 'on läsnä ja saatavilla osoittaen eri tavoin kiinnostusta asiakasta kohtaan ja käyttää läsnäoloa tavoitteellisesti'),
(112, 4, 'havaitsee asiakkaan vuorovaikutusaloitteita, tunnistaa ilmaisun eri muotoja, vastaa niihin ja tukee asiakasta ilmaisussa'),
(113, 4, 'ottaa huomioon asiakkaan kielen, kulttuurin ja katsomuksen yksilöllisesti vuorovaikutustilanteissa'),
(114, 4, 'mukauttaa vuorovaikutustaan asiakkaan tarpeita vastaavaksi hyödyntäen monipuolisesti puhetta tukevia ja korvaavia kommunikointikeinoja ja selkokieltä.'),
(115, 5, 'käyttää työssään monipuolisesti tietoa ihmisen fyysisestä, psyykkisestä ja sosiaalisesta kehityksestä elämänkulun eri vaiheissa soveltaen tietoa yksilöllisesti'),
(116, 5, 'tunnistaa vahvuuksia ja tuen tarpeita fyysisen, tiedollisen, taidollisen, tunne-elämän ja sosiaalisen kehityksen osa-alueilla ja soveltaa tietoa yksilöllisesti työssään'),
(117, 5, 'tunnistaa ihmisen toimintaan vaikuttavia psykologisia tekijöitä ja ja hyödyntää tietoa työssään perustellen toimintaansa'),
(118, 5, 'mahdollistaa asiakkaalle monipuolisia onnistumisen kokemuksia ja tukee asiakkaan myönteistä käsitystä itsestään eri tilanteissa'),
(119, 5, 'käyttää voimavara- ja asiakaslähtöisesti toiminnallisia menetelmiä kasvun ja oppimisen edistämisessä'),
(120, 5, 'hyödyntää ympäristön tarjoamia mahdollisuuksia toiminnassa monipuolisesti ja asiakaslähtöisesti'),
(121, 5, 'luo monipuolisia mahdollisuuksia oppimiseen ja taitojen vahvistamiseen arjen tilanteissa ja kannustaa oppimiseen'),
(122, 5, 'työskentelee varhaisen tuen ja ehkäisevän työn periaatteiden mukaisesti perustellen toimintaansa.'),
(123, 5, 'tukee asiakkaan toimijuutta ja valintojen tekemistä eri tilanteissa hyödyntäen tietoa osallisuudesta'),
(124, 5, 'ohjaa tavoitteellisesti yhdessä toimimista ja ryhmän toimintaa tunnistaen ryhmäilmiöitä'),
(125, 5, 'huolehtii asiakkaan mahdollisuudesta osallistua toimintaan edellytystensä ja kiinnostuksensa mukaisesti'),
(126, 5, 'käyttää toiminnallisia menetelmiä asiakaslähtöisesti ja hyödyntää taiteen tai kulttuurin mahdollisuuksia osallisuuden edistämisessä'),
(127, 5, 'toimii haasteellisissa ja ristiriitatilanteissa rakentavasti yhdessä toimimista edistäen'),
(128, 6, 'ohjaa ja avustaa asiakkaita päivittäisissä toiminnoissa voimavaralähtöisesti ja omatoimisuutta edistäen sekä perustelee toimintaansa'),
(129, 6, 'järjestää toimintaympäristöä esteettömäksi ja omatoimisuutta motivoivaksi ja edistäväksi yhdessä asiakkaan kanssa'),
(130, 6, 'ohjaa ja luo monipuolisia mahdollisuuksia turvalliseen ja säännölliseen liikkumiseen'),
(131, 6, 'hyödyntää apuvälineitä ja teknologiaa turvallisesti ja asiakaslähtöisesti perustellen toimintaansa.'),
(132, 7, 'havainnoi monipuolisesti asiakkaan vointia ja terveydentilaa ja toimii tilanteen vaatimalla tavalla hyödyntäen näyttöön perustuvaa tietoa'),
(133, 7, 'tunnistaa monipuolisesti asiakkaan turvallisuuteen vaikuttavia tekijöitä, ennakoi turvallisuusriskejä ja vaaratilanteita sekä huolehtii turvallisuudesta yhdessä asiakkaan kanssa'),
(134, 7, 'huolehtii ja ohjaa asiakasta huolehtimaan ympäristönsä puhtaudesta, viihtyisyydestä ja toimivuudesta huomioiden asiakkaan toiveita ja tarpeita'),
(135, 7, 'tukee monipuolisesti asiakkaan positiivista mielenterveyttä ja ohjaa havainnoimaan hyvinvointia edistäviä tekijöitä'),
(136, 7, 'edistää asiakkaan kykyä huolehtia itsestään sekä tukee asiakaslähtöisesti valinnoissa ja päätöksenteossa huomioiden asiakkaan itsemääräämisoikeuden'),
(137, 7, 'ohjaa ja avustaa asiakasta ruokailussa perustellen monipuolisesti toimintaansa tiedolla suun terveydestä, ravitsemussuosituksista, erityisruokavalioista sekä uskonnollisista ja eettisistä ruokavalioista.'),
(138, 8, 'antaa asiakkaalle ja lähiverkostolle monipuolisesti tietoa kasvatus-, sosiaali- ja terveysalan palveluista ja etuuksista'),
(139, 8, 'ohjaa ja tukee asiakasta ja hänen läheisiään palveluita koskevassa päätöksenteossa ja palveluiden käytössä'),
(140, 8, 'osallistuu työryhmässä sosiaali- ja terveydenhuollon ohjaus-, yhteydenotto- ja ilmoitusvelvollisuuden toteuttamiseen.'),
(141, 9, 'noudattaa työturvallisuusohjeita'),
(142, 9, 'toimii hygienia- ja aseptiikkaohjeistuksen mukaisesti'),
(143, 9, 'huolehtii työkyvystään ja tunnistaa omien valintojensa vaikutuksia työkykyynsä'),
(144, 9, 'edistää toiminnallaan myönteistä työilmapiiriä'),
(145, 9, 'työskentelee huomioiden työn riski- ja kuormitustekijöitä'),
(146, 9, 'toimii ergonomian periaatteiden mukaisesti vaihtelevissa työtilanteissa'),
(147, 10, 'arvioi realistisesti ja monipuolisesti omaa oppimistaan ja osaamistaan'),
(148, 10, 'tunnistaa omia vahvuuksiaan ja kehittämisalueitaan sekä asettaa tavoitteita ammatilliselle kasvulleen hyödyntäen monipuolisesti työpaikan tarjoamia oppimismahdollisuuksia'),
(149, 10, 'arvioi ja kehittää työtään oma-aloitteisesti saamansa palautteen perusteella'),
(150, 10, 'tekee työssään valintoja ja ratkaisee ongelmia joustavasti erilaisissa tilanteissa työryhmän jäsenenä'),
(151, 10, 'ylläpitää ja kehittää aktiivisesti ammatin edellyttämiä tietoja ja taitoja.');

--
-- Vedos taulusta `evaluation`
--

INSERT INTO `evaluation` (`evaluation_id`, `criteria_Id`, `student_id`, `instructor_id`, `evaluation_text`, `evaluation_date`) VALUES
(1, 1, 2, 4, 'palaute työpaikkaohjaajalta', '2020-12-15 14:00:00'),
(2, 1, 5, 4, 'palaute työpaikkaohjaajalta', '2020-12-15 14:00:00'),
(3, 1, 6, 4, 'palaute työpaikkaohjaajalta', '2020-12-15 14:00:00'),
(4, 1, 7, 4, 'palaute työpaikkaohjaajalta', '2020-12-15 14:00:00'),
(5, 1, 8, 4, 'palaute työpaikkaohjaajalta', '2020-12-15 14:00:00'),
(6, 1, 9, 4, 'palaute työpaikkaohjaajalta', '2020-12-15 14:00:00'),
(7, 1, 10, 4, 'palaute työpaikkaohjaajalta', '2020-12-15 14:00:00'),
(8, 1, 11, 4, 'palaute työpaikkaohjaajalta', '2020-12-15 14:00:00');

--
-- Vedos taulusta `module`
--

INSERT INTO `module` (`module_id`, `name`) VALUES
(1, 'Kasvun ja osallisuuden edistäminen'),
(2, 'Hyvinvoinnin ja toimintakyvyn edistäminen');

--
-- Vedos taulusta `problem`
--

INSERT INTO `problem` (`problem_id`, `criteria_Id`, `file`, `text`, `teacher_id`, `hidden`) VALUES
(1, 1, NULL, 'ongelmanratkaisutehtävän teksti 1-1', 3, 0),
(2, 2, NULL, 'ongelmanratkaisutehtävän teksti 2-2', 3, 0),
(3, 3, NULL, 'ongelmanratkaisutehtävän teksti 3-3', 3, 0),
(4, 4, NULL, 'ongelmanratkaisutehtävän teksti 4-4', 3, 0),
(5, 5, NULL, 'ongelmanratkaisutehtävän teksti 5-5', 3, 0),
(6, 6, NULL, 'ongelmanratkaisutehtävän teksti 6-6', 3, 0),
(7, 7, NULL, 'ongelmanratkaisutehtävän teksti 7-7', 3, 0),
(8, 8, NULL, 'ongelmanratkaisutehtävän teksti 8-8', 3, 0),
(9, 9, NULL, 'ongelmanratkaisutehtävän teksti 9-9', 3, 0),
(10, 1, NULL, 'ongelmanratkaisutehtävän teksti 10-1', 3, 0),
(11, 2, NULL, 'ongelmanratkaisutehtävän teksti 11-2', 3, 0),
(12, 3, NULL, 'ongelmanratkaisutehtävän teksti 12-3', 3, 0),
(13, 4, NULL, 'ongelmanratkaisutehtävän teksti 13-4', 3, 0),
(14, 5, NULL, 'ongelmanratkaisutehtävän teksti 14-5', 3, 0),
(15, 6, NULL, 'ongelmanratkaisutehtävän teksti 15-6', 3, 0),
(16, 7, NULL, 'ongelmanratkaisutehtävän teksti 16-7', 3, 0),
(17, 8, NULL, 'ongelmanratkaisutehtävän teksti 17-8', 3, 0),
(18, 9, NULL, 'ongelmanratkaisutehtävän teksti 18-9', 3, 0),
(19, 1, NULL, 'ongelmanratkaisutehtävän teksti 19-1', 3, 0),
(20, 2, NULL, 'ongelmanratkaisutehtävän teksti 20-2', 3, 0),
(21, 3, NULL, 'ongelmanratkaisutehtävän teksti 21-3', 3, 0),
(22, 4, NULL, 'ongelmanratkaisutehtävän teksti 22-4', 3, 0),
(23, 5, NULL, 'ongelmanratkaisutehtävän teksti 23-5', 3, 0),
(24, 6, NULL, 'ongelmanratkaisutehtävän teksti 24-6', 3, 0),
(25, 7, NULL, 'ongelmanratkaisutehtävän teksti 25-7', 3, 0);

--
-- Vedos taulusta `problem_assignment`
--

INSERT INTO `problem_assignment` (`problem_assignment_id`, `problem_id`, `student_id`, `assign_date`, `submission_file`, `submission_text`, `submission_time`, `grade`, `evaluation`, `evaluation_datetime`) VALUES
(1, 1, 2, '2020-10-29 10:59:39', NULL, 'ongelmaratkaisun tehtävä 1', '2020-10-31 11:00:00', 3, NULL, NULL),
(2, 2, 5, '2020-10-29 12:45:16', NULL, 'ongelmaratkaisun tehtävä 2', '2020-10-31 11:00:00', 3, NULL, NULL),
(3, 2, 6, '2020-10-30 13:25:45', NULL, 'ongelmaratkaisun tehtävä 2', '2020-11-01 11:00:00', 4, NULL, NULL),
(4, 3, 7, '2020-10-30 14:45:21', NULL, 'ongelmaratkaisun tehtävä 3', '2020-11-01 11:00:00', 3, NULL, NULL),
(5, 4, 7, '2020-10-31 10:25:33', NULL, 'ongelmaratkaisun tehtävä 3', '2020-11-02 11:00:00', 4, NULL, NULL),
(6, 3, 8, '2020-10-31 10:45:15', NULL, 'ongelmaratkaisun tehtävä 4', '2020-11-02 11:00:00', 5, NULL, NULL),
(7, 4, 8, '2020-10-31 13:45:56', NULL, 'ongelmaratkaisun tehtävä 4', '2020-11-02 11:00:00', 5, NULL, NULL),
(8, 4, 9, '2020-11-02 14:55:42', NULL, 'ongelmaratkaisun tehtävä 5', '2020-11-04 11:00:00', 2, NULL, NULL),
(9, 5, 10, '2020-11-02 11:45:26', NULL, 'ongelmaratkaisun tehtävä 5', '2020-11-04 11:00:00', 3, NULL, NULL),
(10, 6, 11, '2020-11-02 11:50:43', NULL, 'ongelmaratkaisun tehtävä 6', '2020-11-04 11:00:00', 4, NULL, NULL);

--
-- Vedos taulusta `teacher_student_module`
--

INSERT INTO `teacher_student_module` (`teacher_id`, `student_id`, `module_id`, `task_type`) VALUES
(3, 2, 1, 't'),
(3, 2, 1, 'p'),
(3, 5, 2, 't'),
(3, 5, 2, 'p'),
(3, 6, 2, 't'),
(3, 6, 2, 'p'),
(3, 7, 1, 't'),
(3, 7, 1, 'p'),
(3, 8, 2, 't'),
(3, 8, 2, 'p'),
(3, 9, 1, 't'),
(3, 9, 1, 'p'),
(3, 10, 2, 't'),
(3, 10, 2, 'p'),
(3, 11, 1, 't'),
(3, 11, 1, 'p'),
(4, 2, 1, 'e'),
(4, 7, 1, 'e'),
(4, 9, 1, 'e'),
(4, 11, 1, 'e');

--
-- Vedos taulusta `theory`
--

INSERT INTO `theory` (`theory_id`, `file`, `criteria_Id`, `text`, `teacher_id`, `hidden`) VALUES
(1, NULL, 1, 'teoriatehtävä 1-1', 3, 0),
(2, NULL, 2, 'teoriatehtävä 2-2', 3, 0),
(3, NULL, 3, 'teoriatehtävä 3-3', 3, 0),
(4, NULL, 4, 'teoriatehtävä 4-4', 3, 0),
(5, NULL, 5, 'teoriatehtävä 5-5', 3, 0),
(6, NULL, 6, 'teoriatehtävä 6-6', 3, 0),
(7, NULL, 7, 'teoriatehtävä 7-7', 3, 0);

--
-- Vedos taulusta `theory_assignment`
--

INSERT INTO `theory_assignment` (`theory_assignment_id`, `theory_id`, `student_id`, `assign_date`, `submission_file`, `submission_text`, `submission_time`, `self_grade`, `self_evaluation_text`, `self_evaluation_datetime`, `grade`, `evaluation`, `evaluation_datetime`) VALUES
(1, 1, 2, '2020-10-29 10:59:39', NULL, 'teoriatehtävä 1', '2020-11-01 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 5, '2020-10-29 12:45:16', NULL, 'teoriatehtävä 1', '2020-11-01 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 6, '2020-10-30 13:25:45', NULL, 'teoriatehtävä 1', '2020-11-02 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 4, 7, '2020-10-30 14:45:21', NULL, 'teoriatehtävä 1', '2020-11-02 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 5, 8, '2020-10-31 10:45:15', NULL, 'teoriatehtävä 1', '2020-11-03 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 6, 9, '2020-11-02 14:55:42', NULL, 'teoriatehtävä 1', '2020-11-05 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 7, 10, '2020-11-02 11:45:26', NULL, 'teoriatehtävä 1', '2020-11-05 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 7, 11, '2020-11-02 11:50:43', NULL, 'teoriatehtävä 1', '2020-11-05 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Vedos taulusta `user`
--

INSERT INTO `user` (`user_id`, `email`, `password`, `role`, `first_name`, `last_name`) VALUES
(1, 'someone@example.com', '$2b$10$xMP0yVK3GyR8Seuq2czyEOctMUo39LIkWJ5ExYa8DkHCzyue0pHhG', 'admin', 'jaska', 'jokunen'),
(2, 'matti.mallioppilas@edu.hel.fi', '$2b$10$3nz60uB/sXMlca5J469hKegwS/trEvNJZV0HAgTJrc0HbQhMAdkeq', 'student', 'matti', 'mallioppilas'),
(3, 'olli.opettaja@edu.hel.fi', '$2b$10$grMhWF/DOjzVHEyGJSldSOFUdEWGxpKPZ2oG7UB5lHbixf6SU0u76', 'teacher', 'olli', 'opettaja'),
(4, 'teemu.tyopaikkaohjaaja@edu.hel.fi', '$2b$10$E58vIrrm4/IOmO7.tw8SruSaFzAyL.kOYLH6c2EZ32xYm3xSFPUOu', 'instructor', 'Teemu', 'Työpaikkaohjaaja'),
(5, 'markku.maalainen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'markku', 'maalainen'),
(6, 'outi.oodi@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'outi', 'oodi'),
(7, 'katja.kataja@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'katja', 'kataja'),
(8, 'ossi.oittaa@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'ossi', 'oittaa'),
(9, 'jukka.jukola@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'jukka', 'jukola'),
(10, 'aino.autuas@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'aino', 'autuas'),
(11, 'silja.suomalainen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'silja', 'suomalainen'),
(12, 'seppo.sieppo@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'seppo', 'sieppo'),
(13, 'eila.erakko@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'eila', 'erakko'),
(14, 'rami.reipas@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'rami', 'reipas'),
(15, 'katri.koivu@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'katri', 'koivu'),
(16, 'arto.sammal@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'arto', 'sammal'),
(17, 'alisa.virtanen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'alisa', 'virtanen'),
(18, 'leevi.korhonen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'leevi', 'korhonen'),
(19, 'amanda.hamalainen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'amanda', 'hamalainen'),
(20, 'niko.salminen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'niko', 'salminen'),
(21, 'eeva.saarinen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'eeva', 'saarinen'),
(22, 'pasi.niemi@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'pasi', 'niemi'),
(23, 'elisa.rantanen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'elisa', 'rantanen'),
(24, 'esa.savolainen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'esa', 'savolainen'),
(25, 'heidi.kallio@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'heidi', 'kallio'),
(26, 'riku.koivisto@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'riku', 'koivisto'),
(27, 'hanna.rantala@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'hanna', 'rantala'),
(28, 'harri.ahola@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'harri', 'ahola'),
(29, 'ilona.kokko@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'ilona', 'kokko'),
(30, 'simo.kuusisto@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'simo', 'kuusisto'),
(31, 'hyacinth.bucket@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'hyacinth', 'bucket'),
(32, 'jaakko.korpela@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'jaakko', 'korpela'),
(33, 'satu.rinne@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'satu', 'rinne'),
(34, 'kalle.koski@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'kalle', 'koski');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
