<?php

namespace App\Controller\Back;

use App\Entity\Article;
use App\Entity\Section;
use App\Form\SectionType;
use App\Repository\ArticleRepository;
use App\Repository\SectionRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use App\Entity\ArticleCv;
use App\Form\ArticleCvType;
use App\Entity\ArticleProjectTechnos;
use App\Form\ArticleProjectTechnosType;


/**
 * @Route("/back/section", name="app_back_section_")
 */
class SectionController extends AbstractController
{
    /**
     * @Route("/", name="browse")
     */
    public function browse(SectionRepository $sectionRepository): Response
    {
        // 1. préparation des données
        $sectionList = $sectionRepository->findAll();


        // 2. affichage du template
        return $this->render('back/section/browse.html.twig', [
            'sectionList' => $sectionList,
        ]);
    }

    /**
     * @Route("/add", name="add", methods={"GET","POST"})
     */
    public function add(SectionRepository $sectionRepository, Request $request, EntityManagerInterface $em): Response
    {
        // $this->denyAccessUnlessGranted('ROLE_ADMIN');
        $section = new Section();

        $form = $this->createForm(SectionType::class, $section);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid())
        {

            $em->persist($section);
            $em->flush();
            // todo ajouter un message flash

            return $this->redirectToRoute('app_back_section_browse');

        }

        return $this->renderForm('back/section/add.html.twig', [
            'form' => $form
        ]);
    }

    /**
     * @Route("/{id}/edit", name="edit", methods={"GET","POST"})
     */
    public function edit(Section $section, SectionRepository $sectionRepository, ArticleRepository $articleRepository, Request $request, EntityManagerInterface $em): Response
    {
        $form = $this->createForm(SectionType::class, $section);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid())
        {
            $em->persist($section);
            $em->flush();
            // todo ajouter un message flash

            return $this->redirectToRoute('app_back_section_browse');

        }

        return $this->renderForm('back/section/edit.html.twig', [
            'form' => $form,
            'section' => $section,
        ]);
    }

    /**
     * @Route("/{id}/delete", name="delete", methods={"POST"}, requirements={"id"="\d+"})
     */
    public function delete(Request $request, Section $section, SectionRepository $sectionRepository): Response
    {
        // if ($this->isCsrfTokenValid('delete-movie-' . $movie->getId(), $request->request->get('_token'))) {
            $sectionRepository->remove($section, true);
            $this->addFlash('success', 'Section supprimée');
        // }

        return $this->redirectToRoute('app_back_section_browse', [], Response::HTTP_SEE_OTHER);
    }


    /**
     * @Route("/{id}/article", name="article_browse", methods={"GET"}, requirements={"id"="\d+"})
     */
    public function articleBrowse(EntityManagerInterface $em, Section $section, ArticleRepository $articleRepository, SectionRepository $sectionRepository): Response
    {
        // $section = $em->getRepository(Section::class)->find($id);
        
        // préparer les données
        $sectionWithArticles = $articleRepository->findArticlesBySectionId($section->getId());
        
        
        // dump($sectionWithArticles);
        // fournir les données à la vue
        return $this->render('back/section/article/browse.html.twig', [
            'sectionWithArticles' => $sectionWithArticles,
            'section' => $section
        ]);
    }


    /**
     * @Route("/{id}/article/add", name="article_add", methods={"GET", "POST"}, requirements={"id"="\d+"})
     * 
     */
    public function articleAdd(EntityManagerInterface $em, $id, Request $request): Response
    {
        $section = $em->getRepository(Section::class)->find($id);
        
        if ($section->getArticleType() == 'ArticleCv') {
            $articleCv = new ArticleCv();
            $form = $this->createForm(ArticleCvType::class, $articleCv);
            $form->handleRequest($request);
                if ($form->isSubmitted() && $form->isValid())
            {
            
                $articleCv->setSection($section);

                $em->persist($articleCv);
                $em->flush();

                $this->addFlash('success', 'article ajouté');

            return $this->redirectToRoute('app_back_section_article_browse', ['id' => $section->getId()]);
            }

            return $this->renderForm('back/section/article/add.html.twig', [
                'form' => $form,
                'section' => $section
            ]);

        } else if ($section->getArticleType() == 'ArticleProjectTechnos') {
            $articleProjectTechnos = new ArticleProjectTechnos();
            $form = $this->createForm(ArticleProjectTechnosType::class, $articleProjectTechnos);
            $form->handleRequest($request);
                if ($form->isSubmitted() && $form->isValid())
            {
            
                $articleProjectTechnos->setSection($section);

                $em->persist($articleProjectTechnos);
                $em->flush();

                $this->addFlash('success', 'article ajouté');

            return $this->redirectToRoute('app_back_section_article_browse', ['id' => $section->getId()]);
            }

            return $this->renderForm('back/section/article/add.html.twig', [
                'form' => $form,
                'section' => $section
            ]);
        }
        else {
            return $this->redirectToRoute('app_back_section_browse');
        }              
      
    }
}