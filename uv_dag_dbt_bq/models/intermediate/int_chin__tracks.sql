WITH most_ordered_tracks AS (
  SELECT 
  TrackId,
  TRUE as _is_top_10_track,
  SUM(Quantity) as _total_sales
  FROM {{ref('stg_chin__invoice_lines')}}
  GROUP BY 
  TrackId,
  _is_top_10_track
  ORDER BY SUM(Quantity) DESC
  LIMIT 10
)


SELECT
  _cleaned_track_name,
  _cleaned_array_composer,
  Milliseconds,
  Bytes,
  UnitPrice,
  g._cleaned_name as _genre_name,
  alb._cleaned_title as _alb_title,
  med._cleaned_name as _mediatype,
  mot._is_top_10_track
FROM
  {{ref('stg_chin__tracks')}} t
LEFT JOIN {{ref('stg_chin__albums')}} alb
ON t.AlbumId = alb.AlbumId
LEFT JOIN {{ref('stg_chin__mediatypes')}} med
ON med.MediaTypeId = t.MediaTypeId
LEFT JOIN {{ref('stg_chin__genre')}} g
ON g.GenreId = t.GenreId
LEFT JOIN most_ordered_tracks mot
ON mot.TrackId = t.TrackId
