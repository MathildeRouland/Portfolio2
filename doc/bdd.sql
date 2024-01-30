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
  `discr` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alpha_order` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_23A0E66D823E37A` (`section_id`),
  CONSTRAINT `FK_23A0E66D823E37A` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `article` (`id`, `section_id`, `title`, `content`, `discr`, `date`, `location`, `image`, `alpha_order`) VALUES
(1,	2,	'HTML5',	NULL,	'articleProjectTechnos',	NULL,	NULL,	'assets/img/logo-html5.png',	'aa'),
(2,	2,	'CSS3',	NULL,	'articleProjectTechnos',	NULL,	NULL,	'/home/student/Bureau/html/Portfolio2/public/assets/img/logo-CSS3.png',	'ab'),
(3,	2,	'JAVASCRIPT',	NULL,	'articleProjectTechnos',	NULL,	NULL,	'assets/img/logo-js.png',	'ac'),
(4,	2,	'PHP',	NULL,	'articleProjectTechnos',	NULL,	NULL,	'assets/img/logo-php.png',	'ad'),
(5,	2,	'LARAVEL',	NULL,	'articleProjectTechnos',	NULL,	NULL,	'assets/img/logo-laravel.png',	'ae'),
(6,	2,	'SYMFONY',	NULL,	'articleProjectTechnos',	NULL,	NULL,	'assets/img/logo-symfony.png',	'af'),
(7,	2,	'SQL',	NULL,	'articleProjectTechnos',	NULL,	NULL,	'assets/img/logo-mariadb.png',	'ag'),
(8,	2,	'GIT',	NULL,	'articleProjectTechnos',	NULL,	NULL,	'assets/img/logo-git.png',	'ah'),
(9,	2,	'C2I2E (CERTIFICAT INFORMATIQUE ET INTERNET NIV.2 ENSEIGNANT)',	NULL,	'articleProjectTechnos',	NULL,	NULL,	'assets/img/logo-c2i2e.jpg',	'ai'),
(10,	2,	'ANGLAIS',	'niveau B2',	'articleProjectTechnos',	NULL,	NULL,	NULL,	'aj'),
(11,	2,	'CERTIFICATION VOLTAIRE',	'899 points',	'articleProjectTechnos',	NULL,	NULL,	NULL,	'ak'),
(14,	4,	'DÉVELOPPEUR WEB',	NULL,	'articleCv',	'octobre 2023',	'Ecole o\'Clock',	NULL,	'al'),
(15,	4,	'INGÉNIEUR EN DÉVELOPPEMENT-STAGE D\'IMMERSION',	'observation en équipe: conception technique, programmation et relecture de code, tests manuels et automatisés, analyse et résolution de problèmes de production, livraison en production.',	'articleCv',	'20 au 24/03/2023',	'HelloWork, Rennes',	NULL,	'am'),
(16,	4,	'CHEF DE PROJET DIGITAL LEARNING',	'Modules parcours d\'intégration des nouveaux collaborateurs (synopsis, storyboard, réalisation)\r\nFormation des collaborateurs à l\'ENT O365\r\nRéalisation de tutoriels vidéos',	'articleCv',	'mai à décembre 2022',	'CLPS l\'Enjeu compétences',	NULL,	'an'),
(17,	4,	'CHARGÉE D\'E-INGÉNIERIE PÉDAGOGIQUE',	'Schémas pédagogiques interactifs et motion design (Genially, Blender) - visite virtuelle médiathèque (Uptale) - Recettage (LMS Moodle)\r\nDigitalisation de ressources (Scenari, Opale), création d\'illustrations, exercices interactifs',	'articleCv',	'fév. 2021 à fév. 2022',	'Ecole Supérieure d\'Agriculture d\'Angers',	NULL,	'ao'),
(18,	4,	'CHARGÉE DE COMMUNICATION ET DE FORMATION',	'Animation et coordination d\'un réseau de 9 associations régionales\r\ncommunication: externe et interne, utilisation du backoffice du site web\r\névénementiel: organisation d\'un festival (20 partenaires, 1000 visiteurs)\r\ngestion de projet - organisation de formations et référencement Datadock',	'articleCv',	'fév. 2017 à juin 2019',	'Association InPACT Nouvelle-Aquitaine',	NULL,	'ap'),
(19,	4,	'ANIMATRICE MULTIMÉDIA',	'Médiation numérique et formation\r\névénementiel (exposition d\'art numérique)\r\nmaintenance de niveau 1 du parc informatique',	'articleCv',	'juin 2012 à déc. 2013',	'Espace Public Numérique, CFPPA de Die (26)',	NULL,	'aq'),
(20,	4,	'DÉVELOPPEUR WEB',	'798h - HTML5, CSS3, Javascript, PHP, Laravel, Symfony, Twig, Doctrine, architecture MVC, MariaDB, API Rest, Git, Github...',	'articleCv',	'juin - novembre 2023',	'Ecole O\'Clock',	NULL,	'ar'),
(21,	4,	'DIGITAL JOB EXPERIENCE',	'2 jours pour découvrir les métiers du web, conception d\'un site et création d\'une page web statique',	'articleCv',	'février 2023',	'Estim Numérique',	NULL,	'as'),
(22,	4,	'HTML5, CSS3, JAVASCRIPT',	'autoformation',	'articleCv',	'janvier à juin 2023',	'OpenClassroom',	NULL,	'at'),
(23,	4,	'CONCEPTEUR DE CONTENUS FORMATIFS DIGITAUX',	NULL,	'articleCv',	'2020 - 2021',	'Evocime, Rennes',	NULL,	'au'),
(24,	4,	'MASTER 2 ENSEIGNEMENT AGRICOLE ET DÉVELOPPEMENT RURAL (DISTANCIEL)',	'option éducation socioculturelle',	'articleCv',	'2011 - 2014',	'ENSFEA',	NULL,	'av'),
(25,	4,	'DIPLÔME UNIVERSITAIRE DES MÉTIERS D\'ART',	NULL,	'articleCv',	'2007 - 2010',	'Ecole Supérieure des Métiers d\'Art d\'Arras',	NULL,	'aw'),
(26,	5,	'Projet de fin de formation',	'Projet \"Association Entraide Chômeurs\" en équipe de 5 (3 dont moi-même pour le backend et 2 pour le frontend), avec le framework Symfony, de sa conception, jusqu\'au déploiement d\'un MVP en méthodologie agile, où j\'assurais le rôle de scrum master.',	'articleProjectTechnos',	NULL,	NULL,	'\"bi bi-briefcase\"',	'ax'),
(27,	5,	'Catalogue de films',	'Site catalogue de films avec Symfony, une API Rest, Doctrine, Twig, mise en place de l\'authentification.',	'articleProjectTechnos',	NULL,	NULL,	'\"bi bi-binoculars',	'ay'),
(28,	5,	'Back-office Laravel',	'Projet de back-office avec le framework Laravel, l\'API Rest et l\'ORM Eloquent, appel de l\'API avec Javascript, authentification',	'articleProjectTechnos',	NULL,	NULL,	'\"bi bi-boxes\"',	'az'),
(29,	5,	'Mini-site catalogue produits',	'Mise en place de l\'architecture MVC, SQL avec MariaDB, PSR-4 autoload et namespaces',	'articleProjectTechnos',	NULL,	NULL,	'\"bi bi-card-checklist\"',	'awa'),
(30,	5,	'Plugin Ruby pour Sketchup Pro',	'Participation à l\'écriture d\'un plugin Sketchup Pro en Ruby qui permet de lister le matériel technique mis en œuvre dans le cadre d\'événements festifs.',	'articleProjectTechnos',	NULL,	NULL,	'\"bi bi-boxes\"',	'awb'),
(31,	5,	'Script Google App',	'Réalisation de scripts Google App Script pour google Sheet, utilisés dans le cadre des outils de gestion d\'un festival de musique (Biches Festival).',	'articleProjectTechnos',	NULL,	NULL,	'\"bi bi-boxes\"',	'awc');

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240125171725',	'2024-01-30 15:56:26',	80),
('DoctrineMigrations\\Version20240126095657',	'2024-01-30 15:56:26',	3);

