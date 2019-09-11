#standardSQL

SELECT
  date,
  SUM(impression) as impressions
FROM
  `ga-mozilla-org-prod-001.snippets.snippets_performance_*`
WHERE
  date >= "2019-02-01"
  AND date <= "2019-02-28"
GROUP BY 1
ORDER BY 1
