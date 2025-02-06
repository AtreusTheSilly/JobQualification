--CREATE DATABASE Taxes
--GO

-- ************* No. 3.1 ************* 

--CREATE TABLE [nalog plat] (
--    [Id]        INT            NOT NULL,
--    [name]      NVARCHAR (256) NOT NULL,
--    [head60900] NVARCHAR (20)  NOT NULL,
--    [head70000] NVARCHAR (20)  NOT NULL,
--    [inn]       NVARCHAR (20)  NOT NULL,
--    PRIMARY KEY CLUSTERED ([Id] ASC)
--);
--GO

--INSERT INTO [nalog plat] ([Id], [name], [head60900], [head70000], [inn]) VALUES (0, N'МУНИЦИПАЛЬНОЕ УНИТАРНОЕ ПРЕДПРИЯТИЕ ЖИЛИЩНО-КОММУНАЛЬНЫЕ УСЛУГИ МУНИЦИПАЛЬНОГО ОБРАЗОВАНИЯ СЛАВНЫЙ', N'36.00.2', N'240693.00', N'7121026214')
--INSERT INTO [nalog plat] ([Id], [name], [head60900], [head70000], [inn]) VALUES (1, N'МУНИЦИПАЛЬНОЕ УНИТАРНОЕ ПРЕДПРИЯТИЕ ЖИЛИЩНО-КОММУНАЛЬНЫЕ УСЛУГИ МУНИЦИПАЛЬНОГО ОБРАЗОВАНИЯ СЛАВНЫЙ', N'36.00.2', N'2144.44', N'7121026214')
--INSERT INTO [nalog plat] ([Id], [name], [head60900], [head70000], [inn]) VALUES (2, N'НОВОМОСКОВСКОЕ МУНИЦИПАЛЬНОЕ УНИТАРНОЕ ПРЕДПРИЯТИЕ НОВОМОСКОВСКИЕ БАНИ', N'96.04', N'20425.51', N'7116505081')
--INSERT INTO [nalog plat] ([Id], [name], [head60900], [head70000], [inn]) VALUES (3, N'НОВОМОСКОВСКОЕ МУНИЦИПАЛЬНОЕ УНИТАРНОЕ ПРЕДПРИЯТИЕ НОВОМОСКОВСКИЕ БАНИ', N'96.04', N'20425.51', N'7116505081')
--INSERT INTO [nalog plat] ([Id], [name], [head60900], [head70000], [inn]) VALUES (4, N'НОВОМОСКОВСКОЕ МУНИЦИПАЛЬНОЕ УНИТАРНОЕ ПРЕДПРИЯТИЕ РИТУАЛ', N'96.03', N'6034.10', N'7116000041')
--INSERT INTO [nalog plat] ([Id], [name], [head60900], [head70000], [inn]) VALUES (5, N'МУНИЦИПАЛЬНОЕ КАЗЕННОЕ УЧРЕЖДЕНИЕ КОМБИНАТ СПЕЦИАЛЬНОГО ОБСЛУЖИВАНИЯ', N'96.03', N'37848.00', N'7116507089')
--INSERT INTO [nalog plat] ([Id], [name], [head60900], [head70000], [inn]) VALUES (6, N'МУНИЦИПАЛЬНОЕ КАЗЕННОЕ УЧРЕЖДЕНИЕ КОМБИНАТ СПЕЦИАЛЬНОГО ОБСЛУЖИВАНИЯ', N'96.03', N'15254.00', N'7116507089')
--INSERT INTO [nalog plat] ([Id], [name], [head60900], [head70000], [inn]) VALUES (7, N'МУНИЦИПАЛЬНОЕ БЮДЖЕТНОЕ УЧРЕЖДЕНИЕ ЦЕНТР ДОСУГА ДЕТЕЙ И МОЛОДЕЖИ', N'93.29', N'2216.30', N'7116030550')
--INSERT INTO [nalog plat] ([Id], [name], [head60900], [head70000], [inn]) VALUES (8, N'МУНИЦИПАЛЬНОЕ БЮДЖЕТНОЕ УЧРЕЖДЕНИЕ ЦЕНТР ДОСУГА ДЕТЕЙ И МОЛОДЕЖИ', N'93.29', N'2216.30', N'7116030550')
--INSERT INTO [nalog plat] ([Id], [name], [head60900], [head70000], [inn]) VALUES (9, N'НОВОМОСКОВСКОЕ МУНИЦИПАЛЬНОЕ УЧРЕЖДЕНИЕ СПОРТА ЖЕМЧУЖИНА', N'93.11', N'133307.30', N'7116147189')
--INSERT INTO [nalog plat] ([Id], [name], [head60900], [head70000], [inn]) VALUES (10, N'МУНИЦИПАЛЬНОЕ БЮДЖЕТНОЕ УЧРЕЖДЕНИЕ СПОРТА СПОРТИВНЫЙ КОМПЛЕКС СОКОЛЬНИКИ', N'93.11', N'169494.00', N'7116031667')
--GO


