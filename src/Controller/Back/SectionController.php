<?php

namespace App\Controller\Back;

use App\Entity\Article;
use App\Entity\Section;
use App\Entity\ArticleCv;
use App\Form\ArticleType;
use App\Form\SectionType;
use App\Form\ArticleCvType;
use App\Entity\ArticleProjectTechnos;
use App\Repository\ArticleRepository;
use App\Repository\SectionRepository;
use App\Form\ArticleProjectTechnosType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use App\Service\ArticleTypeResolver;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;



/**
 * @Route("/back/section", name="app_back_section_")
 * @IsGranted("ROLE_ADMIN")
 */
class SectionController extends AbstractController
{
    private $articleTypeResolver;
    

    public function __construct(ArticleTypeResolver $articleTypeResolver)
    {
        $this->articleTypeResolver = $articleTypeResolver;
        
    }


    
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
     * Page de détail d'une section
     *
     * @Route("/{id<\d+>}/read", name="read", methods={"GET"})
     * 
     */
    public function read(Section $section, SectionRepository $sectionRepository, ArticleRepository $articleRepository)
    {
        $sectionWithArticles = $articleRepository->findArticlesBySectionId($section->getId());

        // on check si la section existe
        if ($section === null) {
            throw $this->createNotFoundException('Section non trouvée !');
        }

        $articleList = $articleRepository->findBy(['section' => $section]);
        // dd($articleList);

        return $this->render('back/section/read.html.twig', [
            'section' => $section,
            'articleList' => $articleList,
            
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
            $this->addFlash('success', 'Section ajoutée');

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
            $this->addFlash('success', 'Section modifiée');

            return $this->redirectToRoute('app_back_section_browse');

        }

        return $this->renderForm('back/section/edit.html.twig', [
            'form' => $form,
            'section' => $section,
        ]);
    }

    /**
     * @Route("/{id}/delete", name="delete", methods={"DELETE"}, requirements={"id"="\d+"})
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
            'section' => $section,
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

    /**
     * @Route("/{id}/article/{articleId}/edit", name="article_edit", methods={"GET", "POST"}, requirements={"id"="\d+", "articleId"="\d+"})
     * @ParamConverter("article", options={"mapping": {"articleId": "id"}})
     */
    public function articleEdit(Section $section, SectionRepository $sectionRepository, Article $article, ArticleRepository $articleRepository, Request $request, EntityManagerInterface $em): Response
    {
        $oldSectionId = $article->getSection()->getId();

        $form = $this->createFormForArticle($article, $section, $request);
        $form->handleRequest($request);

        if ($form->isSubmitted()) {
            $newSection = $form->getData()->getSection();
            $newSectionId = $newSection->getId();

            if ($oldSectionId != $newSectionId) {
                $newArticleType = $newSection->getArticleType();
                $newArticle = $this->createNewArticle($article, $newArticleType);
                $this->cloneDatasToNewArticle($article, $newArticle, $newSection);
                
                $em->persist($newArticle);
                $this->deleteOldArticle($article, $articleRepository);
                $em->flush();
                $this->addFlash('success', 'Article modifié');
                

                return $this->redirectToRoute('app_back_section_article_browse', ['id' => $newSectionId]);
            
            } elseif ($form->isSubmitted() && $form->isValid())
            {
                $em->persist($article);
                $em->flush();
                $this->addFlash('success', 'Article modifié');
                

                return $this->redirectToRoute('app_back_section_article_browse', ['id' => $article->getSection()->getId()]);
            }


        }
            
            
            return $this->renderForm('back/section/article/edit.html.twig', [
                'form' => $form,
                'article' => $article,
                'section' => $section,
            ]);
        }

        private function createFormForArticle($article, $section, $request)
        {
            $articleType = $this->articleTypeResolver->resolveArticleType($section);
            
            // Logique de mapping pour obtenir le nom du formulaire correspondant au type d'article
            $formType = $this->getFormTypeForArticle($articleType);
            
            // Créer le formulaire en utilisant le nom du formulaire obtenu
            $form = $this->createForm($formType, $article);
            
            return $form;
        }

    private function getFormTypeForArticle($articleType)
    {
        // Mapping pour obtenir le nom du formulaire en fonction du type d'article
        // utilise un tableau de correspondance entre le type d'article et le nom du formulaire

        $formTypeMapping = [
            'ArticleCv' => ArticleCvType::class,
            'ArticleProjectTechnos' => ArticleProjectTechnosType::class,
        ];
        
        // Vérifie si le type d'article a une correspondance dans le tableau de mapping
        if (isset($formTypeMapping[$articleType])) {
            return $formTypeMapping[$articleType];
        } else {
            throw new \InvalidArgumentException("Type d'article non pris en charge : $articleType");
        }
    }

        private function createNewArticle($article, $articleType)
        {
            // Créer un nouvel objet d'article en fonction du type d'article.
            
        switch ($articleType) {
            case 'ArticleCv':
                return new ArticleCv();
            case 'ArticleProjectTechnos':
                return new ArticleProjectTechnos();
            default:
                throw new \InvalidArgumentException("Type d'article non pris en charge : $articleType");
            }
        }
        


        function cloneDatasToNewArticle($article, $newArticle, $newSection)
        {
        // Copie les valeurs spécifiques de l'objet actuel vers le nouvel objet
        // donc les propriétés spécifiques à l'article CV ou à l'article ProjectTechnos
            
        $newArticle->setTitle($article->getTitle());
        $newArticle->setContent($article->getContent());
        $newArticle->setAlphaOrder($article->getAlphaOrder());
        $newArticleType = $newSection->getArticleType();
        $newArticle->setSection($newSection);

        
        switch ($newArticleType) {
            case 'ArticleCv':
                if (property_exists($article, 'date') && isset($article->date))
                {
                    $newArticle->setDate($article->getDate());
                }else {
                    $newArticle->setDate(''); 
                }
                if (property_exists($article, 'location') && isset($article->location)) {
                    $newArticle->setLocation($article->getLocation());
                }else {
                    $newArticle->setLocation('');  
                } 
            break;
            case 'ArticleProjectTechnos':
                if (property_exists($article, 'image') && isset($article->image)) {
                    $newArticle->setImage($article->getImage());
                } else {
                    $newArticle->setImage('');
                }
            break;
            default:
                throw new \InvalidArgumentException("Type d'article non pris en charge :$newArticleType");
            }
        }
    
        public function deleteOldArticle($article, ArticleRepository $articleRepository)
        {
            
            $articleRepository->remove($article, true);
            $this->addFlash('success', 'article supprimé');
        }
            
    }

