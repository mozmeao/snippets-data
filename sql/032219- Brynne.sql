SELECT s.SubscriberKey, sb.EmailAddress

FROM _Subscribers sb

JOIN (SELECT DISTINCT z.SubscriberKey, MIN(z.EventDate) as EventDate, z.TriggeredSendCustomerKey FROM _Sent z GROUP BY
 z.SubscriberKey, z.EventDate, z.TriggeredSendCustomerKey) s ON s.SubscriberKey = sb.SubscriberKey

WHERE s.TriggeredSendCustomerKey LIKE '%en_download_%'

AND (s.TriggeredSendCustomerKey LIKE '%focus%')

AND NOT (s.TriggeredSendCustomerKey LIKE '%klar%' or s.TriggeredSendCustomerKey LIKE '%notes%' or s.TriggeredSendCustomerKey LIKE '%Lockbox%' or s.TriggeredSendCustomerKey  LIKE '%irl%' or s.TriggeredSendCustomerKey LIKE '%rocket%')

AND NOT EXISTS (SELECT x.EMAIL_ADDRESS_ FROM Firefox_Account_ID x WHERE x.EMAIL_ADDRESS_ = sb.EmailAddress)

AND DATEDIFF(DAY, s.EventDate, GETDATE()) > 2

AND DATEDIFF(DAY, s.EventDate, GETDATE()) < 90
