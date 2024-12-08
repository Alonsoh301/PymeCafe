USE [master]
GO
/****** Object:  Database [PymeCafe]    Script Date: 13/11/2024 09:55:56 a. m. ******/
CREATE DATABASE [PymeCafe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PymeCafe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PymeCafe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PymeCafe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PymeCafe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PymeCafe] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PymeCafe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PymeCafe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PymeCafe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PymeCafe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PymeCafe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PymeCafe] SET ARITHABORT OFF 
GO
ALTER DATABASE [PymeCafe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PymeCafe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PymeCafe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PymeCafe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PymeCafe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PymeCafe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PymeCafe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PymeCafe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PymeCafe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PymeCafe] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PymeCafe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PymeCafe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PymeCafe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PymeCafe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PymeCafe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PymeCafe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PymeCafe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PymeCafe] SET RECOVERY FULL 
GO
ALTER DATABASE [PymeCafe] SET  MULTI_USER 
GO
ALTER DATABASE [PymeCafe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PymeCafe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PymeCafe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PymeCafe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PymeCafe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PymeCafe] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PymeCafe', N'ON'
GO
ALTER DATABASE [PymeCafe] SET QUERY_STORE = ON
GO
ALTER DATABASE [PymeCafe] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PymeCafe]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[CategoriaID] [int] IDENTITY(1,1) NOT NULL,
	[NombreCategoria] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLESPEDIDO]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLESPEDIDO](
	[DetalleID] [int] IDENTITY(1,1) NOT NULL,
	[PedidoID] [int] NULL,
	[ProductoID] [int] NULL,
	[Cantidad] [int] NULL,
	[PrecioUnitario] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[DetalleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NOTIFICACION]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NOTIFICACION](
	[NotificacionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Mensaje] [varchar](255) NULL,
	[FechaEnvio] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PEDIDO]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PEDIDO](
	[PedidoID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[FechaPedido] [date] NULL,
	[EstadoPedido] [varchar](50) NULL,
	[Comentarios] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[PedidoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[ProductoID] [int] IDENTITY(1,1) NOT NULL,
	[NombreProducto] [varchar](100) NULL,
	[Descripcion] [varchar](255) NULL,
	[Precio] [decimal](10, 2) NULL,
	[CategoriaID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PUNTOSDELEALTAD]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PUNTOSDELEALTAD](
	[PuntosID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[PuntosAcumulados] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PuntosID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RECOMENDACION]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RECOMENDACION](
	[RecomendacionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ProductoID] [int] NULL,
	[FechaRecomendacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RecomendacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[CorreoElectronico] [varchar](100) NULL,
	[Contraseña] [varchar](100) NULL,
	[TipoUsuario] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VALORACIONESDEPRODUCTO]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VALORACIONESDEPRODUCTO](
	[ValoracionID] [int] IDENTITY(1,1) NOT NULL,
	[ProductoID] [int] NULL,
	[UserID] [int] NULL,
	[Comentario] [varchar](255) NULL,
	[Calificacion] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ValoracionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CATEGORIA] ON 
GO
INSERT [dbo].[CATEGORIA] ([CategoriaID], [NombreCategoria]) VALUES (1, N'Cafe')
GO
INSERT [dbo].[CATEGORIA] ([CategoriaID], [NombreCategoria]) VALUES (2, N'Fruta Congelada')
GO
INSERT [dbo].[CATEGORIA] ([CategoriaID], [NombreCategoria]) VALUES (3, N'Jugos Naturales Zarcero')
GO
INSERT [dbo].[CATEGORIA] ([CategoriaID], [NombreCategoria]) VALUES (4, N'Queso y Yogurt Zarcero')
GO
INSERT [dbo].[CATEGORIA] ([CategoriaID], [NombreCategoria]) VALUES (5, N'Quesos')
GO
INSERT [dbo].[CATEGORIA] ([CategoriaID], [NombreCategoria]) VALUES (6, N'Complementos para el Café')
GO
INSERT [dbo].[CATEGORIA] ([CategoriaID], [NombreCategoria]) VALUES (7, N'Paquetes Fadiva')
GO
SET IDENTITY_INSERT [dbo].[CATEGORIA] OFF
GO
SET IDENTITY_INSERT [dbo].[NOTIFICACION] ON 
GO
INSERT [dbo].[NOTIFICACION] ([NotificacionID], [UserID], [Mensaje], [FechaEnvio]) VALUES (1, 1, N'Tu pedido está en proceso', CAST(N'2024-10-01T17:52:35.473' AS DateTime))
GO
INSERT [dbo].[NOTIFICACION] ([NotificacionID], [UserID], [Mensaje], [FechaEnvio]) VALUES (2, 2, N'Hemos enviado tu pedido', CAST(N'2024-10-01T17:52:35.473' AS DateTime))
GO
INSERT [dbo].[NOTIFICACION] ([NotificacionID], [UserID], [Mensaje], [FechaEnvio]) VALUES (3, 3, N'Tu pedido ha sido entregado', CAST(N'2024-10-01T17:52:35.473' AS DateTime))
GO
INSERT [dbo].[NOTIFICACION] ([NotificacionID], [UserID], [Mensaje], [FechaEnvio]) VALUES (4, 4, N'Tu pedido ha sido cancelado', CAST(N'2024-10-01T17:52:35.473' AS DateTime))
GO
INSERT [dbo].[NOTIFICACION] ([NotificacionID], [UserID], [Mensaje], [FechaEnvio]) VALUES (5, 5, N'Tu pedido está en camino', CAST(N'2024-10-01T17:52:35.473' AS DateTime))
GO
INSERT [dbo].[NOTIFICACION] ([NotificacionID], [UserID], [Mensaje], [FechaEnvio]) VALUES (6, 6, N'Recuerda dejar tu opinión sobre el pedido', CAST(N'2024-10-01T17:52:35.473' AS DateTime))
GO
INSERT [dbo].[NOTIFICACION] ([NotificacionID], [UserID], [Mensaje], [FechaEnvio]) VALUES (7, 7, N'Gracias por tu compra', CAST(N'2024-10-01T17:52:35.473' AS DateTime))
GO
INSERT [dbo].[NOTIFICACION] ([NotificacionID], [UserID], [Mensaje], [FechaEnvio]) VALUES (8, 8, N'Tu pedido ha sido confirmado', CAST(N'2024-10-01T17:52:35.473' AS DateTime))
GO
INSERT [dbo].[NOTIFICACION] ([NotificacionID], [UserID], [Mensaje], [FechaEnvio]) VALUES (9, 9, N'Recuerda que puedes rastrear tu pedido', CAST(N'2024-10-01T17:52:35.473' AS DateTime))
GO
INSERT [dbo].[NOTIFICACION] ([NotificacionID], [UserID], [Mensaje], [FechaEnvio]) VALUES (10, 10, N'Tu pedido ha sido preparado', CAST(N'2024-10-01T17:52:35.473' AS DateTime))
GO
INSERT [dbo].[NOTIFICACION] ([NotificacionID], [UserID], [Mensaje], [FechaEnvio]) VALUES (11, 11, N'Estamos procesando tu pedido', CAST(N'2024-10-01T17:52:35.473' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[NOTIFICACION] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO] ON 
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (2, N'Cafe_Reserva_75g', N'Café gourmet de alta calidad en presentación de 75g, de cultivo sostenible.', CAST(1900.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (3, N'Cafe Reserva 340g', N'Café premium en presentación de 340g, ideal para disfrutar en casa.', CAST(6500.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (4, N'Cafe Reserva 908g', N'Café de alta calidad en presentación de 908g, perfecto para el amante del café.', CAST(16700.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (5, N'Cafe Hermosa 75g', N'Café suave y aromático en presentación de 75g, ideal para una taza.', CAST(1500.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (6, N'Cafe Hermosa 340g', N'Café delicioso en presentación de 340g, excelente para cualquier momento.', CAST(5500.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (7, N'Cafe Hermosa 908g', N'Café especial en presentación de 908g, para los verdaderos aficionados.', CAST(13100.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (8, N'Cafe Fresh 75g', N'Café fresco y vibrante en presentación de 75g, para empezar el día.', CAST(1500.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (9, N'Cafe Fresh 340g', N'Café fresco en presentación de 340g, ideal para compartir.', CAST(5500.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (10, N'Cafe Fresh 908g', N'Café fresco en presentación de 908g, para disfrutar en casa.', CAST(13100.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (11, N'Cafe Rrazu 75g', N'Café rústico en presentación de 75g, con sabor intenso.', CAST(1500.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (12, N'Cafe Rrazu 340g', N'Café rústico en presentación de 340g, excelente para tus momentos.', CAST(5500.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (13, N'Cafe Rrazu 908g', N'Café rústico en presentación de 908g, perfecto para cualquier ocasión.', CAST(13100.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (14, N'Cafe Quetzal 75g', N'Café exótico en presentación de 75g, para una experiencia única.', CAST(1000.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (15, N'Premium Tueste Medio 340g', N'Café premium con tueste medio, ideal para un buen café.', CAST(4500.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (16, N'Premium Tueste Oscuro 340g', N'Café premium con tueste oscuro, para los amantes del sabor fuerte.', CAST(4500.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (17, N'Clasico 1000g', N'Café clásico en presentación de 1000g, ideal para familias.', CAST(7000.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (18, N'Tradicional 1000g', N'Café tradicional en presentación de 1000g, sabor inconfundible.', CAST(6500.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (19, N'Tradicional Tueste Medio 200g', N'Café tradicional con tueste medio, ideal para cualquier momento.', CAST(1340.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (20, N'Tradicional Tueste Oscuro 200g', N'Café tradicional con tueste oscuro, para un sabor intenso.', CAST(1355.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (21, N'Especialidad Lavado 340g', N'Café de especialidad lavado en presentación de 340g, con sabor único.', CAST(5400.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (22, N'Tarrazu Caracolillo 340g', N'Café Tarrazu en presentación de 340g, de sabor exquisito.', CAST(4350.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (23, N'Gourmet Tueste Claro 340g', N'Café gourmet con tueste claro, para un sabor delicado.', CAST(3500.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (24, N'Especialidad Molido 1kg', N'Café de especialidad molido en presentación de 1kg, perfecto para preparar en casa.', CAST(11000.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (25, N'Especialidad Yellow Honey 340g', N'Café amarillo en presentación de 340g, con un dulzor natural.', CAST(4650.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (26, N'Especialidad Red Honey 340g', N'Café rojo en presentación de 340g, con un sabor suave.', CAST(4650.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (27, N'Especialidad Two Pack 540g', N'Paquete doble de café de especialidad en presentación de 540g.', CAST(9750.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (28, N'Caja Regalo Fadiva', N'Caja de regalo con selección de cafés premium.', CAST(17500.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (29, N'Queso Blanco para Freír', N'Delicioso queso blanco ideal para freír.', CAST(5500.00 AS Decimal(10, 2)), 4)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (30, N'Queso Tierno', N'Queso tierno, perfecto para cualquier platillo.', CAST(5500.00 AS Decimal(10, 2)), 4)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (31, N'Queso Palmito', N'Queso palmito suave y cremoso.', CAST(4000.00 AS Decimal(10, 2)), 4)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (32, N'Queso Mozzarella', N'Queso mozzarella fresco y delicioso.', CAST(6500.00 AS Decimal(10, 2)), 4)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (33, N'Queso Molido', N'Queso molido ideal para pizzas y pastas.', CAST(4000.00 AS Decimal(10, 2)), 4)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (34, N'Queso Personalizado', N'Queso a medida, ideal para tus eventos.', CAST(16000.00 AS Decimal(10, 2)), 4)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (35, N'Queso Crema', N'Suave y cremoso, ideal para untar.', CAST(4500.00 AS Decimal(10, 2)), 4)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (36, N'Natilla', N'Deliciosa natilla, perfecta para el postre.', CAST(1200.00 AS Decimal(10, 2)), 4)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (37, N'Yogurt 1L', N'Yogurt cremoso en presentación de 1 litro.', CAST(3000.00 AS Decimal(10, 2)), 4)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (38, N'Yogurt 200ml', N'Yogurt en presentación individual de 200ml.', CAST(1100.00 AS Decimal(10, 2)), 4)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (39, N'Jugo Natural 1 Galón', N'Jugo natural fresco en presentación de 1 galón.', CAST(8000.00 AS Decimal(10, 2)), 2)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (40, N'Jugo Natural 1.8L', N'Jugo natural en presentación de 1.8L.', CAST(4200.00 AS Decimal(10, 2)), 2)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (41, N'Jugo Natural 500ml', N'Jugo natural en presentación de 500ml.', CAST(1300.00 AS Decimal(10, 2)), 2)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (42, N'Fresa 1kg', N'Fresas frescas en presentación de 1kg.', CAST(3600.00 AS Decimal(10, 2)), 3)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (43, N'Mora 1kg', N'Moras frescas en presentación de 1kg.', CAST(3600.00 AS Decimal(10, 2)), 3)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (44, N'Guanábana 1kg', N'Guanábanas frescas en presentación de 1kg.', CAST(3600.00 AS Decimal(10, 2)), 3)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (45, N'Maracuyá 1kg', N'Maracuyás frescas en presentación de 1kg.', CAST(2700.00 AS Decimal(10, 2)), 3)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (46, N'Cas 1kg', N'Cas frescos en presentación de 1kg.', CAST(2700.00 AS Decimal(10, 2)), 3)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (47, N'Piña 1kg', N'Piñas frescas en presentación de 1kg.', CAST(2700.00 AS Decimal(10, 2)), 3)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (48, N'Mango 1kg', N'Mangos frescos en presentación de 1kg.', CAST(2700.00 AS Decimal(10, 2)), 3)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (49, N'Papaya Piña Mango 1kg', N'Mezcla de frutas en presentación de 1kg.', CAST(3200.00 AS Decimal(10, 2)), 3)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (50, N'Maracuyá Piña 1kg', N'Mezcla de maracuyá y piña en presentación de 1kg.', CAST(3200.00 AS Decimal(10, 2)), 3)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID]) VALUES (51, N'Paquete 12 Frutas 1kg', N'Paquete variado de 12 frutas en presentación de 1kg.', CAST(5500.00 AS Decimal(10, 2)), 3)
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO] OFF
GO
SET IDENTITY_INSERT [dbo].[PUNTOSDELEALTAD] ON 
GO
INSERT [dbo].[PUNTOSDELEALTAD] ([PuntosID], [UserID], [PuntosAcumulados]) VALUES (1, 1, 500)
GO
INSERT [dbo].[PUNTOSDELEALTAD] ([PuntosID], [UserID], [PuntosAcumulados]) VALUES (2, 2, 1000)
GO
INSERT [dbo].[PUNTOSDELEALTAD] ([PuntosID], [UserID], [PuntosAcumulados]) VALUES (4, 4, 450)
GO
INSERT [dbo].[PUNTOSDELEALTAD] ([PuntosID], [UserID], [PuntosAcumulados]) VALUES (5, 5, 600)
GO
INSERT [dbo].[PUNTOSDELEALTAD] ([PuntosID], [UserID], [PuntosAcumulados]) VALUES (6, 6, 1200)
GO
INSERT [dbo].[PUNTOSDELEALTAD] ([PuntosID], [UserID], [PuntosAcumulados]) VALUES (7, 7, 300)
GO
INSERT [dbo].[PUNTOSDELEALTAD] ([PuntosID], [UserID], [PuntosAcumulados]) VALUES (8, 8, 700)
GO
INSERT [dbo].[PUNTOSDELEALTAD] ([PuntosID], [UserID], [PuntosAcumulados]) VALUES (9, 9, 900)
GO
INSERT [dbo].[PUNTOSDELEALTAD] ([PuntosID], [UserID], [PuntosAcumulados]) VALUES (10, 10, 1100)
GO
INSERT [dbo].[PUNTOSDELEALTAD] ([PuntosID], [UserID], [PuntosAcumulados]) VALUES (11, 11, 350)
GO
SET IDENTITY_INSERT [dbo].[PUNTOSDELEALTAD] OFF
GO
SET IDENTITY_INSERT [dbo].[RECOMENDACION] ON 
GO
INSERT [dbo].[RECOMENDACION] ([RecomendacionID], [UserID], [ProductoID], [FechaRecomendacion]) VALUES (8, 1, 3, CAST(N'2024-10-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[RECOMENDACION] ([RecomendacionID], [UserID], [ProductoID], [FechaRecomendacion]) VALUES (9, 2, 4, CAST(N'2024-10-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[RECOMENDACION] ([RecomendacionID], [UserID], [ProductoID], [FechaRecomendacion]) VALUES (10, 3, 5, CAST(N'2024-10-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[RECOMENDACION] ([RecomendacionID], [UserID], [ProductoID], [FechaRecomendacion]) VALUES (11, 4, 6, CAST(N'2024-10-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[RECOMENDACION] ([RecomendacionID], [UserID], [ProductoID], [FechaRecomendacion]) VALUES (12, 5, 7, CAST(N'2024-10-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[RECOMENDACION] ([RecomendacionID], [UserID], [ProductoID], [FechaRecomendacion]) VALUES (13, 6, 8, CAST(N'2024-10-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[RECOMENDACION] ([RecomendacionID], [UserID], [ProductoID], [FechaRecomendacion]) VALUES (14, 7, 9, CAST(N'2024-10-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[RECOMENDACION] ([RecomendacionID], [UserID], [ProductoID], [FechaRecomendacion]) VALUES (15, 8, 10, CAST(N'2024-10-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[RECOMENDACION] ([RecomendacionID], [UserID], [ProductoID], [FechaRecomendacion]) VALUES (16, 9, 11, CAST(N'2024-10-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[RECOMENDACION] ([RecomendacionID], [UserID], [ProductoID], [FechaRecomendacion]) VALUES (17, 10, 2, CAST(N'2024-10-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[RECOMENDACION] ([RecomendacionID], [UserID], [ProductoID], [FechaRecomendacion]) VALUES (18, 11, 12, CAST(N'2024-10-01T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[RECOMENDACION] OFF
GO
SET IDENTITY_INSERT [dbo].[USUARIO] ON 
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (1, N'Juan', N'Pérez', N'juan.perez@example.com', N'password123', N'Cliente')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (2, N'Maria', N'Lopez', N'maria.lopez@example.com', N'password456', N'Administrador')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (3, N'Alonso', N'Hernandez', N'Alonso@gmail.com', N'password1', N'Administrador')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (4, N'Sofia', N'Madrigal', N'Sofia@gmail.com', N'password1', N'Administrador')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (5, N'Juan', N'Pedregal', N'juanpedregal@gmail.com', N'password2', N'Cliente')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (6, N'Lorena', N'Herrera', N'Lorena@gmail.com', N'password1', N'Cliente')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (7, N'Kimberly', N'Ayucagua', N'kim@gmail.com', N'password1', N'Cliente')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (8, N'Gillermo', N'Holanda', N'gille@gmail.com', N'password1', N'Cliente')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (9, N'jose', N'gutierrez', N'jose@gmail.com', N'passwors1', N'Cliente')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (10, N'Osvaldo', N'Lopez', N'osvaldo@gmail.com', N'password1', N'Cliente')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (11, N'Manuel', N'Maduro', N'manuel@gmail.com', N'password1', N'Cliente')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (12, N'Carlos', N'Martinez', N'carlos.martinez@example.com', N'password123', N'Cliente')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (13, N'Alonso', N'Hernandez', N'Alonso1@gmail.com', N'hola', N'Cliente')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (14, N'Ezequiel', N'Barboza', N'Ezequiel@gmail.com', N'password', N'Cliente')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (16, N'Pamela', N'Herrera', N'Pamela@gmail.com', N'password', N'Cliente')
GO
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
GO
SET IDENTITY_INSERT [dbo].[VALORACIONESDEPRODUCTO] ON 
GO
INSERT [dbo].[VALORACIONESDEPRODUCTO] ([ValoracionID], [ProductoID], [UserID], [Comentario], [Calificacion]) VALUES (5, 2, 1, N'Excelente café, sabor inigualable.', 5)
GO
INSERT [dbo].[VALORACIONESDEPRODUCTO] ([ValoracionID], [ProductoID], [UserID], [Comentario], [Calificacion]) VALUES (6, 3, 2, N'Buen café, lo recomendaría.', 4)
GO
INSERT [dbo].[VALORACIONESDEPRODUCTO] ([ValoracionID], [ProductoID], [UserID], [Comentario], [Calificacion]) VALUES (7, 4, 3, N'Me encantó, el aroma es espectacular.', 5)
GO
INSERT [dbo].[VALORACIONESDEPRODUCTO] ([ValoracionID], [ProductoID], [UserID], [Comentario], [Calificacion]) VALUES (8, 5, 4, N'Muy suave, ideal para el desayuno.', 4)
GO
INSERT [dbo].[VALORACIONESDEPRODUCTO] ([ValoracionID], [ProductoID], [UserID], [Comentario], [Calificacion]) VALUES (9, 6, 5, N'Delicioso, volveré a comprar.', 5)
GO
INSERT [dbo].[VALORACIONESDEPRODUCTO] ([ValoracionID], [ProductoID], [UserID], [Comentario], [Calificacion]) VALUES (10, 7, 6, N'Sabor intenso, perfecto para mí.', 5)
GO
INSERT [dbo].[VALORACIONESDEPRODUCTO] ([ValoracionID], [ProductoID], [UserID], [Comentario], [Calificacion]) VALUES (11, 8, 7, N'Muy bueno, lo disfruto cada mañana.', 4)
GO
INSERT [dbo].[VALORACIONESDEPRODUCTO] ([ValoracionID], [ProductoID], [UserID], [Comentario], [Calificacion]) VALUES (12, 9, 8, N'Un gran café para compartir.', 4)
GO
INSERT [dbo].[VALORACIONESDEPRODUCTO] ([ValoracionID], [ProductoID], [UserID], [Comentario], [Calificacion]) VALUES (13, 10, 9, N'Sabor fresco, lo recomiendo.', 5)
GO
INSERT [dbo].[VALORACIONESDEPRODUCTO] ([ValoracionID], [ProductoID], [UserID], [Comentario], [Calificacion]) VALUES (14, 11, 10, N'Un café de alta calidad.', 5)
GO
INSERT [dbo].[VALORACIONESDEPRODUCTO] ([ValoracionID], [ProductoID], [UserID], [Comentario], [Calificacion]) VALUES (15, 12, 11, N'El mejor café que he probado.', 5)
GO
SET IDENTITY_INSERT [dbo].[VALORACIONESDEPRODUCTO] OFF
GO
ALTER TABLE [dbo].[DETALLESPEDIDO]  WITH CHECK ADD FOREIGN KEY([PedidoID])
REFERENCES [dbo].[PEDIDO] ([PedidoID])
GO
ALTER TABLE [dbo].[DETALLESPEDIDO]  WITH CHECK ADD FOREIGN KEY([ProductoID])
REFERENCES [dbo].[PRODUCTO] ([ProductoID])
GO
ALTER TABLE [dbo].[NOTIFICACION]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[USUARIO] ([UserID])
GO
ALTER TABLE [dbo].[PEDIDO]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[USUARIO] ([UserID])
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([CategoriaID])
REFERENCES [dbo].[CATEGORIA] ([CategoriaID])
GO
ALTER TABLE [dbo].[PUNTOSDELEALTAD]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[USUARIO] ([UserID])
GO
ALTER TABLE [dbo].[RECOMENDACION]  WITH CHECK ADD FOREIGN KEY([ProductoID])
REFERENCES [dbo].[PRODUCTO] ([ProductoID])
GO
ALTER TABLE [dbo].[RECOMENDACION]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[USUARIO] ([UserID])
GO
ALTER TABLE [dbo].[VALORACIONESDEPRODUCTO]  WITH CHECK ADD FOREIGN KEY([ProductoID])
REFERENCES [dbo].[PRODUCTO] ([ProductoID])
GO
ALTER TABLE [dbo].[VALORACIONESDEPRODUCTO]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[USUARIO] ([UserID])
GO
/****** Object:  StoredProcedure [dbo].[RegistrarUsuario]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarUsuario]
    @Nombre NVARCHAR(100),
    @Apellido NVARCHAR(100),
    @CorreoElectronico NVARCHAR(100),
    @Contraseña NVARCHAR(100),
    @TipoUsuario NVARCHAR(50) = 'Cliente',  -- Valor por defecto 'Cliente'
    @Resultado NVARCHAR(250) OUTPUT
AS
BEGIN
    -- Verificar si el correo electrónico ya está registrado
    IF EXISTS (SELECT 1 FROM USUARIO WHERE CorreoElectronico = @CorreoElectronico)
    BEGIN
        SET @Resultado = 'El correo electrónico ya está registrado. Intenta con otro.'
        RETURN
    END

    -- Insertar nuevo usuario
    BEGIN TRY
        INSERT INTO USUARIO (Nombre, Apellido, CorreoElectronico, Contraseña, TipoUsuario)
        VALUES (@Nombre, @Apellido, @CorreoElectronico, @Contraseña, @TipoUsuario)
        
        SET @Resultado = 'Usuario registrado exitosamente.'
    END TRY
    BEGIN CATCH
        SET @Resultado = 'Error al registrar el usuario. ' + ERROR_MESSAGE()
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarDetallePedido]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AgregarDetallePedido]
    @PedidoID INT,
    @ProductoID INT,
    @Cantidad INT,
    @PrecioUnitario DECIMAL(18, 2)
AS
BEGIN
    INSERT INTO DETALLESPEDIDO (PedidoID, ProductoID, Cantidad, PrecioUnitario)
    VALUES (@PedidoID, @ProductoID, @Cantidad, @PrecioUnitario);
    
    SELECT 'Detalle de pedido agregado exitosamente' AS Mensaje;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarPedido]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AgregarPedido]
    @UserID INT,
    @FechaPedido DATETIME,
    @EstadoPedido NVARCHAR(255),
    @Comentarios NVARCHAR(500)
AS
BEGIN
    INSERT INTO PEDIDO (UserID, FechaPedido, EstadoPedido, Comentarios)
    VALUES (@UserID, @FechaPedido, @EstadoPedido, @Comentarios);
    
    SELECT 'Pedido agregado exitosamente' AS Mensaje;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarProducto]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AgregarProducto]
    @NombreProducto NVARCHAR(255),
    @Descripcion NVARCHAR(500),
    @Precio DECIMAL(18, 2),
    @CategoriaID INT
AS
BEGIN
    INSERT INTO PRODUCTO (NombreProducto, Descripcion, Precio, CategoriaID)
    VALUES (@NombreProducto, @Descripcion, @Precio, @CategoriaID);
    
    SELECT 'Producto agregado exitosamente' AS Mensaje;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarRecomendacion]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AgregarRecomendacion]
    @UserID INT,
    @ProductoID INT,
    @FechaRecomendacion DATETIME
AS
BEGIN
    INSERT INTO RECOMENDACION (UserID, ProductoID, FechaRecomendacion)
    VALUES (@UserID, @ProductoID, @FechaRecomendacion);
    
    SELECT 'Recomendación agregada exitosamente' AS Mensaje;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarUsuario]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AgregarUsuario]
    @Nombre NVARCHAR(255),
    @Apellido NVARCHAR(255),
    @CorreoElectronico NVARCHAR(255),
    @Contraseña NVARCHAR(255),
    @TipoUsuario INT
AS
BEGIN
    INSERT INTO USUARIO (Nombre, Apellido, CorreoElectronico, Contraseña, TipoUsuario)
    VALUES (@Nombre, @Apellido, @CorreoElectronico, @Contraseña, @TipoUsuario);
    
    SELECT 'Usuario agregado exitosamente' AS Mensaje;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarValoracionProducto]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AgregarValoracionProducto]
    @ProductoID INT,
    @UserID INT,
    @Comentario NVARCHAR(500),
    @Calificacion INT
AS
BEGIN
    INSERT INTO VALORACIONESDEPRODUCTO (ProductoID, UserID, Comentario, Calificacion)
    VALUES (@ProductoID, @UserID, @Comentario, @Calificacion);
    
    SELECT 'Valoración agregada exitosamente' AS Mensaje;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_EditarDetallePedido]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EditarDetallePedido]
    @DetalleID INT,
    @PedidoID INT,
    @ProductoID INT,
    @Cantidad INT,
    @PrecioUnitario DECIMAL(18, 2)
AS
BEGIN
    UPDATE DETALLESPEDIDO
    SET PedidoID = @PedidoID,
        ProductoID = @ProductoID,
        Cantidad = @Cantidad,
        PrecioUnitario = @PrecioUnitario
    WHERE DetalleID = @DetalleID;
    
    SELECT 'Detalle de pedido actualizado exitosamente' AS Mensaje;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_EditarPedido]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EditarPedido]
    @PedidoID INT,
    @UserID INT,
    @FechaPedido DATETIME,
    @EstadoPedido NVARCHAR(255),
    @Comentarios NVARCHAR(500)
AS
BEGIN
    UPDATE PEDIDO
    SET UserID = @UserID,
        FechaPedido = @FechaPedido,
        EstadoPedido = @EstadoPedido,
        Comentarios = @Comentarios
    WHERE PedidoID = @PedidoID;
    
    SELECT 'Pedido actualizado exitosamente' AS Mensaje;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_EditarProducto]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EditarProducto]
    @ProductoID INT,
    @NombreProducto NVARCHAR(255),
    @Descripcion NVARCHAR(500),
    @Precio DECIMAL(18, 2),
    @CategoriaID INT
AS
BEGIN
    UPDATE PRODUCTO
    SET NombreProducto = @NombreProducto,
        Descripcion = @Descripcion,
        Precio = @Precio,
        CategoriaID = @CategoriaID
    WHERE ProductoID = @ProductoID;
    
    SELECT 'Producto actualizado exitosamente' AS Mensaje;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_EditarRecomendacion]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EditarRecomendacion]
    @RecomendacionID INT,
    @FechaRecomendacion DATETIME
AS
BEGIN
    UPDATE RECOMENDACION
    SET FechaRecomendacion = @FechaRecomendacion
    WHERE RecomendacionID = @RecomendacionID;
    
    SELECT 'Recomendación actualizada exitosamente' AS Mensaje;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_EditarUsuario]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EditarUsuario]
    @UserID INT,
    @Nombre NVARCHAR(255),
    @Apellido NVARCHAR(255),
    @CorreoElectronico NVARCHAR(255),
    @Contraseña NVARCHAR(255),
    @TipoUsuario INT
AS
BEGIN
    UPDATE USUARIO
    SET Nombre = @Nombre,
        Apellido = @Apellido,
        CorreoElectronico = @CorreoElectronico,
        Contraseña = @Contraseña,
        TipoUsuario = @TipoUsuario
    WHERE UserID = @UserID;
    
    SELECT 'Usuario actualizado exitosamente' AS Mensaje;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_EditarValoracionProducto]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EditarValoracionProducto]
    @ValoracionID INT,
    @Comentario NVARCHAR(500),
    @Calificacion INT
AS
BEGIN
    UPDATE VALORACIONESDEPRODUCTO
    SET Comentario = @Comentario,
        Calificacion = @Calificacion
    WHERE ValoracionID = @ValoracionID;
    
    SELECT 'Valoración actualizada exitosamente' AS Mensaje;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarDetallePedido]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarDetallePedido]
    @DetalleID INT
AS
BEGIN
    DELETE FROM DETALLESPEDIDO
    WHERE DetalleID = @DetalleID;
    
    SELECT 'Detalle de pedido eliminado exitosamente' AS Mensaje;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarPedido]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarPedido]
    @PedidoID INT
AS
BEGIN
    DELETE FROM PEDIDO
    WHERE PedidoID = @PedidoID;
    
    SELECT 'Pedido eliminado exitosamente' AS Mensaje;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarProducto]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarProducto]
    @ProductoID INT
AS
BEGIN
    DELETE FROM PRODUCTO
    WHERE ProductoID = @ProductoID;
    
    SELECT 'Producto eliminado exitosamente' AS Mensaje;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarRecomendacion]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarRecomendacion]
    @RecomendacionID INT
AS
BEGIN
    DELETE FROM RECOMENDACION
    WHERE RecomendacionID = @RecomendacionID;
    
    SELECT 'Recomendación eliminada exitosamente' AS Mensaje;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarUsuario]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarUsuario]
    @UserID INT
AS
BEGIN
    DELETE FROM USUARIO
    WHERE UserID = @UserID;
    
    SELECT 'Usuario eliminado exitosamente' AS Mensaje;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarValoracionProducto]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarValoracionProducto]
    @ValoracionID INT
AS
BEGIN
    DELETE FROM VALORACIONESDEPRODUCTO
    WHERE ValoracionID = @ValoracionID;
    
    SELECT 'Valoración eliminada exitosamente' AS Mensaje;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_VerificarUsuario]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_VerificarUsuario]
    @Nombre NVARCHAR(50),
    @Apellido NVARCHAR(50)
AS
BEGIN
    SELECT * 
    FROM Usuarios
    WHERE Nombre = @Nombre AND Apellido = @Apellido;
END;
GO
/****** Object:  StoredProcedure [dbo].[VerificarLogin]    Script Date: 13/11/2024 09:55:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerificarLogin]
    @CorreoElectronico NVARCHAR(250),
    @Contraseña NVARCHAR(250),
    @Resultado NVARCHAR(250) OUTPUT,
    @UserID INT OUTPUT
AS
BEGIN
    -- Verificar si el usuario existe con el correo y contraseña
    DECLARE @Id INT;
    SELECT @Id = UserID
    FROM USUARIO
    WHERE CorreoElectronico = @CorreoElectronico
    AND Contraseña = @Contraseña;

    IF @Id IS NOT NULL
    BEGIN
        -- Si las credenciales son correctas
        SET @Resultado = 'Inicio de sesión exitoso';
        SET @UserID = @Id;
    END
    ELSE
    BEGIN
        -- Si las credenciales son incorrectas
        SET @Resultado = 'Correo o contraseña incorrectos';
        SET @UserID = NULL;
    END
END;
GO
USE [master]
GO
ALTER DATABASE [PymeCafe] SET  READ_WRITE 
GO
