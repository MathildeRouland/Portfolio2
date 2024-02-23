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

INSERT INTO `article` (`id`, `section_id`, `title`, `content`, `alpha_order`, `discr`, `date`, `location`, `image`) VALUES
(1,	1,	'Développeuse web',	'<p>En formation de développeur web chez O\'Clock - de juin à mi-novembre 2023 - je suis en spécialisation backend sur le framework Symfony.</p>\r\n            <p>La formation m\'a amenée à travailler sur plusieurs projets concrets comme un catalogue de produits type site de vente en ligne, ou des backoffices avec API et authentification. </p>\r\n            \r\n            <p>Le programme repose sur une formation de 6 mois:</p>\r\n            <ul>\r\n              <li>un socle de 3 mois sur les technologies et notions suivantes:</li>\r\n                <ul>\r\n                  <li>HTML 5, CSS3, Javascript; </li>\r\n                  <li>PHP, SQL;</li>\r\n                  <li>Gestion de projet et agilité.</li>\r\n                </ul>\r\n              <li>1 mois de spécialisation sur Symfony</li>\r\n              <li>1 mois de projet en équipe.</li>          \r\n            </ul>',	'a',	'articleCv',	NULL,	NULL,	NULL),
(2,	2,	'HTML5',	NULL,	'ba',	'articleProjectTechnos',	NULL,	NULL,	'assets/img/logo-html5.png'),
(3,	2,	'CSS3',	NULL,	'bb',	'articleProjectTechnos',	NULL,	NULL,	'assets/img/logo-CSS3.png'),
(4,	2,	'JavaScript',	NULL,	'bc',	'articleProjectTechnos',	NULL,	NULL,	'assets/img/logo-js.png'),
(5,	2,	'PHP',	NULL,	'bd',	'articleProjectTechnos',	NULL,	NULL,	'assets/img/logo-php.png'),
(6,	2,	'SQL',	NULL,	'be',	'articleProjectTechnos',	NULL,	NULL,	'assets/img/logo-mariadb.png'),
(7,	2,	'Git',	NULL,	'bf',	'articleProjectTechnos',	NULL,	NULL,	'assets/img/logo-git.png'),
(8,	2,	'C2i2e (Certificat Informatique et Internet niv.2 enseignant)',	NULL,	'bg',	'articleProjectTechnos',	NULL,	NULL,	'assets/img/logo-c2i2e.jpg'),
(9,	2,	'Anglais',	'niveau B2',	'bh',	'articleProjectTechnos',	NULL,	NULL,	NULL),
(10,	2,	'Certification Voltaire',	'899 points',	'bi',	'articleProjectTechnos',	NULL,	NULL,	NULL),
(11,	3,	'Développeur web',	'<ul>\r\n                <li>Projet de fin de formation: <br>Réalisation d\'une application web en équipe (4 personnes), de sa conception, jusqu\'au déploiement d\'un MVP en méthodologie agile.</li>\r\n              </ul>',	'ca',	'articleCv',	'octobre 2023',	'Ecole o\'Clock',	NULL),
(12,	3,	'Ingénieur en développement-stage d\'immersion',	'<ul>\r\n                <li>observation en équipe: conception technique, programmation et relecture de code, tests manuels et automatisés, analyse et résolution de problèmes de production,  livraison en production.</li>                \r\n              </ul>',	'cb',	'articleCv',	'20 au 24/03/2023',	'HelloWork, Rennes',	NULL),
(13,	3,	'Chef de projet digital learning',	'<ul>\r\n                <li>Modules parcours d\'intégration des nouveaux collaborateurs (synopsis, storyboard, réalisation)</li>\r\n                <li>Formation des collaborateurs à l\'ENT O365</li>\r\n                <li>Réalisation de tutoriels vidéos</li>           \r\n              </ul>',	'cc',	'articleCv',	'mai à décembre 2022',	'CLPS l\'Enjeu compétences',	NULL),
(14,	3,	'Chargée d\'e-ingénierie pédagogique',	'<ul>\r\n                <li>Schémas pédagogiques interactifs et motion design (Genially, Blender) - visite virtuelle médiathèque (Uptale) - Recettage (LMS Moodle)</li>\r\n                <li>Digitalisation de ressources (Scenari, Opale), création d\'illustrations, exercices interactifs</li>\r\n              </ul>',	'cd',	'articleCv',	'fév. 2021 à fév. 2022',	'Ecole Supérieure d\'Agriculture d\'Angers',	NULL),
(15,	3,	'Chargée de communication et de formation',	'<ul>\r\n                <li>Animation et coordination d\'un réseau de 9 associations régionales</li>\r\n                <li>communication: externe et interne, utilisation du backoffice du site web</li>\r\n                <li>événementiel: organisation d\'un festival (20 partenaires, 1000 visiteurs)</li>\r\n                <li> gestion de projet - organisation de formations et référencement Datadock</li>\r\n              </ul>',	'ce',	'articleCv',	'fév. 2017 à juin 2019',	'Association InPACT Nouvelle-Aquitaine',	NULL),
(16,	3,	'Animatrice multimédia',	'<ul>\r\n                <li>Médiation numérique et formation</li>\r\n                <li>événementiel (exposition d\'art numérique)</li>\r\n                <li>maintenance de niveau 1 du parc informatique</li>\r\n              </ul>',	'cf',	'articleCv',	'juin 2012 à décembre 2013',	'Espace Public Numérique, CFPPA de Die',	NULL),
(17,	3,	'Développeur web',	'<p>798h - HTML5, CSS3, Javascript, PHP, Laravel, Symfony, Twig, Doctrine, architecture MVC, MariaDB, API Rest, Git, Github...</p>',	'cg',	'articleCv',	'juin - novembre 2023',	'Ecole O\'Clock',	NULL),
(18,	3,	'Digital Job Experience',	'<p>2 jours pour découvrir les métiers du web, conception d\'un site et création d\'une page web statique</p>',	'ch',	'articleCv',	'février 2023',	'Estim Numérique',	NULL),
(19,	3,	'Html5, CSS3, Javascript',	'<p>autoformation</p>',	'ci',	'articleCv',	'janvier à juin 2023',	'OpenClassroom',	NULL),
(20,	3,	'Concepteur de contenus formatifs digitaux',	NULL,	'cj',	'articleCv',	'2020 - 2021',	'Evocime, Rennes',	NULL),
(21,	3,	'Master 2 enseignement agricole et développement rural (distanciel)',	'<p>option éducation socioculturelle</p>',	'ck',	'articleCv',	'2011 - 2014',	'ENSFEA',	NULL),
(22,	3,	'Diplôme Universitaire des Métiers d\'Art',	NULL,	'cl',	'articleCv',	'2007 - 2010',	'Ecole Supérieure des Métiers d\'Art d\'Arras',	NULL),
(23,	4,	'Projet de fin de formation',	'<p class=\"description\">Projet \"Association Entraide Chômeurs\" en équipe de 5 (3 dont moi-même pour le backend et 2 pour le frontend), avec le framework Symfony, de sa conception, jusqu\'au déploiement d\'un MVP en méthodologie agile, où j\'assurais le rôle de scrum master.</p>',	'da',	'articleProjectTechnos',	NULL,	NULL,	'bi bi-briefcase'),
(24,	4,	'Catalogue de films',	'<p class=\"description\">Site catalogue de films avec Symfony, une API Rest, Doctrine, Twig, mise en place de l\'authentification. </p>',	'db',	'articleProjectTechnos',	NULL,	NULL,	'bi bi-binoculars'),
(25,	4,	'Back-office Laravel',	'<p class=\"description\">Projet de back-office avec le framework Laravel, l\'API Rest et l\'ORM Eloquent, appel de l\'API avec Javascript, authentification </p>',	'dc',	'articleProjectTechnos',	NULL,	NULL,	'bi bi-boxes'),
(26,	4,	'Mini-site catalogue produits',	'<p class=\"description\">Mise en place de l\'architecture MVC, SQL avec MariaDB, PSR-4 autoload et namespaces</p>',	'dd',	'articleProjectTechnos',	NULL,	NULL,	'bi bi-card-checklist'),
(27,	4,	'Plugin Ruby pour Sketchup Pro',	'<p class=\"description\">Participation à l\'écriture d\'un plugin Sketchup Pro en Ruby qui permet de lister le matériel technique mis en œuvre dans le cadre d\'événements festifs.</p>',	'de',	'articleProjectTechnos',	NULL,	NULL,	'bi bi-boxes'),
(28,	4,	'Script Google App',	'<p class=\"description\">Réalisation de scripts Google App Script pour google Sheet, utilisés dans le cadre des outils de gestion d\'un festival de musique (<a href=\"https://biches-festival.fr/\">Biches Festival</a>).\r\n            </p>',	'df',	'articleProjectTechnos',	NULL,	NULL,	'bi bi-boxes');

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240219205529',	'2024-02-19 21:55:38',	87);