DROP TABLE IF EXISTS `section`;
CREATE TABLE `section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `article_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `section` (`id`, `name`, `content`, `article_type`) VALUES
(1,	'A propos de moi',	'Après avoir occupé plusieurs postes en lien avec le digital, notamment animatrice multimédia, chargée de communication et conceptrice digital learning, j’ai eu envie de passer de l’autre côté des interfaces. Je me suis alors reconvertie en tant que développeuse web, pour mettre mon enthousiasme et mon goût pour la résolution de problèmes techniques au service d\'un projet d\'équipe.\r\n\r\n\r\nQue diriez-vous de m\'intégrer dans votre équipe? Rencontrons-nous!',	'ArticleCv'),
(2,	'Savoir-être et compétences',	'Au fil de mes expériences, j\'ai développé ma curiosité, mon adaptabilité, mon écoute et mon esprit d\'équipe\r\nJ\'ai également mis en pratique l\'analyse des besoins client, la rédaction d\'un cahier des charges, la conduite de projet, l\'animation de réunions.',	'ArticleProjectTechnos'),
(4,	'Curriculum Vitae',	NULL,	'ArticleCv'),
(5,	'Projets',	'J\'ai travaillé sur quelques projets avant d\'entrer chez O\'Clock. Ensuite, tout au long de la formation, j\'ai pu mettre en pratique mes connaissances sur plusieurs projets articulant frontend et backend. Celle-ci se termine par un projet final d\'un mois.',	'ArticleProjectTechnos');

-- 2024-01-30 16:02:14