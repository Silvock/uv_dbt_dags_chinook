SELECT
  TrackId,
  Name,
  INITCAP(Name) as _cleaned_track_name,
  AlbumId,
  MediaTypeId,
  GenreId,
  Composer,
  CASE WHEN CONTAINS_SUBSTR(Composer, ',')
  THEN
  SPLIT(REPLACE(Composer,', ',','),',')
  WHEN CONTAINS_SUBSTR(Composer, ';')
  THEN
  SPLIT(REPLACE(Composer,'; ',';'),';')
  ELSE 
  SPLIT(INITCAP(REPLACE(Composer,'/ ','/'),'/'),'/')
  END as _cleaned_array_composer,
  Milliseconds,
  Bytes,
  UnitPrice
FROM
  {{source('chin_db','Track')}}
