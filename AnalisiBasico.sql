SELECT SalesOrderHeader.SubTotal, SalesOrderHeader.Status, SalesOrderDetail.UnitPrice, Product.Name, Product.Size, Vendor.Name 
FROM Sales.salesorderheader, Sales.SalesOrderDetail, Purchasing.ProductVendor, Purchasing.Vendor, Production.Product, Purchasing.ShipMethod
WHERE 	Sales.SalesOrderHeader.SalesOrderID = Sales.SalesOrderDetail.SalesOrderID
	and Sales.SalesOrderHeader.ShipMethodID = Purchasing.ShipMethod.ShipMethodID
	and Purchasing.ProductVendor.ProductID = Production.Product.ProductID
	and Purchasing.Vendor.businessentityid= Purchasing.ProductVendor.businessentityid
	
	
	
SELECT SalesOrderHeader.SubTotal, SalesOrderHeader.Status, SalesOrderHeader.OrderDate as Mes, SUM(SalesOrderHeader.SubTotal) total_mes, SalesOrderDetail.UnitPrice, Product.Name, Product.Size, Vendor.Name 
FROM Sales.SalesOrderHeader, Sales.SalesOrderDetail, Purchasing.ProductVendor, Purchasing.Vendor, Production.Product, Purchasing.ShipMethod
WHERE 	Sales.SalesOrderHeader.SalesOrderID = Sales.SalesOrderDetail.SalesOrderID
	and Sales.SalesOrderHeader.ShipMethodID = Purchasing.ShipMethod.ShipMethodID
	and Purchasing.ProductVendor.ProductID = Production.Product.ProductID
	and Purchasing.Vendor.businessentityid =  Purchasing.ProductVendor.businessentityid
GROUP BY (SalesOrderHeader.SubTotal,SalesOrderHeader.Status,SalesOrderHeader.OrderDate,Vendor.Name, Product.Name,SalesOrderDetail.UnitPrice,Product.Size)