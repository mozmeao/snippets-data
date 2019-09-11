#standardSQL

SELECT country , Count(DISTINCT snippetID) as SnippetsCount

FROM  `ga-mozilla-org-prod-001.snippets.snippets_performance_*`

WHERE date >= '2019-04-01'
     AND date<= '2019-06-30'


GROUP BY 1
