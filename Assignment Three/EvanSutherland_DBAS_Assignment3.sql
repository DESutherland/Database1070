-- Evan Sutherland W0443868
-- 12/04/2020
-- Assignment 3 for DBAS 1007

USE chinook;

-- 1.Display the First Name, Last Name of each customer along with the First Name and Last Name of their support rep.
-- Give the support rep the appropriate alias. Sort the results by customer last name then first name.
SELECT customer.FirstName, customer.LastName, employee.FirstName AS 'Rep First Name', employee.LastName AS 'Rep Last Name'
FROM employee
INNER JOIN customer ON customer.SupportRepId = employee.EmployeeId
ORDER BY customer.LastName, customer.FirstName;

-- 2.	Display the track name, genre name, and mediatype name for each track in the database. Alias all columns and
-- sort by track name in reverse alphabetical order.
SELECT track.Name AS 'Track', genre.Name AS 'Genre', mediatype.Name AS 'Mediatype'
FROM ((track
    INNER JOIN genre ON track.GenreId = genre.GenreId)
    INNER JOIN mediatype ON track.MediaTypeId = mediatype.MediaTypeId)
ORDER BY track.Name DESC;

-- 3. Display the first name and last name of each customer along with the name of each track that they have purchased
-- and the date the track was purchased on. Sort the results by customer last name, then first name, then name of the
-- track.
SELECT customer.LastName, customer.FirstName, track.Name, invoice.InvoiceDate
FROM customer
    INNER JOIN invoice ON customer.CustomerId = invoice.CustomerId
    INNER JOIN invoiceline ON invoiceline.InvoiceId = invoice.InvoiceId
    INNER JOIN track ON track.TrackId = invoiceline.TrackId
ORDER BY customer.LastName, customer.FirstName, track.Name;


-- 4. Display the first name and last name of each employee along with the first name and last name of their
-- respective manager.  Alias all columns and sort by manager last name, then employee last name.
SELECT employee.LastName AS 'EmpLast', employee.FirstName AS 'EmpFirst', manager.LastName AS 'MgrLast', manager.FirstName AS 'MgrFirst'
FROM employee Manager
    RIGHT JOIN employee ON employee.ReportsTo = manager.employeeID
    WHERE (employee.ReportsTo = manager.employeeID OR employee.ReportsTo IS NULL OR manager.EmployeeId IS NULL )
ORDER BY MgrLast, EmpLast;


-- 5. Display the name of the artist and the total number of albums the artist has available for sale. Call the first
-- column Artist and the second "Num of Albums". Sort by number of albums in reverse order, then by artist name.
SELECT artist.Name AS 'Artist', Count(album.AlbumId) AS 'Num of Albums'
FROM album
    INNER JOIN artist ON artist.ArtistId = album.ArtistId
GROUP BY artist.Name
ORDER BY Count(album.AlbumId) DESC, artist.Name;


-- 6. Display the name of each track along with the name of the album it’s from and the name of the artist who
-- performs it. Name all columns as in screenshot and sort by artist, album, then track.
SELECT artist.Name AS 'Artist', album.Title AS 'Album', track.Name AS 'Track'
FROM artist
    INNER JOIN album ON artist.ArtistId = album.ArtistID
    INNER JOIN track ON album.AlbumId = track.AlbumId
ORDER BY artist.Name, album.Title, track.Name;


-- 7. Display the first name and last name of each customer along with the various types of media that they have
-- purchased. Put a label on each column and sort by last name, first name, then media.
SELECT customer.LastName, customer.FirstName, mediatype.Name
FROM customer
    INNER JOIN invoice  on customer.CustomerId = invoice.CustomerId
    INNER JOIN invoiceline on invoice.InvoiceId = invoiceline.InvoiceId
    INNER JOIN track  on invoiceline.TrackId = track.TrackId
    INNER JOIN mediatype on track.MediaTypeId = mediatype.MediaTypeId
GROUP BY customer.LastName, customer.FirstName, mediatype.Name
ORDER BY customer.LastName, customer.FirstName, mediatype.Name;


-- 8. Display the Invoice id, invoice date, total invoice item quantity, and the first and last name of the customer
-- who made the purchase. Put a label on each column and sort by last name, first name, and total invoice amount in
-- descending order.
SELECT customer.LastName, customer.FirstName, invoice.InvoiceID, invoice.InvoiceDate, Count(invoiceline.Quantity) AS 'Total Qty'
FROM customer
    INNER JOIN invoice ON invoice.CustomerId = customer.CustomerId
    INNER JOIN invoiceline ON invoiceline.InvoiceId = invoice.InvoiceId
GROUP BY invoice.InvoiceID, customer.FirstName, customer.LastName, invoice.InvoiceDate
ORDER BY customer.LastName, customer.FirstName, Count(invoiceline.Quantity) DESC;


-- 9. Display the first name and last name of the customer(s) who have purchased the most video tracks.
-- Label the columns and sort by most video tracks highest to lowest.
SELECT customer.LastName, customer.FirstName, Count(invoice.InvoiceID) AS '# Video Tracks Purchased'
FROM customer
    INNER JOIN invoice ON customer.CustomerId = invoice.CustomerId
    INNER JOIN invoiceline ON invoice.InvoiceId = invoiceline.InvoiceId
    INNER JOIN track ON invoiceline.TrackId = track.TrackId WHERE MediaTypeId = 3
GROUP BY customer.LastName, customer.FirstName
ORDER BY Count(invoice.InvoiceId) DESC;


-- 10. Display the name of the artist and number of orders for the artist who has had the highest number orders
-- of his/her music placed. Label the columns and sort by most orders highest to lowest.
SELECT artist.Name AS 'Artist Name', COUNT(invoiceline.Quantity) AS 'Num of Orders'
FROM artist
    INNER JOIN album ON artist.ArtistId = album.ArtistId
    INNER JOIN track ON album.AlbumId = track.AlbumId
    INNER JOIN invoiceline ON track.TrackId = invoiceline.TrackId
GROUP BY artist.Name
ORDER BY Count(invoiceline.Quantity) DESC;