SELECT name, inn, SUM(CAST(head70000 AS MONEY)) AS head70000
	FROM [nalog plat]
	GROUP BY name, inn
	ORDER BY head70000 DESC
GO


-- ************* No. 3.2 ************* 

--CREATE TABLE [nalog plat reestr] (
--    [Id]     INT           NOT NULL,
--    [inn]    NVARCHAR (20) NOT NULL,
--    [budget] NVARCHAR(256) NOT NULL,
--    [status] NVARCHAR(50)  NOT NULL,
--    PRIMARY KEY CLUSTERED ([Id] ASC)
--);
--GO

--INSERT INTO [nalog plat reestr] ([Id], [inn], [budget], [status]) VALUES (0, N'7116505081', N'Бюджет муниципального образования город Новомосковск, 66030106', N'Действующая')
--INSERT INTO [nalog plat reestr] ([Id], [inn], [budget], [status]) VALUES (1, N'7116505081', N'Бюджет муниципального образования город Новомосковск, 66030106', N'Действующая')
--INSERT INTO [nalog plat reestr] ([Id], [inn], [budget], [status]) VALUES (2, N'7116000041', N'Бюджет муниципального образования город Новомосковск, 66030106', N'Специальные указания')
--INSERT INTO [nalog plat reestr] ([Id], [inn], [budget], [status]) VALUES (3, N'7116507089', N'Бюджет муниципального образования город Новомосковск, 66030106', N'Действующая')
--INSERT INTO [nalog plat reestr] ([Id], [inn], [budget], [status]) VALUES (4, N'7116507089', N'Бюджет муниципального образования город Новомосковск, 66030106', N'Действующая')
--INSERT INTO [nalog plat reestr] ([Id], [inn], [budget], [status]) VALUES (5, N'7116030550', N'Бюджет муниципального образования город Новомосковск, 66030106', N'Специальные указания')
--INSERT INTO [nalog plat reestr] ([Id], [inn], [budget], [status]) VALUES (6, N'7116030550', N'Бюджет муниципального образования город Новомосковск, 66030106', N'Действующая')
--INSERT INTO [nalog plat reestr] ([Id], [inn], [budget], [status]) VALUES (7, N'7116147189', N'Бюджет муниципального образования город Новомосковск, 66030106', N'Действующая')
--INSERT INTO [nalog plat reestr] ([Id], [inn], [budget], [status]) VALUES (8, N'7116031667', N'Бюджет муниципального образования город Новомосковск, 66030106', N'Действующая')
--GO


SELECT plat.inn,
	   plat.name,
	   plat.head60900,
	   plat.head70000,
	   reestr.budget,
	   reestr.status
	FROM [nalog plat] AS plat
	FULL OUTER JOIN [nalog plat reestr] AS reestr ON plat.inn = reestr.inn
	GROUP BY plat.inn, plat.name, plat.head60900, head70000, reestr.budget, reestr.status
	ORDER BY inn
GO