DROP TABLE IF EXISTS `section`;
CREATE TABLE `section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `article_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `section` (`id`, `name`, `content`, `article_type`, `css_class`) VALUES
(1,	'A propos de moi',	'<p>Après avoir occupé plusieurs postes en lien avec le digital, notamment animatrice multimédia, chargée de communication et conceptrice digital learning, j’ai eu envie de passer de l’autre côté des interfaces. Je me suis alors reconvertie en tant que développeuse web, pour mettre mon enthousiasme et mon goût pour la résolution de problèmes techniques au service d\'un projet d\'équipe.</p>\r\n          \r\n          <br><p>Que diriez-vous de m\'intégrer dans votre équipe? Rencontrons-nous! </p>',	'ArticleCv',	'about'),
(2,	'Savoir-être et compétences',	'Au fil de mes expériences, j\'ai développé ma curiosité, mon adaptabilité, mon écoute et mon esprit d\'équipe.\r\nJ\'ai également mis en pratique l\'analyse des besoins client, la rédaction d\'un cahier des charges, la conduite de projet, l\'animation de réunions.',	'ArticleProjectTechnos',	'skills section-bg'),
(3,	'Curriculum Vitae',	NULL,	'ArticleCv',	'resume'),
(4,	'Projets',	'J\'ai travaillé sur quelques projets avant d\'entrer chez O\'Clock. Ensuite, tout au long de la formation, j\'ai pu mettre en pratique mes connaissances sur plusieurs projets articulant frontend et backend. Celle-ci se termine par un projet final d\'un mois.',	'ArticleProjectTechnos',	'projects'),
(5,	'Contactez-moi',	NULL,	'ArticleCv',	'contact');

-- 2024-02-23 16:53:14