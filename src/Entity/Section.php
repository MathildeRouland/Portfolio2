<?php

namespace App\Entity;

use App\Entity\Article;
use Doctrine\ORM\Mapping as ORM;
use App\Repository\SectionRepository;
use Doctrine\Common\Collections\Collection;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping\Entity;

/**
 * @ORM\Entity(repositoryClass=SectionRepository::class)
 */
class Section
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=100)
     */
    private $name;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $content;

    /**
     * @ORM\OneToMany(targetEntity=Article::class, mappedBy="section")
     */
    private $Article;

    /**
     * @ORM\Column(type="string", length=50, nullable=true)
     */
    private $articleType;

    public function __construct()
    {
        $this->Article = new ArrayCollection();
    }

    public function __toString()
    {
        return $this->name;        
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

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

    /**
     * @return Collection<int, Article>
     */
    public function getArticle(): Collection
    {
        return $this->Article;
    }

    public function addArticle(Article $article): self
    {
        if (!$this->Article->contains($article)) {
            $this->Article[] = $article;
            $article->setSection($this);
        }

        return $this;
    }

    public function removeArticle(Article $article): self
    {
        if ($this->Article->removeElement($article)) {
            // set the owning side to null (unless already changed)
            if ($article->getSection() === $this) {
                $article->setSection(null);
            }
        }

        return $this;
    }

    public function getArticleType(): ?string
    {
        return $this->articleType;
    }

    public function setArticleType(?string $articleType): self
    {
        $this->articleType = $articleType;

        return $this;
    }
}
