USE [master]
GO
/****** Object:  Database [Cosmechic]    Script Date: 2024-02-09 16:42:56 ******/
CREATE DATABASE [Cosmechic]
GO
ALTER DATABASE [Cosmechic] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cosmechic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cosmechic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cosmechic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cosmechic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cosmechic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cosmechic] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cosmechic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cosmechic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cosmechic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cosmechic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cosmechic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cosmechic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cosmechic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cosmechic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cosmechic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cosmechic] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cosmechic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cosmechic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cosmechic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cosmechic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cosmechic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cosmechic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cosmechic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cosmechic] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Cosmechic] SET  MULTI_USER 
GO
ALTER DATABASE [Cosmechic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cosmechic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cosmechic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cosmechic] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cosmechic] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Cosmechic] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Cosmechic] SET QUERY_STORE = ON
GO
ALTER DATABASE [Cosmechic] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Cosmechic]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2024-02-09 16:42:56 ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 2024-02-09 16:42:57 ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2024-02-09 16:42:57 ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2024-02-09 16:42:57 ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2024-02-09 16:42:57 ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2024-02-09 16:42:57 ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2024-02-09 16:42:57 ******/
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
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 2024-02-09 16:42:57 ******/
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
/****** Object:  Table [dbo].[Avis]    Script Date: 2024-02-09 16:42:57 ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 2024-02-09 16:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategorieID] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [nchar](450) NOT NULL,
	[Description] [nchar](450) NULL,
	[Image] [nchar](450) NOT NULL,
	[Disponible] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategorieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commades]    Script Date: 2024-02-09 16:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commades](
	[CommandeID] [int] IDENTITY(1,1) NOT NULL,
	[AspNetUserID] [nvarchar](450) NOT NULL,
	[DateCommande] [datetime] NOT NULL,
	[AdresseLivraison] [nvarchar](450) NOT NULL,
	[StatutCommande] [nvarchar](450) NOT NULL,
	[FraisLivraison] [float] NOT NULL,
	[Taxes] [float] NOT NULL,
	[Total] [float] NOT NULL,
 CONSTRAINT [PK_Commades] PRIMARY KEY CLUSTERED 
(
	[CommandeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paiement]    Script Date: 2024-02-09 16:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paiement](
	[PaiementID] [int] NOT NULL,
	[CommandeID] [int] NOT NULL,
	[AspNetUserID] [nvarchar](450) NOT NULL,
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[Montant] [float] NOT NULL,
	[DatePaiement] [datetime] NOT NULL,
	[ModePaiement] [nvarchar](450) NOT NULL,
	[StatutPaiement] [nvarchar](450) NOT NULL,
	[DetailsCarte] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Paiement] PRIMARY KEY CLUSTERED 
(
	[PaiementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Panier]    Script Date: 2024-02-09 16:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Panier](
	[PanierID] [int] IDENTITY(1,1) NOT NULL,
	[AspNetUserID] [nvarchar](450) NOT NULL,
	[StatutPanier] [nvarchar](450) NOT NULL,
	[DateCreationPanier] [datetime] NOT NULL,
	[DateModificationPanier] [datetime] NOT NULL,
 CONSTRAINT [PK_Panier] PRIMARY KEY CLUSTERED 
(
	[PanierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PanierItems]    Script Date: 2024-02-09 16:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PanierItems](
	[PanierItemID] [int] NOT NULL,
	[PanierID] [int] NOT NULL,
	[ProduitID] [int] IDENTITY(1,1) NOT NULL,
	[Quantite] [int] NOT NULL,
	[PrixUnitaire] [float] NOT NULL,
	[Image] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_PanierItems] PRIMARY KEY CLUSTERED 
(
	[PanierItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produits]    Script Date: 2024-02-09 16:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produits](
	[ProduitID] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [nvarchar](450) NOT NULL,
	[CategorieID] [int] NOT NULL,
	[Description] [nvarchar](450) NULL,
	[Prix] [money] NOT NULL,
	[Stock] [decimal](18, 0) NOT NULL,
	[Disponible] [bit] NOT NULL,
	[Image] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[ProduitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'7.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240130195451_Commandes', N'7.0.15')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1', N'Admin', N'ADMIN', N'ADMIN')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2', N'Utilisateurs', N'UTILISATEURS', N'UTILISATEURS')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fea37857-1fd3-4dd5-bd8c-de83a07a9f6d', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3387936f-7cba-4efd-ac5e-dba993a6d016', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'450935d9-35db-48e8-94a6-a15e5dd5e94c', N'2')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3387936f-7cba-4efd-ac5e-dba993a6d016', N'Jordan', NULL, N'Jordan@jordan.ca', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'450935d9-35db-48e8-94a6-a15e5dd5e94c', N'paul', NULL, N'paul@paul.ca', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'cf7b247a-4cb9-40bd-a650-db3170183858', N'test', N'TEST', N'test@test.ca', N'TEST@TEST.CA', 1, N'AQAAAAIAAYagAAAAEOYOukr70vib9NbeXTyJtm7aU93i24sJPl17FtbBDYlhlUaw6lXI7pXe0u4zjLsJWw==', N'PLWBLOJRLBU2KE4QC5P3F2KI64PYXA24', N'd13dc2c8-c27c-40ad-9d30-70acaed90b4b', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'fea37857-1fd3-4dd5-bd8c-de83a07a9f6d', N'Admin', N'ADMIN', N'Admin@admin.ca', N'ADMIN@ADMIN.CA', 1, N'AQAAAAIAAYagAAAAEPIDW3sDVrYNj+WD5uZUuxO5vp7+48RVoyAR5++FkJvAi8YQivjBO4cYdgHoCq11ug==', N'LVAHWUM4EOTN4VATRLTPFFI4SPDITRBG', N'b2b3a356-8183-4539-aa43-d390a9f2a250', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategorieID], [Nom], [Description], [Image], [Disponible]) VALUES (1, N'Savon                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', N'Découvrez notre gamme de savons naturels, fabriqués à la main avec des ingrédients biologiques et respectueux de l''''environnement. Nos savons sont enrichis en huiles essentielles et extraits de plantes pour nettoyer, hydrater et revitaliser votre peau. Parfaits pour tous les types de peau, ils laissent une sensation de fraîcheur et un parfum délicat.                                                                                                  ', N'Savon.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', 1)
INSERT [dbo].[Categories] ([CategorieID], [Nom], [Description], [Image], [Disponible]) VALUES (2, N'Lait de beauté                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', N'Explorez notre sélection d''''huiles naturelles pour une peau et des cheveux sublimés. Nos huiles sont extraites de sources durables et sont idéales pour une hydratation profonde, la réparation des cheveux abîmés et l''''amélioration de l''''éclat de la peau. Utilisées seules ou incorporées dans votre routine de soins, elles apportent nutrition et protection.                                                                                               ', N'Huile.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', 1)
INSERT [dbo].[Categories] ([CategorieID], [Nom], [Description], [Image], [Disponible]) VALUES (3, N'Lotion                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Offrez à votre peau le soin qu''''elle mérite avec nos lotions corporelles enrichies. Conçues pour pénétrer en profondeur et hydrater intensément, nos lotions laissent votre peau douce, lisse et visiblement saine. Elles sont formulées avec des ingrédients naturels pour convenir à tous les types de peau, y compris les peaux sensibles.                                                                                                                     ', N'Lotion.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', 1)
INSERT [dbo].[Categories] ([CategorieID], [Nom], [Description], [Image], [Disponible]) VALUES (4, N'Mèche                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', N'Sublimez vos dreadlocks avec notre collection de mèches afro de qualité supérieure. Conçues pour se fondre naturellement avec vos cheveux, nos mèches offrent un look authentique et durable. Elles sont faciles à entretenir et résistantes, idéales pour ceux qui souhaitent adopter un style dreadlocks sans compromis sur la qualité et l''''aspect naturel.                                                                                                    ', N'Meche.png                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', 1)
INSERT [dbo].[Categories] ([CategorieID], [Nom], [Description], [Image], [Disponible]) VALUES (5, N'Maquillage                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', N'Le maquillage est un outil que les femme utilise pour se faire belle                                                                                                                                                                                                                                                                                                                                                                                              ', N'Maquillage.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 1)
INSERT [dbo].[Categories] ([CategorieID], [Nom], [Description], [Image], [Disponible]) VALUES (8, N'Rouge à lèvres                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', N'le rouge à lèvre                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', N'Levre.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', 1)
INSERT [dbo].[Categories] ([CategorieID], [Nom], [Description], [Image], [Disponible]) VALUES (9, N'gants                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', N'Le gant est un outil que l''on utilise pour se frotter le corps lors du bain                                                                                                                                                                                                                                                                                                                                                                                       ', N'Gants.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', 1)
INSERT [dbo].[Categories] ([CategorieID], [Nom], [Description], [Image], [Disponible]) VALUES (10, N'poudre                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'La poudre est un produit                                                                                                                                                                                                                                                                                                                                                                                                                                          ', N'8ca6bdd6-fe05-4bd9-afac-8d280e93f11e_istockphoto-1270972338-612x612.jpg                                                                                                                                                                                                                                                                                                                                                                                           ', 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Panier] ON 

INSERT [dbo].[Panier] ([PanierID], [AspNetUserID], [StatutPanier], [DateCreationPanier], [DateModificationPanier]) VALUES (1, N'cf7b247a-4cb9-40bd-a650-db3170183858', N'0', CAST(N'2024-02-09T12:38:11.183' AS DateTime), CAST(N'2024-02-09T12:38:11.183' AS DateTime))
SET IDENTITY_INSERT [dbo].[Panier] OFF
GO
SET IDENTITY_INSERT [dbo].[Produits] ON 

INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (1, N'Éclat de Vénus Anti-Vergetures', 1, N'Un savon conçu pour atténuer les vergetures et améliorer la douceur de la peau.', 20.0000, CAST(10 AS Decimal(18, 0)), 1, N'vergeture.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (2, N'Charbon Purifiant Zen', 1, N'Savon anti-acné à base de charbon actif pour une peau nette et saine.', 20.0000, CAST(10 AS Decimal(18, 0)), 1, N'acne.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (3, N'Harmonie Moka', 1, N'Savon teint marron pour unifier et illuminer naturellement la peau.', 50.0000, CAST(10 AS Decimal(18, 0)), 1, N'marron.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (4, N'Mirage Doré', 1, N'Savon enrichi de particules dorées pour une peau radieuse et nourrie.', 60.0000, CAST(10 AS Decimal(18, 0)), 1, N'gold.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (5, N'Exfoli''Gel Éclat', 1, N'Gel douche exfoliant pour une peau lisse et revitalisée.', 40.0000, CAST(10 AS Decimal(18, 0)), 1, N'Gel.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (6, N'Lumi-Curcuma ', 2, N'Lait de beauté infusé au curcuma pour une peau éclatante et protégée.', 30.0000, CAST(10 AS Decimal(18, 0)), 1, N'curcuma.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (7, N'Crème Céleste Ultra-Clarté', 2, N'Crème de visage pour un teint super clair, lumineux et uniforme.', 30.0000, CAST(10 AS Decimal(18, 0)), 1, N'Creme.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (8, N'Élixir Gold Éclaircissant', 2, N'Lait corporel luxueux pour un éclaircissement homogène et délicat.', 65.0000, CAST(10 AS Decimal(18, 0)), 1, N'Lait_gold.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (9, N'Colla''Rich Nourrissant', 2, N'Lait enrichi en collagène pour une peau ferme, hydratée et régénérée.', 50.0000, CAST(10 AS Decimal(18, 0)), 1, N'Lait.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (10, N'AquaQuintessence', 3, N'Lotion hydratante pour un soin de la peau profond et revitalisant.', 40.0000, CAST(10 AS Decimal(18, 0)), 1, N'quintos.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (11, N'Lumière Pure', 3, N'Lotion pour un teint clair et lumineux, enrichie d''agents naturels.', 35.0000, CAST(10 AS Decimal(18, 0)), 1, N'super.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (12, N'Sérum Blanc Intense', 3, N'Sérum booster blanchissant pour un effet éclaircissant rapide.', 50.0000, CAST(10 AS Decimal(18, 0)), 1, N'Serum.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (13, N'Voile Lumière Éclaircissant', 3, N'Lotion légère pour un éclaircissement progressif et naturel de la peau.', 40.0000, CAST(10 AS Decimal(18, 0)), 1, N'Lotion_eclair.jpg')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (14, N'DreadLocs courte noir', 4, N'DreadLocs courtes et stylées, faciles à entretenir et parfaites pour un look moderne.', 40.0000, CAST(10 AS Decimal(18, 0)), 1, N'DreadLocs_courte_noir.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (15, N'DreadLocs courte marron ', 4, N'DreadLocs courtes et stylées, faciles à entretenir et parfaites pour un look moderne.', 40.0000, CAST(10 AS Decimal(18, 0)), 1, N'DreadLocs_courte _marron.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (16, N'DreadLocs courte  or', 4, N'DreadLocs courtes et stylées, faciles à entretenir et parfaites pour un look moderne.', 40.0000, CAST(10 AS Decimal(18, 0)), 1, N'DreadLocs_courte _or.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (17, N'Dreadlocs crochet noir', 4, N'Dreadlocs au crochet, offrant un style naturel et une facilité de coiffage.', 55.0000, CAST(10 AS Decimal(18, 0)), 1, N'Dreadlocs_crochet_noir.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (18, N'Dreadlocs crochet marron', 4, N'Dreadlocs au crochet, offrant un style naturel et une facilité de coiffage.', 55.0000, CAST(10 AS Decimal(18, 0)), 1, N'Dreadlocs_crochet_marron.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (19, N'Dreadlocs crochet or', 4, N'Dreadlocs au crochet, offrant un style naturel et une facilité de coiffage.', 55.0000, CAST(10 AS Decimal(18, 0)), 1, N'Dreadlocs_crochet_or.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (20, N'Dreadlocs crochet argent', 4, N'Dreadlocs au crochet, offrant un style naturel et une facilité de coiffage.', 55.0000, CAST(10 AS Decimal(18, 0)), 1, N'Dreadlocs_crochet_argent.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (21, N'Butterfly locs noir', 4, N'Butterfly locs, mèches versatiles pour un look unique et tendance.', 45.0000, CAST(10 AS Decimal(18, 0)), 1, N'Butterfly_locs_noir.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (22, N'Butterfly locs marron', 4, N'Butterfly locs, mèches versatiles pour un look unique et tendance.', 45.0000, CAST(10 AS Decimal(18, 0)), 1, N'Butterfly_locs_marron.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (23, N'Butterfly locs or', 4, N'Butterfly locs, mèches versatiles pour un look unique et tendance.', 45.0000, CAST(10 AS Decimal(18, 0)), 1, N'Butterfly_locs_or.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (24, N'Butterfly locs argent', 4, N'Butterfly locs, mèches versatiles pour un look unique et tendance.', 45.0000, CAST(10 AS Decimal(18, 0)), 1, N'Butterfly_locs_argent.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (25, N'Goddess locs noir', 4, N'Goddess locs, combinant élégance et style, idéales pour une coiffure sophistiquée.', 55.0000, CAST(10 AS Decimal(18, 0)), 1, N'Goddess_locs_noir.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (26, N'Goddess locs marron', 4, N'Goddess locs, combinant élégance et style, idéales pour une coiffure sophistiquée.', 55.0000, CAST(10 AS Decimal(18, 0)), 1, N'Goddess_locs_marron.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (27, N'Goddess locs or', 4, N'Goddess locs, combinant élégance et style, idéales pour une coiffure sophistiquée.', 55.0000, CAST(10 AS Decimal(18, 0)), 1, N'Goddess_locs_or.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (28, N'Goddess locs argent', 4, N'Goddess locs, combinant élégance et style, idéales pour une coiffure sophistiquée.', 55.0000, CAST(10 AS Decimal(18, 0)), 1, N'Goddess-locs_argent.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (29, N'Vernis', 4, N'le vernis', 25.0000, CAST(5 AS Decimal(18, 0)), 1, N'vernis.png')
INSERT [dbo].[Produits] ([ProduitID], [Nom], [CategorieID], [Description], [Prix], [Stock], [Disponible], [Image]) VALUES (30, N'Thas', 1, N'ytyieksrkute redirection', 200.0000, CAST(3 AS Decimal(18, 0)), 1, N'maquillage.png')
SET IDENTITY_INSERT [dbo].[Produits] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 2024-02-09 16:43:12 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2024-02-09 16:43:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 2024-02-09 16:43:12 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 2024-02-09 16:43:12 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 2024-02-09 16:43:12 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 2024-02-09 16:43:12 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 2024-02-09 16:43:12 ******/
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
ALTER TABLE [dbo].[Avis]  WITH CHECK ADD  CONSTRAINT [FK_Avis_Paiement] FOREIGN KEY([PaiementID])
REFERENCES [dbo].[Paiement] ([PaiementID])
GO
ALTER TABLE [dbo].[Avis] CHECK CONSTRAINT [FK_Avis_Paiement]
GO
ALTER TABLE [dbo].[Avis]  WITH CHECK ADD  CONSTRAINT [FK_Avis_Produits] FOREIGN KEY([ProduitID])
REFERENCES [dbo].[Produits] ([ProduitID])
GO
ALTER TABLE [dbo].[Avis] CHECK CONSTRAINT [FK_Avis_Produits]
GO
ALTER TABLE [dbo].[Commades]  WITH CHECK ADD  CONSTRAINT [FK_Commades_AspNetUsers] FOREIGN KEY([AspNetUserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Commades] CHECK CONSTRAINT [FK_Commades_AspNetUsers]
GO
ALTER TABLE [dbo].[Paiement]  WITH CHECK ADD  CONSTRAINT [FK_Paiement_AspNetUsers] FOREIGN KEY([AspNetUserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Paiement] CHECK CONSTRAINT [FK_Paiement_AspNetUsers]
GO
ALTER TABLE [dbo].[Paiement]  WITH CHECK ADD  CONSTRAINT [FK_Paiement_Commades] FOREIGN KEY([CommandeID])
REFERENCES [dbo].[Commades] ([CommandeID])
GO
ALTER TABLE [dbo].[Paiement] CHECK CONSTRAINT [FK_Paiement_Commades]
GO
ALTER TABLE [dbo].[Panier]  WITH CHECK ADD  CONSTRAINT [FK_Panier_AspNetUsers] FOREIGN KEY([AspNetUserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Panier] CHECK CONSTRAINT [FK_Panier_AspNetUsers]
GO
ALTER TABLE [dbo].[PanierItems]  WITH CHECK ADD  CONSTRAINT [FK_PanierItems_Panier] FOREIGN KEY([PanierID])
REFERENCES [dbo].[Panier] ([PanierID])
GO
ALTER TABLE [dbo].[PanierItems] CHECK CONSTRAINT [FK_PanierItems_Panier]
GO
ALTER TABLE [dbo].[PanierItems]  WITH CHECK ADD  CONSTRAINT [FK_PanierItems_Produits] FOREIGN KEY([ProduitID])
REFERENCES [dbo].[Produits] ([ProduitID])
GO
ALTER TABLE [dbo].[PanierItems] CHECK CONSTRAINT [FK_PanierItems_Produits]
GO
ALTER TABLE [dbo].[Produits]  WITH CHECK ADD  CONSTRAINT [FK_Produits_Categories] FOREIGN KEY([CategorieID])
REFERENCES [dbo].[Categories] ([CategorieID])
GO
ALTER TABLE [dbo].[Produits] CHECK CONSTRAINT [FK_Produits_Categories]
GO
USE [master]
GO
ALTER DATABASE [Cosmechic] SET  READ_WRITE 
GO
