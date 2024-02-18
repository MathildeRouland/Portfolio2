<?php

namespace App\Service;

use App\Entity\Section;

class ArticleTypeResolver
{
    public function resolveArticleType(Section $section)
    {
        
        return $section->getArticleType();
    }
}