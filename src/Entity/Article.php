<?php

namespace App\Entity;

use App\Repository\ArticleRepository;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\Column;
use Doctrine\ORM\Mapping\JoinColumn;
use Doctrine\ORM\Mapping\ManyToOne;
use Doctrine\ORM\Mapping\Id;
use Doctrine\ORM\Mapping\MappedSuperclass;
use Doctrine\ORM\Mapping\Entity;


/**
 * @ORM\Entity
 * @ORM\InheritanceType("SINGLE_TABLE")
 * @ORM\DiscriminatorColumn(name="discr", type="string")
 * @ORM\DiscriminatorMap({"articleCv" = "ArticleCv", "articleProjectTechnos" = "ArticleProjectTechnos"})
 */

abstract class Article
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    protected $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    protected $title;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    protected $content;

    /**
     * @ORM\ManyToOne(targetEntity=Section::class, inversedBy="Article")
     * @ORM\JoinColumn(name="section_id", referencedColumnName="id")
     */
    protected $section;

    /**
     * @ORM\Column(type="string", length=10, nullable=true)
     */
    protected $alphaOrder;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): self
    {
        $this->title = $title;

        return $this;
    }

    public function getContent(): ?string
    {
        return $this->content;
    }

    public function setContent(?string $content): self
    {
        $this->content = $content;

        return $this;
    }

    public function getSection(): ?Section
    {
        return $this->section;
    }

    public function setSection(?Section $section): self
    {
        $this->section = $section;

        return $this;
    }

    public function getAlphaOrder(): ?string
    {
        return $this->alphaOrder;
    }

    public function setAlphaOrder(?string $alphaOrder): self
    {
        $this->alphaOrder = $alphaOrder;

        return $this;
    }
}

/**
 * @Entity
 */
class ArticleCv extends Article {

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $date;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $location;

    // getters and setters //

    public function getDate(): ?string
    {
        return $this->date;
    }

    public function setDate($date)
    {
        $this->date = $date;
        return $this;
    }

    public function getLocation(): ?string
    {
        return $this->location;
    }

    public function setLocation($location)
    {
        $this->location = $location;
        return $this;
    }
}

/**
 * @Entity
 */
class ArticleProjectTechnos extends Article {

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $image;

    // getters and setters //

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage($image)
    {
        $this->image = $image;
        return $this;
    }

}
