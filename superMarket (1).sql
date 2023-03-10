USE [master]
GO
/****** Object:  Database [supermarket]    Script Date: 3/8/2023 12:31:38 AM ******/
CREATE DATABASE [supermarket]

GO
ALTER DATABASE [supermarket] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [supermarket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [supermarket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [supermarket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [supermarket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [supermarket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [supermarket] SET ARITHABORT OFF 
GO
ALTER DATABASE [supermarket] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [supermarket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [supermarket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [supermarket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [supermarket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [supermarket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [supermarket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [supermarket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [supermarket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [supermarket] SET  ENABLE_BROKER 
GO
ALTER DATABASE [supermarket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [supermarket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [supermarket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [supermarket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [supermarket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [supermarket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [supermarket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [supermarket] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [supermarket] SET  MULTI_USER 
GO
ALTER DATABASE [supermarket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [supermarket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [supermarket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [supermarket] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [supermarket] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [supermarket] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [supermarket] SET QUERY_STORE = OFF
GO
USE [supermarket]
GO
/****** Object:  Table [dbo].[category]    Script Date: 3/8/2023 12:31:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] NOT NULL  IDENTITY(1,1) ,
	[category_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 3/8/2023 12:31:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[employee_id] [int] NOT NULL  IDENTITY(1,1) ,
	[fullname] [varchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[gender] [bit] NULL,
	[phone] [varchar](20) NOT NULL,
	[hire_date] [date] NOT NULL,
	[manager_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderdetails]    Script Date: 3/8/2023 12:31:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderdetails](
	[order_detail_id] [int] NOT NULL IDENTITY(1,1) ,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 3/8/2023 12:31:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] NOT NULL IDENTITY(1,1) ,
	[employee_id] [int] NOT NULL,
	[order_date] [date] NOT NULL,
	[total_amount] [decimal](10, 2) NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 3/8/2023 12:31:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [int] NOT NULL IDENTITY(1,1) ,
	[product_name] [varchar](50) NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[category_id] [int] NOT NULL,
	[image_url] [varchar](500) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE role (
    role_id INT IDENTITY(1,1) PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
);

CREATE TABLE account (
    account_id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    role_id INT NOT NULL,
    CONSTRAINT fk_account_role FOREIGN KEY (role_id) REFERENCES role (role_id)
);
GO
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (1, N'Ð? di?n t?')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (2, N'Th?c ph?m')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (3, N'Th?i trang')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (4, N'Sách van h?c')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (5, N'Ð? gia d?ng')
GO
INSERT [dbo].[employee] ([employee_id], [fullname], [email], [gender], [phone], [hire_date], [manager_id]) VALUES (1, N'Nguy?n Van A', N'van.a.nguyen@example.com', 1, N'0987654321', CAST(N'2021-01-01' AS Date), NULL)
INSERT [dbo].[employee] ([employee_id], [fullname], [email], [gender], [phone], [hire_date], [manager_id]) VALUES (2, N'Tr?n Th? B', N'thi.b.tran@example.com', 0, N'0123456789', CAST(N'2022-02-01' AS Date), 1)
INSERT [dbo].[employee] ([employee_id], [fullname], [email], [gender], [phone], [hire_date], [manager_id]) VALUES (3, N'Lê Th? C', N'thi.c.le@example.com', 0, N'0321654987', CAST(N'2021-05-01' AS Date), NULL)
INSERT [dbo].[employee] ([employee_id], [fullname], [email], [gender], [phone], [hire_date], [manager_id]) VALUES (4, N'Tr?n Van D', N'van.d.tran@example.com', 1, N'0912345678', CAST(N'2022-02-01' AS Date), 1)
INSERT [dbo].[employee] ([employee_id], [fullname], [email], [gender], [phone], [hire_date], [manager_id]) VALUES (5, N'Nguy?n Th? E', N'thi.e.nguyen@example.com', 0, N'0987654321', CAST(N'2023-01-01' AS Date), 1)
GO
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [price]) VALUES (1, 1, 1, 2, CAST(3000000.00 AS Decimal(10, 2)))
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [price]) VALUES (2, 1, 2, 5, CAST(50000.00 AS Decimal(10, 2)))
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [price]) VALUES (3, 2, 3, 1, CAST(200000.00 AS Decimal(10, 2)))
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [price]) VALUES (4, 3, 2, 3, CAST(30000.00 AS Decimal(10, 2)))
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [price]) VALUES (5, 3, 5, 1, CAST(1500000.00 AS Decimal(10, 2)))
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [price]) VALUES (6, 4, 1, 1, CAST(15000000.00 AS Decimal(10, 2)))
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [price]) VALUES (7, 4, 4, 2, CAST(6000000.00 AS Decimal(10, 2)))
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [price]) VALUES (8, 5, 6, 3, CAST(2400000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[orders] ([order_id], [employee_id], [order_date], [total_amount], [status]) VALUES (1, 1, CAST(N'2022-01-01' AS Date), CAST(5000000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[orders] ([order_id], [employee_id], [order_date], [total_amount], [status]) VALUES (2, 2, CAST(N'2022-02-01' AS Date), CAST(2000000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[orders] ([order_id], [employee_id], [order_date], [total_amount], [status]) VALUES (3, 3, CAST(N'2022-03-01' AS Date), CAST(1000000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[orders] ([order_id], [employee_id], [order_date], [total_amount], [status]) VALUES (4, 4, CAST(N'2022-03-10' AS Date), CAST(4000000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[orders] ([order_id], [employee_id], [order_date], [total_amount], [status]) VALUES (5, 5, CAST(N'2023-02-20' AS Date), CAST(1500000.00 AS Decimal(10, 2)), 0)
GO
INSERT [dbo].[product] ([product_id], [product_name], [price], [category_id], [image_url], [status]) VALUES (1, N'Ði?n tho?i Samsung Galaxy S21', CAST(15000000.00 AS Decimal(10, 2)), 1, N'https://example.com/images/samsung-galaxy-s21.jpg', 1)
INSERT [dbo].[product] ([product_id], [product_name], [price], [category_id], [image_url], [status]) VALUES (2, N'Bánh mì th?t', CAST(10000.00 AS Decimal(10, 2)), 2, N'https://example.com/images/banh-mi-thit.jpg', 1)
INSERT [dbo].[product] ([product_id], [product_name], [price], [category_id], [image_url], [status]) VALUES (3, N'Áo phông nam', CAST(200000.00 AS Decimal(10, 2)), 3, N'https://example.com/images/ao-phong-nam.jpg', 0)
INSERT [dbo].[product] ([product_id], [product_name], [price], [category_id], [image_url], [status]) VALUES (4, N'Máy l?c không khí Sharp', CAST(3000000.00 AS Decimal(10, 2)), 5, N'https://example.com/images/may-loc-khong-khi-sharp.jpg', 1)
INSERT [dbo].[product] ([product_id], [product_name], [price], [category_id], [image_url], [status]) VALUES (5, N'T? sách trang trí', CAST(1500000.00 AS Decimal(10, 2)), 4, N'https://example.com/images/tu-sach-trang-tri.jpg', 1)
INSERT [dbo].[product] ([product_id], [product_name], [price], [category_id], [image_url], [status]) VALUES (6, N'Giày th? thao nam', CAST(800000.00 AS Decimal(10, 2)), 3, N'https://example.com/images/giay-the-thao-nam.jpg', 1)
INSERT [dbo].[product] ([product_id], [product_name], [price], [category_id], [image_url], [status]) VALUES (7, N'B?t gi?t OMO', CAST(75000.00 AS Decimal(10, 2)), 1, N'https://example.com/images/botgiat_omo.jpg', 1)
INSERT [dbo].[product] ([product_id], [product_name], [price], [category_id], [image_url], [status]) VALUES (8, N'Kem dánh rang Closeup', CAST(29000.00 AS Decimal(10, 2)), 2, N'https://example.com/images/kemdanhrang_closeup.jpg', 1)
INSERT [dbo].[product] ([product_id], [product_name], [price], [category_id], [image_url], [status]) VALUES (9, N'Nu?c t?y trang Micellar', CAST(89000.00 AS Decimal(10, 2)), 3, N'https://example.com/images/nuoctaytrang_micellar.jpg', 1)
INSERT [dbo].[product] ([product_id], [product_name], [price], [category_id], [image_url], [status]) VALUES (10, N'Bánh mì tuoi', CAST(10000.00 AS Decimal(10, 2)), 4, N'https://example.com/images/banhmi_tuoi.jpg', 1)
INSERT [dbo].[product] ([product_id], [product_name], [price], [category_id], [image_url], [status]) VALUES (11, N'Nu?c su?i Lavie', CAST(15000.00 AS Decimal(10, 2)), 5, N'https://example.com/images/nuocsuoi_lavie.jpg', 1)
INSERT [dbo].[product] ([product_id], [product_name], [price], [category_id], [image_url], [status]) VALUES (12, N'M? tôm H?o H?o', CAST(5000.00 AS Decimal(10, 2)), 4, N'https://example.com/images/mytom_haohao.jpg', 1)
INSERT INTO role (role_name)
VALUES ('admin'), ('user');

INSERT INTO account (username, password, role_id)
VALUES ('admin', '123456', 1),
       ('user1', '123456', 2),
       ('user2', 'password', 2),
       ('user3', 'password123', 2);

GO
ALTER TABLE [dbo].[product] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [fk_employee_manager] FOREIGN KEY([manager_id])
REFERENCES [dbo].[employee] ([employee_id])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [fk_employee_manager]
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [fk_orderdetails_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [fk_orderdetails_order]
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [fk_orderdetails_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [fk_orderdetails_product]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [fk_order_employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([employee_id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [fk_order_employee]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
USE [master]
GO
ALTER DATABASE [supermarket] SET  READ_WRITE 
GO
