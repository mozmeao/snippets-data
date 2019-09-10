SELECT cs.Signup_Source_URL__c

FROM Contact_Salesforce cs

WHERE cs.Signup_Source_URL__c LIKE '%Snippet%'


GROUP BY Signup_Source_URL__c
