We want to know how many users are returning to the Firefox Browser over the course of their profile age.

How do we define "Returning" vs regular usage?

Compare Active Snippet Users (users who interacted with a snippet) to average Firefox Retention. Also compare usage of folks who block snippets.

When do people opt out of snippets? Histogram.

How many people who see snippets based on current profile age?  How long does it take for someone to turn off snippets?


SELECT Profile Age, Snippet Daily Usage (How many new tabs), Browser Daily Usage (Browser at least once per day)

FROM DataTable

WHERE



USE MIN(Date)
