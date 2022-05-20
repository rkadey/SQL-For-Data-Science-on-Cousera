-- 1. Using a subquery, find the names of all the tracks for the album "Californication". What is the title of the 8th track?

SELECT t.Name
FROM Tracks t
WHERE t.AlbumId = ( SELECT a.AlbumId
FROM Albums a
WHERE a.Title = 'Californication')


-- 2. Find the total number of invoices for each customer along with the customer's full name, city and email. After running the query described above, what is the email address of the 5th person, František Wichterlová?

SELECT c.CustomerId, c.FirstName, c.LastName, c.City, c.Email, COUNT(i.InvoiceId)
FROM Customers c join Invoices i
ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId;



-- 3. Retrieve the track name, album, artistID, and trackID for all the albums. What is the song title of trackID 12 from the "For Those About to Rock We Salute You" album? Enter the answer below.

SELECT t.Name, a.Title, art.Name, t.TrackId
FROM Artists art
inner join Albums a
ON art.ArtistId = a.ArtistId
inner join Tracks t
ON a.AlbumId = t.AlbumId



-- 4. Retrieve a list with the managers last name, and the last name of the employees who report to him or her. After running the query described above, who are the reports for the manager named Mitchell

SELECT mgr.LastName Manager, e.LastName Employee
FROM Employees e
left join Employees mgr
ON e.ReportsTo = mgr.EmployeeId



--5.  Find the name and ID of the artists who do not have albums. After running the query described above, two of the records returned have the same last name.

SELECT a.Title, ar.Name, ar.ArtistId
FROM Artists ar
left join Albums a
ON ar.ArtistId = a.ArtistId
WHERE a.Title is NULL;

--6. Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order. After running the query described above, determine what is the last name of the 6th record? 

SELECT e.FirstName, e.LastName
FROM Employees e
UNION
SELECT c.FirstName, c.LastName
FROM Customers c
ORDER BY c.LastName DESC

--7. See if there are any customers who have a different city listed in their billing city versus their customer city. What is the Outcome?
SELECT c.CustomerId, c.FirstName, c.LastName, c.City
FROM Customers c
join Invoices i
ON c.CustomerId = i.CustomerId
WHERE c.City <> i.BillingCity;
