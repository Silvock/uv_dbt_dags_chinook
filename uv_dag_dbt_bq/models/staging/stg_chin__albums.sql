SELECT
  AlbumId,
  Title,
  ArtistId,
  INITCAP(Title) AS _cleaned_title,
  CHAR_LENGTH(Title) AS _nb_char_in_title
FROM
	{{source('chin_db','Album')}}
