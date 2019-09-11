#standardSQL


SELECT
  date,
  SUM(impression) as impression,
  SUM(clicks) as clicks,
  SUM(snippetBlocked) as blocks


FROM
  `ga-mozilla-org-prod-001.snippets.snippets_performance_*`

WHERE
  date >= "2019-01-01"
  AND date<= "2019-03-31"

  AND snippetID IN(9903, 9904, 10526, 10527, 10528, 10529, 10585, 10586, 10588, 10590, 10592, 10594, 10596, 10744, 10745, 10747,10748, 10722, 10916, 10917, 10918, 10919, 10920,11041, 11042, 11043, 11044, 11045, 11046, 11048, 11047, 11049, 11050, 11051, 11052, 11053, 11054, 11055, 11059, 11061, 11065, 11066, 11067, 11096, 11423, 11098)


  GROUP BY 1
  ORDER BY 1
