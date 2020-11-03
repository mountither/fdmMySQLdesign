select a.albumName, CONCAT(SUM(t.trackLength), " mins") as albumLength
from album a join track t
on a.catalogueNo = t.catalogueNo
group by a.albumName
order by SUM(t.trackLength) desc limit 10;