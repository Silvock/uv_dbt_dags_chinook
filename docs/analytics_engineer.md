# Le rôle de l'analytics engineer

À mi-chemin entre le Data Analyst et le Data Engineer, l’Analytics Engineer est un profil de plus en plus recherché dans les entreprises modernes.

Contrairement au Data Analyst, dont la principale mission est l'analyse des données, l'Analytic Engineer met l’accent sur la modélisation des données. Concrètement, ce professionnel est responsable de la transformation, des tests, du déploiement et de la documentation des données qu'il gère.

Au quotidien, les missions d'un Analytics Engineer concernent :

- la conception et l'optimisation des pipelines de données pour l'acquisition, la transformation et le chargement (ETL/ELT) ;
- l'élaboration et la gestion de modèles de données pour simplifier leur analyse ;
- la surveillance et l'amélioration des performances des systèmes de traitement des données ;
- la mise en place de pratiques de gouvernance des données pour garantir leur qualité et leur sécurité.

L'analytics engineer joue un rôle clé dans une démarche de self-service analytics en préparant et structurant les données de manière à les rendre accessibles et compréhensibles pour les utilisateurs métiers.

Il s'assure que les données sont propres, organisées, bien documentées et disponibles via des outils de visualisation ou de reporting faciles à utiliser.

Ainsi, il crée une infrastructure qui permet aux utilisateurs non techniques d'explorer et d'analyser les données en toute autonomie, tout en garantissant la qualité et la gouvernance des données.

L'Analytics Engineer joue un rôle clé au sein d'une équipe data. Afin de s'assurer que les données soient prêtes pour l'analyse et la visualisation, il conçoit, développe et maintient des pipelines de données performants. L'Analytic Engineer travaille en étroite collaboration avec les membres de son équipe pour comprendre les besoins métier et les exigences en matière de données, dans le but de proposer des solutions adaptées.


# Rappel SQL 

Une formation SQL est disponible dans l'espace formation Quadratic. 

## Premières requêtes

### Afficher ses données

Les mots clés de base pour afficher les données sont `SELECT` et `FROM`. A la suite de `SELECT` on listera les colonnes que l'on souhaite afficher et à la suite de `FROM`

```
SELECT
colonne1,
colonne2
FROM table1
```

### Filtrer

Pour filtrer les données requêtées, on utilisera le mot clé `WHERE` 

```
SELECT 
colonne1,
colonne2
FROM table1
WHERE 
colonne1 > 50
AND colonne2 LIKE 'quad%'
```

### Ordonner

Le mot clé `ORDER BY` est utilisé pour ordonner les données.

```
SELECT 
colonne1,
colonne2
FROM table1
WHERE 
colonne1 > 50
AND colonne2 LIKE 'quad%'
ORDER BY colonne1 DESC
```

### Agréger

L'aggrégation de données est le fait de regrouper les lignes d'une table selon une combinaison de colonne sous le mot clé `GROUP BY` en appliquant ou non une fonction d'aggrégation. 

```
SELECT 
SUM(colonne1) as total_colonne1,
colonne2
FROM table1
WHERE 
colonne1 > 50
AND colonne2 LIKE 'quad%'
GROUP BY 
colonne2
ORDER BY colonne1 DESC
```

## Créer un schema CREATE TABLE

Nommer clairement : utiliser des noms descriptifs et cohérents pour les tables
et les colonnes.
Définir des types de données appropriés : choisir le type de données le plus
adapté pour chaque colonne (par exemple, INT pour les numéros, DATE pour les
dates).
Utiliser des clés primaires : chaque table doit avoir une clé primaire pour
identifier de manière unique chaque ligne.
Utiliser des clés étrangères pour les relations : définir des relations entre les
tables via des clés étrangères pour maintenir l'intégrité référentielle.
Prévoir des contraintes pour garantir la qualité des données : comme les
contraintes d'unicité, de vérification, etc.
SQL - Le data definition language (DDL)

```
CREATE TABLE utilisateur
(
    id INT PRIMARY KEY NOT NULL,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(255),
    date_naissance DATE,
    pays VARCHAR(255),
    ville VARCHAR(255),
    code_postal VARCHAR(5),
    nombre_achat INT
)
```


