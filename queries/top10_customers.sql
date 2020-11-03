select  c.customerID, c.firstName, c.lastName, CONCAT('$ ', p.totalPrice) as totalSpend
from customers c join purchasedetails p
on c.customerID = p.customerID
group by c.customerID
order by p.totalPrice desc limit 10;