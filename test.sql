-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2021 at 05:14 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryID` int(11) NOT NULL,
  `category_name` text NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryID`, `category_name`, `description`) VALUES
(1, 'Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
(2, 'Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings'),
(3, 'Confections', 'Desserts, candies, and sweet breads'),
(4, 'Dairy Products', 'Cheeses'),
(5, 'Grains/Cereals', 'Breads, crackers, pasta, and cereal'),
(6, 'Meat/Poultry', 'Prepared meats'),
(7, 'Produce', 'Dried fruit and bean curd'),
(8, 'Seafood', 'Seaweed and fish');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customerID` int(11) NOT NULL,
  `customer_name` text NOT NULL,
  `contact_name` text NOT NULL,
  `address` text NOT NULL,
  `city` text NOT NULL,
  `postal_code` text DEFAULT NULL,
  `country` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerID`, `customer_name`, `contact_name`, `address`, `city`, `postal_code`, `country`) VALUES
(1, 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany'),
(2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitución', '2222,México D.F.', '5021', 'Mexico'),
(3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mataderos', '2312,México D.F.', '5023', 'Mexico'),
(4, 'Around the Horn', 'Thomas Hardy', '120Hanover Sq.', 'London', 'WA1 1DP', 'UK'),
(5, 'Berglunds snabbköp', 'Christina Berglund', 'Berguvsvägen 8', 'Luleå', 'S-958 22', 'Sweden'),
(6, 'Blauer See Delikatessen', 'Hanna Moos', 'Forsterstr. 57', 'Mannheim', '68306', 'Germany'),
(7, 'Blondel père et fils', 'Frédérique Citeaux', '24, place Kléber', 'Strasbourg', '67000', 'France'),
(8, 'Bólido Comidas preparadas', 'Martín Sommer', 'C/ Araquil, 67', 'Madrid', '28023', 'Spain'),
(9, 'Bon app', 'Laurence Lebihans', '12, rue des Bouchers', 'Marseille', '13008', 'France'),
(10, 'Bottom-Dollar Marketse', 'Elizabeth Lincoln', '23,Tsawassen Blvd.', 'Tsawassen', 'T2F 8M4', 'Canada'),
(11, 'Bs Beverages', 'Victoria Ashworth', 'Fauntleroy Circus', 'London', 'EC2 5NT', 'UK'),
(12, 'Cactus Comidas para llevar', 'Patricio Simpson', 'Cerrito 333', 'Buenos Aires', '1010', 'Argentina'),
(13, 'Centro comercial Moctezuma', 'Francisco Chang', 'Sierras de Granada', '9993,México D.F.', '5022', 'Mexico'),
(14, 'Chop-suey Chinese', 'Yang Wang', 'Hauptstr. 29', 'Bern', '3012', 'Switzerland'),
(15, 'Comércio Mineiro', 'Pedro Afonso', 'Av. dos Lusíadas, 23', 'São Paulo', '05432-043', 'Brazil'),
(16, 'Consolidated Holdings', 'Elizabeth Brown', 'Berkeley Gardens 12 Brewery', 'London', 'WX1 6LT', 'UK'),
(17, 'Drachenblut Delikatessend', 'Sven Ottlieb', 'Walserweg 21', 'Aachen', '52066', 'Germany'),
(18, 'Du monde entier', 'Janine Labrune', '67, rue des Cinquante Otages', 'Nantes', '44000', 'France'),
(19, 'Eastern Connection', 'Ann Devon', '35 King George', 'London', 'WX3 6FW', 'UK'),
(20, 'Ernst Handel', 'Roland Mendel', 'Kirchgasse 6', 'Graz', '8010', 'Austria'),
(21, 'Familia Arquibaldo', 'Aria Cruz', 'Rua Orós, 92', 'São Paulo', '5412', 'Brazil'),
(22, 'FISSA Fabrica Inter. Salchichas S.A.', 'Diego Roel', 'C/ Moralzarzal, 86', 'Madrid', '28034', 'Spain'),
(23, 'Folies gourmandes', 'Martine Rancé', '184, chaussée de Tournai', 'Lille', '59000', 'France'),
(24, 'Folk och fä HB', 'Maria Larsson', 'Åkergatan 24', 'Bräcke', 'S-844 67', 'Sweden'),
(25, 'Frankenversand', 'Peter Franken', 'Berliner Platz 43', 'München', '80805', 'Germany'),
(26, 'France restauration', 'Carine Schmitt', '54, rue Royale', 'Nantes', '44000', 'France'),
(27, 'Franchi S.p.A.', 'Paolo Accorti', 'Via Monte Bianco 34', 'Torino', '10100', 'Italy'),
(28, 'Furia Bacalhau e Frutos do Mar', 'Lino Rodriguez', 'Jardim das rosas n. 32', 'Lisboa', '1675', 'Portugal'),
(29, 'Galería del gastrónomo', 'Eduardo Saavedra', 'Rambla de Cataluña, 23', 'Barcelona', '8022', 'Spain'),
(30, 'Godos Cocina Típica', 'José Pedro Freyre', 'C/ Romero, 33', 'Sevilla', '41101', 'Spain'),
(31, 'Gourmet Lanchonetes', 'André Fonseca', 'Av. Brasil, 442', 'Campinas', '4090', 'Brazil'),
(32, 'Great Lakes Food Market', 'Howard Snyder', '2732 Baker Blvd.', 'Eugene', '97403', 'USA'),
(33, 'GROSELLA-Restaurante', 'Manuel Pereira', '5ª Ave. Los Palos Grandes', 'Caracas', '1081', 'Venezuela'),
(34, 'Hanari Carnes', 'Mario Pontes', 'Rua do Paço, 67', 'Rio de Janeiro', '4578', 'Brazil'),
(35, 'HILARIÓN-Abastos', 'Carlos Hernández Carrera', ' 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', '5022', 'Venezuela'),
(36, 'Hungry Coyote Import Store', 'Yoshi Latimer', 'City Center Plaza 516 Main St.', 'Elgin', '97827', 'USA'),
(37, 'Hungry Owl All-Night Grocers', 'Patricia McKenna', '8 Johnstown Road', 'Cork', '', 'Ireland'),
(38, 'Island Trading', 'Helen Bennett', 'Garden House Crowther Way', 'Cowes', 'PO31 7PJ', 'UK'),
(39, 'Königlich Essen', 'Philip Cramer', 'Maubelstr. 90', 'Brandenburg', '14776', 'Germany'),
(40, 'La corne dabondance', 'Daniel Tonini', '67, avenue de l Europe', 'Versailles', '78000', 'France'),
(41, 'La maison dAsie', 'Annette Roulet', '1 rue Alsace-Lorraine', 'Toulouse', '31000', 'France'),
(42, 'Laughing Bacchus Wine Cellars', 'Yoshi Tannamuri', '1900 Oak St.', 'Vancouver', 'V3F 2K1', 'Canada'),
(43, 'Lazy K Kountry Store', 'John Steel', '12 Orchestra Terrace', 'Walla Walla', '99362', 'USA'),
(44, 'Lehmanns Marktstand', 'Renate Messner', 'Magazinweg 7', 'Frankfurt a.M.', '60528', 'Germany'),
(45, 'Lets Stop N Shop', 'Jaime Yorres', '87 Polk St. Suite 5', 'San Francisco', '94117', 'USA'),
(46, 'LILA-Supermercado', 'Carlos González', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', '3508', 'Venezuela'),
(47, 'LINO-Delicateses', 'Felipe Izquierdo', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', '4980', 'Venezuela'),
(48, 'Lonesome Pine Restaurant', 'Fran Wilson', '89 Chiaroscuro Rd.', 'Portland', '97219', 'USA'),
(49, 'Magazzini Alimentari Riuniti', 'Giovanni Rovelli', 'Via Ludovico il Moro 22', 'Bergamo', '24100', 'Italy'),
(50, 'Maison Dewey', 'Catherine Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', 'B-1180', 'Belgium'),
(51, 'Mère Paillarde', 'Jean Fresnière', '43 rue St. Laurent', 'Montréal', 'H1J 1C3', 'Canada'),
(52, 'Morgenstern Gesundkost', 'Alexander Feuer', 'Heerstr. 22', 'Leipzig', '4179', 'Germany'),
(53, 'North/South', 'Simon Crowther', 'South House 300 Queensbridge', 'London', 'SW7 1RZ', 'UK'),
(54, 'Océano Atlántico Ltda.', 'Yvonne Moncada', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', '1010', 'Argentina'),
(55, 'Old World Delicatessen', 'Rene Phillips', '2743 Bering St.', 'Anchorage', '99508', 'USA'),
(56, 'Ottilies Käseladen', 'Henriette Pfalzheim', 'Mehrheimerstr. 369', 'Köln', '50739', 'Germany'),
(57, 'Paris spécialités', 'Marie Bertrand', '265, boulevard Charonne', 'Paris', '75012', 'France'),
(58, 'Pericles Comidas clásicas', 'Guillermo Fernández', 'Calle Dr. Jorge Cash 321', 'México D.F.', '5033', 'Mexico'),
(59, 'Piccolo und mehr', 'Georg Pipps', 'Geislweg 14', 'Salzburg', '5020', 'Austria'),
(60, 'Princesa Isabel Vinhoss', 'Isabel de Castro', 'Estrada da saúde n. 58', 'Lisboa', '1756', 'Portugal'),
(61, 'Que Delícia', 'Bernardo Batista', 'Rua da Panificadora, 12', 'Rio de Janeiro', '1716', 'Brazil'),
(62, 'Queen Cozinha', 'Lúcia Carvalho', 'Alameda dos Canàrios, 891', 'São Paulo', '5467', 'Brazil'),
(63, 'QUICK-Stop', 'Horst Kloss', 'Taucherstraße 10', 'Cunewalde', '1307', 'Germany'),
(64, 'Rancho grande', 'Sergio Gutiérrez', 'Av. del Libertador 900', 'Buenos Aires', '1010', 'Argentina'),
(65, 'Rattlesnake Canyon Grocery', 'Paula Wilson', '2817 Milton Dr.', 'Albuquerque', '87110', 'USA'),
(66, 'Reggiani Caseifici', 'Maurizio Moroni', 'Strada Provinciale 124', 'Reggio Emilia', '42100', 'Italy'),
(67, 'Ricardo Adocicados', 'Janete Limeira', 'Av. Copacabana, 267', 'Rio de Janeiro', '1499', 'Brazil'),
(68, 'Richter Supermarkt', 'Michael Holz', 'Grenzacherweg 237', 'Genève', '1203', 'Switzerland'),
(69, 'Romero y tomillo', 'Alejandra Camino', 'Gran Vía, 1', 'Madrid', '28001', 'Spain'),
(70, 'Santé Gourmet', 'Jonas Bergulfsen', 'Erling Skakkes gate 78', 'Stavern', '4110', 'Norway'),
(71, 'Save-a-lot Markets', 'Jose Pavarotti', '187 Suffolk Ln.', 'Boise', '83720', 'USA'),
(72, 'Seven Seas Imports', 'Hari Kumar', '90 Wadhurst Rd.', 'London', 'OX15 4NB', 'UK'),
(73, 'Simons bistro', 'Jytte Petersen', 'Vinbæltet 34', 'København', '1734', 'Denmark'),
(74, 'Spécialités du monde', 'Dominique Perrier', '25, rue Lauriston', 'Paris', '75016', 'France'),
(75, 'Split Rail Beer & Ale', 'Art Braunschweiger', 'P.O. Box 555', 'Lander', '82520', 'USA'),
(76, 'Suprêmes délices', 'Pascale Cartrain', 'Boulevard Tirou, 255', 'Charleroi', 'B-6000', 'Belgium'),
(77, 'The Big Cheese', 'Liz Nixon', '89 Jefferson Way Suite 2', 'Portland', '97201', 'USA'),
(78, 'The Cracker Box', 'Liu Wong', '55 Grizzly Peak Rd.', 'Butte', '59801', 'USA'),
(79, 'Toms Spezialitäten', 'Karin Josephs', 'Luisenstr. 48', 'Münster', '44087', 'Germany'),
(80, 'Tortuga Restaurante', 'Miguel Angel Paolino', 'Avda. Azteca 123', 'México D.F.', '5033', 'Mexico'),
(81, 'Tradição Hipermercados', 'Anabela Domingues', 'Av. Inês de Castro, 414', 'São Paulo', '5604', 'Brazil'),
(82, 'Trails Head Gourmet Provisioners', 'Helvetius Nagy', '722 DaVinci Blvd.', 'Kirkland', '98034', 'USA'),
(83, 'Vaffeljernet', 'Palle Ibsen', 'Smagsløget 45', 'Århus', '8200', 'Denmark'),
(84, 'Victuailles en stock', 'Mary Saveley', '2, rue du Commerce', 'Lyon', '69004', 'France'),
(85, 'Vins et alcools Chevalier', 'Paul Henriot', '59 rue de l Abbaye', 'Reims', '51100', 'France'),
(86, 'Die Wandernde Kuh', 'Rita Müller', 'Adenauerallee 900', 'Stuttgart', '70563', 'Germany'),
(87, 'Wartian Herkku', 'Pirkko Koskitalo', 'Torikatu 38', 'Oulu', '90110', 'Finland'),
(88, 'Wellington Importadora', 'Paula Parente', 'Rua do Mercado, 12', 'Resende', '8374', 'Brazil'),
(89, 'White Clover Markets', 'Karl Jablonski', '305 - 14th Ave. S. Suite 3B', 'Seattle', '98128', 'USA'),
(90, 'Wilman Kala', 'Matti Karttunen', 'Keskuskatu 45', 'Helsinki', '21240', 'Finland'),
(91, 'Wolski', 'Zbyszek', 'ul. Filtrowa 68', 'Walla', '-11', 'Poland');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employeeID` int(11) NOT NULL,
  `first_name` text DEFAULT NULL,
  `last_name` text NOT NULL,
  `birthdate` text DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employeeID`, `first_name`, `last_name`, `birthdate`, `notes`) VALUES
(1, 'Davolio', 'Nancy', '1968-12-08', 'Education includes a BA in psychology from Colorado State University. She also completed (The Art of the Cold Call). Nancy is a member of Toastmasters International.'),
(2, 'Fuller', 'Andrew', '1952-02-19', 'Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales. Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.'),
(3, 'Leverling', 'Janet', '1963-08-30', 'Janet has a BS degree in chemistry from Boston College). She has also completed a certificate program in food retailing management. Janet was hired as a sales associate and was promoted to sales representative.'),
(4, 'Peacock', 'Margaret', '1958-09-19', 'Margaret holds a BA in English literature from Concordia College and an MA from the American Institute of Culinary Arts. She was temporarily assigned to the London office before returning to her permanent post in Seattle.'),
(5, 'Buchanan', 'Steven', '1955-03-04', 'Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree. Upon joining the company as a sales representative, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London, where he was promoted to sales manager. Mr. Buchanan has completed the courses Successful Telemarketing and International Sales Management. He is fluent in French.'),
(6, 'Suyama', 'Michael', '1963-07-02', 'Michael is a graduate of Sussex University (MA, economics) and the University of California at Los Angeles (MBA, marketing). He has also taken the courses Multi-Cultural Selling and Time Management for the Sales Professional. He is fluent in Japanese and can read and write French, Portuguese, and Spanish.'),
(7, 'King', 'Robert', '1960-05-29', 'Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan and then joining the company. After completing a course entitled Selling in Europe, he was transferred to the London office.'),
(8, 'Callahan', 'Laura', '1958-01-09', 'Laura received a BA in psychology from the University of Washington. She has also completed a course in business French. She reads and writes French.'),
(9, 'Dodsworth', 'Anne', '1969-07-02', 'Anne has a BA degree in English from St. Lawrence College. She is fluent in French and German.'),
(10, 'West', 'Adam', '1928-09-19', 'An old chum.');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `employeeID` int(11) NOT NULL,
  `orderdate` text DEFAULT NULL,
  `shipperID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `customerID`, `employeeID`, `orderdate`, `shipperID`) VALUES
(10248, 90, 5, '1985', 3),
(10249, 81, 6, '1984', 1),
(10250, 34, 4, '1981', 2),
(10251, 84, 3, '1981', 1),
(10252, 76, 4, '1980', 2),
(10253, 34, 3, '1979', 2),
(10254, 14, 5, '1978', 2),
(10255, 68, 9, '1977', 3),
(10256, 88, 3, '1974', 2),
(10257, 35, 4, '1973', 3),
(10258, 20, 1, '1972', 1),
(10259, 13, 4, '1971', 3),
(10260, 55, 4, '1970', 1),
(10261, 61, 4, '1970', 2),
(10262, 65, 8, '1967', 3),
(10263, 20, 9, '1966', 3),
(10264, 24, 6, '1965', 3),
(10265, 7, 2, '1964', 1),
(10266, 87, 3, '1963', 3),
(10267, 25, 4, '1960', 1),
(10268, 33, 8, '1959', 3),
(10269, 89, 5, '1958', 1),
(10270, 87, 1, '1987', 1),
(10271, 75, 6, '1987', 2),
(10272, 65, 6, '1986', 2),
(10273, 63, 3, '1983', 3),
(10274, 85, 6, '1982', 1),
(10275, 49, 1, '1981', 1),
(10276, 80, 8, '1980', 3),
(10277, 52, 2, '1979', 3),
(10278, 5, 8, '1976', 2),
(10279, 44, 8, '1975', 2),
(10280, 5, 2, '1974', 1),
(10281, 69, 4, '1974', 1),
(10282, 69, 4, '1973', 1),
(10283, 46, 3, '1972', 3),
(10284, 44, 4, '1969', 1),
(10285, 63, 1, '1968', 2),
(10286, 63, 8, '1967', 3),
(10287, 67, 8, '1966', 3),
(10288, 66, 4, '1965', 1),
(10289, 11, 7, '1962', 3),
(10290, 15, 8, '1961', 1),
(10291, 61, 6, '1961', 2),
(10292, 81, 1, '1960', 2),
(10293, 80, 1, '1959', 3),
(10294, 65, 4, '1958', 2),
(10295, 85, 2, '1985', 2),
(10296, 46, 6, '1984', 1),
(10297, 7, 5, '1983', 2),
(10298, 37, 6, '1982', 2),
(10299, 67, 4, '1981', 2),
(10300, 49, 2, '1978', 2),
(10301, 86, 8, '1978', 2),
(10302, 76, 4, '1977', 2),
(10303, 30, 7, '1976', 2),
(10304, 80, 1, '1975', 2),
(10305, 55, 8, '1974', 3),
(10306, 69, 1, '1971', 3),
(10307, 48, 2, '1970', 2),
(10308, 2, 7, '1969', 3),
(10309, 37, 3, '1968', 1),
(10310, 77, 8, '1967', 2),
(10311, 18, 1, '1967', 3),
(10312, 86, 2, '1964', 2),
(10313, 63, 2, '1963', 2),
(10314, 65, 1, '1962', 2),
(10315, 38, 4, '1961', 2),
(10316, 65, 1, '1960', 3),
(10317, 48, 6, '1957', 1),
(10318, 38, 8, '1985', 2),
(10319, 80, 7, '1984', 3),
(10320, 87, 5, '1983', 3),
(10321, 38, 3, '1983', 2),
(10322, 58, 7, '1982', 3),
(10323, 39, 4, '1979', 1),
(10324, 71, 9, '1978', 1),
(10325, 39, 1, '1977', 3),
(10326, 8, 4, '1976', 2),
(10327, 24, 2, '1975', 1),
(10328, 28, 4, '1972', 3),
(10329, 75, 4, '1971', 2),
(10330, 46, 3, '1970', 1),
(10331, 9, 9, '1970', 1),
(10332, 51, 3, '1969', 2),
(10333, 87, 5, '1968', 3),
(10334, 84, 8, '1965', 2),
(10335, 37, 7, '1964', 2),
(10336, 60, 7, '1963', 2),
(10337, 25, 4, '1962', 3),
(10338, 55, 4, '1961', 3),
(10339, 51, 2, '1958', 2),
(10340, 9, 1, '1957', 3),
(10341, 73, 7, '1957', 3),
(10342, 25, 4, '1956', 2),
(10343, 44, 4, '1955', 1),
(10344, 89, 4, '1984', 2),
(10345, 63, 2, '1981', 2),
(10346, 65, 3, '1980', 3),
(10347, 21, 4, '1979', 3),
(10348, 86, 4, '1978', 2),
(10349, 75, 7, '1977', 1),
(10350, 41, 6, '1974', 2),
(10351, 20, 1, '1974', 1),
(10352, 28, 3, '1973', 3),
(10353, 59, 7, '1972', 3),
(10354, 58, 8, '1971', 3),
(10355, 4, 6, '1970', 1),
(10356, 86, 6, '1967', 2),
(10357, 46, 1, '1966', 3),
(10358, 41, 5, '1965', 1),
(10359, 72, 5, '1964', 3),
(10360, 7, 4, '1963', 3),
(10361, 63, 1, '1963', 2),
(10362, 9, 3, '1960', 1),
(10363, 17, 4, '1959', 3),
(10364, 19, 1, '1959', 1),
(10365, 3, 3, '1958', 2),
(10366, 29, 8, '1957', 2),
(10367, 83, 7, '1957', 3),
(10368, 20, 2, '1956', 2),
(10369, 75, 8, '1982', 2),
(10370, 14, 6, '1981', 2),
(10371, 41, 1, '1981', 1),
(10372, 62, 5, '1980', 2),
(10373, 37, 4, '1979', 3),
(10374, 91, 1, '1979', 3),
(10375, 36, 3, '1978', 2),
(10376, 51, 1, '1975', 2),
(10377, 72, 1, '1975', 3),
(10378, 24, 5, '1974', 3),
(10379, 61, 2, '1973', 1),
(10380, 37, 8, '1972', 3),
(10381, 46, 3, '1972', 3),
(10382, 20, 4, '1971', 1),
(10383, 4, 8, '1968', 3),
(10384, 5, 3, '1968', 3),
(10385, 75, 1, '1967', 2),
(10386, 21, 9, '1966', 3),
(10387, 70, 1, '1966', 2),
(10388, 72, 2, '1965', 1),
(10389, 10, 4, '1964', 2),
(10390, 20, 6, '1961', 1),
(10391, 17, 3, '1961', 3),
(10392, 59, 2, '1960', 3),
(10393, 71, 1, '1959', 3),
(10394, 36, 1, '1959', 3),
(10395, 35, 6, '1958', 1),
(10396, 25, 1, '1957', 3),
(10397, 60, 5, '1957', 1),
(10398, 71, 2, '1954', 3),
(10399, 83, 8, '1953', 3),
(10400, 19, 1, '1995', 3),
(10401, 65, 1, '1995', 1),
(10402, 20, 8, '1994', 2),
(10403, 20, 4, '1993', 3),
(10404, 49, 2, '1993', 1),
(10405, 47, 1, '1990', 1),
(10406, 62, 7, '1989', 1),
(10407, 56, 2, '1989', 2),
(10408, 23, 8, '1988', 1),
(10409, 54, 3, '1987', 1),
(10410, 10, 3, '1986', 3),
(10411, 10, 9, '1986', 3),
(10412, 87, 8, '1983', 2),
(10413, 41, 3, '1982', 2),
(10414, 21, 2, '1982', 3),
(10415, 36, 3, '1981', 1),
(10416, 87, 8, '1980', 3),
(10417, 73, 4, '1980', 3),
(10418, 63, 4, '1979', 1),
(10419, 68, 4, '1976', 2),
(10420, 88, 3, '1975', 1),
(10421, 61, 8, '1975', 1),
(10422, 27, 2, '1974', 1),
(10423, 31, 6, '1973', 3),
(10424, 51, 7, '1973', 2),
(10425, 41, 6, '1972', 2),
(10426, 29, 4, '1969', 1),
(10427, 59, 4, '1969', 2),
(10428, 66, 7, '1968', 1),
(10429, 37, 3, '1967', 2),
(10430, 20, 4, '1966', 1),
(10431, 10, 4, '1966', 2),
(10432, 75, 3, '1965', 2),
(10433, 60, 3, '1992', 3),
(10434, 24, 3, '1992', 2),
(10435, 16, 8, '1991', 2),
(10436, 7, 3, '1990', 2),
(10437, 87, 8, '1990', 1),
(10438, 79, 3, '1989', 2),
(10439, 51, 6, '1988', 3),
(10440, 71, 4, '1985', 2),
(10441, 55, 3, '1985', 2),
(10442, 20, 3, '1984', 2),
(10443, 66, 8, '1983', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shippers`
--

CREATE TABLE `shippers` (
  `shipperID` int(11) NOT NULL,
  `shipper_name` text NOT NULL,
  `phone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shippers`
--

INSERT INTO `shippers` (`shipperID`, `shipper_name`, `phone`) VALUES
(1, 'Speedy Express', 0),
(2, 'United Package', 0),
(3, 'Federal Shipping', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employeeID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `employeeID` (`employeeID`),
  ADD KEY `shipperID` (`shipperID`);

--
-- Indexes for table `shippers`
--
ALTER TABLE `shippers`
  ADD PRIMARY KEY (`shipperID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customers` (`customerID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`employeeID`) REFERENCES `employees` (`employeeID`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`shipperID`) REFERENCES `shippers` (`shipperID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
