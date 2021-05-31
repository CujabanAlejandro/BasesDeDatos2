SELECT SalesOrderHeader.SubTotal, SalesOrderHeader.Status, SalesOrderDetail.UnitPrice, Contact.FirstName,  Contact.LastName,  Contact.Phone, Contact.EmailAddrress, Product.Name, Product.Size, Vendor.Name 
FROM SalesOrderHeader, SalesOrderDetail, Contact, ProductVendor, Vendor, Product
WHERE 	SalesOrderHeader.SalesOrderID = SalesOrderDetail.SalesOrderID, 
      	SalesOrderHeader.ContactID = Contact.ContactID, 
	SalesOrderHeader.ShipMethodID = ShipMethod.ShipMethodID, 
	ProductVendor.ProductID = Product.ProductID
	Vendor.VendorID =  ProductVendor.VendorID
	
	
SELECT SalesOrderHeader.SubTotal, SalesOrderHeader.Status, MONTH(SalesOrderHeader.OrderDate) as Mes, SUM(SalesOrderHeader.SubTotal) total_mes, SalesOrderDetail.UnitPrice, Product.Name, Product.Size, Vendor.Name 
FROM SalesOrderHeader, SalesOrderDetail, ProductVendor, Vendor, Product
WHERE 	SalesOrderHeader.SalesOrderID = SalesOrderDetail.SalesOrderID, 
	SalesOrderHeader.ShipMethodID = ShipMethod.ShipMethodID, 
	ProductVendor.ProductID = Product.ProductID
	Vendor.VendorID =  ProductVendor.VendorID
GROUP BY (Vendor.Name, Product.Name)