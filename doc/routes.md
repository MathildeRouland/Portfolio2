## BackOffice

| url | Verb HTTP | Controller | Method | constraint | comment |
|---|---|---|---|---|---|
| /back/ | GET | Back\Main | home | | backoffice homepage |
| /back/section | GET/POST| Back\Section | browse/add | | backoffice page section |
| /back/section{id} | GET/PATCH/DELETE | Back\Section | edit/delete | | backoffice page modification/suppression d'une section donnée |
| /back/section{id}/article | GET/POST | Back\Section | browse/add | | backoffice page articles d'une section donnée|
| /back/section{id}/article{id} | GET/PATCH/DELETE | Back\Section | edit/delete | | backoffice page modification/suppression d'un article donné  d'une section donnée|