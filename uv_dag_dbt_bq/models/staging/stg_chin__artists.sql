SELECT
  ArtistId,
  Name,
  INITCAP(Name) as _cleaned_name,
  CHAR_LENGTH(Name) as _nb_char_name,
  SOUNDEX(Name) as _snd_name
FROM
  {{source('chin_db','Artist')}}
