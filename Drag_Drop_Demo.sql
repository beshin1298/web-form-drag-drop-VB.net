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

CREATE TABLE Drag_Drop_Demo.dbo.m_product (
	id int IDENTITY(1,1) NOT NULL,
	name nvarchar(1000) NOT NULL,
	code varchar(20) NOT NULL,
	CONSTRAINT m_product_pk PRIMARY KEY (id),
	CONSTRAINT m_product_unique UNIQUE (code)
);
CREATE TABLE Drag_Drop_Demo.dbo.m_client (
	id int IDENTITY(1,1) NOT NULL,
	name nvarchar(1000) NOT NULL,
	email varchar(100) NULL,
	code varchar(20) NOT NULL,
	CONSTRAINT m_client_pk PRIMARY KEY (id)
);