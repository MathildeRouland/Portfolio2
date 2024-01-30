<?php

namespace App\Controller;

use App\Entity\Article;
use App\Form\ArticleCvType;
use App\Controller\ArticleController;
use App\Repository\ArticleRepository;
use App\Repository\SectionRepository;
use App\Form\ArticleProjectTechnosType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;


/**
 * @Route("/back/article", name="app_back_article_")
 */
class ArticleController extends AbstractController
{
    /**
     * @Route("/article", name="app_article")
     */
    public function index(): Response
    {
        return $this->render('article/index.html.twig', [
            'controller_name' => 'ArticleController',
        ]);
    }

    /**
     * @Route("/{id}/edit", name="edit", methods={"GET","POST"})
     */
    public function edit(Article $article, ArticleRepository $articleRepository, SectionRepository $sectionRepository, Request $request, EntityManagerInterface $em): Response
    {
        if ($article->getSection()->getArticleType() == 'ArticleCv') {
            $articleCv = $articleRepository->find($article->getId());
            $form = $this->createForm(ArticleCvType::class, $articleCv);
           
            $form->handleRequest($request);
            if ($form->isSubmitted() && $form->isValid())
            {


                $em->persist($articleCv);
                $em->flush();
                // todo ajouter un message flash

                return $this->redirectToRoute('app_back_section_article_browse', ['id' => $section->getId()]);

            }

            return $this->renderForm('back/section/article/edit.html.twig', [
                'form' => $form,
                'articleCv' => $articleCv,
                // 'section' => $section,
                'article' => $article
            ]);

    } else if ($article->getSection()->getArticleType() == 'ArticleProjectTechnos') {
        $articleProjectTechnos = $articleRepository->find($article->getId());  
                
        $form = $this->createForm(ArticleProjectTechnosType::class, $articleProjectTechnos);
       
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid())
        {
            

            $em->persist($articleProjectTechnos);
            $em->flush();
            // todo ajouter un message flash

            return $this->redirectToRoute('app_back_section_article_browse', ['id' => $article->getSection()->getId()]);

        }
    
        return $this->renderForm('back/section/article/edit.html.twig', [
            'form' => $form,
            'articleProjectTechnos' => $articleProjectTechnos,
            // 'section' => $section,
            'article' => $article
        ]);
    

    }
}
}