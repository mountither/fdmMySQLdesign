select a.albumName, t.trackName, CONCAT(t.trackLength, ' min') as maxLength
from album a join track t
on a.catalogueNo = t.catalogueNo
where t.trackLength = 
(select MAX(trackLength)
from track
where catalogueNo = a.catalogueNo);