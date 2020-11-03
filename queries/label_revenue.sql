select ar.recordLabel, CONCAT('$ ', SUM(p.totalPrice)) as revenue
from artist ar join artistcredits ac
on ar.artistID = ac.artistID
join track t
on ac.trackID = t.trackID
join album a
on t.catalogueNo = a.catalogueNo
join orderline ol
on a.catalogueNo = ol.catalogueNo
join purchasedetails p
on ol.recieptNo = p.recieptNo
group by ar.recordLabel
order by SUM(p.totalPrice) desc;