## Altérer ses données INSERT, UPDATE, DELETE

Il est possible d'altérer les données d'une table avec les mots clés `INSERT`, `UPDATE`, `DELETE`.

- `INSERT` permet d'ajouter des enregistrements à une table.

```
INSERT INTO table VALUES ('valeur 1', 'valeur 2', ...)
```

- `UPDATE` permet de changer la structure de la tables comme ajouter une colonne.

```
UPDATE table
SET nom_colonne_1 = 'nouvelle valeur'
WHERE condition
```

- `DELETE` permet de supprimer des enregistrements à une table.

```
DELETE FROM `table`
WHERE condition
```

## Les Jointures

### INNER JOIN et LEFT JOIN

Les deux types de jointure les plus utilisés sont INNER JOIN et LEFT JOIN :

- INNER JOIN permet d'afficher les lignes en commun entre la table de gauche et la table de droite.

```
SELECT 
t1.colonne1,
t2.colonne3,
t1.colonne2
FROM table1 t1
INNER JOIN table2 t2
ON t1.primarykeycol = t2.secondarykeycol
```

- LEFT JOIN permet d'afficher toutes les lignes de la table de gauche, qu'elles aient ou non une correspondance avec la table de droite.

```
SELECT 
t1.colonne1,
t2.colonne3,
t1.colonne2
FROM table1 t1
INNER JOIN table2 t2
ON t1.primarykeycol = t2.secondarykeycol
```

### RIGHT JOIN et FULL JOIN

- RIGHT JOIN permet d'afficher toutes les lignes de la table de droite, qu'elles aient ou non une correspondance avec la table de gauche.

Un RIGHT JOIN pourra toujours s'écrire avec un LEFT JOIN (table A LEFT JOIN table B équivaut à table B RIGHT JOIN table A).

Tout dépend de l'ordre dans lequel on souhaite écrire les tables dans la requête !

- FULL JOIN permet d'afficher toutes les lignes des tables de gauche et de droite.

Ce type de jointure est moins utilisé car il rallonge le temps de requête : elle affiche une table avec plus de colonnes (2 colonnes ID) et potentiellement plus de lignes.

# Se repérer parmi les cloud providers, optimisation et  bonnes pratiques SQL pour travailler en collaboration. 

## Du "On premise" vers le cloud

### Avant

Les entreprises achetaient et géraient leurs propres serveurs physiques. Elles s'occupaient de faire évoluer leur matériel en achetant de nouveaux composants pour ajouter de la mémoire et/ou de la puissance. Enfin, elles faisaient la maintenance de leur matériel mais aussi les sauvegardes et étaient responsables de la sécurité des données. 

### Maintenant

Les entreprises se tournent de plus en plus vers des solutions cloud. Il existe trois types de services cloud : 

- Les services IaaS (Infrastructure as a Service) : Ils permettent d'accèder à distance à des composants d'une structure informatique gérer par le cloud providers. Il n'y a donc pas besoin d'acheter, ni de configurer et il n'y a pas de maintenance à effectuer sur ces composants pour pouvoir bénéficier de ressources de calcul, de stockage etc ...

- Les services PaaS (Platforme as a Service) : Ils s'appuient sur les services IaaS pour fournir des outils et services nécessaires pour créer et déployer des applications. Ce sont par exemple les systèmes d'exploitations et les middlwares. 

- Les services SaaS (Software as a Service) : Ce sont des applications prêtent à l'emploi accessible à distance et dont on a pas se soucier du développement et de déploiement comme Google Gmail, Docs ...

### Les trois grands cloud providers

Un cloud provider est une entreprises qui fournit des ressources de calcul évolutive et accessible via le web. Les trois principaux cloud providers sont :

- Google
- Amazon
- Microsoft

|   Cloud Prodvider   |   Data lake |   Data warehouse |
|---    |:-:    |:-:    |
|   Google   |   Google Cloud Storage    |   BigQuery |
|   Amazon   |   Amazon S3  |   Redshift |
|   Microsoft   |   OneLake   |   Azure SQL server |

