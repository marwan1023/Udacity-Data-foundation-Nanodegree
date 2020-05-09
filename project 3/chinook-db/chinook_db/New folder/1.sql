Select Country, MusicType, MusicID, MAX(Purchases) MostBought

FROM

(

SELECT DISTINCT customer.Country, Genre.name MusicType,Genre.GenreId MusicID,

count(InvoiceLine.InvoiceId)Purchases

FROM Customer

JOIN Invoice

ON Customer.CustomerId = Invoice.CustomerId

JOIN InvoiceLine

ON InvoiceLine.InvoiceId=Invoice.InvoiceId

JOIN Track

ON InvoiceLine.TrackId=Track.TrackId

JOIN Genre

ON Genre.GenreId=Track.GenreId

GROUP BY Country, MusicType

order by Country, Purchases Desc

) sub

Group By Country

Order By Country, MusicType;