<?php

namespace App\Repository;

use App\Entity\Section;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Section>
 *
 * @method Section|null find($id, $lockMode = null, $lockVersion = null)
 * @method Section|null findOneBy(array $criteria, array $orderBy = null)
 * @method Section[]    findAll()
 * @method Section[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class SectionRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Section::class);
    }

    public function add(Section $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(Section $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    
    // public function findArticlesBySectionId($sectionId): ?Section
    // {
    //     // l'entityManager fait le lien entre les objets en PHP et les lignes dans la BDD
    //     // lorsque l'on lance la méthode flush(), l'entityManager
    //     // - mettre à jour les entités que l'on a récupéré de la BDD uniquement si elles ont été modifiées par du code PHP
    //     // - insérer les entités créées en PHP et que l'on souhaite enregistrer en BDD ( grace à la méthode persist )
    //     $entityManager = $this->getEntityManager();
        

    //     $query = $entityManager->createQuery(
    //         'SELECT a
    //         FROM App\Entity\Article a
    //         JOIN a.section s
    //         WHERE s.id = :id
    //     ');
    //     $query->setParameter('id', $sectionId);

    //     // returns an array of Product objects
    //     return $query->getResult();
    // }

//    /**
//     * @return Section[] Returns an array of Section objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('s')
//            ->andWhere('s.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('s.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Section
//    {
//        return $this->createQueryBuilder('s')
//            ->andWhere('s.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
