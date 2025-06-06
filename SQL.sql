USE [master]
GO
/****** Object:  Database [pymecafe]    Script Date: 27/03/2025 04:21:46 p. m. ******/
CREATE DATABASE [pymecafe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pymecafe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\pymecafe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pymecafe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\pymecafe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [pymecafe] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pymecafe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pymecafe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pymecafe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pymecafe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pymecafe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pymecafe] SET ARITHABORT OFF 
GO
ALTER DATABASE [pymecafe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pymecafe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pymecafe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pymecafe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pymecafe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pymecafe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pymecafe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pymecafe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pymecafe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pymecafe] SET  ENABLE_BROKER 
GO
ALTER DATABASE [pymecafe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pymecafe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pymecafe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pymecafe] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [pymecafe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pymecafe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pymecafe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pymecafe] SET RECOVERY FULL 
GO
ALTER DATABASE [pymecafe] SET  MULTI_USER 
GO
ALTER DATABASE [pymecafe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pymecafe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pymecafe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pymecafe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pymecafe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [pymecafe] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'pymecafe', N'ON'
GO
ALTER DATABASE [pymecafe] SET QUERY_STORE = ON
GO
ALTER DATABASE [pymecafe] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [pymecafe]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 27/03/2025 04:21:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 27/03/2025 04:21:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[CategoriaID] [int] IDENTITY(1,1) NOT NULL,
	[NombreCategoria] [varchar](100) NULL,
 CONSTRAINT [PK__CATEGORI__F353C1C50B531DE6] PRIMARY KEY CLUSTERED 
(
	[CategoriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLESPEDIDO]    Script Date: 27/03/2025 04:21:47 p. m. ******/
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
 CONSTRAINT [PK__DETALLES__6E19D6FA2F11F711] PRIMARY KEY CLUSTERED 
(
	[DetalleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NOTIFICACION]    Script Date: 27/03/2025 04:21:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NOTIFICACION](
	[NotificacionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Mensaje] [varchar](255) NULL,
	[FechaEnvio] [datetime] NULL,
 CONSTRAINT [PK__NOTIFICA__BCC120C44EAC3A5D] PRIMARY KEY CLUSTERED 
(
	[NotificacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PEDIDO]    Script Date: 27/03/2025 04:21:47 p. m. ******/
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
	[Comprobante] [varbinary](max) NULL,
	[DireccionDeEnvio] [varchar](255) NULL,
 CONSTRAINT [PK__PEDIDO__09BA1410549D09D4] PRIMARY KEY CLUSTERED 
(
	[PedidoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 27/03/2025 04:21:47 p. m. ******/
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
	[Foto] [nvarchar](max) NULL,
 CONSTRAINT [PK__PRODUCTO__A430AE836D9441A6] PRIMARY KEY CLUSTERED 
(
	[ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publicacion]    Script Date: 27/03/2025 04:21:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publicacion](
	[PublicacionID] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [nvarchar](max) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[FechaPublicacion] [datetime2](7) NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[ImagenRuta] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Publicacion] PRIMARY KEY CLUSTERED 
(
	[PublicacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PUNTOSDELEALTAD]    Script Date: 27/03/2025 04:21:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PUNTOSDELEALTAD](
	[PuntosID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[PuntosAcumulados] [int] NULL,
 CONSTRAINT [PK__PUNTOSDE__77F5142BC519A10E] PRIMARY KEY CLUSTERED 
(
	[PuntosID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RECOMENDACION]    Script Date: 27/03/2025 04:21:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RECOMENDACION](
	[RecomendacionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ProductoID] [int] NULL,
	[FechaRecomendacion] [datetime] NULL,
 CONSTRAINT [PK__RECOMEND__104CC1EEF8107DE6] PRIMARY KEY CLUSTERED 
(
	[RecomendacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 27/03/2025 04:21:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[CorreoElectronico] [varchar](100) NOT NULL,
	[Contraseña] [varchar](100) NOT NULL,
	[TipoUsuario] [varchar](20) NULL,
 CONSTRAINT [PK__USUARIO__1788CCACCE9AC0A3] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VALORACIONESDEPRODUCTO]    Script Date: 27/03/2025 04:21:47 p. m. ******/
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
 CONSTRAINT [PK__VALORACI__BFB912DD1AC85966] PRIMARY KEY CLUSTERED 
(
	[ValoracionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241202212105_AddImagenRutaToPublicaciones', N'9.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241202213950_RenamePublicacionTable', N'9.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241208165711_AgregarFechaPublicacion', N'9.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241209175921_RemoveImagenColumn', N'9.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250113221908_AgregarColumnaFoto', N'9.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250114231048_Sinpemovil', N'9.0.0')
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
INSERT [dbo].[CATEGORIA] ([CategoriaID], [NombreCategoria]) VALUES (8, N'licor')
GO
SET IDENTITY_INSERT [dbo].[CATEGORIA] OFF
GO
SET IDENTITY_INSERT [dbo].[DETALLESPEDIDO] ON 
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (7, 1, 3, 2, CAST(6500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (8, 2, 2, 1, CAST(1500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (21, 1, 3, 2, CAST(6500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (22, 2, 2, 1, CAST(1500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (23, 6, 4, 1, CAST(1500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (24, 8, 5, 2, CAST(5500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (25, 9, 6, 1, CAST(13100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (26, 10, 7, 5, CAST(1500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (27, 11, 8, 1, CAST(1500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (28, 12, 9, 4, CAST(5500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (29, 13, 10, 3, CAST(13100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (30, 14, 11, 2, CAST(1000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (31, 15, 12, 5, CAST(4500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (33, 7, 14, 1, CAST(7000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (34, 8, 15, 2, CAST(6500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (35, 9, 16, 3, CAST(1340.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (36, 10, 17, 2, CAST(1355.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (37, 11, 18, 4, CAST(5400.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (38, 12, 19, 2, CAST(4350.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (63, 28, 2, 1, CAST(1900.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (65, 30, 2, 1, CAST(1900.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (69, 34, 3, 1, CAST(6500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (70, 34, 2, 1, CAST(1900.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (71, 35, 2, 1, CAST(1900.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (2078, 1040, 2, 1, CAST(1900.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (2085, 1047, 9, 1, CAST(5500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DETALLESPEDIDO] ([DetalleID], [PedidoID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (2086, 1048, 2, 1, CAST(1900.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[DETALLESPEDIDO] OFF
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
SET IDENTITY_INSERT [dbo].[PEDIDO] ON 
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (1, 1, CAST(N'2024-09-30' AS Date), N'En Proceso', N'Pedido urgente.', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (2, 2, CAST(N'2024-10-01' AS Date), N'Completado', N'Cliente satisfecho.', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (6, 1, CAST(N'2024-10-01' AS Date), N'Completado', N'Pedido sin comentarios adicionales.', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (7, 2, CAST(N'2024-10-01' AS Date), N'En proceso', N'Requiere entrega rápida.', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (8, 3, CAST(N'2024-10-01' AS Date), N'Completado', N'Excelente atención al cliente.', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (9, 4, CAST(N'2024-10-01' AS Date), N'Cancelado', N'Cliente canceló por problemas de pago.', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (10, 5, CAST(N'2024-10-01' AS Date), N'En proceso', N'Pedido con entrega programada.', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (11, 1, CAST(N'2024-10-01' AS Date), N'Completado', N'El cliente solicitó un descuento.', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (12, 2, CAST(N'2024-10-01' AS Date), N'En proceso', N'Cliente solicitó verificación de producto.', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (13, 3, CAST(N'2024-10-01' AS Date), N'Completado', N'Entrega antes de las 3 PM.', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (14, 4, CAST(N'2024-10-01' AS Date), N'Completado', N'Pedido procesado sin problemas.', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (15, 5, CAST(N'2024-10-01' AS Date), N'En proceso', N'Revisión de disponibilidad de productos.', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (16, 3, CAST(N'2024-10-01' AS Date), N'Completado', N'El cliente solicitó un descuento.', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (17, 4, CAST(N'2024-10-01' AS Date), N'En proceso', N'Cliente solicitó verificación de producto.', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (18, 5, CAST(N'2024-10-01' AS Date), N'Completado', N'Entrega antes de las 3 PM.', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (20, 2, CAST(N'2024-10-01' AS Date), N'En proceso', N'Revisión de disponibilidad de productos.', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (21, 3, CAST(N'2024-10-01' AS Date), N'Completado', N'El cliente solicitó un descuento.', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (22, 4, CAST(N'2024-10-01' AS Date), N'En proceso', N'Cliente solicitó verificación de producto.', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (23, 5, CAST(N'2024-10-01' AS Date), N'Completado', N'Entrega antes de las 3 PM.', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (24, 1, CAST(N'2024-10-01' AS Date), N'Completado', N'Pedido procesado sin problemas.', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (25, 2, CAST(N'2024-10-01' AS Date), N'En proceso', N'Revisión de disponibilidad de productos.', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (28, 16, CAST(N'2024-12-09' AS Date), N'Confirmado', N'', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (30, 16, CAST(N'2024-12-09' AS Date), N'Confirmado', N'', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (34, 3, CAST(N'2024-12-09' AS Date), N'En proceso', N'', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (35, 1015, CAST(N'2024-12-16' AS Date), N'En proceso', N'', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (1040, 2017, CAST(N'2025-02-24' AS Date), N'En proceso', N'', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (1041, 2015, CAST(N'2025-02-25' AS Date), N'Completado', N'Aguacate y Jaggermaister', 0x9E86A996271A, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (1047, 2023, CAST(N'2025-03-16' AS Date), N'En proceso', N'', NULL, N'SIN ASIGNAR')
GO
INSERT [dbo].[PEDIDO] ([PedidoID], [UserID], [FechaPedido], [EstadoPedido], [Comentarios], [Comprobante], [DireccionDeEnvio]) VALUES (1048, 2015, CAST(N'2025-03-19' AS Date), N'En proceso', N'', NULL, N'SIN ASIGNAR')
GO
SET IDENTITY_INSERT [dbo].[PEDIDO] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO] ON 
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (2, N'Cafe_Reserva_85g', N'Café gourmet de alta calidad en presentación de 85g, de cultivo sostenible.', CAST(1900.00 AS Decimal(10, 2)), 1, N'https://media.nidux.net/pull/700/700/2770/83894-product-672149109ed62-reserva.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (3, N'Cafe Reserva 340g', N'Café premium en presentación de 340g, ideal para disfrutar en casa.', CAST(6500.00 AS Decimal(10, 2)), 1, N'https://media.nidux.net/pull/700/700/2770/83894-product-672149109ed62-reserva.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (4, N'Cafe Reserva 908g', N'Café de alta calidad en presentación de 908g, perfecto para el amante del café.', CAST(16700.00 AS Decimal(10, 2)), 1, N'https://media.nidux.net/pull/700/700/2770/83894-product-672149109ed62-reserva.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (5, N'Cafe Hermosa 75g', N'Café suave y aromático en presentación de 75g, ideal para una taza.', CAST(1500.00 AS Decimal(10, 2)), 1, N'https://media.nidux.net/pull/1200/1600/2770/84325-product-660b2a994a47d-hermosa-75g.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (6, N'Cafe Hermosa 340g', N'Café delicioso en presentación de 340g, excelente para cualquier momento.', CAST(5500.00 AS Decimal(10, 2)), 1, N'https://media.nidux.net/pull/700/700/2770/83892-product-672142d06459f-hermosa.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (7, N'Cafe Hermosa 908g', N'Café especial en presentación de 908g, para los verdaderos aficionados.', CAST(13100.00 AS Decimal(10, 2)), 1, N'https://media.nidux.net/pull/1200/1600/2770/84308-product-660b20491feff-cafe-1-kilohermosa.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (8, N'Cafe Fresh 75g', N'Café fresco y vibrante en presentación de 75g, para empezar el día.', CAST(1500.00 AS Decimal(10, 2)), 1, N'https://media.nidux.net/pull/700/700/2770/84326-product-660b2a85697ac-dotafresh-75g.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (9, N'Cafe Fresh 340g', N'Café fresco en presentación de 340g, ideal para compartir.', CAST(5500.00 AS Decimal(10, 2)), 1, N'https://media.nidux.net/pull/700/700/2770/84335-product-67213fcdd1511-dotafresh.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (10, N'Cafe Fresh 908g', N'Café fresco en presentación de 908g, para disfrutar en casa.', CAST(13100.00 AS Decimal(10, 2)), 1, N'https://media.nidux.net/pull/700/700/2770/84309-product-660b248b0ae03-dotafresh-molido.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (11, N'Cafe Rrazu 75g', N'Café rústico en presentación de 75g, con sabor intenso.', CAST(1500.00 AS Decimal(10, 2)), 1, NULL)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (12, N'Cafe Rrazu 340g', N'Café rústico en presentación de 340g, excelente para tus momentos.', CAST(5500.00 AS Decimal(10, 2)), 1, NULL)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (13, N'Cafe Rrazu 908g', N'Café rústico en presentación de 908g, perfecto para cualquier ocasión.', CAST(13100.00 AS Decimal(10, 2)), 1, NULL)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (14, N'Cafe Quetzal 75g', N'Café exótico en presentación de 75g, para una experiencia única.', CAST(1000.00 AS Decimal(10, 2)), 1, N'https://media.nidux.net/pull/700/700/2770/84324-product-61490073f0393-quetzal-5-pack.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (15, N'Premium Tueste Medio 340g', N'Café premium con tueste medio, ideal para un buen café.', CAST(4500.00 AS Decimal(10, 2)), 1, N'https://sagazcoffee.com/wp-content/uploads/2023/12/9-1-scaled.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (16, N'Premium Tueste Oscuro 340g', N'Café premium con tueste oscuro, para los amantes del sabor fuerte.', CAST(4500.00 AS Decimal(10, 2)), 1, N'https://sagazcoffee.com/wp-content/uploads/2023/12/9-1-scaled.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (17, N'Clasico 1000g', N'Café clásico en presentación de 1000g, ideal para familias.', CAST(7000.00 AS Decimal(10, 2)), 1, N'https://sagazcoffee.com/wp-content/uploads/2023/12/8-scaled.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (18, N'Tradicional 1000g', N'Café tradicional en presentación de 1000g, sabor inconfundible.', CAST(6500.00 AS Decimal(10, 2)), 1, N'https://sagazcoffee.com/wp-content/uploads/2023/12/7-1-scaled.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (19, N'Tradicional Tueste Medio 200g', N'Café tradicional con tueste medio, ideal para cualquier momento.', CAST(1340.00 AS Decimal(10, 2)), 1, N'https://sagazcoffee.com/wp-content/uploads/2023/12/7-1-scaled.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (20, N'Tradicional Tueste Oscuro 200g', N'Café tradicional con tueste oscuro, para un sabor intenso.', CAST(1355.00 AS Decimal(10, 2)), 1, N'https://sagazcoffee.com/wp-content/uploads/2023/12/7-1-scaled.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (21, N'Especialidad Lavado 340g', N'Café de especialidad lavado en presentación de 340g, con sabor único.', CAST(5400.00 AS Decimal(10, 2)), 1, N'https://walmartcr.vtexassets.com/arquivos/ids/503521-1200-900?v=638415038273030000&width=1200&height=900&aspect=true')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (22, N'Tarrazu Caracolillo 340g', N'Café Tarrazu en presentación de 340g, de sabor exquisito.', CAST(4350.00 AS Decimal(10, 2)), 1, N'https://walmartcr.vtexassets.com/arquivos/ids/721782-1200-900?v=638627128153700000&width=1200&height=900&aspect=true')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (23, N'Gourmet Tueste Claro 340g', N'Café gourmet con tueste claro, para un sabor delicado.', CAST(3500.00 AS Decimal(10, 2)), 1, NULL)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (24, N'Especialidad Molido 1kg', N'Café de especialidad molido en presentación de 1kg, perfecto para preparar en casa.', CAST(11000.00 AS Decimal(10, 2)), 1, N'https://www.lavazzausa.com/es/recipes-and-coffee-hacks/consejos-para-almacenar-el-cafe-molido/_jcr_content/root/cust/customcontainer/customcontainer_copy/image.coreimg.jpeg/1673259712111/d-m-how-to-store-ground-coffee-large.jpeg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (25, N'Especialidad Yellow Honey 340g', N'Café amarillo en presentación de 340g, con un dulzor natural.', CAST(4650.00 AS Decimal(10, 2)), 1, N'https://walmartcr.vtexassets.com/arquivos/ids/503272-1200-900?v=638415036997530000&width=1200&height=900&aspect=true')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (26, N'Especialidad Red Honey 340g', N'Café rojo en presentación de 340g, con un sabor suave.', CAST(4650.00 AS Decimal(10, 2)), 1, N'https://walmartcr.vtexassets.com/arquivos/ids/502526-1200-900?v=638415033760000000&width=1200&height=900&aspect=true')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (27, N'Especialidad Two Pack 540g', N'Paquete doble de café de especialidad en presentación de 540g.', CAST(9750.00 AS Decimal(10, 2)), 1, NULL)
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (28, N'Caja Regalo Fadiva', N'Caja de regalo con selección de cafés premium.', CAST(17500.00 AS Decimal(10, 2)), 1, N'https://www.fadivatarrazucr.com/cdn/shop/files/Copia_Productos_sitio_web_Post_de_Instagram_3_7f502a5b-2dbc-42e7-be18-c669b596eede.png?v=1730909986')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (29, N'Queso Blanco para Freír', N'Delicioso queso blanco ideal para freír.', CAST(5500.00 AS Decimal(10, 2)), 4, N'https://i0.wp.com/mercato.cr/wp-content/uploads/2024/10/Queso-para-freir-Chicua.webp?fit=650%2C366&ssl=1')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (30, N'Queso Tierno', N'Queso tierno, perfecto para cualquier platillo.', CAST(5500.00 AS Decimal(10, 2)), 4, N'https://www.quesosguijarro.com/files/noticias/33/imagenes/queso_tierno.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (31, N'Queso Palmito', N'Queso palmito suave y cremoso.', CAST(4000.00 AS Decimal(10, 2)), 4, N'https://elcolectivo506.com/wp-content/uploads/2021/06/EC506-mqcphoto-QuesoPalmito-CR-007.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (32, N'Queso Mozzarella', N'Queso mozzarella fresco y delicioso.', CAST(6500.00 AS Decimal(10, 2)), 4, N'https://www.gastronomiavasca.net/uploads/image/file/4415/w700_queso_mozarella_rallado.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (33, N'Queso Molido', N'Queso molido ideal para pizzas y pastas.', CAST(4000.00 AS Decimal(10, 2)), 4, N'https://solera.co.cr/wp-content/uploads/2020/11/0332.png')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (34, N'Queso Personalizado', N'Queso a medida, ideal para tus eventos.', CAST(16000.00 AS Decimal(10, 2)), 4, N'https://upload.wikimedia.org/wikipedia/commons/8/8a/Queso_turrialba_crc.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (35, N'Queso Crema', N'Suave y cremoso, ideal para untar.', CAST(4500.00 AS Decimal(10, 2)), 4, N'https://i0.wp.com/www.pasionthermomix.co/wp-content/uploads/2022/04/como-hacer-queso-crema-casero-para-cheesecakes-receta.jpg?w=688&ssl=1')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (36, N'Natilla', N'Deliciosa natilla, perfecta para el postre.', CAST(1200.00 AS Decimal(10, 2)), 4, N'https://assets.tmecosys.com/image/upload/t_web600x528/img/recipe/ras/Assets/5b2c37f7-5c4c-497d-9db7-56a126fb042c/Derivates/ed610bfd-2a19-44cc-a9a4-ba0fd976a488.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (37, N'Yogurt 1L', N'Yogurt cremoso en presentación de 1 litro.', CAST(3000.00 AS Decimal(10, 2)), 4, N'https://images.mrcook.app/recipe-image/018edcf2-483e-79bf-8037-f344ca0bd28a?cacheKey=U3VuLCAxMiBKYW4gMjAyNSAwMzozODoyNCBHTVQ=')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (38, N'Yogurt 200ml', N'Yogurt en presentación individual de 200ml.', CAST(1100.00 AS Decimal(10, 2)), 4, N'https://images.mrcook.app/recipe-image/018edcf2-483e-79bf-8037-f344ca0bd28a?cacheKey=U3VuLCAxMiBKYW4gMjAyNSAwMzozODoyNCBHTVQ=')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (39, N'Jugo Natural 1 Galón', N'Jugo natural fresco en presentación de 1 galón.', CAST(8000.00 AS Decimal(10, 2)), 2, N'https://borinquennatural.net/cdn/shop/articles/aprende-como-hacer-algunos-jugos-de-frutas-sin-azucar-para-tus-dietas-571246_2000x.progressive.jpg?v=1660382481')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (40, N'Jugo Natural 1.8L', N'Jugo natural en presentación de 1.8L.', CAST(4200.00 AS Decimal(10, 2)), 2, N'https://borinquennatural.net/cdn/shop/articles/aprende-como-hacer-algunos-jugos-de-frutas-sin-azucar-para-tus-dietas-571246_2000x.progressive.jpg?v=1660382481')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (41, N'Jugo Natural 500ml', N'Jugo natural en presentación de 500ml.', CAST(1300.00 AS Decimal(10, 2)), 2, N'https://borinquennatural.net/cdn/shop/articles/aprende-como-hacer-algunos-jugos-de-frutas-sin-azucar-para-tus-dietas-571246_2000x.progressive.jpg?v=1660382481')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (42, N'Fresa 1kg', N'Fresas frescas en presentación de 1kg.', CAST(3600.00 AS Decimal(10, 2)), 3, N'https://libbys.es/wordpress/wp-content/uploads/2018/05/fresas.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (43, N'Mora 1kg', N'Moras frescas en presentación de 1kg.', CAST(3600.00 AS Decimal(10, 2)), 3, N'https://5aldia.cl/wp-content/uploads/2018/03/mora.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (44, N'Guanábana 1kg', N'Guanábanas frescas en presentación de 1kg.', CAST(3600.00 AS Decimal(10, 2)), 3, N'https://blog.oncosalud.pe/hubfs/beneficios-de-la-guanabana-para-tu-salud-imagen-1-1.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (45, N'Maracuyá 1kg', N'Maracuyás frescas en presentación de 1kg.', CAST(2700.00 AS Decimal(10, 2)), 3, N'https://www.maraustral.com.uy/wp-content/uploads/sites/11/2023/02/19.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (46, N'Cas 1kg', N'Cas frescos en presentación de 1kg.', CAST(2700.00 AS Decimal(10, 2)), 3, N'https://agroferiacr.com/wp-content/uploads/2023/04/cas.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (47, N'Piña 1kg', N'Piñas frescas en presentación de 1kg.', CAST(2700.00 AS Decimal(10, 2)), 3, N'https://www.figoecomercado.com/up-one/2020/06/pina-producto-organico.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (48, N'Mango 1kg', N'Mangos frescos en presentación de 1kg.', CAST(2700.00 AS Decimal(10, 2)), 3, N'https://s3.eu-west-2.amazonaws.com/mentta/producto/mango-1kg-2.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (49, N'Papaya Piña Mango 1kg', N'Mezcla de frutas en presentación de 1kg.', CAST(3200.00 AS Decimal(10, 2)), 3, N'https://www.shutterstock.com/shutterstock/photos/1715017369/display_1500/stock-photo-papaya-mango-and-pineapple-tropical-fruits-1715017369.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (50, N'Maracuyá Piña 1kg', N'Mezcla de maracuyá y piña en presentación de 1kg.', CAST(3200.00 AS Decimal(10, 2)), 3, N'https://previews.123rf.com/images/dizolator/dizolator1911/dizolator191100139/134450091-imagen-compuesta-con-frutas-ex%C3%B3ticas-pi%C3%B1a-y-maracuy%C3%A1-aislado-sobre-fondo-blanco-como-elemento-de.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (51, N'Paquete 12 Frutas 1kg', N'Paquete variado de 12 frutas en presentación de 1kg.', CAST(5500.00 AS Decimal(10, 2)), 3, N'https://st.depositphotos.com/1486923/1948/i/950/depositphotos_19486293-stock-photo-more-fruit.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (54, N'jagermaister', N'licor altamente fuerte traido de las germanys ', CAST(11000.00 AS Decimal(10, 2)), 8, N'https://m.media-amazon.com/images/I/61zD0HRX2lL.jpg')
GO
INSERT [dbo].[PRODUCTO] ([ProductoID], [NombreProducto], [Descripcion], [Precio], [CategoriaID], [Foto]) VALUES (56, N'aceite de aguacate', N'rico aceite para la comida ', CAST(3500.00 AS Decimal(10, 2)), 1, N'https://th.bing.com/th/id/OIP.4K9sOMLsS0HlbW19CVgF6QHaE7?rs=1&pid=ImgDetMain')
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO] OFF
GO
SET IDENTITY_INSERT [dbo].[Publicacion] ON 
GO
INSERT [dbo].[Publicacion] ([PublicacionID], [Titulo], [Descripcion], [FechaPublicacion], [UsuarioID], [ImagenRuta]) VALUES (6, N'Nueva update en la Pagina web!', N'En estos dias el equipo de TI se encargo de resolver errores menores sobre el funcionamiento de la pagina', CAST(N'2025-02-26T15:55:00.0000000' AS DateTime2), 2015, N'https://img.freepik.com/foto-gratis/mano-humana-escribiendo-teclado-computadora-noche-generada-ai_188544-31050.jpg?t=st=1740607098~exp=1740610698~hmac=009ef26bb53c7b2c9fe8428bd1ee65cd8efc6424c5cd8e7dbccdf0ef29c9b1a5&w=1380')
GO
SET IDENTITY_INSERT [dbo].[Publicacion] OFF
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
INSERT [dbo].[PUNTOSDELEALTAD] ([PuntosID], [UserID], [PuntosAcumulados]) VALUES (12, 3, 200)
GO
INSERT [dbo].[PUNTOSDELEALTAD] ([PuntosID], [UserID], [PuntosAcumulados]) VALUES (13, 2015, 700)
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
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (1, N'alonso', N'hernandez', N'alonso@gmail.com', N'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', N'Administrador')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (2, N'antonio', N'Hernandez', N'antonio@gmail.com', N'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', N'Cliente')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (3, N'Alonso', N'Hernandez', N'Alonso@gmail.com', N'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', N'Administrador')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (4, N'Sofia', N'Madrigal', N'Sofia@gmail.com', N'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', N'Administrador')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (5, N'Juan', N'Pedregal', N'juanpedregal@gmail.com', N'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', N'Administrador')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (6, N'Lorena', N'Herrera', N'Lorena@gmail.com', N'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', N'Administrador')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (7, N'Kimberly', N'Ayucagua', N'kim@gmail.com', N'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', N'Administrador')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (8, N'Gillermo', N'Holanda', N'gille@gmail.com', N'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', N'Administrador')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (9, N'jose', N'gutierrez', N'jose@gmail.com', N'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', N'Administrador')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (10, N'Osvaldo', N'Lopez', N'osvaldo@gmail.com', N'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', N'Administrador')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (11, N'Manuel', N'Maduro', N'manuel@gmail.com', N'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', N'Cliente')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (12, N'Carlos', N'Martinez', N'carlos.martinez@example.com', N'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', N'Cliente')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (13, N'Alonso', N'Hernandez', N'Alonso1@gmail.com', N'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', N'Cliente')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (14, N'Ezequiel', N'Barboza', N'Ezequiel@gmail.com', N'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', N'Cliente')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (16, N'Pamela', N'Herrera', N'Pamela@gmail.com', N'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', N'Cliente')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (1015, N'mariano', N'pelotas', N'pelotica@gmail.com', N'ce803fc5ad6d66b1bf937f58deb66c108bd365b1171b33e8c2581a11fef9fdec', N'Cliente')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (2015, N'Alonso', N'Hernandez', N'Alonso2@gmail.com', N'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', N'Administrador')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (2016, N'jimena', N'fallas', N'jime@gmail.com', N'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', N'Cliente')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (2017, N'antonio', N'Hernandez', N'antonio@gmail.com', N'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', N'Cliente')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (2018, N'marioneta', N'avioneta', N'cuneta@gmail.com', N'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', N'Cliente')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (2019, N'peter', N'illman', N'peter@gmail.com', N'448670af7041dcb92d3744ee4972ad465132748b87294062eb700eb77176103e', N'Cliente')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (2020, N'mariaelos', N'holanda', N'mari@gmail.com', N'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', N'Cliente')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (2021, N'Testing', N'User', N'testinguser@gmail.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'Cliente')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (2022, N'Alejandraa', N'Bonillaa', N'Ale1@gmail.com', N'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', N'Cliente')
GO
INSERT [dbo].[USUARIO] ([UserID], [Nombre], [Apellido], [CorreoElectronico], [Contraseña], [TipoUsuario]) VALUES (2023, N'antonio', N'morales', N'montero@gmail.com', N'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', N'Cliente')
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
/****** Object:  Index [IX_DETALLESPEDIDO_PedidoID]    Script Date: 27/03/2025 04:21:47 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_DETALLESPEDIDO_PedidoID] ON [dbo].[DETALLESPEDIDO]
(
	[PedidoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DETALLESPEDIDO_ProductoID]    Script Date: 27/03/2025 04:21:47 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_DETALLESPEDIDO_ProductoID] ON [dbo].[DETALLESPEDIDO]
(
	[ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_NOTIFICACION_UserID]    Script Date: 27/03/2025 04:21:47 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_NOTIFICACION_UserID] ON [dbo].[NOTIFICACION]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PEDIDO_UserID]    Script Date: 27/03/2025 04:21:47 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_PEDIDO_UserID] ON [dbo].[PEDIDO]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PRODUCTO_CategoriaID]    Script Date: 27/03/2025 04:21:47 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_PRODUCTO_CategoriaID] ON [dbo].[PRODUCTO]
(
	[CategoriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PUNTOSDELEALTAD_UserID]    Script Date: 27/03/2025 04:21:47 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_PUNTOSDELEALTAD_UserID] ON [dbo].[PUNTOSDELEALTAD]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RECOMENDACION_ProductoID]    Script Date: 27/03/2025 04:21:47 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_RECOMENDACION_ProductoID] ON [dbo].[RECOMENDACION]
(
	[ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RECOMENDACION_UserID]    Script Date: 27/03/2025 04:21:47 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_RECOMENDACION_UserID] ON [dbo].[RECOMENDACION]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_VALORACIONESDEPRODUCTO_ProductoID]    Script Date: 27/03/2025 04:21:47 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_VALORACIONESDEPRODUCTO_ProductoID] ON [dbo].[VALORACIONESDEPRODUCTO]
(
	[ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_VALORACIONESDEPRODUCTO_UserID]    Script Date: 27/03/2025 04:21:47 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_VALORACIONESDEPRODUCTO_UserID] ON [dbo].[VALORACIONESDEPRODUCTO]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Publicacion] ADD  DEFAULT ((0)) FOR [UsuarioID]
GO
ALTER TABLE [dbo].[DETALLESPEDIDO]  WITH CHECK ADD  CONSTRAINT [FK__DETALLESP__Pedid__412EB0B6] FOREIGN KEY([PedidoID])
REFERENCES [dbo].[PEDIDO] ([PedidoID])
GO
ALTER TABLE [dbo].[DETALLESPEDIDO] CHECK CONSTRAINT [FK__DETALLESP__Pedid__412EB0B6]
GO
ALTER TABLE [dbo].[DETALLESPEDIDO]  WITH CHECK ADD  CONSTRAINT [FK__DETALLESP__Produ__4222D4EF] FOREIGN KEY([ProductoID])
REFERENCES [dbo].[PRODUCTO] ([ProductoID])
GO
ALTER TABLE [dbo].[DETALLESPEDIDO] CHECK CONSTRAINT [FK__DETALLESP__Produ__4222D4EF]
GO
ALTER TABLE [dbo].[NOTIFICACION]  WITH CHECK ADD  CONSTRAINT [FK__NOTIFICAC__UserI__48CFD27E] FOREIGN KEY([UserID])
REFERENCES [dbo].[USUARIO] ([UserID])
GO
ALTER TABLE [dbo].[NOTIFICACION] CHECK CONSTRAINT [FK__NOTIFICAC__UserI__48CFD27E]
GO
ALTER TABLE [dbo].[PEDIDO]  WITH CHECK ADD  CONSTRAINT [FK__PEDIDO__UserID__398D8EEE] FOREIGN KEY([UserID])
REFERENCES [dbo].[USUARIO] ([UserID])
GO
ALTER TABLE [dbo].[PEDIDO] CHECK CONSTRAINT [FK__PEDIDO__UserID__398D8EEE]
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD  CONSTRAINT [FK__PRODUCTO__Catego__3E52440B] FOREIGN KEY([CategoriaID])
REFERENCES [dbo].[CATEGORIA] ([CategoriaID])
GO
ALTER TABLE [dbo].[PRODUCTO] CHECK CONSTRAINT [FK__PRODUCTO__Catego__3E52440B]
GO
ALTER TABLE [dbo].[PUNTOSDELEALTAD]  WITH CHECK ADD  CONSTRAINT [FK__PUNTOSDEL__UserI__4BAC3F29] FOREIGN KEY([UserID])
REFERENCES [dbo].[USUARIO] ([UserID])
GO
ALTER TABLE [dbo].[PUNTOSDELEALTAD] CHECK CONSTRAINT [FK__PUNTOSDEL__UserI__4BAC3F29]
GO
ALTER TABLE [dbo].[RECOMENDACION]  WITH CHECK ADD  CONSTRAINT [FK__RECOMENDA__Produ__45F365D3] FOREIGN KEY([ProductoID])
REFERENCES [dbo].[PRODUCTO] ([ProductoID])
GO
ALTER TABLE [dbo].[RECOMENDACION] CHECK CONSTRAINT [FK__RECOMENDA__Produ__45F365D3]
GO
ALTER TABLE [dbo].[RECOMENDACION]  WITH CHECK ADD  CONSTRAINT [FK__RECOMENDA__UserI__44FF419A] FOREIGN KEY([UserID])
REFERENCES [dbo].[USUARIO] ([UserID])
GO
ALTER TABLE [dbo].[RECOMENDACION] CHECK CONSTRAINT [FK__RECOMENDA__UserI__44FF419A]
GO
ALTER TABLE [dbo].[VALORACIONESDEPRODUCTO]  WITH CHECK ADD  CONSTRAINT [FK__VALORACIO__Produ__4E88ABD4] FOREIGN KEY([ProductoID])
REFERENCES [dbo].[PRODUCTO] ([ProductoID])
GO
ALTER TABLE [dbo].[VALORACIONESDEPRODUCTO] CHECK CONSTRAINT [FK__VALORACIO__Produ__4E88ABD4]
GO
ALTER TABLE [dbo].[VALORACIONESDEPRODUCTO]  WITH CHECK ADD  CONSTRAINT [FK__VALORACIO__UserI__4F7CD00D] FOREIGN KEY([UserID])
REFERENCES [dbo].[USUARIO] ([UserID])
GO
ALTER TABLE [dbo].[VALORACIONESDEPRODUCTO] CHECK CONSTRAINT [FK__VALORACIO__UserI__4F7CD00D]
GO
/****** Object:  StoredProcedure [dbo].[InsertarRecomendacion]    Script Date: 27/03/2025 04:21:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarRecomendacion]
    @ProductoId INT,
    @UserId INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Recomendacion (ProductoId, UserId, FechaRecomendacion)
    VALUES (@ProductoId, @UserId, GETDATE());
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertarValoracionProducto]    Script Date: 27/03/2025 04:21:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarValoracionProducto]
    @ProductoId INT,
    @UserId INT,
    @Comentario NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Valoracionesdeproducto (ProductoId, UserId, Comentario)
    VALUES (@ProductoId, @UserId, @Comentario);
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertDetallePedido]    Script Date: 27/03/2025 04:21:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertDetallePedido]
    @PedidoID INT,
    @ProductoID INT,
    @Cantidad INT,
    @PrecioUnitario DECIMAL(18, 2)
AS
BEGIN
    INSERT INTO [pymeCafe].[dbo].[DETALLESPEDIDO] (PedidoID, ProductoID, Cantidad, PrecioUnitario)
    VALUES (@PedidoID, @ProductoID, @Cantidad, @PrecioUnitario);
END;

GO
/****** Object:  StoredProcedure [dbo].[InsertPedido]    Script Date: 27/03/2025 04:21:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertPedido]
    @UserId INT,
    @EstadoPedido NVARCHAR(50) = 'En proceso',
    @Comentarios NVARCHAR(MAX) = ''
AS
BEGIN
    INSERT INTO [pymeCafe].[dbo].[PEDIDO] (UserID, FechaPedido, EstadoPedido, Comentarios)
    VALUES (@UserId, GETDATE(), @EstadoPedido, @Comentarios);
    
    -- Devuelve el ID del pedido recién insertado
    SELECT SCOPE_IDENTITY() AS PedidoID;
END;

GO
/****** Object:  StoredProcedure [dbo].[RegistrarUsuario]    Script Date: 27/03/2025 04:21:47 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ActualizarUsuario]    Script Date: 27/03/2025 04:21:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActualizarUsuario]
    @UsuarioID INT,
    @Nombre NVARCHAR(100),
    @Apellido NVARCHAR(100),
    @CorreoElectronico NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Usuario -- Cambié de Usuarios a Usuario
    SET Nombre = @Nombre,
        Apellido = @Apellido,
        CorreoElectronico = @CorreoElectronico
    WHERE UserId = @UsuarioID;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarDetallePedido]    Script Date: 27/03/2025 04:21:47 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AgregarPedido]    Script Date: 27/03/2025 04:21:47 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AgregarProducto]    Script Date: 27/03/2025 04:21:47 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AgregarRecomendacion]    Script Date: 27/03/2025 04:21:47 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AgregarUsuario]    Script Date: 27/03/2025 04:21:47 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AgregarValoracionProducto]    Script Date: 27/03/2025 04:21:47 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ConfirmarPedido]    Script Date: 27/03/2025 04:21:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ConfirmarPedido]
    @PedidoID INT,
    @UserID INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE PEDIDO
    SET EstadoPedido = 'Confirmado'
    WHERE PedidoID = @PedidoID AND UserID = @UserID;

    -- Opcional: Registra en un log el cambio de estado
    INSERT INTO LOG_CAMBIOS (PedidoID, UserID, FechaCambio, NuevoEstado)
    VALUES (@PedidoID, @UserID, GETDATE(), 'Confirmado');
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_EditarDetallePedido]    Script Date: 27/03/2025 04:21:47 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EditarPedido]    Script Date: 27/03/2025 04:21:47 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EditarProducto]    Script Date: 27/03/2025 04:21:47 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EditarRecomendacion]    Script Date: 27/03/2025 04:21:47 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EditarUsuario]    Script Date: 27/03/2025 04:21:47 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EditarValoracionProducto]    Script Date: 27/03/2025 04:21:47 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EliminarDetallePedido]    Script Date: 27/03/2025 04:21:47 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EliminarPedido]    Script Date: 27/03/2025 04:21:47 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EliminarProducto]    Script Date: 27/03/2025 04:21:47 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EliminarRecomendacion]    Script Date: 27/03/2025 04:21:47 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EliminarUsuario]    Script Date: 27/03/2025 04:21:47 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EliminarValoracionProducto]    Script Date: 27/03/2025 04:21:47 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_VerificarUsuario]    Script Date: 27/03/2025 04:21:47 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[VerificarLogin]    Script Date: 27/03/2025 04:21:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerificarLogin]
    @CorreoElectronico NVARCHAR(250),
    @Contraseña NVARCHAR(250),
    @Resultado NVARCHAR(250) OUTPUT,
    @UserID INT OUTPUT,
    @TipoUsuario NVARCHAR(50) OUTPUT
AS
BEGIN
    -- Verificar si el usuario existe con el correo y contraseña
    DECLARE @Id INT, @Tipo NVARCHAR(50);

    SELECT @Id = UserID, @Tipo = TipoUsuario
    FROM USUARIO
    WHERE CorreoElectronico = @CorreoElectronico
    AND Contraseña = @Contraseña;

    IF @Id IS NOT NULL
    BEGIN
        -- Si las credenciales son correctas
        SET @Resultado = 'Inicio de sesión exitoso';
        SET @UserID = @Id;
        SET @TipoUsuario = @Tipo; -- Asignamos el TipoUsuario como texto
    END
    ELSE
    BEGIN
        -- Si las credenciales son incorrectas
        SET @Resultado = 'Correo o contraseña incorrectos';
        SET @UserID = NULL;
        SET @TipoUsuario = NULL;
    END
END;

GO
USE [master]
GO
ALTER DATABASE [pymecafe] SET  READ_WRITE 
GO
