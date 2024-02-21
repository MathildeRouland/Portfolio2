<?php

namespace App\Controller\Front;

use App\Repository\ArticleRepository;
use App\Repository\SectionRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MainController extends AbstractController
{
    /**
     * @Route("/front/main", name="app_front_main")
     */
    public function home(ArticleRepository $articleRepository, SectionRepository $sectionRepository): Response
    {
        //récupération de toutes les sections
        $sections = $sectionRepository->findAll();
        // récupération de la liste des articles par section
        // $articlesBySection = findArticlesBySection();
        // foreach ($allSections as $section) {
        //     $sectionName = $section->getName();
        //     $articlesBySection = $section->getArticle();
        // }
        
        // var_dump($articlesBySection);
        return $this->render('front/main/home.html.twig', [
            'controller_name' => 'MainController',
            'sections' => $sections,
            // 'articlesBySection' => $articlesBySection
        ]);
    }
}