Chaque fournisseur a ses points forts et ses inconvénients.
Les critères de choix des entreprises se font sur :

- la performance,
- le coût,
- la flexibilité.

Les grandes entreprises bénéficient en général de contrats personnalisés
négociés avec les fournisseurs.

## Distinguer Data Lake du Data Warehouse

Historiquement, l'ensemble des données d'une entreprise était contenue dans une base de données relationnelle (année 80). Ces bases de données, reposaient sur un langage simple à utiliser (SQL) et permettaient des opérations CRUD (Create, Read, Update, Delete) qui respectaient les propriétés ACID (Atomicity, Consistency, Isolation, Durability). On utilisait ces bases de données relationnelles pour créée des rapport quotidiens à des fins opérationelle. 

Avec le temps, un besoin de réaliser des rapports analytiques a émergé. Ce besoin a nécessité d'avoir des données historiques pour projeter des tendances. 
Les Data Warehouses sont nés avec ce besoin. Ce sont de vaste bases de données historiques organisées par thème et sujets métiers. Ces bases de données ont garder les capacité OLTP des bases de données relationnaelles mais apport des fonctionnalités supplémentaires comme le processus ETL et des outils de traitement OLAP. 

Bien que les data warehouse peuvent stocker des données non structurées, ils s'avèrent peu agile devant les demandes métiers de rajout de nouvelles sources et les changements de structures de sources. C'est à partir de cet instant que sont nés les Data Lakes qui se sont avéraient plus agiles que les Data Warehouse. En effet, en plus de pouvoir stocker de la données brutes structurés ou non, les changements de structure de ces données sont rapidement pris en charges. On passe d'un schéma on write (créer un schéma pour la donnée avant de l'écrire sur la base de données) à un schéma on read (on crée le schéma d’écriture seulement en lisant la donnée). 

Pour requêter un data lake on utilise un langage NoSQL. 
 
### Data lake

Un data lake est un entrepôt de données où vous pouvez stocker tous vos types
de données – qu'elles soient structurées (comme des tableaux de chiffres),
semi-structurées (comme des fichiers XML ou JSON), ou non structurées
(comme des vidéos, des images, des fichiers audio)

### Data warehouse

Un data warehouse est un grand entrepôt de données centralisées.
Il est conçu pour stocker des données structurées provenant de diverses
sources et les rendre faciles à analyser pour obtenir des informations utiles.

### Tableau comparatif

|   Caractéristiques   |   Data lake |   Data warehouse |
|---    |:-:    |:-:    |
|   Type de données   |   Structurées, semi-structurées, non structurées   |   Principalement structurées |
|   Organisation   |   Données brutes et non organisées  |   Données organisées et pré-structurées |
|   Stockage   |   Stockage à faible coùt pour grandes quantités   |   Stockage plus coûteux en raison de l'optimisation |
|   Scalabilité   |   Très évolutif et flexible  |   Evolutif, mais à un coût plus élévé |
|   Coût   |   Moins cher à stocker des données brutes  |   Plus cher en raison de l'optimisation et de la structure |

## Pourquoi optimiser ces requêtes

- Réduction des coût : malgré la baisse du coût du stockage, il peut être intéressant d'optimiser ces requêtes pour qu'elles consomment moins de ressources afin de diminuer les coûts d'exploitation.
- Amélioration des performances : les dashboards et les rapports se chargent plus rapidement, ce qui offre une meilleure expérience à l'utilisateur.
- Gain de temps : les équipes peuvent accéder aux données plus rapidement, ce qui accèlère le processus de prise de décision.

### Partitionnement

Le partitionnement est une méthode d'indexation propre à BigQuery, les autres base de données et les cloud providers proposent des fonctions similaires. 
Le partitionnement divise une table en segments plus petits, appelés partitions. Chaque partition correspond généralement à une colonne, souvent des dates, car elles répartissent les données de façon uniforme et sont fréquemment utilisées dans les filtres des requêtes.
Le partitionnement permet à BigQuery de ne scanner que les partitions concernées, améliorant ainsi les performances.

