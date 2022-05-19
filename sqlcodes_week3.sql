-- 1. How many albums does the artist Led Zeppelin have?

SELECT COUNT(*) FROM (SELECT *
FROM artists
left join albums
on artists.ArtistId=albums.ArtistId)
where Name = 'Led Zeppelin';

-- 2. Create a list of album titles and the unit prices for the artist "Audioslave". How many records are returned?

SELECT a.UnitPrice,b.Title,b.Name
FROM (SELECT tracks.AlbumId,invoice_items.UnitPrice
FROM tracks
left join invoice_items
ON tracks.TrackId=invoice_items.TrackId) as a
left join (SELECT artists.Name,albums.Title,albums.AlbumId
FROM artists
left join albums
ON artists.ArtistId=albums.ArtistId) as b
ON a.AlbumId=b.AlbumId
WHERE b.Name="Audioslave";

-- 3. Find the first and last name of any customer who does not have an invoice. Are there any customers returned from the query?

SELECT customers.FirstName,customers.LastName,
invoices.InvoiceId
FROM customers
left join invoices
ON customers.CustomerId=invoices.CustomerId
WHERE invoices.InvoiceId is null;

-- 4. Find the total price for each album. What is the total price for the album “Big Ones”?

SELECT sum(b.UnitPrice) AS TotalPrice,b.Title AS Title
FROM (SELECT a.UnitPrice AS UnitPrice,albums.Title AS Title
FROM (SELECT tracks.AlbumId,invoice_items.UnitPrice
FROM tracks
left join invoice_items
ON tracks.TrackId=invoice_items.TrackId) AS a 
left join albums
ON a.AlbumId=albums.AlbumId
WHERE albums.Title="Big Ones") AS b

-- 5. How many records are created when you apply a Cartesian join to the invoice and invoice items table?

SELECT invoices.InvoiceId
FROM invoices
cross join invoice_items