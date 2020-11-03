select monthname(l.dateOfPurchase) as monthName,month(l.dateOfPurchase) as month, 
year(l.dateOfPurchase) as year, CONCAT('$ ',SUM(p.totalPrice)) as revenue
from purchasedetails p join orderline l
on p.recieptNo = l.recieptNo
group by month, year
order by sum(p.totalPrice) desc;