### Clustering

Le clustering organise physiquement les données à l'intérieur de la table en fonction des colonnes choisies. Par exemple, en clusterisant par pays, les données sont triées par pays, ce qui permet un accès plus rapide aux lignes filtrées par cette colonne.
Le clustering est souvent utilisé conjointement avec le partitionnement

## Bonnes pratiques

### Naming 

Dans l'idéal, il faut être descriptif dans les noms des colonnes, des cte et des alias de tables même si le nom est long : ceci\_est\_un\_exemple\_de\_nom.

### Utilisation des CTE

Les CTEs améliorent la lisibilité des requêtes complexes en les
décomposant en étapes logiques.

### Utilisation d'une indentation cohérente et homogène

On utilisera par exemple l'indentation sur les différentes clauses SELECT, FROM, WHERE, GROUP BY, etc.

### Ajouter des espaces entre les opérateurs

Dans les conditions, le fait d'espacer les opérateurs (comme =, <>, >, <,
etc.) améliore la lisibilité.

### Ne pas faire de group by imprécis

Dans Bigquery, il est possible d'utiliser `GROUP BY ALL` ou `GROUP BY 1,2,3`. 

Par exemple, 

```
SELECT 
categories,
zone,
COUNT(products)

FROM table 
GROUP BY 1,2
```

Dans cet exemple, on arrive facilement à identifier les colonnes qui aggrègent nos données. Cependant, pour rendre le code plus lisible, on nommera les colonnes d'aggrégation dans notre clause `GROUP BY`.

### Utiliser un maximum les linters

#### Bouton "Format" dans Bigquery

Dans la console google cloud, il faut se rendre sur la page Bigquery. En cliquant sur "Saisir une nouvelle requête", l'éditeur de requête s'ouvre. Après avoir saisi sa requête, il faut cliquer sur le bouton "Plus" puis "Formatter la requête". 

#### Azure SQL

Dans SQL Server Management Studio, il est possible d'installer un plugin gratuit pour formatter ces requêtes. Il est disponible à cette [adresse](http://architectshack.com/PoorMansTSqlFormatter.ashx#Download_5).

#### Redshift

Il n'existe pas de client SQL développé par Amazon pour leurs bases de données Amazon Redshift. Le plus simple est d'utiliser un client SQL générique comme SQL Workbench ou DBeaver qui ont une option de formattage des requêtes pré installée. 

#### SQLFlluff en local

