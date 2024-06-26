USE [master]
GO
/****** Object:  Database [beagles_app]    Script Date: 4/22/2024 8:37:27 AM ******/
CREATE DATABASE [beagles_app]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'beagles_app', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\beagles_app.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'beagles_app_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\beagles_app_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [beagles_app] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [beagles_app].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [beagles_app] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [beagles_app] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [beagles_app] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [beagles_app] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [beagles_app] SET ARITHABORT OFF 
GO
ALTER DATABASE [beagles_app] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [beagles_app] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [beagles_app] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [beagles_app] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [beagles_app] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [beagles_app] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [beagles_app] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [beagles_app] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [beagles_app] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [beagles_app] SET  DISABLE_BROKER 
GO
ALTER DATABASE [beagles_app] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [beagles_app] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [beagles_app] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [beagles_app] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [beagles_app] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [beagles_app] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [beagles_app] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [beagles_app] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [beagles_app] SET  MULTI_USER 
GO
ALTER DATABASE [beagles_app] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [beagles_app] SET DB_CHAINING OFF 
GO
ALTER DATABASE [beagles_app] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [beagles_app] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [beagles_app] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [beagles_app] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [beagles_app] SET QUERY_STORE = ON
GO
ALTER DATABASE [beagles_app] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [beagles_app]
GO
/****** Object:  Table [dbo].[Animal]    Script Date: 4/22/2024 8:37:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Weight] [decimal](6, 3) NOT NULL,
	[Age] [smallint] NOT NULL,
	[Acquired] [datetime] NOT NULL,
	[BirthDate] [datetime] NULL,
	[Verified] [bit] NULL,
 CONSTRAINT [PK_Animal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnimalBreed]    Script Date: 4/22/2024 8:37:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimalBreed](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BreedID] [int] NOT NULL,
	[AnimalID] [int] NOT NULL,
 CONSTRAINT [PK_AnimalBreed] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnimalType]    Script Date: 4/22/2024 8:37:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimalType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Animal] [varchar](20) NOT NULL,
 CONSTRAINT [PK_AnimalType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Breed]    Script Date: 4/22/2024 8:37:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Breed](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Breed] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Owner]    Script Date: 4/22/2024 8:37:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owner](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[Phone] [varchar](10) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[City] [varchar](100) NOT NULL,
	[State] [varchar](2) NOT NULL,
 CONSTRAINT [PK_Owner] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vet]    Script Date: 4/22/2024 8:37:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Business] [varchar](50) NOT NULL,
	[VetName] [varchar](50) NOT NULL,
	[Street] [varchar](100) NOT NULL,
	[Street2] [varchar](100) NULL,
	[City] [varchar](25) NOT NULL,
	[State] [varchar](2) NOT NULL,
	[PostalCode] [varchar](10) NOT NULL,
	[Phone] [varchar](10) NOT NULL,
	[Email] [varchar](40) NOT NULL,
	[Validated] [bit] NOT NULL,
 CONSTRAINT [PK_Vet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AnimalType] ON 

INSERT [dbo].[AnimalType] ([ID], [Animal]) VALUES (1, N'Cat')
INSERT [dbo].[AnimalType] ([ID], [Animal]) VALUES (2, N'Dog')
SET IDENTITY_INSERT [dbo].[AnimalType] OFF
GO
SET IDENTITY_INSERT [dbo].[Breed] ON 

INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (1, 2, N'German Shepherd Dog')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (2, 2, N'Alaskan Malamute')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (3, 2, N'Akita')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (4, 2, N'Anatolian Sheepdog')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (5, 2, N'Bernese Mountain Dog')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (6, 2, N'Bloodhound')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (7, 2, N'Borzoi')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (8, 2, N'Bullmastiff')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (9, 2, N'Great Dane')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (10, 2, N'Great Pyrenees')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (11, 2, N'Great Swiss Mountain Dog')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (12, 2, N'Irish Wolfhound')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (13, 2, N'Kuvasz')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (14, 2, N'Mastiff')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (15, 2, N'Neopolitan Mastiff')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (16, 2, N'Newfoundland')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (17, 2, N'Otter Hound')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (18, 2, N'Rottweiler')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (19, 2, N'Saint Bernard')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (20, 2, N'Afghan Hound')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (21, 2, N'American Foxhound')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (22, 2, N'Beauceron')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (23, 2, N'Belgian Malinois')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (24, 2, N'Belgian Sheepdog')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (25, 2, N'Belgian Tervuren')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (26, 2, N'Black And Tan Coonhound')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (27, 2, N'Black Russian Terrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (28, 2, N'Bouvier Des Flandres')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (29, 2, N'Boxer')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (30, 2, N'Briard')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (31, 2, N'Chesapeake Bay Retriever')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (32, 2, N'Clumber Spaniel')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (33, 2, N'Collie (Rough) & (Smooth)')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (34, 2, N'Curly Coated Retriever')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (35, 2, N'Doberman Pinscher')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (36, 2, N'English Foxhound')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (37, 2, N'English Setter')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (38, 2, N'German Shorthaired Pointer')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (39, 2, N'German Wirehaired Pointer')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (40, 2, N'Giant Schnauzer')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (41, 2, N'Golden Retriever')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (42, 2, N'Gordon Setter')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (43, 2, N'Greyhound')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (44, 2, N'Irish Setter')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (45, 2, N'Komondor')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (46, 2, N'Labrador Retriever')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (47, 2, N'Old English Sheepdog (Bobtail)')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (48, 2, N'Poodle Standard')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (49, 2, N'Rhodesian Ridgeback')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (50, 2, N'Scottish Deerhound')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (51, 2, N'Spinone Italiano')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (52, 2, N'Tibetan Mastiff')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (53, 2, N'Weimaraner')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (54, 2, N'Airdale Terrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (55, 2, N'American Staffordshire Terrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (56, 2, N'American Water Spaniel')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (57, 2, N'Australian Cattle Dog')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (58, 2, N'Australian Shepherd')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (59, 2, N'Basset Hound')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (60, 2, N'Bearded Collie')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (61, 2, N'Border Collie')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (62, 2, N'Brittany')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (63, 2, N'Bull Dog')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (64, 2, N'Bull Terrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (65, 2, N'Canaan Dog')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (66, 2, N'Chinese Shar Pei')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (67, 2, N'Chow Chow')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (68, 2, N'Cocker Spaniel-American')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (69, 2, N'Cocker Spaniel-English')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (70, 2, N'Dalmatian')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (71, 2, N'English Springer Spaniel')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (72, 2, N'Field Spaniel')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (73, 2, N'Flat Coated Retriever')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (74, 2, N'Finnish Spitz')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (75, 2, N'Harrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (76, 2, N'Ibizan Hound')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (77, 2, N'Irish Terrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (78, 2, N'Irish Water Spaniel')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (79, 2, N'Keeshond')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (80, 2, N'Kerry Blue Terrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (81, 2, N'Norwegian Elkhound')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (82, 2, N'Nova Scotia Duck Tolling Retriever')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (83, 2, N'Petit Basset Griffon Vendeen')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (84, 2, N'Pharaoh Hound')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (85, 2, N'Plott Hound')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (86, 2, N'Pointer')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (87, 2, N'Polish Lowland Sheepdog')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (88, 2, N'Portuguese Water Dog')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (89, 2, N'Redbone Coonhound')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (90, 2, N'Saluki')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (91, 2, N'Samoyed')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (92, 2, N'Siberian Husky')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (93, 2, N'Soft-Coated Wheaten Terrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (94, 2, N'Staffordshire Bull Terrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (95, 2, N'Standard Schnauzer')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (96, 2, N'Sussex Spaniel')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (97, 2, N'Vizsla')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (98, 2, N'Welsh Springer Spaniel')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (99, 2, N'Wirehaired Pointing Griffon')
GO
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (100, 2, N'American Eskimo')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (101, 2, N'Australian Terrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (102, 2, N'Basenji')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (103, 2, N'Beagle')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (104, 2, N'Bedlington Terrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (105, 2, N'Bichon Frise')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (106, 2, N'Border Terrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (107, 2, N'Boston Terrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (108, 2, N'Brussels Griffon')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (109, 2, N'Cairn Terrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (110, 2, N'Cardigan Welsh Corgi')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (111, 2, N'Cavalier King Charles Spaniel')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (112, 2, N'Coton de Tulear')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (113, 2, N'Dachshund')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (114, 2, N'Dandie Dinmont Terrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (115, 2, N'English Toy Spaniel')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (116, 2, N'Fox Terrier ‰ÛÒ Smooth')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (117, 2, N'Fox Terrier ‰ÛÒ Wirehair')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (118, 2, N'French Bulldog')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (119, 2, N'German Pinscher')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (120, 2, N'Glen Imaal Terrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (121, 2, N'Lakeland Terrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (122, 2, N'Manchester Terrier (Standard)')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (123, 2, N'Poodle Miniature')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (124, 2, N'Pug')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (125, 2, N'Puli')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (126, 2, N'Schipperke')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (127, 2, N'Scottish Terrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (128, 2, N'Sealyham Terrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (129, 2, N'Shetland Sheepdog (Sheltie)')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (130, 2, N'Shiba Inu')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (131, 2, N'Shih Tzu')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (132, 2, N'Silky Terrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (133, 2, N'Skye Terrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (134, 2, N'Tibetan Spaniel')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (135, 2, N'Tibetan Terrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (136, 2, N'Welsh Terrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (137, 2, N'West Highland White Terrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (138, 2, N'Whippet')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (139, 2, N'Affenpinscher')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (140, 2, N'Chihuahua')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (141, 2, N'Chinese Crested')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (142, 2, N'Italian Greyhound')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (143, 2, N'Japanese Chin')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (144, 2, N'Maltese')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (145, 2, N'Manchester Terrier (Toy)')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (146, 2, N'Papillon')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (147, 2, N'Pomeranian')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (148, 2, N'Poodle Toy')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (149, 2, N'Toy Fox Terrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (150, 2, N'Yorkshire Terrier')
INSERT [dbo].[Breed] ([ID], [TypeID], [Name]) VALUES (151, 2, N'Mix')
SET IDENTITY_INSERT [dbo].[Breed] OFF
GO
USE [master]
GO
ALTER DATABASE [beagles_app] SET  READ_WRITE 
GO
