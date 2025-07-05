MERGE INTO customers A
USING customer_temp B
ON A.Customer_ID = B.Customer_ID
WHEN MATCHED THEN 
UPDATE SET 
A.Customer_Name = B.Customer_Name,
A.Segment = B.Segment,
A.City = B.City,
A.State = B.State,
A.Country = B.Country,
A.Postal_Code = B.Postal_Code,
A.Market = B.Market,
A.Region = B.Region,
A.Ingestion_Date = CURRENT_DATE
WHEN NOT MATCHED THEN
INSERT (Customer_ID, Customer_Name, Segment, City, State, Country, Postal_Code, Market, Region, Ingestion_Date) 
VALUES (B.Customer_ID,
B.Customer_Name,
B.Segment,
B.City,
B.State,
B.Country,
B.Postal_Code,
B.Market,
B.Region,
CURRENT_DATE
)