SQLFluff est un linter open-source, multi dialect et configurable. C'est un package python qui s'install via `pip install sqlfluff`
La documentation se trouve à cette [adresse](https://sqlfluff.com/).


# Data Build Tool : L'outil indispensable de l'AE

1. Présentation de dbt

    dbt est un outil de modélisation de données qui incarne parfaitement l’approche analytics engineering.

    Il est massivement adopté par les entreprises, comme en témoigne sa fréquence de citation dans les retours d’expérience (ex. : podcast DataGen).

2. Centralisation et fiabilité

    dbt permet de centraliser tous les modèles SQL au même endroit, organisés dans des dossiers et sous-dossiers.

    Cela améliore la fiabilité des données : plus de requêtes dispersées, plus de doublons, tout est standardisé et versionné.

3. Travail collaboratif

    Tous les analystes accèdent au même référentiel SQL, ce qui facilite le travail collaboratif et évite les divergences de méthodes ou de résultats.

4. Accessibilité pour les profils SQL

    dbt est conçu pour être utilisé par des profils non-développeurs, comme les data analysts qui maîtrisent uniquement le SQL.

    Cela rend ces profils autonomes pour transformer les données, en complément de leur capacité à les ingérer (via des outils comme Fivetran).

5. Profil de l’analytics engineer

    Ces outils permettent l’émergence de nouveaux profils : les analytics engineers ou data analysts full stack, capables de maîtriser toute la chaîne de la donnée (ingestion + modélisation).

## Installation

Pré-requis: 

1. [Windows Subsystem for Linux](https://learn.microsoft.com/fr-fr/windows/wsl/install) --> Choisissez Ubuntu
2. [UV](https://github.com/astral-sh/uv)
3. Avoir un compte d'essai gratuit Google Cloud [ici](https://cloud.google.com/bigquery?utm_source=google&utm_medium=cpc&utm_campaign=emea-fr-all-fr-dr-bkws-all-all-trial-e-gcp-1707574&utm_content=text-ad-none-any-DEV_c-CRE_738039007406-ADGP_Hybrid+%7C+BKWS+-+EXA+%7C+Txt+-+Data+Analytics+-+BigQuery+-+v2-KWID_43700053286934973-kwd-47616965283-userloc_9198620&utm_term=KW_bigquery-NET_g-PLAC_&&gclsrc=aw.ds&gad_source=1&gad_campaignid=731154383&gclid=Cj0KCQjw5ubABhDIARIsAHMighZc4HFeSVPA1P9E2N-oyL9WSzsY7zmhDu-lM3fj9qOVzWNzyI3HIlAaAoXvEALw_wcB&hl=fr)


### Dbt Core avec dagster

dbt Core est la version open source à installer et utiliser en local. Dagster est un data orchestrator au même titre qu'airflow mais il est plus simple à mettre en place avec dbt. 

Dans le terminal ubuntu, on crée notre dossier de travail avec `uv init nom_du_projet` et on se positionne dans notre dossier de travail avec `cd nom_du_projet`.

1. `uv add dagster-dbt dbt-bigquery` : On install dagster avec dbt et son adapteur pour BigQuery.
2. `uv run dbt init` : On crée notre dossier de travail dbt avec ces sous-dossiers.

a. On donne un nom à notre projet dbt
b. On selectionne l'adaptateur que l'on va utiliser. En l'occurence ici, on utilisera l'adaptateur BigQuery. 
c. On sélectionne une méthode de connexion à bigquery. Je vous conseille la méthode service account qui demandera le chemin vers le fichier clé du service account. Pour obtenir se fichier, il faudra : 

- Se rendre à ce [lien](https://console.cloud.google.com/iam-admin/serviceaccounts?hl=fr&inv=1&invt=Abwq_w&project=thibault-bigquery-training)
- Cliquer sur "Créer un compte de service" et lui donner un nom. 
- A la seconde étape de création du compte de service, on donnera les rôles "Editeur de données BigQuery", "Utilisateur de job BigQuery" et "Utilisateur BigQuery".
- La troisième étape est facultative, on pourra donc cliquer sur "OK".

Une fois le compte de service créé, on cliquera sur ce compte de service et on génèrera une clé d'autorisation JSON. Un fichier JSON sera téléchargé. On aura plus qu'à copier/coller le chemin d'accès à ce fichier à l'étape de configuration dbt. 

d. On donne le nombre de coeurs CPU que DBT pourra utiliser.
e. On donne le nombre du projet bigquery et le nom du dataset bigquery.
f. On sélectionne la même zone géographique US ou EU pour dbt, notre projet bigquery et notre dataset.

### Dbt Cloud

Pour utiliser dbtCloud, la version Saas avec une interface web de DBT, on faudra créer un compte d'essai gratuit. 
La configuration d'un projet dbtcloud passe par les étapes ci-dessous : 

1. Se connecter à une platforme
a. Cliquer sur "add new connection"
b. Choisir la platforme Bigquery
c. Charger la clé JSON du compte de service que l'on a créée précédement pour dbt core (étape 2c)
d. Terminer en cliquant sur save. 

De l'aide est disponible, à ce [lien](https://docs.getdbt.com/docs/cloud/about-cloud-setup) 

2. Configurer l'accès à Github, Gitlab ou notre propre repository git. 
Sur la page proposant de configurer un repository git, on choisira l'option "Managed" pour que Git soit directement géré dans console dbt cloud. 

Pour finir, on choisira un nom pour notre projet dbt et il faudra cliquer sur bouton "Create". 

## Dbt et la modélisation

Un projet dbt est constitué d'un ensemble de dossiers : 

- models : Ce dossier contiendra les requêtes SQL et des fichier YAML qui mettront en place des tests sur nos models et les documenteront.
- snapshots : Ce dossier contiendra les fichiers de configurations des snapshots de tables.
- seeds : Ce dossier contiendra des fichier csv qui pourront être chargés dans la plateforme. 
- tests : Ce dossier contiendra des tests personnalisables sur nos models.
- analysis : Ce dossier contiendra des requêtes SQL d'analyse supplémentaires.
- macros : Ce dossier contiendra des fichiers YAML de création de macros jinja. Ce code pourra être utilisé dans les models.

Le fichier dbt_project.yml est le fichier principal de configuration du projet dbt. Il contient des informations qui détermine comment dbt fonctionne dans notre projet.
Par exemple des informations sur la materialisation de nos models en vue ou en table, sur les tests à appliquer...

Un model est un fichier sql contenant une requête amélioré avec du code jinja. Ce code jinja est simple à utiliser et est identifiable par les deux accolades qui l'entoure. 
Pour générer la table issue du model "my_first_model.sql" on utlisera la commande `dbt run --select:my_first_model` (il ne faut pas oublier de mettre `uv` avant si vous utiliser dbtcore).
A la fin de cette opération, on trouvera dans notre dataset BigQuery une nouvelle table portant le nom "my_first_model".

Avant de créer son premier modèle, on va créer nos tables sources et les identifier dans un fichier source.yml.

- Création des tables dans bigquery

Vous trouverez le fichier Chinook_BigQuery.sql qui va créer les tables chinook et insérer données à l'intérieur.Il suffira de copier le script et de l'exécuter dans BigQuery studio. Un nouvel ensemble de données (=dataset) sera créé contenant les tables Album, Artist etc. 
Ces tables sont décrites dans la formations quadratic SQL. 

- Création du fichier source.yml dans le dossier "model" pour identifier nos sources. 

Identifier les sources dans un fichier yml permet d'utiliser la fonction jinja `{{source(source\_name,table_name)}}` dans nos models. 

Cette référence évite par exemple d'écrire dans notre model `FROM db_name.dataset.table`. De plus, dans ce fichier source il est possible de décrire les tables sources et leurs colonnes pour générer ensuite une documentation. Enfin, il est possible d'appliquer des tests génériques sur nos tables sources. 

Dans l'exemple ci-dessous, notre dataset source "chinook" sera référencé par le nom "chin\_db". Ensuite, les tables tables contenues dans dataset sont listées et un test générique sera appliqué sur la colonne "AlbumId" de la table "Album". Ce test vérifiera si la colonne clé "AlbumId" n'est pas null et n'a pas de doublons lors de l'utilisation de commandes comme "uv dbt run" ou "uv dbt test". 

```
version: 2

sources:
  - name: chini\_db
    schema: chinook
    tables:
      - name: Album
        description: Une table qui contient les informations concernant les albums
        columns:
          - name: AlbumId
            description: Identifiant unique d'un album
            tests:
              - unique
              - not\_null
      - name: Artist
      - name: Customer
```

- Notre premier modèle

Pour faciliter la lisibilité de notre project dbt, il est nécessaire de le structurer selon trois couches : 

Staging : Les modèles de staging sont la première couche de transformation dans un projet DBT. Ils consistent en des transformations légères de vos sources de données brutes pour les préparer à des transformations plus complexes. Les modèles de staging traitent généralement une seule source à la fois et normalisent les noms des colonnes, suppriment les lignes en double, convertissent les types de données, etc.

Intermediate : Les modèles intermédiaires sont la deuxième couche de transformation. Ils effectuent des transformations plus complexes et peuvent incorporer plusieurs sources de données. Le but de ces modèles est de préparer les données pour les modèles mart.

Mart : Les modèles mart (ou data marts) sont la couche finale de transformation. Ils créent des vues finales des données qui sont optimisées pour l’analyse et la visualisation. Ces modèles consolident les informations provenant de diverses sources et les présentent dans un format facilement compréhensible et utilisable.

Nous allons donc créer dans dossier "models" un premier sous-dossier "staging" qui contiendra notre premier model nommé '_stg__albums.sql' 

Notre code ...

```
SELECT
  AlbumId,
  Title,
  ArtistId,
  INITCAP(Title) AS _cleaned_title,
  CHAR_LENGTH(Title) AS _nb_char_in_title
FROM
        {{source('chin_db','Album')}}
```

sera compilé par dbt ...

```
SELECT
  AlbumId,
  Title,
  ArtistId,
  INITCAP(Title) AS _cleaned_title,
  CHAR_LENGTH(Title) AS _nb_char_in_title
FROM
        `bq_project_name`.`chinook`.`Album`
```

et une vue sera générée dans le dataset "dbt\_quad".

 

## La documentation et les tests dans DBT

Après avoir vu comment modéliser les données avec dbt, ce nouveau chapitre aborde les étapes de documentation et de tests dans DBT. 

En effet, dbt permet de documenter les modèles de données pour :
- améliorer la lisibilité,
- faciliter la collaboration,
- garder une trace claire de chaque transformation et de sa logique métier.

Ensuite, dbt inclut des fonctionnalités de test intégrées pour garantir la qualité et la fiabilité des données :
- tests de non-nullité,
- tests d’unicité,
- tests de relations entre tables, etc.

Enfin, il est possible de personnaliser le comportement de chaque modèle via des fichiers de configuration comme la gestion de la materialisation (table, vues, incremental), la priorisation des modèles et la gestion de rafraichissement.

### La documentation dans DBT

Documenter les données est essentiel pour améliorer la communication entre équipes et garantir l'indépendance de celles-ci. Cela facilite aussi la maintenabilité du code.
dbt permet de documenter les modèles via des fichiers _schema.yml_. Ces fichiers contiennent des descriptions des modèles et de leurs colonnes clés, en particulier celles spécifiques aux besoins métiers.
dbt génère automatiquement un site web avec la commande dbt docs generate pour faciliter la visualisation et diffusion de cette documentation.

Une documentation bien faite répond aux questions récurrentes des équipes métiers, comme le calcul des KPIs, et évite des échanges répétitifs.
Elle accélère également l’onboarding des nouvelles recrues dans une équipe data, car elles peuvent directement accéder aux informations nécessaires sur les modèles et données.

La documentation générée peut être visualisée localement via la commande dbt docs serve, ou directement dans dbt Cloud sans avoir besoin de la générer manuellement.
Un des éléments clés de cette documentation est le lineage, une vue en arborescence qui montre les dépendances entre modèles, facilitant la compréhension des relations entre eux.

### Les tests dans DBT

Le fait de tester les données permet de garantir leur qualité et d'éviter des erreurs courantes dans les dashboards d’entreprise (écarts de chiffres entre tableaux, erreurs de segmentation des données, etc.).
En plus des tests basiques, des tests plus avancés comme la détection d'anomalies peuvent être réalisés pour intervenir avant que les données problématiques ne soient chargées en base.

Les tests dans dbt sont des affirmations sur les données. Par exemple : "chaque commande doit avoir un montant supérieur à zéro" ou "chaque utilisateur doit avoir un user_id unique et non nul".
Deux types de tests existent :

- Tests singular : Des requêtes SQL personnalisées, stockées dans le dossier /test du projet.
- Tests generic : Des tests standards (unicité, valeurs acceptées, non null, etc.) définis dans les fichiers YAML. Ces tests sont pré-codés dans dbt et ne nécessitent pas d'écrire de SQL.

Les tests s’exécutent avec la commande `dbt test`. Il est possible de lancer tous les tests ou de se limiter à un modèle spécifique avec `dbt test --select nom_modèle`.
Si un test échoue, dbt renvoie une liste des erreurs pour les analyser et les corriger.
 
# Travailler en collaboration avec Git

## Rappel Git 

Une certification Git Kraken est disponible 

### Git pull

### Git add, commit et push

## Apporter ces modifications à la branche principale

### Workflow Git

### Git merge with main

### Git rebase

### Gérer les conflits git

## Mettre son code en production

### Les pull requests : Bonnes pratiques

## Mettre en place une CI/CD

### Définition

### Github actions

### Gitlab CI/CD
