SELECT TOP 1000 f.FXA_ID, f.EMAIL_ADDRESS_ as EmailAddress, f.EMAIL_ADDRESS_ as SubscriberKey, f.EMAIL_ADDRESS_, f.CREATED_DATE_ as CreatedDate, f.CREATED_DATE_ as LastActivity, f.FXA_LANGUAGE_ISO2

FROM Firefox_Account_ID f

WHERE DATEDIFF(day, CREATED_DATE_, GetDate()) < 2

AND FXA_LANGUAGE_ISO2 = 'en'

AND NOT EXISTS (SELECT x.FXA_ID FROM FxA_Onboarding x WHERE x.FXA_ID = f.FXA_ID)

AND NOT EXISTS (SELECT fxanew.FXA_ID FROM FxA_Onboarding_v3 fxanew WHERE fxanew.FXA_ID = f.FXA_ID)

AND NOT EXISTS (SELECT xx.FXA_ID FROM FxA_Onboarding_v2 xx WHERE xx.FXA_ID = f.FXA_ID)

AND NOT EXISTS (SELECT z.FXA_ID FROM FxA_Onboarding_Control z WHERE z.FXA_ID = f.FXA_ID)

AND NOT EXISTS (SELECT cs.Email FROM Contact_Salesforce cs WHERE cs.Email = f.EMAIL_ADDRESS_)

AND NOT EXISTS (SELECT s.EmailAddress FROM _Subscribers s WHERE s.EmailAddress = f.EMAIL_ADDRESS_)

AND NOT EXISTS (SELECT f.FXA_ID FROM FXA_Deleted d WHERE d.FXA_ID = f.FXA_ID)

AND NOT EXISTS (SELECT a.FXA_ID FROM FXA_Onboarding_v2_Archive a WHERE a.FXA_ID = f.FXA_ID)

AND NOT EXISTS (SELECT lv.Email FROM FxAccounts_Concert_RSVP lv WHERE lv.Email = f.EMAIL_ADDRESS_)


ORDER BY NewId()
