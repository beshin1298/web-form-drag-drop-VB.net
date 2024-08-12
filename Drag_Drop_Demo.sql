-- DROP SCHEMA dbo;

CREATE SCHEMA dbo;
-- Drag_Drop_Demo.dbo.demo definition

-- Drop table

-- DROP TABLE Drag_Drop_Demo.dbo.demo;

CREATE TABLE Drag_Drop_Demo.dbo.demo (
	Id int IDENTITY(1,1) NOT NULL,
	name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[index] int NOT NULL,
	CONSTRAINT demo_pk PRIMARY KEY (Id)
);