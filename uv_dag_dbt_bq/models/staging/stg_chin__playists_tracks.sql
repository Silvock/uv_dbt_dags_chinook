SELECT
  TrackId,
  PlaylistId,
  ARRAY(SELECT AS STRUCT TrackId,PlaylistId) as _array_keys
FROM
  {{source('chin_db','PlaylistTrack')}}
