SELECT
  Name,
  PlaylistId,
  INITCAP(Name) as _cleaned_name,
  CHAR_LENGTH(Name) as _nb_char_name
FROM
  {{source('chin_db','Playlist')}}
