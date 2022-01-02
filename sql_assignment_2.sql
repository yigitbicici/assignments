/*How many tracks does each album have? Your solution should include Album id and its number of tracks sorted from highest to lowest.
*/

SELECT AlbumId, COUNT (*) AS num_of_tracks
FROM tracks
GROUP BY AlbumId
ORDER BY num_of_tracks DESC;

/*Find the album title of the tracks. Your solution should include track name and its album title.
*/

SELECT t.name track_name, a.Title album_title
FROM tracks t
JOIN albums a ON t.AlbumId = a.AlbumId;

/*Find the minimum duration of the track in each album. Your solution should include album id, album title and duration of the track sorted from highest to lowest.
*/

SELECT t.AlbumId, a.Title album_title, MIN(t.Milliseconds) shortest_duration_ms
FROM tracks t
JOIN albums a
ON t.AlbumId = a.AlbumId
GROUP BY t.AlbumId
ORDER BY shortest_duration_ms DESC;

/*Find the total duration of each album. Your solution should include album id, album title and its total duration sorted from highest to lowest.
*/

SELECT t.AlbumId, a.Title album_title, SUM(t.Milliseconds) total_duration_ms
FROM tracks t
JOIN albums a
ON t.AlbumId = a.AlbumId
GROUP BY t.AlbumId
ORDER BY total_duration_ms DESC;

/*Based on the previous question, find the albums whose total duration is higher than 70 minutes. Your solution should include album title 
and total duration.
*/

SELECT 
t.AlbumId, a.Title album_title, 
SUM(t.Milliseconds) total_duration_ms
FROM tracks t 
INNER JOIN albums a 
ON t.AlbumId = a.AlbumId
GROUP BY a.title
HAVING SUM(t.Milliseconds) > 4200000
order by total_duration_ms DESC;
