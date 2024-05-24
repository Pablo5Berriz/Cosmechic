USE [master]
GO
/****** Object:  Database [Cosmechics]    Script Date: 2024-03-01 06:28:41 ******/
CREATE DATABASE [Cosmechics]
GO
ALTER DATABASE [Cosmechics] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cosmechics].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cosmechics] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cosmechics] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cosmechics] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cosmechics] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cosmechics] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cosmechics] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cosmechics] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cosmechics] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cosmechics] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cosmechics] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cosmechics] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cosmechics] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cosmechics] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cosmechics] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cosmechics] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cosmechics] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cosmechics] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cosmechics] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cosmechics] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cosmechics] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cosmechics] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cosmechics] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cosmechics] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Cosmechics] SET  MULTI_USER 
GO
ALTER DATABASE [Cosmechics] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cosmechics] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cosmechics] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cosmechics] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cosmechics] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Cosmechics] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Cosmechics] SET QUERY_STORE = ON
GO
ALTER DATABASE [Cosmechics] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Cosmechics]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2024-03-01 06:28:41 ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 2024-03-01 06:28:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2024-03-01 06:28:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2024-03-01 06:28:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2024-03-01 06:28:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2024-03-01 06:28:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2024-03-01 06:28:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[StreetAddress] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[PostalCode] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 2024-03-01 06:28:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Avis]    Script Date: 2024-03-01 06:28:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Avis](
	[ReviewID] [int] NOT NULL,
	[AspNetUserID] [nvarchar](450) NOT NULL,
	[ProduitID] [int] NOT NULL,
	[PaiementID] [int] IDENTITY(1,1) NOT NULL,
	[Note] [int] NOT NULL,
	[Commentaire] [nvarchar](max) NULL,
	[DateReview] [datetime] NOT NULL,
 CONSTRAINT [PK_Avis] PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2024-03-01 06:28:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategorieID] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [nchar](450) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nchar](450) NOT NULL,
	[Disponible] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategorieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2024-03-01 06:28:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderHeaderId] [int] NOT NULL,
	[ProduitId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderHeaders]    Script Date: 2024-03-01 06:28:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHeaders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationUserId] [nvarchar](450) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[ShippingDate] [datetime2](7) NOT NULL,
	[OrderTotal] [float] NOT NULL,
	[OrderStatus] [nvarchar](max) NULL,
	[PaymentStatus] [nvarchar](max) NULL,
	[TrackingNumber] [nvarchar](max) NULL,
	[Carrier] [nvarchar](max) NULL,
	[PaymentDate] [datetime2](7) NOT NULL,
	[PaymentDueDate] [datetime2](7) NOT NULL,
	[SessionId] [nvarchar](max) NULL,
	[PaymentIntentId] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[StreetAddress] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[State] [nvarchar](max) NOT NULL,
	[PostalCode] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_OrderHeaders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produits]    Script Date: 2024-03-01 06:28:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produits](
	[ProduitID] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [nvarchar](450) NOT NULL,
	[CategorieID] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Prix] [money] NOT NULL,
	[Stock] [decimal](18, 0) NOT NULL,
	[Disponible] [bit] NOT NULL,
	[Image] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[ProduitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCarts]    Script Date: 2024-03-01 06:28:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCarts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProduitId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[ApplicationUserId] [varchar](500) NULL,
 CONSTRAINT [PK_ShoppingCarts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'7.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240130195451_Commandes', N'7.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240221071448_Added Front Image', N'7.0.16')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1', N'Admin', N'ADMIN', N'ADMIN')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2', N'Utilisateurs', N'UTILISATEURS', N'UTILISATEURS')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ae6bf82b-db49-427b-9939-0bd35a398bc7', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0ca54caa-83be-4935-8497-0fb6db5475aa', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c0da3a8e-23c4-4d41-b215-283df6b519ba', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c32c30ea-6c72-47e9-a87b-adb1c9d77ce9', N'2')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [StreetAddress], [City], [State], [PostalCode]) VALUES (N'0ca54caa-83be-4935-8497-0fb6db5475aa', N'AjouterAuPanier', N'AJOUTERAUPANIER', N'lapoulgaa@gmail.com', N'LAPOULGAA@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEM4SPuwbd3Pssj/Dq0A0bYzIcsN890JAGCcVIzrPAcbH9IYfbdbvh0YxUsL9aiTrlQ==', N'5EK23FL2TMGL5BREEPJ4ZMSW3ISHGRE5', N'b4e91589-a8af-4a4d-999c-e18e027355c0', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [StreetAddress], [City], [State], [PostalCode]) VALUES (N'55697332-cd42-43c9-8640-f880f282a702', N'jeudisoir', NULL, N'jeudisoir@gmail.com', NULL, 0, NULL, NULL, NULL, N'5142083644', 0, 0, NULL, 0, 0, N'164 rue principale', N'Saint Louis de Gonzague', N'Québec', N'J0S1T0')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [StreetAddress], [City], [State], [PostalCode]) VALUES (N'5facd053-abe9-41e3-ab2c-3d5ae0c445a9', N'Quentin', NULL, N'Quentin@paul.ca', NULL, 0, NULL, NULL, NULL, N'5142083644', 0, 0, NULL, 0, 0, N'164 Avenue Germaine', N'Saint Thomas', N'Québec', N'J0T-2G3')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [StreetAddress], [City], [State], [PostalCode]) VALUES (N'6afdf1f0-12cf-46e5-8af2-db0bd334d367', N'teste', N'TESTE', N'paulquentin4@gmail.com', N'PAULQUENTIN4@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEEht3Hxdq2+D+5Qx4Hqp8xSYt63k7MjwvuejponmPpXvYMfqvTN+Q1KQfLtAJmOT/w==', N'WM3F45TGQ7KA7OMTCKG3ZERBHNTUNR3F', N'62944d5b-af81-4193-83e2-ea590a8e9b8c', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [StreetAddress], [City], [State], [PostalCode]) VALUES (N'ae6bf82b-db49-427b-9939-0bd35a398bc7', N'Admin', N'ADMIN', N'Admin@admin.ca', N'ADMIN@ADMIN.CA', 1, N'AQAAAAIAAYagAAAAEEX1BQ5WPKyim1YqFTyNLoSgxKzzajuQK3OM3Z+Qp2VhhLy5m3GE126Gnk9EgGnXUA==', N'P5ODSNYCCWQQE46MIYF3IEN2TALGPCKP', N'377e11cb-6f01-44f8-a35f-c72b6370b28e', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [StreetAddress], [City], [State], [PostalCode]) VALUES (N'c0da3a8e-23c4-4d41-b215-283df6b519ba', N'Test', NULL, N'test@test.ca', NULL, 0, NULL, NULL, NULL, N'514-200-1256', 0, 0, NULL, 0, 0, N'633 de la taverne', N'Québec', N'Québec', N'Q4H-6G2')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [StreetAddress], [City], [State], [PostalCode]) VALUES (N'c32c30ea-6c72-47e9-a87b-adb1c9d77ce9', N'Paul', NULL, N'paul@paul.ca', NULL, 0, NULL, NULL, NULL, N'5012345678', 0, 0, NULL, 0, 0, N'12 avenue germaine', N'Beauharnois', N'Québec', N'H2G-6L1')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [StreetAddress], [City], [State], [PostalCode]) VALUES (N'cf767458-e333-46e7-87cb-725bc3555674', N'Kent', NULL, N'kent@kent.ca', NULL, 0, NULL, NULL, NULL, N'514-123-4567', 0, 0, NULL, 0, 0, N'164 Avenue Germaine', N'Saint Thomas', N'Québec', N'J0T-2G3')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategorieID], [Nom], [Description], [Image], [Disponible]) VALUES (1, N'Savon                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', N'Découvrez notre gamme de savons naturels, fabriqués à la main avec des ingrédients biologiques et respectueux de l''''environnement. Nos savons sont enrichis en huiles essentielles et extraits de plantes pour nettoyer, hydrater et revitaliser votre peau. Parfaits pour tous les types de peau, ils laissent une sensation de fraîcheur et un parfum délicat.                                                                                                  ', N'Savon.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', 1)
INSERT [dbo].[Categories] ([CategorieID], [Nom], [Description], [Image], [Disponible]) VALUES (2, N'Lait de beauté                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', N'Explorez notre sélection d''''huiles naturelles pour une peau et des cheveux sublimés. Nos huiles sont extraites de sources durables et sont idéales pour une hydratation profonde, la réparation des cheveux abîmés et l''''amélioration de l''''éclat de la peau. Utilisées seules ou incorporées dans votre routine de soins, elles apportent nutrition et protection.                                                                                               ', N'Lait.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', 1)
INSERT [dbo].[Categories] ([CategorieID], [Nom], [Description], [Image], [Disponible]) VALUES (3, N'Lotion                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Offrez à votre peau le soin qu''''elle mérite avec nos lotions corporelles enrichies. Conçues pour pénétrer en profondeur et hydrater intensément, nos lotions laissent votre peau douce, lisse et visiblement saine. Elles sont formulées avec des ingrédients naturels pour convenir à tous les types de peau, y compris les peaux sensibles.                                                                                                                     ', N'Lotion.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', 1)
INSERT [dbo].[Categories] ([CategorieID], [Nom], [Description], [Image], [Disponible]) VALUES (4, N'Mèche                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', N'Sublimez vos dreadlocks avec notre collection de mèches afro de qualité supérieure. Conçues pour se fondre naturellement avec vos cheveux, nos mèches offrent un look authentique et durable. Elles sont faciles à entretenir et résistantes, idéales pour ceux qui souhaitent adopter un style dreadlocks sans compromis sur la qualité et l''''aspect naturel.                                                                                                    ', N'Meche.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', 1)
INSERT [dbo].[Categories] ([CategorieID], [Nom], [Description], [Image], [Disponible]) VALUES (13, N'Baume à lèvres                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', N'Découvrez notre gamme exclusive de baumes à lèvres "Le Baume à Lèvres", offrant une sélection variée de formules enrichies en ingrédients naturels pour des lèvres douces, hydratées et sublimées. Que vous recherchiez une hydratation intense, une protection solaire ou une touche de couleur, nos baumes à lèvres parfumés et nourrissants sont conçus pour répondre à tous vos besoins, vous offrant une expérience sensorielle unique et des résultats visibles dès la première application.', N'Baume.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (13, 7, 1, 2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (14, 7, 10, 2, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (16, 8, 1, 1, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (18, 9, 13, 1, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (22, 13, 13, 1, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (23, 14, 7, 3, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (24, 14, 2, 1, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (25, 14, 12, 1, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (27, 14, 6, 1, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (28, 15, 13, 1, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (29, 15, 3, 1, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (30, 15, 6, 1, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (31, 16, 11, 1, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (32, 17, 11, 1, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (33, 18, 17, 2, 55)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (34, 19, 41, 3, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (35, 19, 4, 1, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (36, 20, 13, 3, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (37, 20, 41, 3, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (38, 21, 6, 2, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (39, 22, 4, 1, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (40, 23, 7, 1, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (41, 24, 12, 1, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (42, 24, 15, 1, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (43, 24, 2, 1, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (44, 25, 12, 1, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (45, 25, 15, 1, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (46, 25, 2, 1, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (47, 26, 4, 1, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (48, 26, 44, 1, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProduitId], [Count], [Price]) VALUES (49, 26, 3, 1, 50)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderHeaders] ON 

INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [SessionId], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name]) VALUES (7, N'0ca54caa-83be-4935-8497-0fb6db5475aa', CAST(N'2024-02-15T11:10:06.0057163' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 120, N'Pending', N'Pending', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'cs_test_b1VzBOKiyHpyyxc89IPht6lcVhi2LMmaZ7lVZWy4THJ0MRX42dA3RKzOkw', NULL, N'26765786763', N'2335 rue des meuniers', N'Québec', N'QC', N'G2C 1R2', N'AjouterAuPanier')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [SessionId], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name]) VALUES (8, N'0ca54caa-83be-4935-8497-0fb6db5475aa', CAST(N'2024-02-15T14:26:13.6067333' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 95, N'Approved', N'Approved', NULL, NULL, CAST(N'2024-02-15T14:29:47.9938577' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'cs_test_b1Y4VPdHs2n5AsohWWtWkGEzuhum3svdHE1JEpPiDdQv1A4JW6dh3Gkxcp', N'pi_3OkAcvA7Z9pBhoDc05FviAKK', N'7678367835353', N'2335 rue des meuniers', N'Québec', N'QC', N'G2C 1R2', N'AjouterAuPanier')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [SessionId], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name]) VALUES (9, N'c32c30ea-6c72-47e9-a87b-adb1c9d77ce9', CAST(N'2024-02-18T15:20:22.6418716' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 90, N'Approved', N'Approved', NULL, NULL, CAST(N'2024-02-18T15:25:15.0755624' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'cs_test_b1pEeZQsXPxqXNhXPF4pMeUFGxuKb2FjPVnJQaI4rj6juYccVOeZFQn2Xe', N'pi_3OlGuGA7Z9pBhoDc0ZtWn9fb', N'234-5678-9012', N'123 Rue de la batisse', N'Saguenay', N'Québec', N'S2A-5T3', N'Paul')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [SessionId], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name]) VALUES (10, N'c32c30ea-6c72-47e9-a87b-adb1c9d77ce9', CAST(N'2024-02-18T16:51:42.0997970' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 75, N'Approved', N'Approved', NULL, NULL, CAST(N'2024-02-18T16:53:34.3505173' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'cs_test_a1EmhptT7VQDJR7DBLdsdmBRjnsd0oFEabcDi2g5hIIlQ6yBd5dsG36Wdh', N'pi_3OlIHkA7Z9pBhoDc1KlE5S0w', N'502-512-15442', N'12 Avenue Papineau', N'Montréal', N'Quebec', N'H2V-5Y6', N'Paul')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [SessionId], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name]) VALUES (11, N'c32c30ea-6c72-47e9-a87b-adb1c9d77ce9', CAST(N'2024-02-19T10:42:35.9034379' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 150, N'Approved', N'Approved', NULL, NULL, CAST(N'2024-02-19T10:43:35.3098612' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'cs_test_a1rt4jtN7BiAxIyJBc0gOmHfLuzOBbnHSGY4MmsUSx1yB52X6NRYTD6WYM', N'pi_3OlZ0AA7Z9pBhoDc09tuJTRN', N'501-354-6524', N'45 Avenue Morgan', N'Gatineau', N'Québec', N'G3B-2C3', N'Paul')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [SessionId], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name]) VALUES (12, N'c32c30ea-6c72-47e9-a87b-adb1c9d77ce9', CAST(N'2024-02-19T11:04:36.2983941' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 25, N'Approved', N'Approved', NULL, NULL, CAST(N'2024-02-19T11:05:14.5418018' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'cs_test_a1T7oqrKPG21vuCURt4PYJpBSSBeCyEJZPoFNIUzi4ytsOOi9q6jwBonYH', N'pi_3OlZL7A7Z9pBhoDc1QeavgHW', N'501-354-6524', N'45 Avenue Morgan', N'Gatineau', N'Québec', N'G3B-2C3', N'Paul')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [SessionId], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name]) VALUES (13, N'c32c30ea-6c72-47e9-a87b-adb1c9d77ce9', CAST(N'2024-02-20T07:54:20.3345552' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 40, N'Approved', N'Approved', NULL, NULL, CAST(N'2024-02-20T07:55:20.3540584' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'cs_test_a1T1cj7NUDtnw6qYYtAp1VSBTD51trctjN7N0wKZ7eYv9Vit8LvjKiVqZd', N'pi_3OlsqrA7Z9pBhoDc1lxdOPeZ', N'514-258-3697', N'6354 Rue du moulin', N'Montréal', N'Québec', N'H1V-2T3', N'Paul')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [SessionId], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name]) VALUES (14, N'c0da3a8e-23c4-4d41-b215-283df6b519ba', CAST(N'2024-02-20T16:05:40.6868467' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 215, N'Approved', N'Approved', NULL, NULL, CAST(N'2024-02-20T16:06:34.3502532' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'cs_test_b1GWV0dWHMo7YX1smAlJVIXhuycYE49jwloaZHR2eErYg5XQhc3dEQ5rVK', N'pi_3Om0WFA7Z9pBhoDc1WylHoAU', N'501-354-6524', N'45 Avenue Morgan', N'Gatineau', N'Québec', N'G3B-2C3', N'Test')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [SessionId], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name]) VALUES (15, N'c0da3a8e-23c4-4d41-b215-283df6b519ba', CAST(N'2024-02-21T10:04:45.2549617' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 120, N'Approved', N'Approved', NULL, NULL, CAST(N'2024-02-21T10:05:41.4460135' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'cs_test_b1QwvvZmBct56tsfVW4dcCIoZoEUOMQBzsQtUOUuKNTMPvgrLSb1iVk5D1', N'pi_3OmHMbA7Z9pBhoDc1WrKDlBo', N'501-354-6524', N'45 Avenue Morgan', N'Gatineau', N'Québec', N'G3B-2C3', N'Test')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [SessionId], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name]) VALUES (16, N'c32c30ea-6c72-47e9-a87b-adb1c9d77ce9', CAST(N'2024-02-21T18:09:09.7176343' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 35, N'Approuvé', N'Approuvé', NULL, NULL, CAST(N'2024-02-21T18:10:03.9538619' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'cs_test_a1dFWU2ZxzEKNJUef40Y4pP2TWCHy6G069IiMVtWkcGqtQOuvgiNloN2ya', N'pi_3OmOvMA7Z9pBhoDc1moIN3ZO', N'501-354-6524', N'12 rue du domaine', N'Québec', N'Québec', N'A1B-2C3', N'Paul')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [SessionId], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name]) VALUES (17, N'c32c30ea-6c72-47e9-a87b-adb1c9d77ce9', CAST(N'2024-02-21T18:15:29.0156623' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 35, N'Approuvé', N'Approuvé', NULL, NULL, CAST(N'2024-02-21T18:16:20.9275966' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'cs_test_a1ctfr9rw5iUYUzyls4cfwO40NLGvMNgDR4QIxgcqk0QZr3TOLimAmJMB1', N'pi_3OmP1RA7Z9pBhoDc1qCg3Bon', N'501-354-6524', N'12 rue du domaine', N'Québec', N'Québec', N'A1B-2C3', N'Paul')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [SessionId], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name]) VALUES (18, N'c32c30ea-6c72-47e9-a87b-adb1c9d77ce9', CAST(N'2024-02-21T21:29:53.0028059' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 110, N'Approuvé', N'Approuvé', NULL, NULL, CAST(N'2024-02-21T21:31:14.8878103' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'cs_test_a1DY0cEIHwj77GiUE2DTNpJDAufa8XYjna2Y2TJ9UaCn42d8SD4zMj7U13', N'pi_3OmS43A7Z9pBhoDc1lDF6lg0', N'501-354-6524', N'12 Rue du domaine', N'Montréal', N'Québec', N'A1B-2C3', N'Paul')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [SessionId], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name]) VALUES (19, N'c32c30ea-6c72-47e9-a87b-adb1c9d77ce9', CAST(N'2024-02-22T09:24:51.5233765' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 135, N'Approuvé', N'Approuvé', NULL, NULL, CAST(N'2024-02-22T09:25:59.2600483' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'cs_test_b11JpFHd76gL5UoVTRzAJiMeQB7onAi4RIORYiVa4lELNIsdUOjjR5sxJ0', N'pi_3OmdDiA7Z9pBhoDc1zZmkV8s', N'501-234-5678', N'12 avenue germaine', N'Beauharnois', N'Québec', N'H2G-6L1', N'Paul')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [SessionId], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name]) VALUES (20, N'c0da3a8e-23c4-4d41-b215-283df6b519ba', CAST(N'2024-02-22T10:33:22.5997152' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 195, N'Approuvé', N'Approuvé', NULL, NULL, CAST(N'2024-02-22T10:34:07.3600482' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'cs_test_b1jdvWryscewMcsBqWUODZmykhWfP9o8KtxHSKlZI06yUrKLBuq16zxbAB', N'pi_3OmeHeA7Z9pBhoDc1YL0lSQH', N'501-354-6524', N'12 Rue du domaine', N'Montréal', N'Québec', N'A1B-2C3', N'Test')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [SessionId], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name]) VALUES (21, N'5facd053-abe9-41e3-ab2c-3d5ae0c445a9', CAST(N'2024-02-23T22:37:59.4063767' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 83.985, N'Approuvé', N'Approuvé', NULL, NULL, CAST(N'2024-02-23T22:39:06.2947090' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'cs_test_a1jnWVs8ZWNonHFgKRqYotBhn7mzQYBoj4Xs3ZEScHnOKGkME3sivDw7tn', N'pi_3OnC4pA7Z9pBhoDc13W2dYz3', N'5142083644', N'164 rue principale', N'Saint Thomas', N'Québec', N'J0T3F4', N'Paul Quentin')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [SessionId], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name]) VALUES (22, N'cf767458-e333-46e7-87cb-725bc3555674', CAST(N'2024-02-26T10:21:08.4188076' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 83.985, N'Approuvé', N'Approuvé', NULL, NULL, CAST(N'2024-02-26T10:22:07.9355675' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'cs_test_a19MEYLMARHqustNeoy0HWDVNBc4l5IFXdaANcg8Wuc7OiXcNuhFCaRNBu', N'pi_3Oo60AA7Z9pBhoDc04CqrnOV', N'514-202-2521', N'623 Avenue Germaine', N'Montréal', N'Québec', N'H1G-5R9', N'Kent')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [SessionId], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name]) VALUES (23, N'ae6bf82b-db49-427b-9939-0bd35a398bc7', CAST(N'2024-02-26T11:19:27.4859708' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 49.4925, N'Approuvé', N'Approuvé', NULL, NULL, CAST(N'2024-02-26T11:19:51.5832853' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'cs_test_a1FKP3VEpoy6SZEZdvhHAsCHw3SwFarCnNOGFASTGqzA5wnVlqgB1yIbG9', N'pi_3Oo6u2A7Z9pBhoDc1ZgM61rc', N'514-202-2521', N'623 Avenue Germaine', N'Montréal', N'Québec', N'H1G-5R9', N'Admin')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [SessionId], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name]) VALUES (24, N'55697332-cd42-43c9-8640-f880f282a702', CAST(N'2024-02-29T20:13:18.0489532' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 110, N'En attente', N'En attente', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'cs_test_b1wLigPKx94MohG1Ln0HzVWdC2EScpDuWGI4AON8zQRzeNeeVm4aZnGdl7', NULL, N'5142083644', N'325 Boulevard de la Côte-Vertu, 10', N'Montréal', N'QC', N'H4N 1E4', N'The Perfect Gift')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [SessionId], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name]) VALUES (25, N'55697332-cd42-43c9-8640-f880f282a702', CAST(N'2024-02-29T20:13:47.1469509' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 110, N'Approuvé', N'Approuvé', NULL, NULL, CAST(N'2024-02-29T20:14:59.3523425' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'cs_test_b1oj5FvoxVyxlNpXRj6kmqWqqnlVea0vLECrvHBceoMkbcNyaBwAGVmDbx', N'pi_3OpKgeA7Z9pBhoDc0fOMkzF1', N'5142083644', N'164 rue principale', N'Saint Louis de Gonzague', N'Québec', N'J0S1T0', N'Paul Quentin')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShippingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [SessionId], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name]) VALUES (26, N'ae6bf82b-db49-427b-9939-0bd35a398bc7', CAST(N'2024-02-29T21:59:52.1752870' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 125, N'Approuvé', N'Approuvé', NULL, NULL, CAST(N'2024-02-29T22:01:07.1232405' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'cs_test_b11IH6m1MsZsR7F0zi9mw5wsTvSsV5saWDAtLKI02r7whMbOyii8WXYLhP', N'pi_3OpMLLA7Z9pBhoDc0s63tHco', N'5141234567', N'164 Avenue Germaine', N'Saint Thomas', N'Québec', N'J0T-2G3', N'Admin')
SET IDENTITY_INSERT [dbo].[OrderHeaders] OFF
GO
SET IDENTITY_INSERT [dbo].[Produits] ON 

INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (1, N'Éclat de Vénus Anti-Vergetures', 1, N'Un savon conçu pour atténuer les vergetures et améliorer la douceur de la peau.', 20.0000, CAST(9 AS Decimal(18, 0)), 1, N'vergeture.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (2, N'Charbon Purifiant Zen', 1, N'Savon anti-acné à base de charbon actif pour une peau nette et saine.', 20.0000, CAST(8 AS Decimal(18, 0)), 1, N'acne.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (3, N'Harmonie Moka', 1, N'Savon teint marron pour unifier et illuminer naturellement la peau.', 50.0000, CAST(7 AS Decimal(18, 0)), 1, N'marron.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (4, N'Mirage Doré', 1, N'Savon enrichi de particules dorées pour une peau radieuse et nourrie.', 60.0000, CAST(5 AS Decimal(18, 0)), 1, N'Gold.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (5, N'Exfoli''Gel Éclat', 1, N'Gel douche exfoliant pour une peau lisse et revitalisée.', 40.0000, CAST(9 AS Decimal(18, 0)), 1, N'Gel.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (6, N'Lumi-Curcuma ', 2, N'Lait de beauté infusé au curcuma pour une peau éclatante et protégée.', 30.0000, CAST(6 AS Decimal(18, 0)), 1, N'curcuma.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (7, N'Crème Céleste Ultra-Clarté', 2, N'Crème de visage pour un teint super clair, lumineux et uniforme.', 30.0000, CAST(6 AS Decimal(18, 0)), 1, N'Creme.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (8, N'Élixir Gold Éclaircissant', 2, N'Lait corporel luxueux pour un éclaircissement homogène et délicat.', 65.0000, CAST(10 AS Decimal(18, 0)), 1, N'Lait_gold.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (9, N'Colla''Rich Nourrissant', 2, N'Lait enrichi en collagène pour une peau ferme, hydratée et régénérée.', 50.0000, CAST(9 AS Decimal(18, 0)), 1, N'Lait.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (10, N'AquaQuintessence', 3, N'Lotion hydratante pour un soin de la peau profond et revitalisant.', 40.0000, CAST(10 AS Decimal(18, 0)), 1, N'quintos.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (11, N'Lumière Pure', 3, N'Lotion pour un teint clair et lumineux, enrichie d''agents naturels.', 35.0000, CAST(8 AS Decimal(18, 0)), 1, N'super.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (12, N'Sérum Blanc Intense', 3, N'Sérum booster blanchissant pour un effet éclaircissant rapide.', 50.0000, CAST(6 AS Decimal(18, 0)), 1, N'Serum.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (13, N'Voile Lumière Éclaircissant', 3, N'Lotion légère pour un éclaircissement progressif et naturel de la peau.', 40.0000, CAST(5 AS Decimal(18, 0)), 1, N'Lotion_eclair.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (14, N'DreadLocs courte noir', 4, N'DreadLocs courtes et stylées, faciles à entretenir et parfaites pour un look moderne.', 40.0000, CAST(9 AS Decimal(18, 0)), 1, N'DreadLocs_courte_noir.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (15, N'DreadLocs courte marron ', 4, N'DreadLocs courtes et stylées, faciles à entretenir et parfaites pour un look moderne.', 40.0000, CAST(9 AS Decimal(18, 0)), 1, N'DreadLocs_courte _marron.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (16, N'DreadLocs courte  or', 4, N'DreadLocs courtes et stylées, faciles à entretenir et parfaites pour un look moderne.', 40.0000, CAST(10 AS Decimal(18, 0)), 1, N'DreadLocs_courte _or.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (17, N'Dreadlocs crochet noir', 4, N'Dreadlocs au crochet, offrant un style naturel et une facilité de coiffage.', 55.0000, CAST(8 AS Decimal(18, 0)), 1, N'Dreadlocs_crochet_noir.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (18, N'Dreadlocs crochet marron', 4, N'Dreadlocs au crochet, offrant un style naturel et une facilité de coiffage.', 55.0000, CAST(10 AS Decimal(18, 0)), 1, N'Dreadlocs_crochet_marron.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (19, N'Dreadlocs crochet or', 4, N'Dreadlocs au crochet, offrant un style naturel et une facilité de coiffage.', 55.0000, CAST(10 AS Decimal(18, 0)), 1, N'Dreadlocs_crochet_or.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (20, N'Dreadlocs crochet argent', 4, N'Dreadlocs au crochet, offrant un style naturel et une facilité de coiffage.', 55.0000, CAST(10 AS Decimal(18, 0)), 1, N'Dreadlocs_crochet_argent.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (21, N'Butterfly locs noir', 4, N'Butterfly locs, mèches versatiles pour un look unique et tendance.', 45.0000, CAST(10 AS Decimal(18, 0)), 1, N'Butterfly_locs_noir.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (22, N'Butterfly locs marron', 4, N'Butterfly locs, mèches versatiles pour un look unique et tendance.', 45.0000, CAST(10 AS Decimal(18, 0)), 1, N'Butterfly_locs_marron.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (23, N'Butterfly locs or', 4, N'Butterfly locs, mèches versatiles pour un look unique et tendance.', 45.0000, CAST(10 AS Decimal(18, 0)), 1, N'Butterfly_locs_or.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (24, N'Butterfly locs argent', 4, N'Butterfly locs, mèches versatiles pour un look unique et tendance.', 45.0000, CAST(10 AS Decimal(18, 0)), 1, N'Butterfly_locs_argent.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (25, N'Goddess locs noir', 4, N'Goddess locs, combinant élégance et style, idéales pour une coiffure sophistiquée.', 55.0000, CAST(10 AS Decimal(18, 0)), 1, N'Goddess_locs_noir.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (26, N'Goddess locs marron', 4, N'Goddess locs, combinant élégance et style, idéales pour une coiffure sophistiquée.', 55.0000, CAST(10 AS Decimal(18, 0)), 1, N'Goddess_locs_marron.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (27, N'Goddess locs or', 4, N'Goddess locs, combinant élégance et style, idéales pour une coiffure sophistiquée.', 55.0000, CAST(10 AS Decimal(18, 0)), 1, N'Goddess_locs_or.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (28, N'Goddess locs argent', 4, N'Goddess locs, combinant élégance et style, idéales pour une coiffure sophistiquée.', 55.0000, CAST(10 AS Decimal(18, 0)), 1, N'Goddess_locs_argent.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (32, N'DreadLocs_courte _Bordeau', 4, N'DreadLocs courtes et stylées, faciles à entretenir et parfaites pour un look moderne.', 40.0000, CAST(10 AS Decimal(18, 0)), 1, N'DreadLocs_courte _bordeau.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (33, N'Dreadlocs crochet bordeau', 4, N'Dreadlocs au crochet, offrant un style naturel et une facilité de coiffage.', 40.0000, CAST(10 AS Decimal(18, 0)), 1, N'Dreadlocs_crochet_bordeau.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (40, N'Baume à Lèvres Karité et Vanille', 13, N'Offrez à vos lèvres une expérience luxueuse avec notre baume à lèvres enrichi en beurre de karité nourrissant et l''arôme doux et apaisant de la vanille.', 25.0000, CAST(10 AS Decimal(18, 0)), 1, N'Karite_Vanille.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (41, N'Baume à Lèvres Ananas et Coco', 13, N'Laissez-vous transporter vers une oasis tropicale avec notre baume à lèvres à l''ananas rafraîchissant et à la noix de coco exotique.', 25.0000, CAST(6 AS Decimal(18, 0)), 1, N'Ananas_Coco.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (42, N'Baume à Lèvres Fraise et Macadamia', 13, N'Offrez à vos lèvres une délicieuse touche de fraîcheur et de douceur avec notre baume à la fraise et à la macadamia. ', 25.0000, CAST(10 AS Decimal(18, 0)), 1, N'Fraise_Macadamia.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (44, N'maquillage', 13, N'Le maquillage', 15.0000, CAST(4 AS Decimal(18, 0)), 1, N'5b28a3b4-af43-4155-bcab-f2a8d7a56c02_natural-cosmetics-4528588_640.jpg')
SET IDENTITY_INSERT [dbo].[Produits] OFF
GO
SET IDENTITY_INSERT [dbo].[ShoppingCarts] ON 

INSERT [dbo].[ShoppingCarts] ([Id], [ProduitId], [Count], [ApplicationUserId]) VALUES (25, 13, 2, N'c0da3a8e-23c4-4d41-b215-283df6b519ba')
INSERT [dbo].[ShoppingCarts] ([Id], [ProduitId], [Count], [ApplicationUserId]) VALUES (26, 14, 2, N'c0da3a8e-23c4-4d41-b215-283df6b519ba')
INSERT [dbo].[ShoppingCarts] ([Id], [ProduitId], [Count], [ApplicationUserId]) VALUES (30, 4, 2, N'cf767458-e333-46e7-87cb-725bc3555674')
INSERT [dbo].[ShoppingCarts] ([Id], [ProduitId], [Count], [ApplicationUserId]) VALUES (31, 12, 2, N'cf767458-e333-46e7-87cb-725bc3555674')
INSERT [dbo].[ShoppingCarts] ([Id], [ProduitId], [Count], [ApplicationUserId]) VALUES (36, 3, 1, N'cf767458-e333-46e7-87cb-725bc3555674')
INSERT [dbo].[ShoppingCarts] ([Id], [ProduitId], [Count], [ApplicationUserId]) VALUES (37, 1, 1, N'cf767458-e333-46e7-87cb-725bc3555674')
SET IDENTITY_INSERT [dbo].[ShoppingCarts] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 2024-03-01 06:28:55 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2024-03-01 06:28:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 2024-03-01 06:28:55 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 2024-03-01 06:28:55 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 2024-03-01 06:28:55 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 2024-03-01 06:28:55 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 2024-03-01 06:28:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Avis]  WITH CHECK ADD  CONSTRAINT [FK_Avis_AspNetUsers] FOREIGN KEY([AspNetUserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Avis] CHECK CONSTRAINT [FK_Avis_AspNetUsers]
GO
ALTER TABLE [dbo].[Avis]  WITH CHECK ADD  CONSTRAINT [FK_Avis_Produits] FOREIGN KEY([ProduitID])
REFERENCES [dbo].[Produits] ([ProduitID])
GO
ALTER TABLE [dbo].[Avis] CHECK CONSTRAINT [FK_Avis_Produits]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_OrderHeaders] FOREIGN KEY([OrderHeaderId])
REFERENCES [dbo].[OrderHeaders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_OrderHeaders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Produits] FOREIGN KEY([ProduitId])
REFERENCES [dbo].[Produits] ([ProduitID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Produits]
GO
ALTER TABLE [dbo].[OrderHeaders]  WITH CHECK ADD  CONSTRAINT [FK_OrderHeaders_AspNetUsers] FOREIGN KEY([ApplicationUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[OrderHeaders] CHECK CONSTRAINT [FK_OrderHeaders_AspNetUsers]
GO
ALTER TABLE [dbo].[Produits]  WITH CHECK ADD  CONSTRAINT [FK_Produits_Categories] FOREIGN KEY([CategorieID])
REFERENCES [dbo].[Categories] ([CategorieID])
GO
ALTER TABLE [dbo].[Produits] CHECK CONSTRAINT [FK_Produits_Categories]
GO
USE [master]
GO
ALTER DATABASE [Cosmechics] SET  READ_WRITE 
GO
