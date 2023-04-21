DROP TABLE IF EXISTS [ProductCategory]
DROP TABLE IF EXISTS [Product]
DROP TABLE IF EXISTS [Category]

CREATE TABLE [Product] (
ProductID int PRIMARY KEY IDENTITY(1,1),
ProductName nvarchar(100) NOT NULL,
ProductDescription nvarchar(max)
)

CREATE TABLE [Category](
CategoryID int PRIMARY KEY IDENTITY(1,1),
CategoryName nvarchar(100) NOT NULL,
CategoryDescription nvarchar(max)
)

CREATE TABLE [ProductCategory] (
ProductID int REFERENCES [Product]([ProductID]) ON UPDATE CASCADE ON DELETE CASCADE,
CategoryID int REFERENCES [Category]([CategoryID]) ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT PK_ProductIDCategoryID PRIMARY KEY(ProductID, CategoryID)
)

INSERT INTO [Product](ProductName) 
VALUES 
('Огурцы'),
('Апельсины'),
('Coca-Cola')

INSERT INTO [Category](CategoryName) 
VALUES 
('Овощи'),
('Фрукты'),
('ЗОЖ')

INSERT INTO [ProductCategory](ProductID, CategoryID) 
VALUES 
(1, 1),
(1, 3),
(2, 3),
(2, 2)

GO

SELECT p1.ProductName AS Продукт, c.CategoryName AS Категория
FROM Product AS p1 FULL JOIN ProductCategory AS pc ON pc.ProductID=p1.ProductID 
LEFT JOIN Category AS c on c.CategoryID=pc.CategoryID
ORDER BY p1.ProductID