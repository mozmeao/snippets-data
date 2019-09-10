SELECT f.EMAIL as SubscriberKey, f.EMAIL AS 'EmailAddress', f. RSVP_Time, f. Firefox AS 'FirefoxBrowser', l.FXA_ID

FROM  FxAccounts_Concert_RSVP f

JOIN Firefox_Account_ID l ON l.EMAIL_ADDRESS_ = f.Email

WHERE FXA_LANGUAGE_ISO2 = 'en'

AND NOT EXISTS (SELECT y.EmailAddress FROM FxA_LiveNationSeries y WHERE y.EmailAddress = f.Email )

AND NOT EXISTS (SELECT fxanew.FXA_ID FROM FxA_Onboarding_v3 fxanew WHERE fxanew.FXA_ID = f.FXA_ID AND fxanew.OptOut = 'True')

AND NOT EXISTS (SELECT xx.FXA_ID FROM FxA_Onboarding_v2 xx WHERE xx.FXA_ID = f.FXA_ID AND xx.OptOut = 'True')

AND NOT EXISTS (SELECT f.FXA_ID FROM FXA_Deleted d WHERE d.FXA_ID = f.FXA_ID)

AND NOT EXISTS (SELECT a.FXA_ID FROM FXA_Onboarding_v2_Archive a WHERE a.FXA_ID = f.FXA_ID AND a.OptOut = 'True')

AND NOT EXISTS (SELECT cs.Email FROM Contact_Salesforce cs WHERE cs.Email = f.EMAIL_ADDRESS_ AND (cs.HasOptedOutOfEmail = 1))

AND NOT EXISTS (SELECT x.FXA_ID FROM FxA_Reengagement x WHERE x.FXA_ID = f.FXA_ID AND x.OptOut = 'True')
