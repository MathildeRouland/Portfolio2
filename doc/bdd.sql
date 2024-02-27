-- Adminer 4.7.6 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alpha_order` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discr` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_23A0E66D823E37A` (`section_id`),
  CONSTRAINT `FK_23A0E66D823E37A` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `article` (`id`, `section_id`, `title`, `content`, `alpha_order`, `discr`, `date`, `location`, `image`, `category`) VALUES
(1,	1,	'Développeuse web',	'<p>En formation de développeur web chez O\'Clock - de juin à mi-novembre 2023 - je suis en spécialisation backend sur le framework Symfony.</p>\r\n            <p>La formation m\'a amenée à travailler sur plusieurs projets concrets comme un catalogue de produits type site de vente en ligne, ou des backoffices avec API et authentification. </p>\r\n            \r\n            <p>Le programme repose sur une formation de 6 mois:</p>\r\n            <ul>\r\n              <li>un socle de 3 mois sur les technologies et notions suivantes:</li>\r\n                <ul>\r\n                  <li>HTML 5, CSS3, Javascript; </li>\r\n                  <li>PHP, SQL;</li>\r\n                  <li>Gestion de projet et agilité.</li>\r\n                </ul>\r\n              <li>1 mois de spécialisation sur Symfony</li>\r\n              <li>1 mois de projet en équipe.</li>          \r\n            </ul>',	'a',	'articleCv',	NULL,	NULL,	NULL,	NULL),
(2,	2,	'HTML5',	NULL,	'ba',	'articleProjectTechnos',	NULL,	NULL,	'assets/img/logo-html5.png',	NULL),
(3,	2,	'CSS3',	NULL,	'bb',	'articleProjectTechnos',	NULL,	NULL,	'assets/img/logo-CSS3.png',	NULL),
(4,	2,	'JavaScript',	NULL,	'bc',	'articleProjectTechnos',	NULL,	NULL,	'assets/img/logo-js.png',	NULL),
(5,	2,	'PHP',	NULL,	'bd',	'articleProjectTechnos',	NULL,	NULL,	'assets/img/logo-php.png',	NULL),
(6,	2,	'SQL',	NULL,	'be',	'articleProjectTechnos',	NULL,	NULL,	'assets/img/logo-mariadb.png',	NULL),
(7,	2,	'Git',	NULL,	'bf',	'articleProjectTechnos',	NULL,	NULL,	'assets/img/logo-git.png',	NULL),
(8,	2,	'C2i2e (Certificat Informatique et Internet niv.2 enseignant)',	NULL,	'bg',	'articleProjectTechnos',	NULL,	NULL,	'assets/img/logo-c2i2e.jpg',	NULL),
(9,	2,	'Anglais',	'niveau B2',	'bh',	'articleProjectTechnos',	NULL,	NULL,	NULL,	NULL),
(10,	2,	'Certification Voltaire',	'899 points',	'bi',	'articleProjectTechnos',	NULL,	NULL,	NULL,	NULL),
(11,	3,	'Développeur web',	'Projet de fin de formation: <br>Réalisation d\'une application web en équipe (4 personnes), de sa conception, jusqu\'au déploiement d\'un MVP en méthodologie agile.',	'ca',	'articleCv',	'octobre 2023',	'Ecole o\'Clock',	NULL,	'Expérience'),
(12,	3,	'Ingénieur en développement-stage d\'immersion',	'observation en équipe: conception technique, programmation et relecture de code, tests manuels et automatisés, analyse et résolution de problèmes de production,  livraison en production.',	'cb',	'articleCv',	'20 au 24/03/2023',	'HelloWork, Rennes',	NULL,	'Expérience'),
(13,	3,	'Chef de projet digital learning',	'Modules parcours d\'intégration des nouveaux collaborateurs (synopsis, storyboard, réalisation)</li>\r\n                <li>Formation des collaborateurs à l\'ENT O365</li>\r\n                <li>Réalisation de tutoriels vidéos',	'cc',	'articleCv',	'mai à décembre 2022',	'CLPS l\'Enjeu compétences',	NULL,	'Expérience'),
(14,	3,	'Chargée d\'e-ingénierie pédagogique',	'Schémas pédagogiques interactifs et motion design (Genially, Blender) - visite virtuelle médiathèque (Uptale) - Recettage (LMS Moodle)</li>\r\n                <li>Digitalisation de ressources (Scenari, Opale), création d\'illustrations, exercices interactifs',	'cd',	'articleCv',	'fév. 2021 à fév. 2022',	'Ecole Supérieure d\'Agriculture d\'Angers',	NULL,	'Expérience'),
(15,	3,	'Chargée de communication et de formation',	'Animation et coordination d\'un réseau de 9 associations régionales</li>\r\n                <li>communication: externe et interne, utilisation du backoffice du site web</li>\r\n                <li>événementiel: organisation d\'un festival (20 partenaires, 1000 visiteurs)</li>\r\n                <li> gestion de projet - organisation de formations et référencement Datadock',	'ce',	'articleCv',	'fév. 2017 à juin 2019',	'Association InPACT Nouvelle-Aquitaine',	NULL,	'Expérience'),
(16,	3,	'Animatrice multimédia',	'Médiation numérique et formation</li>\r\n                <li>événementiel (exposition d\'art numérique)</li>\r\n                <li>maintenance de niveau 1 du parc informatique',	'cf',	'articleCv',	'juin 2012 à décembre 2013',	'Espace Public Numérique, CFPPA de Die',	NULL,	'Expérience'),
(17,	3,	'Développeur web',	'Titre professionnel DWWM (obtenu) - 798h - HTML5, CSS3, Javascript, PHP, Laravel, Symfony, Twig, Doctrine, architecture MVC, MariaDB, API Rest, Git, Github...',	'cg',	'articleCv',	'juin - novembre 2023',	'Ecole O\'Clock',	NULL,	'Formation'),
(18,	3,	'Digital Job Experience',	'2 jours pour découvrir les métiers du web, conception d\'un site et création d\'une page web statique',	'ch',	'articleCv',	'février 2023',	'Estim Numérique',	NULL,	'Formation'),
(19,	3,	'Html5, CSS3, Javascript',	'autoformation',	'ci',	'articleCv',	'janvier à juin 2023',	'OpenClassroom',	NULL,	'Formation'),
(20,	3,	'Concepteur de contenus formatifs digitaux',	NULL,	'cj',	'articleCv',	'2020 - 2021',	'Evocime, Rennes',	NULL,	'Formation'),
(21,	3,	'Master 2 enseignement agricole et développement rural (distanciel)',	'option éducation socioculturelle',	'ck',	'articleCv',	'2011 - 2014',	'ENSFEA',	NULL,	'Formation'),
(22,	3,	'Diplôme Universitaire des Métiers d\'Art',	NULL,	'cl',	'articleCv',	'2007 - 2010',	'Ecole Supérieure des Métiers d\'Art d\'Arras',	NULL,	'Formation'),
(23,	4,	'Projet de fin de formation',	'Projet \"Association Entraide Chômeurs\" en équipe de 5 (3 dont moi-même pour le backend et 2 pour le frontend), avec le framework Symfony, de sa conception, jusqu\'au déploiement d\'un MVP en méthodologie agile, où j\'assurais le rôle de scrum master.',	'da',	'articleProjectTechnos',	NULL,	NULL,	'bi bi-briefcase',	NULL),
(24,	4,	'Catalogue de films',	'Site catalogue de films avec Symfony, une API Rest, Doctrine, Twig, mise en place de l\'authentification.',	'db',	'articleProjectTechnos',	NULL,	NULL,	'bi bi-binoculars',	NULL),
(25,	4,	'Back-office Laravel',	'Projet de back-office avec le framework Laravel, l\'API Rest et l\'ORM Eloquent, appel de l\'API avec Javascript, authentification.',	'dc',	'articleProjectTechnos',	NULL,	NULL,	'bi bi-boxes',	NULL),
(26,	4,	'Mini-site catalogue produits',	'Mise en place de l\'architecture MVC, SQL avec MariaDB, PSR-4 autoload et namespaces.',	'dd',	'articleProjectTechnos',	NULL,	NULL,	'bi bi-card-checklist',	NULL),
(27,	4,	'Plugin Ruby pour Sketchup Pro',	'Participation à l\'écriture d\'un plugin Sketchup Pro en Ruby qui permet de lister le matériel technique mis en œuvre dans le cadre d\'événements festifs.',	'de',	'articleProjectTechnos',	NULL,	NULL,	'bi bi-boxes',	NULL),
(28,	4,	'Script Google App',	'Réalisation de scripts Google App Script pour google Sheet, utilisés dans le cadre des outils de gestion d\'un festival de musique (<a href=\"https://biches-festival.fr/\">Biches Festival</a>).',	'df',	'articleProjectTechnos',	NULL,	NULL,	'bi bi-boxes',	NULL);

-- 2024-02-27 16:32:33