
SELECT
profile_creation_date,  COUNT(Client_id)

FROM assa_sessions_daily_by_client_id

WHERE profile_creation_date < 30

Group by 1

LIMIT 100
