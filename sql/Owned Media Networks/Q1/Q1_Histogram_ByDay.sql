


#standardSQL
WITH Sent_Table as (SELECT
  SnippetID as PublishedSnippetID,
  MIN(DATE) as PublishedDate


FROM
  `ga-mozilla-org-prod-001.snippets.snippets_performance_*`
WHERE
  date >= "2019-01-03"
  AND date<= "2019-03-31"

GROUP BY 1
ORDER BY 1
)
SELECT
  SnippetID,
  DATE_DIFF(date, PublishedDate, DAY) as DayOfSnippet,
  SUM(impression) as impression,
  SUM(clicks) as clicks



FROM
  `ga-mozilla-org-prod-001.snippets.snippets_performance_*`

JOIN Sent_Table ON PublishedSnippetID = SnippetID

WHERE
  date >= "2019-01-01"
  AND date<= "2019-03-31"

  AND PublishedDate > "2019-01-01"

  AND DATE_DIFF(date, PublishedDate, DAY) > 0

  AND DATE_DIFF(date, PublishedDate, DAY) < 8

  AND clicks > 0

  AND name like "%p100%fxa%"


GROUP BY 1, 2
ORDER BY 1, 2
