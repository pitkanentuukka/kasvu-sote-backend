-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 25, 2020 at 12:15 PM
-- Server version: 10.1.44-MariaDB-0+deb9u1
-- PHP Version: 7.0.33-0+deb9u7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Table structure for table `criteria`
--

CREATE TABLE `criteria` (
  `criteria_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `criteria`
--

INSERT INTO `criteria` (`criteria_id`, `category_id`, `text`) VALUES
(1, 1, 'toimii asiakkaan perus- ja ihmisoikeuksia kunnioittaen\n'),
(2, 1, 'noudattaa kasvatus-, sosiaali- ja terveysalan lainsäädäntöä, määräyksiä, toimintaperiaatteita ja työpaikan ohjeita työryhmän kanssa\r\n'),
(3, 1, 'toimii kasvatus-, sosiaali- ja terveysalan työn arvojen ja lähihoitajan ammattieettisten ohjeiden mukaan\r\n'),
(4, 1, 'noudattaa tietosuojaa ja salassapitoa\r\n'),
(5, 1, 'työskentelee laatusuositusten ja omavalvontamääräysten mukaan työryhmän ohjaamana\r\n'),
(6, 1, 'toimii kestävän kehityksen periaatteiden mukaan\r\n'),
(7, 1, 'opiskelija suunnittelee työtään ja tekee yhteistyötä työryhmän kanssa.\r\n'),
(8, 1, 'suunnittelee työtehtäviään työpaikan toiminnan mukaan\r\n'),
(9, 1, 'tekee yhteistyötä työryhmän kanssa\r\n'),
(10, 1, 'viestii ja dokumentoi työpaikan käytäntöjen mukaisesti työryhmän ohjaamana\r\n'),
(11, 1, 'opiskelija suunnittelee, toteuttaa ja arvioi kasvun ja osallisuuden edistämistä.\r\n'),

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
(101, 21, 'tekee realistisia kehittämisehdotuksia asiakkaan terveyden ja hyvinvoinnin lisäämiseksi ja toimii aktiivisesti hyvinvointia edistäen.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `evaluation`
--

CREATE TABLE `evaluation` (
  `evaluation_id` int(11) NOT NULL,
  `criteria_Id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `evaluation_text` text NOT NULL,
  `evaluation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `module_id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`module_id`, `name`) VALUES
(1, 'Kasvun ja osallisuuden edistäminen'),
(2, 'Hyvinvoinnin ja toimintakyvyn edistäminen');

-- --------------------------------------------------------

--
-- Table structure for table `problem`
--

CREATE TABLE `problem` (
  `problem_id` int(11) NOT NULL,
  `criteria_Id` int(11) NOT NULL,
  `file` TEXT NULL,
  `text` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `teacher_id` int(11) NOT NULL,
  `hidden` BOOLEAN NOT NULL DEFAULT FALSE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `problem_assignment`
--

CREATE TABLE `problem_assignment` (
  `problem_assignment_id` int(11) NOT NULL,
  `problem_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `assign_date` datetime NOT NULL,
  `submission_file` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `submission_text` TEXT NULL,
  `submission_time` datetime NULL DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `evaluation` text,
  `evaluation_datetime` DATETIME NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_student_module`
--

CREATE TABLE `teacher_student_module` (
  `teacher_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `task_type` ENUM ('t', 'p', 'e') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `theory`
--

CREATE TABLE `theory` (
  `theory_id` int(11) NOT NULL,
  `file` TEXT NULL,
  `criteria_Id` int(11) NOT NULL,
  `text` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `teacher_id` int(11) NOT NULL,
  `hidden` BOOLEAN NOT NULL DEFAULT FALSE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `theory_assignment`
--

CREATE TABLE `theory_assignment` (
  `theory_assignment_id` int(11) NOT NULL,
  `theory_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `assign_date` datetime NOT NULL,
  `submission_file` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `submission_text` TEXT NULL,
  `submission_time` datetime DEFAULT NULL,
  `self_grade` int(11) DEFAULT NULL,
  `self_evaluation_text` text,
  `self_evaluation_datetime` datetime DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `evaluation` TEXT NULL DEFAULT NULL,
  `evaluation_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','student','teacher','instructor') NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `criteria`
--
ALTER TABLE `criteria`
  ADD PRIMARY KEY (`criteria_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `evaluation`
--
ALTER TABLE `evaluation`
  ADD PRIMARY KEY (`evaluation_id`),
  ADD KEY `criteria_Id` (`criteria_Id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `instructor_id` (`instructor_id`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `problem`
--
ALTER TABLE `problem`
  ADD PRIMARY KEY (`problem_id`),
  ADD KEY `criteria_Id` (`criteria_Id`),
  ADD KEY `teacher_problem` (`teacher_id`);

--
-- Indexes for table `problem_assignment`
--
ALTER TABLE `problem_assignment`
  ADD PRIMARY KEY (`problem_assignment_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `problem_id` (`problem_id`);

--
-- Indexes for table `teacher_student_module`
--
ALTER TABLE `teacher_student_module`
  ADD PRIMARY KEY (`student_id`,`module_id`, `task_type`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `module_id` (`module_id`),
  ADD KEY `task_type` (`task_type`);

--
-- Indexes for table `theory`
--
ALTER TABLE `theory`
  ADD PRIMARY KEY (`theory_id`),
  ADD KEY `criteria_Id` (`criteria_Id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `theory_assignment`
--
ALTER TABLE `theory_assignment`
  ADD PRIMARY KEY (`theory_assignment_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `theory_id` (`theory_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

-- --------------------------------------------------------

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `criteria`
--
ALTER TABLE `criteria`
  MODIFY `criteria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `evaluation`
--
ALTER TABLE `evaluation`
  MODIFY `evaluation_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `problem`
--
ALTER TABLE `problem`
  MODIFY `problem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `problem_assignment`
--
ALTER TABLE `problem_assignment`
  MODIFY `problem_assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `theory`
--
ALTER TABLE `theory`
  MODIFY `theory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `theory_assignment`
--
ALTER TABLE `theory_assignment`
  MODIFY `theory_assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

-- --------------------------------------------------------

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `module` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`);

--
-- Constraints for table `criteria`
--
ALTER TABLE `criteria`
  ADD CONSTRAINT `category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `criteria` FOREIGN KEY (`criteria_Id`) REFERENCES `criteria` (`criteria_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `instructor` FOREIGN KEY (`instructor_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `problem`
--
ALTER TABLE `problem`
  ADD CONSTRAINT `criteria_id` FOREIGN KEY (`criteria_Id`) REFERENCES `criteria` (`criteria_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teacher_problem` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `problem_assignment`
--
ALTER TABLE `problem_assignment`
  ADD CONSTRAINT `problem_id` FOREIGN KEY (`problem_id`) REFERENCES `problem` (`problem_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_id` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teacher_student_module`
--
ALTER TABLE `teacher_student_module`
  ADD CONSTRAINT `teacher_student_module_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teacher_student_module_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teacher_student_module_ibfk_3` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `theory`
--
ALTER TABLE `theory`
  ADD CONSTRAINT `teacher_theory` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `theory_ibfk_1` FOREIGN KEY (`criteria_Id`) REFERENCES `criteria` (`criteria_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `theory_assignment`
--
ALTER TABLE `theory_assignment`
  ADD CONSTRAINT `studen` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `theory_id` FOREIGN KEY (`theory_id`) REFERENCES `theory` (`theory_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
