USE [master]
GO
/****** Object:  Database [pos_admin]    Script Date: 16/03/2022 07:24:49 p. m. ******/
CREATE DATABASE [pos_admin]
GO
ALTER DATABASE [pos_admin] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pos_admin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pos_admin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pos_admin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pos_admin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pos_admin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pos_admin] SET ARITHABORT OFF 
GO
ALTER DATABASE [pos_admin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pos_admin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pos_admin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pos_admin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pos_admin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pos_admin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pos_admin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pos_admin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pos_admin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pos_admin] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pos_admin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pos_admin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pos_admin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pos_admin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pos_admin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pos_admin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pos_admin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pos_admin] SET RECOVERY FULL 
GO
ALTER DATABASE [pos_admin] SET  MULTI_USER 
GO
ALTER DATABASE [pos_admin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pos_admin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pos_admin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pos_admin] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [pos_admin]
GO
/****** Object:  Table [dbo].[articulo]    Script Date: 16/03/2022 07:24:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[articulo](
	[cod_barras] [varchar](15) NOT NULL,
	[cod_asociado] [varchar](15) NULL,
	[id_clasificacion] [bigint] NOT NULL,
	[cod_interno] [varchar](15) NULL,
	[descripcion] [varchar](80) NOT NULL,
	[descripcion_corta] [varchar](30) NOT NULL,
	[cantidad_um] [decimal](19, 3) NOT NULL,
	[id_unidad] [uniqueidentifier] NOT NULL,
	[id_proveedor] [uniqueidentifier] NOT NULL,
	[precio_compra] [decimal](19, 3) NOT NULL,
	[utilidad] [decimal](19, 3) NOT NULL,
	[precio_venta] [decimal](19, 3) NOT NULL,
	[tipo_articulo] [varchar](50) NOT NULL,
	[stock] [decimal](19, 3) NOT NULL,
	[stock_min] [decimal](19, 3) NOT NULL,
	[stock_max] [decimal](19, 3) NOT NULL,
	[iva] [decimal](4, 2) NOT NULL,
	[kit_fecha_ini] [datetime] NULL,
	[kit_fecha_fin] [datetime] NULL,
	[articulo_disponible] [bit] NOT NULL,
	[kit] [bit] NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[visible] [bit] NOT NULL,
	[puntos] [smallint] NOT NULL,
	[last_update_inventory] [datetime] NOT NULL,
	[cve_producto] [varchar](15) NOT NULL,
 CONSTRAINT [pk_articulo] PRIMARY KEY CLUSTERED 
(
	[cod_barras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[articulos]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[articulos](
	[cod_barras] [varchar](15) NOT NULL,
	[cod_asociado] [varchar](15) NULL,
	[cod_interno] [varchar](15) NULL,
	[descripcion] [varchar](80) NOT NULL,
	[descripcion_corta] [varchar](30) NOT NULL,
	[cantidad_um] [decimal](19, 3) NOT NULL,
	[id_unidad] [uniqueidentifier] NOT NULL,
	[id_proveedor] [uniqueidentifier] NOT NULL,
	[precio_compra] [decimal](19, 3) NOT NULL,
	[utilidad] [decimal](19, 3) NOT NULL,
	[precio_venta] [decimal](19, 3) NOT NULL,
	[tipo_articulo] [varchar](50) NOT NULL,
	[iva] [decimal](4, 2) NOT NULL,
	[articulo_disponible] [bit] NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
 CONSTRAINT [key31] PRIMARY KEY CLUSTERED 
(
	[cod_barras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clasificacion]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clasificacion](
	[id_clasificacion] [bigint] IDENTITY(1,1) NOT NULL,
	[id_clasificacion_dep] [bigint] NULL,
	[descripcion] [varchar](100) NOT NULL,
	[nivel_clasificacion] [smallint] NOT NULL,
 CONSTRAINT [pk_categoria] PRIMARY KEY CLUSTERED 
(
	[id_clasificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [fk_clasificacion] UNIQUE NONCLUSTERED 
(
	[id_clasificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id_cliente] [uniqueidentifier] NOT NULL,
	[rfc] [varchar](15) NOT NULL,
	[razon_social] [varchar](120) NOT NULL,
	[contacto] [varchar](100) NULL,
	[e_mail] [varchar](80) NULL,
	[e_mail2] [varchar](80) NULL,
	[id_municipio] [smallint] NULL,
	[id_entidad] [smallint] NULL,
 CONSTRAINT [pk_cliente] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uq_rfc_cliente] UNIQUE NONCLUSTERED 
(
	[rfc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[compra]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compra](
	[id_compra] [uniqueidentifier] NOT NULL,
	[id_proveedor] [uniqueidentifier] NULL,
	[no_factura] [varchar](20) NULL,
	[fecha_compra] [datetime] NOT NULL,
	[id_pedido] [uniqueidentifier] NULL,
	[cancelada] [bit] NOT NULL,
	[fecha_cancelacion] [datetime] NULL,
	[no_entrada] [smallint] NOT NULL,
	[observaciones] [varchar](100) NULL,
 CONSTRAINT [pk_compra] PRIMARY KEY CLUSTERED 
(
	[id_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[compra_articulo]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compra_articulo](
	[id_compra] [uniqueidentifier] NOT NULL,
	[cod_barras] [varchar](15) NOT NULL,
	[num_articulo] [smallint] NOT NULL,
	[cant_cja] [decimal](19, 3) NOT NULL,
	[cant_pza] [decimal](19, 3) NOT NULL,
	[precio_compra] [decimal](19, 3) NOT NULL,
	[no_captura] [smallint] NOT NULL,
	[no_entrega] [decimal](19, 3) NOT NULL,
 CONSTRAINT [pk_compra_articulo] PRIMARY KEY CLUSTERED 
(
	[id_compra] ASC,
	[num_articulo] ASC,
	[cod_barras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comprobante]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comprobante](
	[id_comprobante] [varchar](3) NOT NULL,
	[documento] [varchar](90) NOT NULL,
	[sat] [varchar](2) NOT NULL,
 CONSTRAINT [pk_comprobante] PRIMARY KEY CLUSTERED 
(
	[id_comprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[condicion_pago]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[condicion_pago](
	[id_condicion] [char](3) NOT NULL,
	[descripcion] [varchar](80) NOT NULL,
 CONSTRAINT [pk_condicion_pago] PRIMARY KEY CLUSTERED 
(
	[id_condicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[control_errores]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[control_errores](
	[id_error] [uniqueidentifier] NOT NULL,
	[aplicacion] [varchar](60) NOT NULL,
	[host] [varchar](50) NOT NULL,
	[tipo] [varchar](100) NOT NULL,
	[origen] [varchar](60) NOT NULL,
	[mensage] [varchar](500) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[cod_status] [int] NOT NULL,
	[time_utc] [datetime] NOT NULL,
	[secuencia] [int] NOT NULL,
	[all_xml] [ntext] NOT NULL,
 CONSTRAINT [key21] PRIMARY KEY CLUSTERED 
(
	[id_error] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ctrl_errores]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ctrl_errores](
	[id_error] [uniqueidentifier] NOT NULL,
	[fecha_log] [datetime] NOT NULL,
	[descripcion] [ntext] NOT NULL,
 CONSTRAINT [key34] PRIMARY KEY CLUSTERED 
(
	[id_error] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[direccion_proveedor]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[direccion_proveedor](
	[id_proveedor] [uniqueidentifier] NOT NULL,
	[calle] [varchar](100) NULL,
	[no_int] [varchar](10) NULL,
	[no_ext] [varchar](10) NULL,
	[colonia] [varchar](100) NULL,
	[localidad] [varchar](100) NULL,
	[id_entidad] [smallint] NULL,
	[id_municipio] [smallint] NULL,
	[pais] [varchar](20) NOT NULL,
	[cod_postal] [varchar](10) NULL,
 CONSTRAINT [pk_direccion] PRIMARY KEY CLUSTERED 
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[id_empleado] [uniqueidentifier] NOT NULL,
	[nombre] [varchar](60) NOT NULL,
	[a_paterno] [varchar](60) NOT NULL,
	[a_materno] [varchar](80) NOT NULL,
	[user_name] [varchar](15) NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
 CONSTRAINT [pk_empleado] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empresa]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empresa](
	[rfc] [varchar](18) NOT NULL,
	[razon_social] [varchar](100) NOT NULL,
	[representante] [varchar](100) NULL,
	[calle] [varchar](100) NOT NULL,
	[no_ext] [varchar](20) NOT NULL,
	[no_int] [varchar](20) NULL,
	[colonia] [varchar](150) NOT NULL,
	[municipio] [varchar](100) NOT NULL,
	[estado] [varchar](100) NOT NULL,
	[pais] [varchar](50) NOT NULL,
	[codigo_postal] [varchar](10) NOT NULL,
	[tel_principal] [varchar](30) NULL,
	[e_mail] [varchar](100) NULL,
	[logo] [image] NULL,
	[fecha_registro] [datetime] NOT NULL,
 CONSTRAINT [key3] PRIMARY KEY CLUSTERED 
(
	[rfc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entidad]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entidad](
	[id_entidad] [smallint] NOT NULL,
	[nombre] [varchar](40) NOT NULL,
 CONSTRAINT [pk_estado] PRIMARY KEY CLUSTERED 
(
	[id_entidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entrada]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entrada](
	[id_entrada] [uniqueidentifier] NOT NULL,
	[num_entrada] [bigint] NOT NULL,
	[fecha_entrada] [datetime] NOT NULL,
	[observacion] [text] NULL,
	[id_movto] [bigint] NULL,
	[user_name] [varchar](15) NULL,
	[cancelada] [bit] NOT NULL,
	[fecha_cancelacion] [datetime] NULL,
 CONSTRAINT [key6] PRIMARY KEY CLUSTERED 
(
	[id_entrada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entrada_articulo]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entrada_articulo](
	[id_entrada] [uniqueidentifier] NOT NULL,
	[cod_barras] [varchar](15) NOT NULL,
	[cant_ent] [decimal](19, 3) NOT NULL,
	[cant_pza] [decimal](19, 3) NOT NULL,
	[cant_reg] [decimal](19, 3) NOT NULL,
	[costo] [decimal](19, 3) NOT NULL,
 CONSTRAINT [key8] PRIMARY KEY CLUSTERED 
(
	[id_entrada] ASC,
	[cod_barras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estadistica]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estadistica](
	[anio] [smallint] NOT NULL,
	[cod_barras] [varchar](15) NOT NULL,
	[ene] [decimal](19, 3) NOT NULL,
	[feb] [decimal](19, 3) NOT NULL,
	[mar] [decimal](19, 3) NOT NULL,
	[abr] [decimal](19, 3) NOT NULL,
	[may] [decimal](19, 3) NOT NULL,
	[jun] [decimal](19, 3) NOT NULL,
	[jul] [decimal](19, 3) NOT NULL,
	[ago] [decimal](19, 3) NOT NULL,
	[sep] [decimal](19, 3) NOT NULL,
	[oct] [decimal](19, 3) NOT NULL,
	[nov] [decimal](19, 3) NOT NULL,
	[dic] [decimal](19, 3) NOT NULL,
 CONSTRAINT [key17] PRIMARY KEY CLUSTERED 
(
	[anio] ASC,
	[cod_barras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura](
	[id_factura] [bigint] NOT NULL,
	[fecha_remision] [datetime] NOT NULL,
	[id_cliente] [uniqueidentifier] NOT NULL,
	[cfdi_relacionado] [varchar](50) NULL,
	[uuid_relacionado] [varchar](100) NULL,
	[id_comprobante] [varchar](3) NOT NULL,
	[id_condicion] [char](3) NOT NULL,
	[id_uso] [char](3) NOT NULL,
 CONSTRAINT [pk_factura] PRIMARY KEY CLUSTERED 
(
	[id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura_articulo]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura_articulo](
	[id_factura_articulo] [uniqueidentifier] NOT NULL,
	[id_factura] [bigint] NOT NULL,
	[cod_barras] [varchar](15) NOT NULL,
	[descripcion] [varchar](80) NOT NULL,
	[id_unidad] [uniqueidentifier] NOT NULL,
	[cantidad] [decimal](19, 3) NOT NULL,
	[iva] [decimal](4, 3) NOT NULL,
	[precio_vta] [decimal](19, 3) NOT NULL,
 CONSTRAINT [key24] PRIMARY KEY CLUSTERED 
(
	[id_factura_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura_metodo_pago]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura_metodo_pago](
	[id_factura] [bigint] NOT NULL,
	[id_metodo] [char](2) NOT NULL,
 CONSTRAINT [pk_factura_metodo_pago] PRIMARY KEY CLUSTERED 
(
	[id_factura] ASC,
	[id_metodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura_venta]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura_venta](
	[id_pos] [int] NOT NULL,
	[id_venta] [uniqueidentifier] NOT NULL,
	[id_factura] [bigint] NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
 CONSTRAINT [key19] PRIMARY KEY CLUSTERED 
(
	[id_venta] ASC,
	[id_pos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[generacion_codigos]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[generacion_codigos](
	[id_gencode] [bigint] IDENTITY(1,1) NOT NULL,
	[cod_barras] [decimal](18, 0) NULL,
	[cod_pesable] [decimal](18, 0) NULL,
	[cod_inpesable] [decimal](18, 0) NULL,
 CONSTRAINT [key5] PRIMARY KEY CLUSTERED 
(
	[id_gencode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventario_articulo]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventario_articulo](
	[cod_barras] [varchar](15) NOT NULL,
	[fecha_inicial_inv] [datetime] NOT NULL,
	[fecha_ultima_act] [datetime] NOT NULL,
	[inventario_ini] [decimal](19, 3) NOT NULL,
	[entradas] [decimal](19, 3) NOT NULL,
	[compras] [decimal](19, 3) NOT NULL,
	[salidas] [decimal](19, 3) NOT NULL,
	[ventas] [decimal](19, 3) NOT NULL,
	[stock_actual] [decimal](19, 3) NOT NULL,
 CONSTRAINT [key23] PRIMARY KEY CLUSTERED 
(
	[cod_barras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventario_captura]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventario_captura](
	[id_captura] [uniqueidentifier] NOT NULL,
	[id_inventario_fisico] [uniqueidentifier] NOT NULL,
	[num_captura] [bigint] NOT NULL,
	[cod_barras] [varchar](15) NOT NULL,
	[fecha_captura] [datetime] NOT NULL,
	[cant_cja] [decimal](19, 3) NOT NULL,
	[cant_pza] [decimal](19, 3) NOT NULL,
	[upload] [bit] NOT NULL,
 CONSTRAINT [pk_inventario_captura] PRIMARY KEY CLUSTERED 
(
	[id_captura] ASC,
	[id_inventario_fisico] ASC,
	[num_captura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventario_fisico]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventario_fisico](
	[id_inventario_fisico] [uniqueidentifier] NOT NULL,
	[id_proveedor] [uniqueidentifier] NOT NULL,
	[user_name] [varchar](15) NOT NULL,
	[fecha_ini] [datetime] NOT NULL,
	[fecha_fin] [datetime] NULL,
	[fecha_registro] [datetime] NOT NULL,
 CONSTRAINT [key13] PRIMARY KEY CLUSTERED 
(
	[id_inventario_fisico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventario_fisico_articulo]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventario_fisico_articulo](
	[cod_barras] [varchar](15) NOT NULL,
	[id_inventario_fisico] [uniqueidentifier] NOT NULL,
	[stock_estimado] [decimal](19, 3) NOT NULL,
	[stock_fisico] [decimal](19, 3) NOT NULL,
 CONSTRAINT [key14] PRIMARY KEY CLUSTERED 
(
	[cod_barras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kit_articulos]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kit_articulos](
	[cod_barras_kit] [varchar](15) NOT NULL,
	[cod_barras_pro] [varchar](15) NOT NULL,
	[cantidad] [decimal](19, 3) NOT NULL,
 CONSTRAINT [pk_articulo_asociado] PRIMARY KEY CLUSTERED 
(
	[cod_barras_kit] ASC,
	[cod_barras_pro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[metodo_pago]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metodo_pago](
	[id_metodo] [char](2) NOT NULL,
	[descripcion] [varchar](80) NOT NULL,
 CONSTRAINT [pk_metodo_pago] PRIMARY KEY CLUSTERED 
(
	[id_metodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movimiento_almacen]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimiento_almacen](
	[id_movto] [bigint] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[tipo_movto] [varchar](15) NOT NULL,
 CONSTRAINT [key7] PRIMARY KEY CLUSTERED 
(
	[id_movto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[municipio]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[municipio](
	[id_entidad] [smallint] NOT NULL,
	[id_municipio] [smallint] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
 CONSTRAINT [pk_municipio] PRIMARY KEY CLUSTERED 
(
	[id_municipio] ASC,
	[id_entidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oferta]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oferta](
	[id_oferta] [uniqueidentifier] NOT NULL,
	[num_oferta] [bigint] NOT NULL,
	[descripcion] [varchar](80) NOT NULL,
	[fecha_oferta] [datetime] NOT NULL,
	[fecha_ini] [datetime] NOT NULL,
	[fecha_fin] [datetime] NOT NULL,
	[status_oferta] [varchar](20) NOT NULL,
	[fecha_cancelacion] [datetime] NULL,
	[user_name] [varchar](15) NULL,
 CONSTRAINT [key11] PRIMARY KEY CLUSTERED 
(
	[id_oferta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oferta_articulo]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oferta_articulo](
	[id_oferta] [uniqueidentifier] NOT NULL,
	[cod_barras] [varchar](15) NOT NULL,
	[precio_oferta] [decimal](19, 3) NOT NULL,
	[status_oferta] [varchar](20) NOT NULL,
	[fecha_cancelacion] [datetime] NULL,
	[fecha_registro] [datetime] NOT NULL,
 CONSTRAINT [key12] PRIMARY KEY CLUSTERED 
(
	[id_oferta] ASC,
	[cod_barras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orden]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orden](
	[id_pedido] [uniqueidentifier] NOT NULL,
	[num_pedido] [bigint] NOT NULL,
	[fecha_pedido] [datetime] NOT NULL,
	[id_proveedor] [uniqueidentifier] NOT NULL,
	[status_pedido] [varchar](20) NOT NULL,
	[no_dias] [smallint] NOT NULL,
	[fecha_autorizado] [datetime] NULL,
	[plan] [varchar](15) NOT NULL,
	[anio] [smallint] NOT NULL,
	[mes] [smallint] NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
 CONSTRAINT [key26] PRIMARY KEY CLUSTERED 
(
	[id_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orden_articulo]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orden_articulo](
	[id_pedido] [uniqueidentifier] NOT NULL,
	[no_articulo] [smallint] NOT NULL,
	[cod_barras] [varchar](15) NOT NULL,
	[cod_anexo] [varchar](15) NOT NULL,
	[cantidad] [decimal](19, 3) NOT NULL,
	[precio_articulo] [decimal](19, 3) NOT NULL,
	[por_surtir] [decimal](19, 3) NOT NULL,
	[por_surtir_pzas] [decimal](19, 3) NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
 CONSTRAINT [key27] PRIMARY KEY CLUSTERED 
(
	[no_articulo] ASC,
	[id_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pedido]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pedido](
	[id_pedido] [uniqueidentifier] NOT NULL,
	[num_pedido] [bigint] NOT NULL,
	[fecha_pedido] [datetime] NOT NULL,
	[id_proveedor] [uniqueidentifier] NOT NULL,
	[status_pedido] [varchar](20) NOT NULL,
	[no_dias] [smallint] NOT NULL,
	[fecha_autorizado] [datetime] NULL,
	[plan] [varchar](15) NOT NULL,
	[anio] [smallint] NOT NULL,
	[mes] [smallint] NOT NULL,
 CONSTRAINT [pk_pedido] PRIMARY KEY CLUSTERED 
(
	[id_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pedido_articulo]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pedido_articulo](
	[id_pedido] [uniqueidentifier] NOT NULL,
	[no_articulo] [smallint] NOT NULL,
	[cod_barras] [varchar](15) NOT NULL,
	[cod_anexo] [varchar](15) NOT NULL,
	[cant_original] [decimal](19, 3) NOT NULL,
	[cantidad] [decimal](19, 3) NOT NULL,
	[precio_articulo] [decimal](19, 3) NOT NULL,
	[sugerido] [decimal](19, 3) NOT NULL,
 CONSTRAINT [pk_pedido_articulo] PRIMARY KEY CLUSTERED 
(
	[id_pedido] ASC,
	[no_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permiso]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permiso](
	[id_permiso] [varchar](15) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[tipo_sistema] [varchar](50) NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
 CONSTRAINT [pk_permiso] PRIMARY KEY CLUSTERED 
(
	[id_permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pos]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pos](
	[id_pos] [smallint] NOT NULL,
	[pos_address] [varchar](30) NOT NULL,
	[user_sql] [varchar](30) NOT NULL,
	[pwsd_sql] [varchar](50) NOT NULL,
 CONSTRAINT [pk_pos] PRIMARY KEY CLUSTERED 
(
	[id_pos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pos_admin_settings]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pos_admin_settings](
	[id_setting] [uniqueidentifier] NOT NULL,
	[path_ptr_label] [varchar](80) NULL,
	[path_dir_bascula] [varchar](80) NULL,
	[cod_normal] [bigint] NOT NULL,
	[cod_pesable] [bigint] NOT NULL,
	[cod_nopesable] [bigint] NOT NULL,
	[iva] [decimal](5, 3) NOT NULL,
	[cfdi_user] [varchar](100) NULL,
	[cfdi_pwsd] [varchar](100) NULL,
	[cfdi_path_txt] [varchar](150) NULL,
	[cfdi_path_pdf] [varchar](150) NULL,
 CONSTRAINT [key20] PRIMARY KEY CLUSTERED 
(
	[id_setting] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pos_control]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pos_control](
	[id_control_pos] [uniqueidentifier] NOT NULL,
	[id_pos] [int] NOT NULL,
	[user_name] [varchar](15) NOT NULL,
	[pos_open_date] [datetime] NOT NULL,
 CONSTRAINT [key30] PRIMARY KEY CLUSTERED 
(
	[id_control_pos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[precio_temporal]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[precio_temporal](
	[cod_barras] [varchar](15) NOT NULL,
	[precio_compra] [decimal](19, 3) NOT NULL,
	[utilidad] [decimal](5, 3) NOT NULL,
	[precio_venta] [decimal](19, 3) NOT NULL,
	[iva] [decimal](4, 2) NOT NULL,
 CONSTRAINT [key4] PRIMARY KEY CLUSTERED 
(
	[cod_barras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos_sin_iva]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos_sin_iva](
	[cod_barras] [varchar](15) NOT NULL,
	[descripcion] [varchar](80) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promocion]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promocion](
	[id_promo] [uniqueidentifier] NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[tipo_promo] [char](3) NOT NULL,
	[fecha_ini] [datetime] NOT NULL,
	[fecha_fin] [datetime] NOT NULL,
 CONSTRAINT [key32] PRIMARY KEY CLUSTERED 
(
	[id_promo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promocion_articulo]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promocion_articulo](
	[id_promo] [uniqueidentifier] NOT NULL,
	[cod_barras] [varchar](15) NOT NULL,
	[cantidad_lleva] [decimal](19, 3) NOT NULL,
	[cantidad_paga] [decimal](19, 3) NOT NULL,
	[porcent_desc] [decimal](4, 3) NOT NULL,
 CONSTRAINT [key33] PRIMARY KEY CLUSTERED 
(
	[id_promo] ASC,
	[cod_barras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedor](
	[id_proveedor] [uniqueidentifier] NOT NULL,
	[rfc] [varchar](18) NOT NULL,
	[razon_social] [varchar](80) NOT NULL,
	[nombre_contacto] [varchar](100) NULL,
	[tel_principal] [varchar](20) NULL,
	[tel_movil] [varchar](30) NULL,
	[e_mail] [varchar](80) NULL,
	[estatus] [varchar](15) NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
 CONSTRAINT [pk_proveedor] PRIMARY KEY CLUSTERED 
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salida]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salida](
	[id_salida] [uniqueidentifier] NOT NULL,
	[num_salida] [bigint] NOT NULL,
	[fecha_salida] [datetime] NOT NULL,
	[observacion] [text] NULL,
	[id_movto] [bigint] NULL,
	[user_name] [varchar](15) NULL,
	[cancelada] [bit] NOT NULL,
	[fecha_cancelacion] [datetime] NULL,
 CONSTRAINT [key9] PRIMARY KEY CLUSTERED 
(
	[id_salida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salida_articulo]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salida_articulo](
	[id_salida] [uniqueidentifier] NOT NULL,
	[cod_barras] [varchar](15) NOT NULL,
	[cant_sal] [decimal](19, 3) NOT NULL,
	[cant_pza] [decimal](19, 3) NOT NULL,
	[cant_reg] [decimal](19, 3) NOT NULL,
	[costo] [decimal](19, 3) NOT NULL,
 CONSTRAINT [key10] PRIMARY KEY CLUSTERED 
(
	[id_salida] ASC,
	[cod_barras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[unidad_medida]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[unidad_medida](
	[id_unidad] [uniqueidentifier] NOT NULL,
	[descripcion] [varchar](10) NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[cve_sat] [varchar](5) NOT NULL,
 CONSTRAINT [pk_unidad_medida] PRIMARY KEY CLUSTERED 
(
	[id_unidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[uso_cfdi]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uso_cfdi](
	[id_uso] [char](3) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [pk_uso_cfdi] PRIMARY KEY CLUSTERED 
(
	[id_uso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[user_name] [varchar](15) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[tipo_usuario] [varchar](30) NOT NULL,
	[enable] [bit] NOT NULL,
	[user_code_bascula] [smallint] NULL,
	[fecha_registro] [datetime] NOT NULL,
 CONSTRAINT [pk_usuario] PRIMARY KEY CLUSTERED 
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario_permiso]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario_permiso](
	[user_name] [varchar](15) NOT NULL,
	[id_permiso] [varchar](15) NOT NULL,
	[valor_num] [decimal](18, 3) NULL,
	[fecha_registro] [datetime] NOT NULL,
 CONSTRAINT [pk_usuario_permiso] PRIMARY KEY CLUSTERED 
(
	[user_name] ASC,
	[id_permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[id_pos] [int] NOT NULL,
	[id_venta] [uniqueidentifier] NOT NULL,
	[vendedor] [varchar](15) NOT NULL,
	[folio] [bigint] NOT NULL,
	[fecha_venta] [datetime] NOT NULL,
	[total_vendido] [decimal](19, 3) NOT NULL,
	[pago_efectivo] [decimal](19, 2) NOT NULL,
	[pago_cheque] [decimal](19, 3) NOT NULL,
	[pago_vales] [decimal](19, 2) NOT NULL,
	[pago_tc] [decimal](19, 2) NOT NULL,
	[supervisor] [varchar](15) NULL,
	[upload] [bit] NOT NULL,
	[num_registros] [smallint] NOT NULL,
 CONSTRAINT [pk_venta] PRIMARY KEY CLUSTERED 
(
	[id_venta] ASC,
	[id_pos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta_articulo]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta_articulo](
	[id_pos] [int] NOT NULL,
	[id_venta] [uniqueidentifier] NOT NULL,
	[no_articulo] [bigint] NOT NULL,
	[cod_barras] [varchar](15) NOT NULL,
	[user_code_bascula] [smallint] NULL,
	[cantidad] [decimal](19, 3) NOT NULL,
	[articulo_ofertado] [bit] NOT NULL,
	[precio_regular] [decimal](19, 3) NOT NULL,
	[cambio_precio] [bit] NOT NULL,
	[iva] [decimal](4, 3) NOT NULL,
	[precio_vta] [decimal](19, 3) NOT NULL,
	[porcent_desc] [decimal](4, 2) NOT NULL,
	[cant_devuelta] [decimal](19, 3) NOT NULL,
	[user_name] [varchar](15) NULL,
	[id_promo] [uniqueidentifier] NULL,
	[no_promo_aplicado] [smallint] NULL,
 CONSTRAINT [pk_venta_articulo] PRIMARY KEY CLUSTERED 
(
	[no_articulo] ASC,
	[id_pos] ASC,
	[id_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta_cancelada]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta_cancelada](
	[id_pos] [int] NOT NULL,
	[id_venta_cancel] [uniqueidentifier] NOT NULL,
	[vendedor] [varchar](15) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[total_vendido] [decimal](19, 3) NOT NULL,
	[pago_efectivo] [decimal](19, 2) NOT NULL,
	[pago_cheque] [decimal](19, 2) NOT NULL,
	[pago_vales] [decimal](19, 2) NOT NULL,
	[pago_tc] [decimal](19, 2) NOT NULL,
	[status] [varchar](15) NOT NULL,
	[supervisor] [varchar](15) NULL,
	[upload] [bit] NOT NULL,
 CONSTRAINT [key15] PRIMARY KEY CLUSTERED 
(
	[id_venta_cancel] ASC,
	[id_pos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta_cancelada_articulo]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta_cancelada_articulo](
	[id_pos] [int] NOT NULL,
	[id_venta_cancel] [uniqueidentifier] NOT NULL,
	[no_articulo] [bigint] NOT NULL,
	[cod_barras] [varchar](15) NOT NULL,
	[cantidad] [decimal](19, 3) NOT NULL,
	[articulo_ofertado] [bit] NOT NULL,
	[precio_regular] [decimal](19, 3) NOT NULL,
	[cambio_precio] [bit] NOT NULL,
	[precio_vta] [decimal](19, 3) NOT NULL,
	[porcent_desc] [decimal](19, 3) NOT NULL,
	[user_name] [varchar](15) NULL,
 CONSTRAINT [key16] PRIMARY KEY CLUSTERED 
(
	[id_venta_cancel] ASC,
	[id_pos] ASC,
	[no_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta_devolucion]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta_devolucion](
	[id_devolucion] [uniqueidentifier] NOT NULL,
	[folio] [bigint] NOT NULL,
	[id_pos] [int] NOT NULL,
	[id_venta] [uniqueidentifier] NOT NULL,
	[fecha_dev] [datetime] NOT NULL,
	[vendedor] [varchar](15) NOT NULL,
	[supervisor] [varchar](15) NOT NULL,
	[cant_dev] [decimal](19, 3) NOT NULL,
	[upload] [bit] NOT NULL,
 CONSTRAINT [key18] PRIMARY KEY CLUSTERED 
(
	[id_devolucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta_devolucion_articulo]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta_devolucion_articulo](
	[id_devolucion] [uniqueidentifier] NOT NULL,
	[no_articulo] [bigint] NOT NULL,
	[cod_barras] [varchar](15) NOT NULL,
	[cantidad] [decimal](19, 3) NOT NULL,
 CONSTRAINT [key29] PRIMARY KEY CLUSTERED 
(
	[id_devolucion] ASC,
	[cod_barras] ASC,
	[no_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[colector_articulo]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[colector_articulo]
AS
SELECT        cod_barras, id_clasificacion, cod_asociado, cod_interno, descripcion, descripcion_corta, cantidad_um, id_unidad, id_proveedor, precio_compra, utilidad, precio_venta, tipo_articulo, stock, stock_min, stock_max, 
                         iva, kit_fecha_ini, kit_fecha_fin, articulo_disponible, kit, fecha_registro, visible, puntos, last_update_inventory
FROM            dbo.articulo
GO
/****** Object:  View [dbo].[colector_compra]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[colector_compra]
AS
SELECT        dbo.compra.*
FROM            dbo.compra
GO
/****** Object:  View [dbo].[colector_inventario_fisico]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[colector_inventario_fisico]
AS
SELECT        dbo.inventario_fisico.*
FROM            dbo.inventario_fisico
GO
/****** Object:  View [dbo].[colector_orden]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[colector_orden]
AS
SELECT        id_pedido, num_pedido, fecha_pedido, id_proveedor, status_pedido, fecha_registro
FROM            dbo.orden
GO
/****** Object:  View [dbo].[colector_orden_articulo]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[colector_orden_articulo]
AS
SELECT        id_pedido, no_articulo, cod_barras, cod_anexo, cantidad, precio_articulo, por_surtir, por_surtir_pzas
FROM            dbo.orden_articulo
GO
/****** Object:  View [dbo].[colector_proveedor]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[colector_proveedor]
AS
SELECT        id_proveedor, razon_social, fecha_registro
FROM            dbo.proveedor
GO
/****** Object:  View [dbo].[colector_unidad_medida]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[colector_unidad_medida]
AS
SELECT        id_unidad, descripcion, fecha_registro
FROM            dbo.unidad_medida
GO
/****** Object:  View [dbo].[colector_usuario]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[colector_usuario]
AS
SELECT        user_name, password, tipo_usuario, enable, fecha_registro
FROM            dbo.usuario
GO
/****** Object:  View [dbo].[colector_usuario_permiso]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[colector_usuario_permiso]
AS
SELECT        dbo.usuario_permiso.*
FROM            dbo.usuario_permiso
GO
/****** Object:  View [dbo].[vw_articulo]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vw_articulo]
as
select    ap.cod_barras,
        isnull(ap.cod_asociado,ap.cod_barras) [cod_asociado],
        ap.id_clasificacion,
        ap.descripcion,
        ap.descripcion_corta,
        ap.tipo_articulo,
        ap.cantidad_um,
        ap.id_unidad,
        ap.id_proveedor,
        ap.kit
from articulo ap
where ap.tipo_articulo = 'principal'
union
select    aa.cod_barras,
        aa.cod_asociado,
        aa.id_clasificacion,
        aa.descripcion,
        aa.descripcion_corta,
        aa.tipo_articulo,
        aa.cantidad_um,
        aa.id_unidad,
        aa.id_proveedor,
        aa.kit
from articulo aa
where aa.tipo_articulo <> 'principal'
GO
/****** Object:  View [dbo].[vw_articulos_principales]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_articulos_principales]
AS

SELECT	ap.cod_barras cod_principal,an.cod_barras cod_anexo,ap.cod_interno,ap.descripcion desc_principal,ISNULL(an.descripcion, ap.descripcion) desc_anexo,ump.descripcion unidad_principal,ISNULL(an.unidad_anexo, ump.descripcion) unidad_anexo,ap.cantidad_um cantidad_ump,ISNULL(an.cantidad_um, ap.cantidad_um) cantidad_uma,ap.id_proveedor,ap.precio_compra, ISNULL(an.precio_compra,ap.precio_compra) precio_compra_anexo
FROM articulo ap LEFT JOIN (
 SELECT aa.cod_barras,aa.cod_asociado,aa.descripcion,uma.descripcion unidad_anexo, aa.cantidad_um, aa.precio_compra
 FROM articulo aa INNER JOIN unidad_medida uma ON aa.id_unidad=uma.id_unidad
 WHERE aa.cod_barras IN (SELECT TOP 1 cod_barras FROM articulo sart JOIN unidad_medida sumed ON sart.id_unidad=sumed.id_unidad  WHERE (tipo_articulo='anexo' AND cod_asociado=aa.cod_asociado) AND sumed.descripcion='Cja'  ORDER BY sart.fecha_registro DESC)
) an ON ap.cod_barras=an.cod_asociado
 INNER JOIN unidad_medida ump ON ap.id_unidad=ump.id_unidad
WHERE ap.tipo_articulo='principal'

GO
/****** Object:  View [dbo].[vw_cajas]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_cajas]
AS
	SELECT DISTINCT id_pos, 'Caja ' + CONVERT(VARCHAR(3), id_pos) AS descripcion FROM dbo.venta AS v
GO
/****** Object:  View [dbo].[vw_clasificacion]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- create views section -------------------------------------------------

create view [dbo].[vw_clasificacion]
as
select
 c1.id_clasificacion  id_dpto
,c1.descripcion       departamento
,c2.id_clasificacion  id_cat
,c2.descripcion       categoria
,c3.id_clasificacion  id_subcat
,c3.descripcion       subcategoria
,c4.id_clasificacion  id_linea
,c4.descripcion       linea
from clasificacion c1
 inner join clasificacion c2 on c1.id_clasificacion=c2.id_clasificacion_dep and c2.nivel_clasificacion=2
 inner join clasificacion c3 on c2.id_clasificacion=c3.id_clasificacion_dep and c3.nivel_clasificacion=3
 inner join clasificacion c4 on c3.id_clasificacion=c4.id_clasificacion_dep and c4.nivel_clasificacion=4
GO
/****** Object:  View [dbo].[vw_items]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_items]
AS
SELECT        cod_barras, ISNULL(cod_asociado, cod_barras) AS Expr1, descripcion, precio_venta, fecha_registro
FROM            dbo.articulo
GO
/****** Object:  View [dbo].[vw_oferta_articulo]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_oferta_articulo]
AS
SELECT
 a.cod_barras, a.descripcion, a.precio_venta, ISNULL(ofe.precio_oferta,a.precio_venta) precio_oferta
FROM articulo a LEFT JOIN (SELECT oa.cod_barras, oa.precio_oferta FROM oferta_articulo oa JOIN oferta o ON ((oa.id_oferta=o.id_oferta AND oa.status_oferta='disponible') AND o.status_oferta='disponible') AND convert(date,getdate()) between o.fecha_ini and o.fecha_fin) ofe
ON a.cod_barras = ofe.cod_barras OR (a.cod_asociado = ofe.cod_barras and a.tipo_articulo = 'asociado')
GO
/****** Object:  View [dbo].[vw_offers]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_offers]
AS
SELECT        dbo.oferta.id_oferta, dbo.oferta_articulo.cod_barras, dbo.oferta_articulo.precio_oferta, dbo.oferta_articulo.status_oferta, dbo.oferta.fecha_ini, dbo.oferta.fecha_fin, dbo.oferta_articulo.fecha_registro
FROM            dbo.oferta INNER JOIN
                         dbo.oferta_articulo ON dbo.oferta.id_oferta = dbo.oferta_articulo.id_oferta
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_articulo]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [ix_articulo] ON [dbo].[articulo]
(
	[cod_barras] ASC,
	[cod_asociado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship2]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship2] ON [dbo].[articulo]
(
	[id_clasificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship3]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship3] ON [dbo].[articulo]
(
	[id_unidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship4]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship4] ON [dbo].[articulo]
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship6]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship6] ON [dbo].[articulos]
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship7]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship7] ON [dbo].[articulos]
(
	[id_unidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship1]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship1] ON [dbo].[clasificacion]
(
	[id_clasificacion_dep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship1]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship1] ON [dbo].[compra]
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship2]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship2] ON [dbo].[compra]
(
	[id_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship2]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship2] ON [dbo].[compra_articulo]
(
	[id_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_relationship3]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship3] ON [dbo].[compra_articulo]
(
	[cod_barras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship4]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship4] ON [dbo].[direccion_proveedor]
(
	[id_municipio] ASC,
	[id_entidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_relationship10]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship10] ON [dbo].[empleado]
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_relationship1]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship1] ON [dbo].[entrada]
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship4]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship4] ON [dbo].[entrada]
(
	[id_movto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship1]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship1] ON [dbo].[factura]
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship1]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship1] ON [dbo].[factura_articulo]
(
	[id_unidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship2]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship2] ON [dbo].[factura_articulo]
(
	[id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship1]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship1] ON [dbo].[factura_venta]
(
	[id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship1]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship1] ON [dbo].[inventario_captura]
(
	[id_captura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship2]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship2] ON [dbo].[inventario_captura]
(
	[id_inventario_fisico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_relationship3]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship3] ON [dbo].[inventario_captura]
(
	[cod_barras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship1]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship1] ON [dbo].[inventario_fisico]
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_relationship5]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship5] ON [dbo].[inventario_fisico]
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship2]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship2] ON [dbo].[inventario_fisico_articulo]
(
	[id_inventario_fisico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_relationship1]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship1] ON [dbo].[oferta]
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship1]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship1] ON [dbo].[orden]
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship2]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship2] ON [dbo].[orden_articulo]
(
	[id_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_relationship3]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship3] ON [dbo].[orden_articulo]
(
	[cod_barras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_relationship4]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship4] ON [dbo].[orden_articulo]
(
	[cod_anexo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship4]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship4] ON [dbo].[pedido]
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_relationship1]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship1] ON [dbo].[pedido_articulo]
(
	[cod_anexo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship5]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship5] ON [dbo].[pedido_articulo]
(
	[id_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_relationship6]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship6] ON [dbo].[pedido_articulo]
(
	[cod_barras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_relationship1]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship1] ON [dbo].[pos_control]
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship2]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship2] ON [dbo].[pos_control]
(
	[id_pos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_razon_social_proveedor]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [ix_razon_social_proveedor] ON [dbo].[proveedor]
(
	[razon_social] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_relationship2]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship2] ON [dbo].[salida]
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship5]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship5] ON [dbo].[salida]
(
	[id_movto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_usuario_password]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [ix_usuario_password] ON [dbo].[usuario]
(
	[password] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship2]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship2] ON [dbo].[venta]
(
	[id_pos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_relationship3]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship3] ON [dbo].[venta]
(
	[supervisor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_relationship4]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship4] ON [dbo].[venta]
(
	[vendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship1]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship1] ON [dbo].[venta_articulo]
(
	[id_venta] ASC,
	[id_pos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_relationship2]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship2] ON [dbo].[venta_articulo]
(
	[cod_barras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_relationship3]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship3] ON [dbo].[venta_articulo]
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship4]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship4] ON [dbo].[venta_articulo]
(
	[id_promo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship1]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship1] ON [dbo].[venta_cancelada]
(
	[id_pos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_relationship4]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship4] ON [dbo].[venta_cancelada]
(
	[vendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_relationship5]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship5] ON [dbo].[venta_cancelada]
(
	[supervisor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_relationship3]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship3] ON [dbo].[venta_cancelada_articulo]
(
	[cod_barras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_relationship6]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship6] ON [dbo].[venta_cancelada_articulo]
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_relationship1]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship1] ON [dbo].[venta_devolucion]
(
	[vendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_relationship2]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship2] ON [dbo].[venta_devolucion]
(
	[id_venta] ASC,
	[id_pos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_relationship3]    Script Date: 16/03/2022 07:24:50 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_relationship3] ON [dbo].[venta_devolucion]
(
	[supervisor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[articulo] ADD  DEFAULT ((1)) FOR [cantidad_um]
GO
ALTER TABLE [dbo].[articulo] ADD  DEFAULT ((0)) FOR [precio_compra]
GO
ALTER TABLE [dbo].[articulo] ADD  DEFAULT ((0)) FOR [precio_venta]
GO
ALTER TABLE [dbo].[articulo] ADD  DEFAULT ('principal') FOR [tipo_articulo]
GO
ALTER TABLE [dbo].[articulo] ADD  DEFAULT ((0.0)) FOR [stock]
GO
ALTER TABLE [dbo].[articulo] ADD  DEFAULT ((0.16)) FOR [iva]
GO
ALTER TABLE [dbo].[articulo] ADD  DEFAULT ((1)) FOR [articulo_disponible]
GO
ALTER TABLE [dbo].[articulo] ADD  DEFAULT ((0)) FOR [kit]
GO
ALTER TABLE [dbo].[articulo] ADD  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[articulo] ADD  DEFAULT ((1)) FOR [visible]
GO
ALTER TABLE [dbo].[articulo] ADD  DEFAULT ((0)) FOR [puntos]
GO
ALTER TABLE [dbo].[articulo] ADD  DEFAULT (getdate()) FOR [last_update_inventory]
GO
ALTER TABLE [dbo].[articulo] ADD  DEFAULT ('0') FOR [cve_producto]
GO
ALTER TABLE [dbo].[articulos] ADD  DEFAULT ((1)) FOR [cantidad_um]
GO
ALTER TABLE [dbo].[compra] ADD  DEFAULT ((0)) FOR [cancelada]
GO
ALTER TABLE [dbo].[compra_articulo] ADD  DEFAULT ((0.0)) FOR [cant_cja]
GO
ALTER TABLE [dbo].[compra_articulo] ADD  DEFAULT ((0.0)) FOR [cant_pza]
GO
ALTER TABLE [dbo].[control_errores] ADD  DEFAULT (newid()) FOR [id_error]
GO
ALTER TABLE [dbo].[ctrl_errores] ADD  DEFAULT (getdate()) FOR [fecha_log]
GO
ALTER TABLE [dbo].[direccion_proveedor] ADD  DEFAULT ('méxico') FOR [pais]
GO
ALTER TABLE [dbo].[empleado] ADD  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[empresa] ADD  DEFAULT ('méxico') FOR [pais]
GO
ALTER TABLE [dbo].[empresa] ADD  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[entrada] ADD  DEFAULT ((0)) FOR [cancelada]
GO
ALTER TABLE [dbo].[entrada_articulo] ADD  DEFAULT ((0)) FOR [cant_ent]
GO
ALTER TABLE [dbo].[entrada_articulo] ADD  DEFAULT ((0.0)) FOR [cant_pza]
GO
ALTER TABLE [dbo].[entrada_articulo] ADD  DEFAULT ((0.0)) FOR [cant_reg]
GO
ALTER TABLE [dbo].[entrada_articulo] ADD  DEFAULT ((0.0)) FOR [costo]
GO
ALTER TABLE [dbo].[estadistica] ADD  DEFAULT ((0)) FOR [ene]
GO
ALTER TABLE [dbo].[estadistica] ADD  DEFAULT ((0)) FOR [feb]
GO
ALTER TABLE [dbo].[estadistica] ADD  DEFAULT ((0)) FOR [mar]
GO
ALTER TABLE [dbo].[estadistica] ADD  DEFAULT ((0)) FOR [abr]
GO
ALTER TABLE [dbo].[estadistica] ADD  DEFAULT ((0)) FOR [may]
GO
ALTER TABLE [dbo].[estadistica] ADD  DEFAULT ((0)) FOR [jun]
GO
ALTER TABLE [dbo].[estadistica] ADD  DEFAULT ((0)) FOR [jul]
GO
ALTER TABLE [dbo].[estadistica] ADD  DEFAULT ((0)) FOR [ago]
GO
ALTER TABLE [dbo].[estadistica] ADD  DEFAULT ((0)) FOR [sep]
GO
ALTER TABLE [dbo].[estadistica] ADD  DEFAULT ((0)) FOR [oct]
GO
ALTER TABLE [dbo].[estadistica] ADD  DEFAULT ((0)) FOR [nov]
GO
ALTER TABLE [dbo].[estadistica] ADD  DEFAULT ((0)) FOR [dic]
GO
ALTER TABLE [dbo].[factura] ADD  CONSTRAINT [df_comprobante]  DEFAULT ('FA') FOR [id_comprobante]
GO
ALTER TABLE [dbo].[factura] ADD  CONSTRAINT [df_condicion]  DEFAULT ('PUE') FOR [id_condicion]
GO
ALTER TABLE [dbo].[factura] ADD  CONSTRAINT [df_uso_cfdi]  DEFAULT ('P01') FOR [id_uso]
GO
ALTER TABLE [dbo].[factura_articulo] ADD  DEFAULT ((0)) FOR [iva]
GO
ALTER TABLE [dbo].[factura_articulo] ADD  DEFAULT ((0)) FOR [precio_vta]
GO
ALTER TABLE [dbo].[factura_venta] ADD  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[inventario_articulo] ADD  DEFAULT ((0)) FOR [inventario_ini]
GO
ALTER TABLE [dbo].[inventario_articulo] ADD  DEFAULT ((0)) FOR [entradas]
GO
ALTER TABLE [dbo].[inventario_articulo] ADD  DEFAULT ((0)) FOR [compras]
GO
ALTER TABLE [dbo].[inventario_articulo] ADD  DEFAULT ((0)) FOR [salidas]
GO
ALTER TABLE [dbo].[inventario_articulo] ADD  DEFAULT ((0)) FOR [ventas]
GO
ALTER TABLE [dbo].[inventario_articulo] ADD  DEFAULT ((0.0)) FOR [stock_actual]
GO
ALTER TABLE [dbo].[inventario_captura] ADD  DEFAULT (newid()) FOR [id_captura]
GO
ALTER TABLE [dbo].[inventario_captura] ADD  DEFAULT (newid()) FOR [id_inventario_fisico]
GO
ALTER TABLE [dbo].[inventario_captura] ADD  DEFAULT (getdate()) FOR [fecha_captura]
GO
ALTER TABLE [dbo].[inventario_captura] ADD  DEFAULT ((0)) FOR [cant_cja]
GO
ALTER TABLE [dbo].[inventario_captura] ADD  DEFAULT ((0)) FOR [cant_pza]
GO
ALTER TABLE [dbo].[inventario_captura] ADD  DEFAULT ((0)) FOR [upload]
GO
ALTER TABLE [dbo].[inventario_fisico] ADD  DEFAULT (newid()) FOR [id_inventario_fisico]
GO
ALTER TABLE [dbo].[inventario_fisico] ADD  DEFAULT (getdate()) FOR [fecha_ini]
GO
ALTER TABLE [dbo].[inventario_fisico] ADD  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[inventario_fisico_articulo] ADD  DEFAULT (newid()) FOR [id_inventario_fisico]
GO
ALTER TABLE [dbo].[inventario_fisico_articulo] ADD  DEFAULT ((0.0)) FOR [stock_estimado]
GO
ALTER TABLE [dbo].[inventario_fisico_articulo] ADD  DEFAULT ((0.0)) FOR [stock_fisico]
GO
ALTER TABLE [dbo].[oferta] ADD  DEFAULT (getdate()) FOR [fecha_oferta]
GO
ALTER TABLE [dbo].[oferta_articulo] ADD  DEFAULT ((0.0)) FOR [precio_oferta]
GO
ALTER TABLE [dbo].[oferta_articulo] ADD  DEFAULT ('disponible') FOR [status_oferta]
GO
ALTER TABLE [dbo].[oferta_articulo] ADD  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[orden] ADD  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[orden_articulo] ADD  DEFAULT ((0)) FOR [por_surtir_pzas]
GO
ALTER TABLE [dbo].[orden_articulo] ADD  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[pedido] ADD  DEFAULT ('pendiente') FOR [status_pedido]
GO
ALTER TABLE [dbo].[pedido] ADD  DEFAULT ((0)) FOR [no_dias]
GO
ALTER TABLE [dbo].[pedido_articulo] ADD  DEFAULT ((0)) FOR [cant_original]
GO
ALTER TABLE [dbo].[pedido_articulo] ADD  DEFAULT ((0)) FOR [sugerido]
GO
ALTER TABLE [dbo].[permiso] ADD  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[pos_admin_settings] ADD  DEFAULT ((0.000)) FOR [iva]
GO
ALTER TABLE [dbo].[pos_control] ADD  DEFAULT (getdate()) FOR [pos_open_date]
GO
ALTER TABLE [dbo].[precio_temporal] ADD  DEFAULT ((0.0)) FOR [precio_compra]
GO
ALTER TABLE [dbo].[precio_temporal] ADD  DEFAULT ((0.0)) FOR [utilidad]
GO
ALTER TABLE [dbo].[precio_temporal] ADD  DEFAULT ((0.0)) FOR [precio_venta]
GO
ALTER TABLE [dbo].[precio_temporal] ADD  DEFAULT ((0.0)) FOR [iva]
GO
ALTER TABLE [dbo].[promocion_articulo] ADD  DEFAULT ((0)) FOR [cantidad_lleva]
GO
ALTER TABLE [dbo].[promocion_articulo] ADD  DEFAULT ((0)) FOR [cantidad_paga]
GO
ALTER TABLE [dbo].[promocion_articulo] ADD  DEFAULT ((0.000)) FOR [porcent_desc]
GO
ALTER TABLE [dbo].[proveedor] ADD  DEFAULT ('activo') FOR [estatus]
GO
ALTER TABLE [dbo].[proveedor] ADD  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[salida] ADD  DEFAULT ((0)) FOR [cancelada]
GO
ALTER TABLE [dbo].[salida_articulo] ADD  DEFAULT ((0.0)) FOR [cant_sal]
GO
ALTER TABLE [dbo].[salida_articulo] ADD  DEFAULT ((0.0)) FOR [cant_pza]
GO
ALTER TABLE [dbo].[salida_articulo] ADD  DEFAULT ((0.0)) FOR [cant_reg]
GO
ALTER TABLE [dbo].[salida_articulo] ADD  DEFAULT ((0.0)) FOR [costo]
GO
ALTER TABLE [dbo].[unidad_medida] ADD  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[unidad_medida] ADD  DEFAULT ('0') FOR [cve_sat]
GO
ALTER TABLE [dbo].[usuario] ADD  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[usuario] ADD  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[usuario_permiso] ADD  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[venta] ADD  DEFAULT ((0.0)) FOR [total_vendido]
GO
ALTER TABLE [dbo].[venta] ADD  DEFAULT ((0.0)) FOR [pago_efectivo]
GO
ALTER TABLE [dbo].[venta] ADD  DEFAULT ((0.0)) FOR [pago_cheque]
GO
ALTER TABLE [dbo].[venta] ADD  DEFAULT ((0.0)) FOR [pago_vales]
GO
ALTER TABLE [dbo].[venta] ADD  DEFAULT ((0.0)) FOR [pago_tc]
GO
ALTER TABLE [dbo].[venta] ADD  DEFAULT ((0)) FOR [upload]
GO
ALTER TABLE [dbo].[venta] ADD  DEFAULT ((0)) FOR [num_registros]
GO
ALTER TABLE [dbo].[venta_articulo] ADD  DEFAULT ((0)) FOR [articulo_ofertado]
GO
ALTER TABLE [dbo].[venta_articulo] ADD  DEFAULT ((0.0)) FOR [precio_regular]
GO
ALTER TABLE [dbo].[venta_articulo] ADD  DEFAULT ((0)) FOR [cambio_precio]
GO
ALTER TABLE [dbo].[venta_articulo] ADD  DEFAULT ((0)) FOR [iva]
GO
ALTER TABLE [dbo].[venta_articulo] ADD  DEFAULT ((0.0)) FOR [porcent_desc]
GO
ALTER TABLE [dbo].[venta_articulo] ADD  DEFAULT ((0.0)) FOR [cant_devuelta]
GO
ALTER TABLE [dbo].[venta_cancelada] ADD  DEFAULT ((0)) FOR [total_vendido]
GO
ALTER TABLE [dbo].[venta_cancelada] ADD  DEFAULT ((0)) FOR [pago_efectivo]
GO
ALTER TABLE [dbo].[venta_cancelada] ADD  DEFAULT ((0)) FOR [pago_cheque]
GO
ALTER TABLE [dbo].[venta_cancelada] ADD  DEFAULT ((0)) FOR [pago_vales]
GO
ALTER TABLE [dbo].[venta_cancelada] ADD  DEFAULT ((0)) FOR [pago_tc]
GO
ALTER TABLE [dbo].[venta_cancelada] ADD  DEFAULT ((0)) FOR [upload]
GO
ALTER TABLE [dbo].[venta_cancelada_articulo] ADD  DEFAULT ((0)) FOR [cantidad]
GO
ALTER TABLE [dbo].[venta_cancelada_articulo] ADD  DEFAULT ((0)) FOR [articulo_ofertado]
GO
ALTER TABLE [dbo].[venta_cancelada_articulo] ADD  DEFAULT ((0)) FOR [precio_regular]
GO
ALTER TABLE [dbo].[venta_cancelada_articulo] ADD  DEFAULT ((0)) FOR [cambio_precio]
GO
ALTER TABLE [dbo].[venta_cancelada_articulo] ADD  DEFAULT ((0)) FOR [precio_vta]
GO
ALTER TABLE [dbo].[venta_cancelada_articulo] ADD  DEFAULT ((0)) FOR [porcent_desc]
GO
ALTER TABLE [dbo].[venta_devolucion] ADD  DEFAULT ((0)) FOR [cant_dev]
GO
ALTER TABLE [dbo].[venta_devolucion] ADD  DEFAULT ((0)) FOR [upload]
GO
ALTER TABLE [dbo].[venta_devolucion_articulo] ADD  DEFAULT ((0)) FOR [cantidad]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD  CONSTRAINT [fk_articulo_articulo] FOREIGN KEY([cod_asociado])
REFERENCES [dbo].[articulo] ([cod_barras])
GO
ALTER TABLE [dbo].[articulo] CHECK CONSTRAINT [fk_articulo_articulo]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD  CONSTRAINT [fk_clasificacion_articulo] FOREIGN KEY([id_clasificacion])
REFERENCES [dbo].[clasificacion] ([id_clasificacion])
GO
ALTER TABLE [dbo].[articulo] CHECK CONSTRAINT [fk_clasificacion_articulo]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD  CONSTRAINT [fk_proveedor_articulo] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[articulo] CHECK CONSTRAINT [fk_proveedor_articulo]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD  CONSTRAINT [fk_unidad_articulo] FOREIGN KEY([id_unidad])
REFERENCES [dbo].[unidad_medida] ([id_unidad])
GO
ALTER TABLE [dbo].[articulo] CHECK CONSTRAINT [fk_unidad_articulo]
GO
ALTER TABLE [dbo].[articulos]  WITH CHECK ADD  CONSTRAINT [fk_articulo_articulos] FOREIGN KEY([cod_barras])
REFERENCES [dbo].[articulo] ([cod_barras])
GO
ALTER TABLE [dbo].[articulos] CHECK CONSTRAINT [fk_articulo_articulos]
GO
ALTER TABLE [dbo].[articulos]  WITH CHECK ADD  CONSTRAINT [fk_proveedor_articulos] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[articulos] CHECK CONSTRAINT [fk_proveedor_articulos]
GO
ALTER TABLE [dbo].[articulos]  WITH CHECK ADD  CONSTRAINT [fk_unidad_articulos] FOREIGN KEY([id_unidad])
REFERENCES [dbo].[unidad_medida] ([id_unidad])
GO
ALTER TABLE [dbo].[articulos] CHECK CONSTRAINT [fk_unidad_articulos]
GO
ALTER TABLE [dbo].[clasificacion]  WITH CHECK ADD  CONSTRAINT [fk_clasificacion_subclasificacion] FOREIGN KEY([id_clasificacion_dep])
REFERENCES [dbo].[clasificacion] ([id_clasificacion])
GO
ALTER TABLE [dbo].[clasificacion] CHECK CONSTRAINT [fk_clasificacion_subclasificacion]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [fk_cliente_municipio] FOREIGN KEY([id_municipio], [id_entidad])
REFERENCES [dbo].[municipio] ([id_municipio], [id_entidad])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [fk_cliente_municipio]
GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD  CONSTRAINT [fk_pedido_compra] FOREIGN KEY([id_pedido])
REFERENCES [dbo].[pedido] ([id_pedido])
GO
ALTER TABLE [dbo].[compra] CHECK CONSTRAINT [fk_pedido_compra]
GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD  CONSTRAINT [fk_proveedor_compra] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[compra] CHECK CONSTRAINT [fk_proveedor_compra]
GO
ALTER TABLE [dbo].[compra_articulo]  WITH CHECK ADD  CONSTRAINT [fk_articulo_compra] FOREIGN KEY([cod_barras])
REFERENCES [dbo].[articulo] ([cod_barras])
GO
ALTER TABLE [dbo].[compra_articulo] CHECK CONSTRAINT [fk_articulo_compra]
GO
ALTER TABLE [dbo].[compra_articulo]  WITH CHECK ADD  CONSTRAINT [fk_compra_articulo] FOREIGN KEY([id_compra])
REFERENCES [dbo].[compra] ([id_compra])
GO
ALTER TABLE [dbo].[compra_articulo] CHECK CONSTRAINT [fk_compra_articulo]
GO
ALTER TABLE [dbo].[direccion_proveedor]  WITH CHECK ADD  CONSTRAINT [fk_municipio_direccion] FOREIGN KEY([id_municipio], [id_entidad])
REFERENCES [dbo].[municipio] ([id_municipio], [id_entidad])
GO
ALTER TABLE [dbo].[direccion_proveedor] CHECK CONSTRAINT [fk_municipio_direccion]
GO
ALTER TABLE [dbo].[direccion_proveedor]  WITH CHECK ADD  CONSTRAINT [fk_proveedor_direccion] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[direccion_proveedor] CHECK CONSTRAINT [fk_proveedor_direccion]
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD  CONSTRAINT [fk_usuario_empleado] FOREIGN KEY([user_name])
REFERENCES [dbo].[usuario] ([user_name])
GO
ALTER TABLE [dbo].[empleado] CHECK CONSTRAINT [fk_usuario_empleado]
GO
ALTER TABLE [dbo].[entrada]  WITH CHECK ADD  CONSTRAINT [fk_movimiento_entrada] FOREIGN KEY([id_movto])
REFERENCES [dbo].[movimiento_almacen] ([id_movto])
GO
ALTER TABLE [dbo].[entrada] CHECK CONSTRAINT [fk_movimiento_entrada]
GO
ALTER TABLE [dbo].[entrada]  WITH CHECK ADD  CONSTRAINT [fk_usuario_entrada] FOREIGN KEY([user_name])
REFERENCES [dbo].[usuario] ([user_name])
GO
ALTER TABLE [dbo].[entrada] CHECK CONSTRAINT [fk_usuario_entrada]
GO
ALTER TABLE [dbo].[entrada_articulo]  WITH CHECK ADD  CONSTRAINT [fk_articulo_entrada] FOREIGN KEY([cod_barras])
REFERENCES [dbo].[articulo] ([cod_barras])
GO
ALTER TABLE [dbo].[entrada_articulo] CHECK CONSTRAINT [fk_articulo_entrada]
GO
ALTER TABLE [dbo].[entrada_articulo]  WITH CHECK ADD  CONSTRAINT [fk_entrada_articulo] FOREIGN KEY([id_entrada])
REFERENCES [dbo].[entrada] ([id_entrada])
GO
ALTER TABLE [dbo].[entrada_articulo] CHECK CONSTRAINT [fk_entrada_articulo]
GO
ALTER TABLE [dbo].[estadistica]  WITH CHECK ADD  CONSTRAINT [fk_articulo_estadistica] FOREIGN KEY([cod_barras])
REFERENCES [dbo].[articulo] ([cod_barras])
GO
ALTER TABLE [dbo].[estadistica] CHECK CONSTRAINT [fk_articulo_estadistica]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [fk_cliente_factura] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [fk_cliente_factura]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [fk_factura_comprobante] FOREIGN KEY([id_comprobante])
REFERENCES [dbo].[comprobante] ([id_comprobante])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [fk_factura_comprobante]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [fk_factura_condicion_pago] FOREIGN KEY([id_condicion])
REFERENCES [dbo].[condicion_pago] ([id_condicion])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [fk_factura_condicion_pago]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [fk_factura_uso_cfdi] FOREIGN KEY([id_uso])
REFERENCES [dbo].[uso_cfdi] ([id_uso])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [fk_factura_uso_cfdi]
GO
ALTER TABLE [dbo].[factura_articulo]  WITH CHECK ADD  CONSTRAINT [fk_factura_articulo] FOREIGN KEY([id_factura])
REFERENCES [dbo].[factura] ([id_factura])
GO
ALTER TABLE [dbo].[factura_articulo] CHECK CONSTRAINT [fk_factura_articulo]
GO
ALTER TABLE [dbo].[factura_articulo]  WITH CHECK ADD  CONSTRAINT [fk_factura_unidad] FOREIGN KEY([id_unidad])
REFERENCES [dbo].[unidad_medida] ([id_unidad])
GO
ALTER TABLE [dbo].[factura_articulo] CHECK CONSTRAINT [fk_factura_unidad]
GO
ALTER TABLE [dbo].[factura_metodo_pago]  WITH CHECK ADD  CONSTRAINT [fk_factura_metodo_pago] FOREIGN KEY([id_factura])
REFERENCES [dbo].[factura] ([id_factura])
GO
ALTER TABLE [dbo].[factura_metodo_pago] CHECK CONSTRAINT [fk_factura_metodo_pago]
GO
ALTER TABLE [dbo].[factura_metodo_pago]  WITH CHECK ADD  CONSTRAINT [fk_metodo_pago_factura] FOREIGN KEY([id_metodo])
REFERENCES [dbo].[metodo_pago] ([id_metodo])
GO
ALTER TABLE [dbo].[factura_metodo_pago] CHECK CONSTRAINT [fk_metodo_pago_factura]
GO
ALTER TABLE [dbo].[factura_venta]  WITH CHECK ADD  CONSTRAINT [fk_factura_venta] FOREIGN KEY([id_factura])
REFERENCES [dbo].[factura] ([id_factura])
GO
ALTER TABLE [dbo].[factura_venta] CHECK CONSTRAINT [fk_factura_venta]
GO
ALTER TABLE [dbo].[factura_venta]  WITH CHECK ADD  CONSTRAINT [fk_venta_factura] FOREIGN KEY([id_venta], [id_pos])
REFERENCES [dbo].[venta] ([id_venta], [id_pos])
GO
ALTER TABLE [dbo].[factura_venta] CHECK CONSTRAINT [fk_venta_factura]
GO
ALTER TABLE [dbo].[inventario_articulo]  WITH CHECK ADD  CONSTRAINT [fk_inventario_articulo] FOREIGN KEY([cod_barras])
REFERENCES [dbo].[articulo] ([cod_barras])
GO
ALTER TABLE [dbo].[inventario_articulo] CHECK CONSTRAINT [fk_inventario_articulo]
GO
ALTER TABLE [dbo].[inventario_captura]  WITH CHECK ADD  CONSTRAINT [fk_articulo_captura] FOREIGN KEY([cod_barras])
REFERENCES [dbo].[articulo] ([cod_barras])
GO
ALTER TABLE [dbo].[inventario_captura] CHECK CONSTRAINT [fk_articulo_captura]
GO
ALTER TABLE [dbo].[inventario_captura]  WITH CHECK ADD  CONSTRAINT [fk_inventario_captura] FOREIGN KEY([id_inventario_fisico])
REFERENCES [dbo].[inventario_fisico] ([id_inventario_fisico])
GO
ALTER TABLE [dbo].[inventario_captura] CHECK CONSTRAINT [fk_inventario_captura]
GO
ALTER TABLE [dbo].[inventario_fisico]  WITH CHECK ADD  CONSTRAINT [fk_proveedor_inventario_fisico] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[inventario_fisico] CHECK CONSTRAINT [fk_proveedor_inventario_fisico]
GO
ALTER TABLE [dbo].[inventario_fisico]  WITH CHECK ADD  CONSTRAINT [fk_usuario_inventario] FOREIGN KEY([user_name])
REFERENCES [dbo].[usuario] ([user_name])
GO
ALTER TABLE [dbo].[inventario_fisico] CHECK CONSTRAINT [fk_usuario_inventario]
GO
ALTER TABLE [dbo].[inventario_fisico_articulo]  WITH CHECK ADD  CONSTRAINT [fk_articulo_inventario_fisico] FOREIGN KEY([cod_barras])
REFERENCES [dbo].[articulo] ([cod_barras])
GO
ALTER TABLE [dbo].[inventario_fisico_articulo] CHECK CONSTRAINT [fk_articulo_inventario_fisico]
GO
ALTER TABLE [dbo].[inventario_fisico_articulo]  WITH CHECK ADD  CONSTRAINT [fk_inventario_fisico_articulo] FOREIGN KEY([id_inventario_fisico])
REFERENCES [dbo].[inventario_fisico] ([id_inventario_fisico])
GO
ALTER TABLE [dbo].[inventario_fisico_articulo] CHECK CONSTRAINT [fk_inventario_fisico_articulo]
GO
ALTER TABLE [dbo].[kit_articulos]  WITH CHECK ADD  CONSTRAINT [fk_articulo_kit] FOREIGN KEY([cod_barras_kit])
REFERENCES [dbo].[articulo] ([cod_barras])
GO
ALTER TABLE [dbo].[kit_articulos] CHECK CONSTRAINT [fk_articulo_kit]
GO
ALTER TABLE [dbo].[kit_articulos]  WITH CHECK ADD  CONSTRAINT [fk_articulos_kit] FOREIGN KEY([cod_barras_pro])
REFERENCES [dbo].[articulo] ([cod_barras])
GO
ALTER TABLE [dbo].[kit_articulos] CHECK CONSTRAINT [fk_articulos_kit]
GO
ALTER TABLE [dbo].[municipio]  WITH CHECK ADD  CONSTRAINT [fk_entidad_municipio] FOREIGN KEY([id_entidad])
REFERENCES [dbo].[entidad] ([id_entidad])
GO
ALTER TABLE [dbo].[municipio] CHECK CONSTRAINT [fk_entidad_municipio]
GO
ALTER TABLE [dbo].[oferta]  WITH CHECK ADD  CONSTRAINT [fk_usuario_oferta] FOREIGN KEY([user_name])
REFERENCES [dbo].[usuario] ([user_name])
GO
ALTER TABLE [dbo].[oferta] CHECK CONSTRAINT [fk_usuario_oferta]
GO
ALTER TABLE [dbo].[oferta_articulo]  WITH CHECK ADD  CONSTRAINT [fk_articulo_oferta] FOREIGN KEY([cod_barras])
REFERENCES [dbo].[articulo] ([cod_barras])
GO
ALTER TABLE [dbo].[oferta_articulo] CHECK CONSTRAINT [fk_articulo_oferta]
GO
ALTER TABLE [dbo].[oferta_articulo]  WITH CHECK ADD  CONSTRAINT [fk_oferta_articulo] FOREIGN KEY([id_oferta])
REFERENCES [dbo].[oferta] ([id_oferta])
GO
ALTER TABLE [dbo].[oferta_articulo] CHECK CONSTRAINT [fk_oferta_articulo]
GO
ALTER TABLE [dbo].[orden]  WITH CHECK ADD  CONSTRAINT [fk_order_proveedor] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[orden] CHECK CONSTRAINT [fk_order_proveedor]
GO
ALTER TABLE [dbo].[orden_articulo]  WITH CHECK ADD  CONSTRAINT [fk_orden_articulo] FOREIGN KEY([id_pedido])
REFERENCES [dbo].[orden] ([id_pedido])
GO
ALTER TABLE [dbo].[orden_articulo] CHECK CONSTRAINT [fk_orden_articulo]
GO
ALTER TABLE [dbo].[orden_articulo]  WITH CHECK ADD  CONSTRAINT [fk_orden_articulo_anexo] FOREIGN KEY([cod_anexo])
REFERENCES [dbo].[articulo] ([cod_barras])
GO
ALTER TABLE [dbo].[orden_articulo] CHECK CONSTRAINT [fk_orden_articulo_anexo]
GO
ALTER TABLE [dbo].[orden_articulo]  WITH CHECK ADD  CONSTRAINT [fk_orden_articulo_principal] FOREIGN KEY([cod_barras])
REFERENCES [dbo].[articulo] ([cod_barras])
GO
ALTER TABLE [dbo].[orden_articulo] CHECK CONSTRAINT [fk_orden_articulo_principal]
GO
ALTER TABLE [dbo].[pedido]  WITH CHECK ADD  CONSTRAINT [fk_proveedor_pedido] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[pedido] CHECK CONSTRAINT [fk_proveedor_pedido]
GO
ALTER TABLE [dbo].[pedido_articulo]  WITH CHECK ADD  CONSTRAINT [fk_articulo_pedido] FOREIGN KEY([cod_barras])
REFERENCES [dbo].[articulo] ([cod_barras])
GO
ALTER TABLE [dbo].[pedido_articulo] CHECK CONSTRAINT [fk_articulo_pedido]
GO
ALTER TABLE [dbo].[pedido_articulo]  WITH CHECK ADD  CONSTRAINT [fk_articulo_pedido_anexo] FOREIGN KEY([cod_anexo])
REFERENCES [dbo].[articulo] ([cod_barras])
GO
ALTER TABLE [dbo].[pedido_articulo] CHECK CONSTRAINT [fk_articulo_pedido_anexo]
GO
ALTER TABLE [dbo].[pedido_articulo]  WITH CHECK ADD  CONSTRAINT [fk_pedido_articulo] FOREIGN KEY([id_pedido])
REFERENCES [dbo].[pedido] ([id_pedido])
GO
ALTER TABLE [dbo].[pedido_articulo] CHECK CONSTRAINT [fk_pedido_articulo]
GO
ALTER TABLE [dbo].[pos_control]  WITH CHECK ADD  CONSTRAINT [usuario_pos_control] FOREIGN KEY([user_name])
REFERENCES [dbo].[usuario] ([user_name])
GO
ALTER TABLE [dbo].[pos_control] CHECK CONSTRAINT [usuario_pos_control]
GO
ALTER TABLE [dbo].[precio_temporal]  WITH CHECK ADD  CONSTRAINT [fk_articulo_temporal] FOREIGN KEY([cod_barras])
REFERENCES [dbo].[articulo] ([cod_barras])
GO
ALTER TABLE [dbo].[precio_temporal] CHECK CONSTRAINT [fk_articulo_temporal]
GO
ALTER TABLE [dbo].[promocion_articulo]  WITH CHECK ADD  CONSTRAINT [fk_articulo_promocion] FOREIGN KEY([cod_barras])
REFERENCES [dbo].[articulo] ([cod_barras])
GO
ALTER TABLE [dbo].[promocion_articulo] CHECK CONSTRAINT [fk_articulo_promocion]
GO
ALTER TABLE [dbo].[promocion_articulo]  WITH CHECK ADD  CONSTRAINT [fk_promocion_articulo] FOREIGN KEY([id_promo])
REFERENCES [dbo].[promocion] ([id_promo])
GO
ALTER TABLE [dbo].[promocion_articulo] CHECK CONSTRAINT [fk_promocion_articulo]
GO
ALTER TABLE [dbo].[salida]  WITH CHECK ADD  CONSTRAINT [fk_movimiento_salida] FOREIGN KEY([id_movto])
REFERENCES [dbo].[movimiento_almacen] ([id_movto])
GO
ALTER TABLE [dbo].[salida] CHECK CONSTRAINT [fk_movimiento_salida]
GO
ALTER TABLE [dbo].[salida]  WITH CHECK ADD  CONSTRAINT [fk_usuario_salida] FOREIGN KEY([user_name])
REFERENCES [dbo].[usuario] ([user_name])
GO
ALTER TABLE [dbo].[salida] CHECK CONSTRAINT [fk_usuario_salida]
GO
ALTER TABLE [dbo].[salida_articulo]  WITH CHECK ADD  CONSTRAINT [fk_articulo_salida] FOREIGN KEY([cod_barras])
REFERENCES [dbo].[articulo] ([cod_barras])
GO
ALTER TABLE [dbo].[salida_articulo] CHECK CONSTRAINT [fk_articulo_salida]
GO
ALTER TABLE [dbo].[salida_articulo]  WITH CHECK ADD  CONSTRAINT [fk_salida_articulo] FOREIGN KEY([id_salida])
REFERENCES [dbo].[salida] ([id_salida])
GO
ALTER TABLE [dbo].[salida_articulo] CHECK CONSTRAINT [fk_salida_articulo]
GO
ALTER TABLE [dbo].[usuario_permiso]  WITH CHECK ADD  CONSTRAINT [fk_permiso_usuario] FOREIGN KEY([id_permiso])
REFERENCES [dbo].[permiso] ([id_permiso])
GO
ALTER TABLE [dbo].[usuario_permiso] CHECK CONSTRAINT [fk_permiso_usuario]
GO
ALTER TABLE [dbo].[usuario_permiso]  WITH CHECK ADD  CONSTRAINT [fk_usuario_permiso] FOREIGN KEY([user_name])
REFERENCES [dbo].[usuario] ([user_name])
GO
ALTER TABLE [dbo].[usuario_permiso] CHECK CONSTRAINT [fk_usuario_permiso]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [fk_usuario_cancelacion] FOREIGN KEY([supervisor])
REFERENCES [dbo].[usuario] ([user_name])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [fk_usuario_cancelacion]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [fk_usuario_venta] FOREIGN KEY([vendedor])
REFERENCES [dbo].[usuario] ([user_name])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [fk_usuario_venta]
GO
ALTER TABLE [dbo].[venta_articulo]  WITH CHECK ADD  CONSTRAINT [fk_articulo_venta] FOREIGN KEY([cod_barras])
REFERENCES [dbo].[articulo] ([cod_barras])
GO
ALTER TABLE [dbo].[venta_articulo] CHECK CONSTRAINT [fk_articulo_venta]
GO
ALTER TABLE [dbo].[venta_articulo]  WITH CHECK ADD  CONSTRAINT [fk_promocion_venta_articulo] FOREIGN KEY([id_promo])
REFERENCES [dbo].[promocion] ([id_promo])
GO
ALTER TABLE [dbo].[venta_articulo] CHECK CONSTRAINT [fk_promocion_venta_articulo]
GO
ALTER TABLE [dbo].[venta_articulo]  WITH CHECK ADD  CONSTRAINT [fk_usuario_cambia_precio] FOREIGN KEY([user_name])
REFERENCES [dbo].[usuario] ([user_name])
GO
ALTER TABLE [dbo].[venta_articulo] CHECK CONSTRAINT [fk_usuario_cambia_precio]
GO
ALTER TABLE [dbo].[venta_articulo]  WITH CHECK ADD  CONSTRAINT [fk_venta_articulo] FOREIGN KEY([id_venta], [id_pos])
REFERENCES [dbo].[venta] ([id_venta], [id_pos])
GO
ALTER TABLE [dbo].[venta_articulo] CHECK CONSTRAINT [fk_venta_articulo]
GO
ALTER TABLE [dbo].[venta_cancelada]  WITH CHECK ADD  CONSTRAINT [fk_venta_cancelada_supervisor] FOREIGN KEY([supervisor])
REFERENCES [dbo].[usuario] ([user_name])
GO
ALTER TABLE [dbo].[venta_cancelada] CHECK CONSTRAINT [fk_venta_cancelada_supervisor]
GO
ALTER TABLE [dbo].[venta_cancelada]  WITH CHECK ADD  CONSTRAINT [fk_venta_cancelada_vendedor] FOREIGN KEY([vendedor])
REFERENCES [dbo].[usuario] ([user_name])
GO
ALTER TABLE [dbo].[venta_cancelada] CHECK CONSTRAINT [fk_venta_cancelada_vendedor]
GO
ALTER TABLE [dbo].[venta_cancelada_articulo]  WITH CHECK ADD  CONSTRAINT [fk_articulo_venta_cancelada] FOREIGN KEY([cod_barras])
REFERENCES [dbo].[articulo] ([cod_barras])
GO
ALTER TABLE [dbo].[venta_cancelada_articulo] CHECK CONSTRAINT [fk_articulo_venta_cancelada]
GO
ALTER TABLE [dbo].[venta_cancelada_articulo]  WITH CHECK ADD  CONSTRAINT [fk_venta_cancelada_articulo] FOREIGN KEY([id_venta_cancel], [id_pos])
REFERENCES [dbo].[venta_cancelada] ([id_venta_cancel], [id_pos])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[venta_cancelada_articulo] CHECK CONSTRAINT [fk_venta_cancelada_articulo]
GO
ALTER TABLE [dbo].[venta_cancelada_articulo]  WITH CHECK ADD  CONSTRAINT [fk_venta_cancelada_articulo_usuario] FOREIGN KEY([user_name])
REFERENCES [dbo].[usuario] ([user_name])
GO
ALTER TABLE [dbo].[venta_cancelada_articulo] CHECK CONSTRAINT [fk_venta_cancelada_articulo_usuario]
GO
ALTER TABLE [dbo].[venta_devolucion]  WITH CHECK ADD  CONSTRAINT [fk_usuario_devolucion_supervisor] FOREIGN KEY([supervisor])
REFERENCES [dbo].[usuario] ([user_name])
GO
ALTER TABLE [dbo].[venta_devolucion] CHECK CONSTRAINT [fk_usuario_devolucion_supervisor]
GO
ALTER TABLE [dbo].[venta_devolucion]  WITH CHECK ADD  CONSTRAINT [fk_usuario_devolucion_vendedor] FOREIGN KEY([vendedor])
REFERENCES [dbo].[usuario] ([user_name])
GO
ALTER TABLE [dbo].[venta_devolucion] CHECK CONSTRAINT [fk_usuario_devolucion_vendedor]
GO
ALTER TABLE [dbo].[venta_devolucion]  WITH CHECK ADD  CONSTRAINT [fk_venta_devolucion] FOREIGN KEY([id_venta], [id_pos])
REFERENCES [dbo].[venta] ([id_venta], [id_pos])
GO
ALTER TABLE [dbo].[venta_devolucion] CHECK CONSTRAINT [fk_venta_devolucion]
GO
ALTER TABLE [dbo].[venta_devolucion_articulo]  WITH CHECK ADD  CONSTRAINT [fk_venta_devolucion_articulo] FOREIGN KEY([id_devolucion])
REFERENCES [dbo].[venta_devolucion] ([id_devolucion])
GO
ALTER TABLE [dbo].[venta_devolucion_articulo] CHECK CONSTRAINT [fk_venta_devolucion_articulo]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD  CONSTRAINT [ck_cod_barras] CHECK  (([cod_barras] like '[0-9][0-9][0-9][0-9][0-9][0-9]%'))
GO
ALTER TABLE [dbo].[articulo] CHECK CONSTRAINT [ck_cod_barras]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD  CONSTRAINT [ck_tipo_articulo] CHECK  (([tipo_articulo]='kit' OR [tipo_articulo]='anexo' OR [tipo_articulo]='asociado' OR [tipo_articulo]='principal'))
GO
ALTER TABLE [dbo].[articulo] CHECK CONSTRAINT [ck_tipo_articulo]
GO
ALTER TABLE [dbo].[movimiento_almacen]  WITH CHECK ADD  CONSTRAINT [ck_tipo_mvto] CHECK  (([tipo_movto]='salida' OR [tipo_movto]='entrada'))
GO
ALTER TABLE [dbo].[movimiento_almacen] CHECK CONSTRAINT [ck_tipo_mvto]
GO
ALTER TABLE [dbo].[oferta]  WITH CHECK ADD  CONSTRAINT [checkconstrainta1] CHECK  (([status_oferta]='cancelada' OR [status_oferta]='suspendida' OR [status_oferta]='disponible'))
GO
ALTER TABLE [dbo].[oferta] CHECK CONSTRAINT [checkconstrainta1]
GO
ALTER TABLE [dbo].[oferta_articulo]  WITH CHECK ADD  CONSTRAINT [ck_status_oferta_articulo] CHECK  (([status_oferta]='cancelada' OR [status_oferta]='suspendida' OR [status_oferta]='disponible'))
GO
ALTER TABLE [dbo].[oferta_articulo] CHECK CONSTRAINT [ck_status_oferta_articulo]
GO
ALTER TABLE [dbo].[orden]  WITH CHECK ADD  CONSTRAINT [ck_status_order] CHECK  (([status_pedido]='surtido' OR [status_pedido]='autorizado'))
GO
ALTER TABLE [dbo].[orden] CHECK CONSTRAINT [ck_status_order]
GO
ALTER TABLE [dbo].[pedido]  WITH CHECK ADD  CONSTRAINT [ck_status_pedido] CHECK  (([status_pedido]='autorizado' OR [status_pedido]='suspendido' OR [status_pedido]='no autorizado' OR [status_pedido]='pendiente'))
GO
ALTER TABLE [dbo].[pedido] CHECK CONSTRAINT [ck_status_pedido]
GO
ALTER TABLE [dbo].[permiso]  WITH CHECK ADD  CONSTRAINT [ck_tipo_sistema] CHECK  (([tipo_sistema]='pos_colector' OR [tipo_sistema]='pos_caja' OR [tipo_sistema]='pos_admin'))
GO
ALTER TABLE [dbo].[permiso] CHECK CONSTRAINT [ck_tipo_sistema]
GO
ALTER TABLE [dbo].[proveedor]  WITH CHECK ADD  CONSTRAINT [ck_proveedor_status] CHECK  (([estatus]='moroso' OR [estatus]='suspendido' OR [estatus]='baja' OR [estatus]='activo'))
GO
ALTER TABLE [dbo].[proveedor] CHECK CONSTRAINT [ck_proveedor_status]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [ck_tipo_usuario] CHECK  (([tipo_usuario]='supervisor' OR [tipo_usuario]='cajero' OR [tipo_usuario]='administrador'))
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [ck_tipo_usuario]
GO
ALTER TABLE [dbo].[venta_cancelada]  WITH CHECK ADD  CONSTRAINT [ch_status_vta_cancelada] CHECK  (([status]='suspecancel' OR [status]='vendida' OR [status]='cancelada' OR [status]='suspendida'))
GO
ALTER TABLE [dbo].[venta_cancelada] CHECK CONSTRAINT [ch_status_vta_cancelada]
GO
/****** Object:  StoredProcedure [dbo].[reset_estadistica]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--En caso de existir, utilizar ALTER en lugar de CREATE
CREATE PROCEDURE [dbo].[reset_estadistica]
@anio SMALLINT
AS
 BEGIN
	DECLARE @barCode VARCHAR(20),
			@mes SMALLINT,
			@cant DECIMAL(19,3)	

	--Elimina estadisticas
	IF EXISTS(SELECT DISTINCT anio FROM estadistica WHERE anio=@anio)
	 BEGIN
	  DELETE FROM estadistica WHERE anio=@anio
	 END

	 --Reinicia en 0s las estadisticas con los articulos principales
	 INSERT INTO estadistica(anio,cod_barras) 
	 SELECT @anio, a.cod_barras FROM articulo a WHERE a.tipo_articulo='principal'

	

	DECLARE cur_estadistica CURSOR
	 FOR SELECT e.cod_barras FROM estadistica e WHERE e.anio=@anio

	OPEN cur_estadistica

	FETCH NEXT FROM cur_estadistica INTO @barCode

	WHILE(@@FETCH_STATUS=0)
	 BEGIN
	 
		 --ENERO
		 SET @mes = 1 

		 --Contabiliza articulos principales, asociados y anexos
		 SELECT @cant = ISNULL(SUM(va.cantidad*i.cantidad_um),0.0)
		 FROM venta_articulo va 
		  JOIN venta v ON va.id_venta=v.id_venta
		  JOIN ( SELECT cod_barras, cantidad_um FROM articulo 
				 WHERE cod_barras=@barCode OR cod_asociado=@barCode) i ON va.cod_barras=i.cod_barras
		 WHERE YEAR(v.fecha_venta)=@anio AND MONTH(v.fecha_venta)=@mes

		 --Disminuye a los artículos devueltos
		 SELECT @cant = @cant - ISNULL(SUM(vda.cantidad*i.cantidad_um),0.0)
		 FROM venta_devolucion_articulo vda 
		  JOIN venta_devolucion vd ON vda.id_devolucion=vd.id_devolucion
		  JOIN ( SELECT cod_barras, cantidad_um FROM articulo 
				 WHERE cod_barras=@barCode OR cod_asociado=@barCode) i ON vda.cod_barras=i.cod_barras
		 WHERE YEAR(vd.fecha_dev)=@anio AND MONTH(vd.fecha_dev)=@mes

		 SELECT @cant = @cant + ISNULL(sum((va.cantidad)*a.cantidad_um*ka.cantidad), 0.000)
		 FROM venta v 
		  JOIN venta_articulo va ON v.id_venta=va.id_venta
		  JOIN articulo a ON a.cod_barras = va.cod_barras OR a.cod_asociado=va.cod_barras
		  JOIN kit_articulos ka ON ka.cod_barras_kit=va.cod_barras
		 WHERE ka.cod_barras_pro = @barCode AND YEAR(v.fecha_venta) = @anio AND MONTH(v.fecha_venta) = @mes

		 UPDATE estadistica SET ene=@cant WHERE anio=@anio AND cod_barras=@barCode

		 --FEBRERO
		 SET @mes = 2 

		 --Contabiliza articulos principales, asociados y anexos
		 SELECT @cant = ISNULL(SUM(va.cantidad*i.cantidad_um),0.0)
		 FROM venta_articulo va 
		  JOIN venta v ON va.id_venta=v.id_venta
		  JOIN ( SELECT cod_barras, cantidad_um FROM articulo 
				 WHERE cod_barras=@barCode OR cod_asociado=@barCode) i ON va.cod_barras=i.cod_barras
		 WHERE YEAR(v.fecha_venta)=@anio AND MONTH(v.fecha_venta)=@mes

		 --Disminuye a los artículos devueltos
		 SELECT @cant = @cant - ISNULL(SUM(vda.cantidad*i.cantidad_um),0.0)
		 FROM venta_devolucion_articulo vda 
		  JOIN venta_devolucion vd ON vda.id_devolucion=vd.id_devolucion
		  JOIN ( SELECT cod_barras, cantidad_um FROM articulo 
				 WHERE cod_barras=@barCode OR cod_asociado=@barCode) i ON vda.cod_barras=i.cod_barras
		 WHERE YEAR(vd.fecha_dev)=@anio AND MONTH(vd.fecha_dev)=@mes

		 SELECT @cant = @cant + ISNULL(sum((va.cantidad)*a.cantidad_um*ka.cantidad), 0.000)
		 FROM venta v 
		  JOIN venta_articulo va ON v.id_venta=va.id_venta
		  JOIN articulo a ON a.cod_barras = va.cod_barras OR a.cod_asociado=va.cod_barras
		  JOIN kit_articulos ka ON ka.cod_barras_kit=va.cod_barras
		 WHERE ka.cod_barras_pro = @barCode AND YEAR(v.fecha_venta) = @anio AND MONTH(v.fecha_venta) = @mes

		 UPDATE estadistica SET feb=@cant WHERE anio=@anio AND cod_barras=@barCode
		 
		 --MARZO
		 SET @mes = 3

		 --Contabiliza articulos principales, asociados y anexos
		 SELECT @cant = ISNULL(SUM(va.cantidad*i.cantidad_um),0.0)
		 FROM venta_articulo va 
		  JOIN venta v ON va.id_venta=v.id_venta
		  JOIN ( SELECT cod_barras, cantidad_um FROM articulo 
				 WHERE cod_barras=@barCode OR cod_asociado=@barCode) i ON va.cod_barras=i.cod_barras
		 WHERE YEAR(v.fecha_venta)=@anio AND MONTH(v.fecha_venta)=@mes

		 --Disminuye a los artículos devueltos
		 SELECT @cant = @cant - ISNULL(SUM(vda.cantidad*i.cantidad_um),0.0)
		 FROM venta_devolucion_articulo vda 
		  JOIN venta_devolucion vd ON vda.id_devolucion=vd.id_devolucion
		  JOIN ( SELECT cod_barras, cantidad_um FROM articulo 
				 WHERE cod_barras=@barCode OR cod_asociado=@barCode) i ON vda.cod_barras=i.cod_barras
		 WHERE YEAR(vd.fecha_dev)=@anio AND MONTH(vd.fecha_dev)=@mes

		 SELECT @cant = @cant + ISNULL(sum((va.cantidad)*a.cantidad_um*ka.cantidad), 0.000)
		 FROM venta v 
		  JOIN venta_articulo va ON v.id_venta=va.id_venta
		  JOIN articulo a ON a.cod_barras = va.cod_barras OR a.cod_asociado=va.cod_barras
		  JOIN kit_articulos ka ON ka.cod_barras_kit=va.cod_barras
		 WHERE ka.cod_barras_pro = @barCode AND YEAR(v.fecha_venta) = @anio AND MONTH(v.fecha_venta) = @mes

		 UPDATE estadistica SET mar=@cant WHERE anio=@anio AND cod_barras=@barCode
		 
		 --ABRIL
		 SET @mes = 4

		 --Contabiliza articulos principales, asociados y anexos
		 SELECT @cant = ISNULL(SUM(va.cantidad*i.cantidad_um),0.0)
		 FROM venta_articulo va 
		  JOIN venta v ON va.id_venta=v.id_venta
		  JOIN ( SELECT cod_barras, cantidad_um FROM articulo 
				 WHERE cod_barras=@barCode OR cod_asociado=@barCode) i ON va.cod_barras=i.cod_barras
		 WHERE YEAR(v.fecha_venta)=@anio AND MONTH(v.fecha_venta)=@mes

		 --Disminuye a los artículos devueltos
		 SELECT @cant = @cant - ISNULL(SUM(vda.cantidad*i.cantidad_um),0.0)
		 FROM venta_devolucion_articulo vda 
		  JOIN venta_devolucion vd ON vda.id_devolucion=vd.id_devolucion
		  JOIN ( SELECT cod_barras, cantidad_um FROM articulo 
				 WHERE cod_barras=@barCode OR cod_asociado=@barCode) i ON vda.cod_barras=i.cod_barras
		 WHERE YEAR(vd.fecha_dev)=@anio AND MONTH(vd.fecha_dev)=@mes

		 SELECT @cant = @cant + ISNULL(sum((va.cantidad)*a.cantidad_um*ka.cantidad), 0.000)
		 FROM venta v 
		  JOIN venta_articulo va ON v.id_venta=va.id_venta
		  JOIN articulo a ON a.cod_barras = va.cod_barras OR a.cod_asociado=va.cod_barras
		  JOIN kit_articulos ka ON ka.cod_barras_kit=va.cod_barras
		 WHERE ka.cod_barras_pro = @barCode AND YEAR(v.fecha_venta) = @anio AND MONTH(v.fecha_venta) = @mes

		 UPDATE estadistica SET abr=@cant WHERE anio=@anio AND cod_barras=@barCode
		 
		 --MAYO
		 SET @mes = 5

		 --Contabiliza articulos principales, asociados y anexos
		 SELECT @cant = ISNULL(SUM(va.cantidad*i.cantidad_um),0.0)
		 FROM venta_articulo va 
		  JOIN venta v ON va.id_venta=v.id_venta
		  JOIN ( SELECT cod_barras, cantidad_um FROM articulo 
				 WHERE cod_barras=@barCode OR cod_asociado=@barCode) i ON va.cod_barras=i.cod_barras
		 WHERE YEAR(v.fecha_venta)=@anio AND MONTH(v.fecha_venta)=@mes

		 --Disminuye a los artículos devueltos
		 SELECT @cant = @cant - ISNULL(SUM(vda.cantidad*i.cantidad_um),0.0)
		 FROM venta_devolucion_articulo vda 
		  JOIN venta_devolucion vd ON vda.id_devolucion=vd.id_devolucion
		  JOIN ( SELECT cod_barras, cantidad_um FROM articulo 
				 WHERE cod_barras=@barCode OR cod_asociado=@barCode) i ON vda.cod_barras=i.cod_barras
		 WHERE YEAR(vd.fecha_dev)=@anio AND MONTH(vd.fecha_dev)=@mes

		 SELECT @cant = @cant + ISNULL(sum((va.cantidad)*a.cantidad_um*ka.cantidad), 0.000)
		 FROM venta v 
		  JOIN venta_articulo va ON v.id_venta=va.id_venta
		  JOIN articulo a ON a.cod_barras = va.cod_barras OR a.cod_asociado=va.cod_barras
		  JOIN kit_articulos ka ON ka.cod_barras_kit=va.cod_barras
		 WHERE ka.cod_barras_pro = @barCode AND YEAR(v.fecha_venta) = @anio AND MONTH(v.fecha_venta) = @mes

		 UPDATE estadistica SET may=@cant WHERE anio=@anio AND cod_barras=@barCode
		 
		 --JUNIO
		 SET @mes = 6

		 --Contabiliza articulos principales, asociados y anexos
		 SELECT @cant = ISNULL(SUM(va.cantidad*i.cantidad_um),0.0)
		 FROM venta_articulo va 
		  JOIN venta v ON va.id_venta=v.id_venta
		  JOIN ( SELECT cod_barras, cantidad_um FROM articulo 
				 WHERE cod_barras=@barCode OR cod_asociado=@barCode) i ON va.cod_barras=i.cod_barras
		 WHERE YEAR(v.fecha_venta)=@anio AND MONTH(v.fecha_venta)=@mes

		 --Disminuye a los artículos devueltos
		 SELECT @cant = @cant - ISNULL(SUM(vda.cantidad*i.cantidad_um),0.0)
		 FROM venta_devolucion_articulo vda 
		  JOIN venta_devolucion vd ON vda.id_devolucion=vd.id_devolucion
		  JOIN ( SELECT cod_barras, cantidad_um FROM articulo 
				 WHERE cod_barras=@barCode OR cod_asociado=@barCode) i ON vda.cod_barras=i.cod_barras
		 WHERE YEAR(vd.fecha_dev)=@anio AND MONTH(vd.fecha_dev)=@mes

		 SELECT @cant = @cant + ISNULL(sum((va.cantidad)*a.cantidad_um*ka.cantidad), 0.000)
		 FROM venta v 
		  JOIN venta_articulo va ON v.id_venta=va.id_venta
		  JOIN articulo a ON a.cod_barras = va.cod_barras OR a.cod_asociado=va.cod_barras
		  JOIN kit_articulos ka ON ka.cod_barras_kit=va.cod_barras
		 WHERE ka.cod_barras_pro = @barCode AND YEAR(v.fecha_venta) = @anio AND MONTH(v.fecha_venta) = @mes

		 UPDATE estadistica SET jun=@cant WHERE anio=@anio AND cod_barras=@barCode
		 
		 --JULIO
		 SET @mes = 7

		 --Contabiliza articulos principales, asociados y anexos
		 SELECT @cant = ISNULL(SUM(va.cantidad*i.cantidad_um),0.0)
		 FROM venta_articulo va 
		  JOIN venta v ON va.id_venta=v.id_venta
		  JOIN ( SELECT cod_barras, cantidad_um FROM articulo 
				 WHERE cod_barras=@barCode OR cod_asociado=@barCode) i ON va.cod_barras=i.cod_barras
		 WHERE YEAR(v.fecha_venta)=@anio AND MONTH(v.fecha_venta)=@mes

		 --Disminuye a los artículos devueltos
		 SELECT @cant = @cant - ISNULL(SUM(vda.cantidad*i.cantidad_um),0.0)
		 FROM venta_devolucion_articulo vda 
		  JOIN venta_devolucion vd ON vda.id_devolucion=vd.id_devolucion
		  JOIN ( SELECT cod_barras, cantidad_um FROM articulo 
				 WHERE cod_barras=@barCode OR cod_asociado=@barCode) i ON vda.cod_barras=i.cod_barras
		 WHERE YEAR(vd.fecha_dev)=@anio AND MONTH(vd.fecha_dev)=@mes

		 SELECT @cant = @cant + ISNULL(sum((va.cantidad)*a.cantidad_um*ka.cantidad), 0.000)
		 FROM venta v 
		  JOIN venta_articulo va ON v.id_venta=va.id_venta
		  JOIN articulo a ON a.cod_barras = va.cod_barras OR a.cod_asociado=va.cod_barras
		  JOIN kit_articulos ka ON ka.cod_barras_kit=va.cod_barras
		 WHERE ka.cod_barras_pro = @barCode AND YEAR(v.fecha_venta) = @anio AND MONTH(v.fecha_venta) = @mes

		 UPDATE estadistica SET jul=@cant WHERE anio=@anio AND cod_barras=@barCode
		 
		 --AGOSTO
		 SET @mes = 8

		 --Contabiliza articulos principales, asociados y anexos
		 SELECT @cant = ISNULL(SUM(va.cantidad*i.cantidad_um),0.0)
		 FROM venta_articulo va 
		  JOIN venta v ON va.id_venta=v.id_venta
		  JOIN ( SELECT cod_barras, cantidad_um FROM articulo 
				 WHERE cod_barras=@barCode OR cod_asociado=@barCode) i ON va.cod_barras=i.cod_barras
		 WHERE YEAR(v.fecha_venta)=@anio AND MONTH(v.fecha_venta)=@mes

		 --Disminuye a los artículos devueltos
		 SELECT @cant = @cant - ISNULL(SUM(vda.cantidad*i.cantidad_um),0.0)
		 FROM venta_devolucion_articulo vda 
		  JOIN venta_devolucion vd ON vda.id_devolucion=vd.id_devolucion
		  JOIN ( SELECT cod_barras, cantidad_um FROM articulo 
				 WHERE cod_barras=@barCode OR cod_asociado=@barCode) i ON vda.cod_barras=i.cod_barras
		 WHERE YEAR(vd.fecha_dev)=@anio AND MONTH(vd.fecha_dev)=@mes

		 SELECT @cant = @cant + ISNULL(sum((va.cantidad)*a.cantidad_um*ka.cantidad), 0.000)
		 FROM venta v 
		  JOIN venta_articulo va ON v.id_venta=va.id_venta
		  JOIN articulo a ON a.cod_barras = va.cod_barras OR a.cod_asociado=va.cod_barras
		  JOIN kit_articulos ka ON ka.cod_barras_kit=va.cod_barras
		 WHERE ka.cod_barras_pro = @barCode AND YEAR(v.fecha_venta) = @anio AND MONTH(v.fecha_venta) = @mes

		 UPDATE estadistica SET ago=@cant WHERE anio=@anio AND cod_barras=@barCode
		 
		 --SEPTIEMBRE
		 SET @mes = 9

		 --Contabiliza articulos principales, asociados y anexos
		 SELECT @cant = ISNULL(SUM(va.cantidad*i.cantidad_um),0.0)
		 FROM venta_articulo va 
		  JOIN venta v ON va.id_venta=v.id_venta
		  JOIN ( SELECT cod_barras, cantidad_um FROM articulo 
				 WHERE cod_barras=@barCode OR cod_asociado=@barCode) i ON va.cod_barras=i.cod_barras
		 WHERE YEAR(v.fecha_venta)=@anio AND MONTH(v.fecha_venta)=@mes

		 --Disminuye a los artículos devueltos
		 SELECT @cant = @cant - ISNULL(SUM(vda.cantidad*i.cantidad_um),0.0)
		 FROM venta_devolucion_articulo vda 
		  JOIN venta_devolucion vd ON vda.id_devolucion=vd.id_devolucion
		  JOIN ( SELECT cod_barras, cantidad_um FROM articulo 
				 WHERE cod_barras=@barCode OR cod_asociado=@barCode) i ON vda.cod_barras=i.cod_barras
		 WHERE YEAR(vd.fecha_dev)=@anio AND MONTH(vd.fecha_dev)=@mes

		 SELECT @cant = @cant + ISNULL(sum((va.cantidad)*a.cantidad_um*ka.cantidad), 0.000)
		 FROM venta v 
		  JOIN venta_articulo va ON v.id_venta=va.id_venta
		  JOIN articulo a ON a.cod_barras = va.cod_barras OR a.cod_asociado=va.cod_barras
		  JOIN kit_articulos ka ON ka.cod_barras_kit=va.cod_barras
		 WHERE ka.cod_barras_pro = @barCode AND YEAR(v.fecha_venta) = @anio AND MONTH(v.fecha_venta) = @mes

		 UPDATE estadistica SET sep=@cant WHERE anio=@anio AND cod_barras=@barCode
		 
		 --OCTUBRE
		 SET @mes = 10

		 --Contabiliza articulos principales, asociados y anexos
		 SELECT @cant = ISNULL(SUM(va.cantidad*i.cantidad_um),0.0)
		 FROM venta_articulo va 
		  JOIN venta v ON va.id_venta=v.id_venta
		  JOIN ( SELECT cod_barras, cantidad_um FROM articulo 
				 WHERE cod_barras=@barCode OR cod_asociado=@barCode) i ON va.cod_barras=i.cod_barras
		 WHERE YEAR(v.fecha_venta)=@anio AND MONTH(v.fecha_venta)=@mes

		 --Disminuye a los artículos devueltos
		 SELECT @cant = @cant - ISNULL(SUM(vda.cantidad*i.cantidad_um),0.0)
		 FROM venta_devolucion_articulo vda 
		  JOIN venta_devolucion vd ON vda.id_devolucion=vd.id_devolucion
		  JOIN ( SELECT cod_barras, cantidad_um FROM articulo 
				 WHERE cod_barras=@barCode OR cod_asociado=@barCode) i ON vda.cod_barras=i.cod_barras
		 WHERE YEAR(vd.fecha_dev)=@anio AND MONTH(vd.fecha_dev)=@mes

		 SELECT @cant = @cant + ISNULL(sum((va.cantidad)*a.cantidad_um*ka.cantidad), 0.000)
		 FROM venta v 
		  JOIN venta_articulo va ON v.id_venta=va.id_venta
		  JOIN articulo a ON a.cod_barras = va.cod_barras OR a.cod_asociado=va.cod_barras
		  JOIN kit_articulos ka ON ka.cod_barras_kit=va.cod_barras
		 WHERE ka.cod_barras_pro = @barCode AND YEAR(v.fecha_venta) = @anio AND MONTH(v.fecha_venta) = @mes

		 UPDATE estadistica SET oct=@cant WHERE anio=@anio AND cod_barras=@barCode
		 
		 --NOVIEMBRE
		 SET @mes = 11

		 --Contabiliza articulos principales, asociados y anexos
		 SELECT @cant = ISNULL(SUM(va.cantidad*i.cantidad_um),0.0)
		 FROM venta_articulo va 
		  JOIN venta v ON va.id_venta=v.id_venta
		  JOIN ( SELECT cod_barras, cantidad_um FROM articulo 
				 WHERE cod_barras=@barCode OR cod_asociado=@barCode) i ON va.cod_barras=i.cod_barras
		 WHERE YEAR(v.fecha_venta)=@anio AND MONTH(v.fecha_venta)=@mes

		 --Disminuye a los artículos devueltos
		 SELECT @cant = @cant - ISNULL(SUM(vda.cantidad*i.cantidad_um),0.0)
		 FROM venta_devolucion_articulo vda 
		  JOIN venta_devolucion vd ON vda.id_devolucion=vd.id_devolucion
		  JOIN ( SELECT cod_barras, cantidad_um FROM articulo 
				 WHERE cod_barras=@barCode OR cod_asociado=@barCode) i ON vda.cod_barras=i.cod_barras
		 WHERE YEAR(vd.fecha_dev)=@anio AND MONTH(vd.fecha_dev)=@mes

		 SELECT @cant = @cant + ISNULL(sum((va.cantidad)*a.cantidad_um*ka.cantidad), 0.000)
		 FROM venta v 
		  JOIN venta_articulo va ON v.id_venta=va.id_venta
		  JOIN articulo a ON a.cod_barras = va.cod_barras OR a.cod_asociado=va.cod_barras
		  JOIN kit_articulos ka ON ka.cod_barras_kit=va.cod_barras
		 WHERE ka.cod_barras_pro = @barCode AND YEAR(v.fecha_venta) = @anio AND MONTH(v.fecha_venta) = @mes

		 UPDATE estadistica SET nov=@cant WHERE anio=@anio AND cod_barras=@barCode
		 
		 --DICIEMBRE
		 SET @mes = 12

		 --Contabiliza articulos principales, asociados y anexos
		 SELECT @cant = ISNULL(SUM(va.cantidad*i.cantidad_um),0.0)
		 FROM venta_articulo va 
		  JOIN venta v ON va.id_venta=v.id_venta
		  JOIN ( SELECT cod_barras, cantidad_um FROM articulo 
				 WHERE cod_barras=@barCode OR cod_asociado=@barCode) i ON va.cod_barras=i.cod_barras
		 WHERE YEAR(v.fecha_venta)=@anio AND MONTH(v.fecha_venta)=@mes

		 --Disminuye a los artículos devueltos
		 SELECT @cant = @cant - ISNULL(SUM(vda.cantidad*i.cantidad_um),0.0)
		 FROM venta_devolucion_articulo vda 
		  JOIN venta_devolucion vd ON vda.id_devolucion=vd.id_devolucion
		  JOIN ( SELECT cod_barras, cantidad_um FROM articulo 
				 WHERE cod_barras=@barCode OR cod_asociado=@barCode) i ON vda.cod_barras=i.cod_barras
		 WHERE YEAR(vd.fecha_dev)=@anio AND MONTH(vd.fecha_dev)=@mes

		 SELECT @cant = @cant + ISNULL(sum((va.cantidad)*a.cantidad_um*ka.cantidad), 0.000)
		 FROM venta v 
		  JOIN venta_articulo va ON v.id_venta=va.id_venta
		  JOIN articulo a ON a.cod_barras = va.cod_barras OR a.cod_asociado=va.cod_barras
		  JOIN kit_articulos ka ON ka.cod_barras_kit=va.cod_barras
		 WHERE ka.cod_barras_pro = @barCode AND YEAR(v.fecha_venta) = @anio AND MONTH(v.fecha_venta) = @mes

		 UPDATE estadistica SET dic=@cant WHERE anio=@anio AND cod_barras=@barCode
	
	 FETCH NEXT FROM cur_estadistica INTO @barCode

	END --END WHILE 1

	CLOSE cur_estadistica
	DEALLOCATE cur_estadistica
 END

/**
 La instrucción para regenera la estadística, se executa el siguiente comando: 

  EXEC dbo.reset_estadistica 2018
 
 Donde 2018 es el año del cual se requiere general el estadístico.
**/


GO
/****** Object:  StoredProcedure [dbo].[sp_cierre_inventario]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cierre_inventario] @InventoryID UNIQUEIDENTIFIER
AS
BEGIN
	DECLARE @ProviderID  UNIQUEIDENTIFIER,
		    @fecha_ini   DATETIME,
			@fecha_fin   DATETIME

	SELECT @fecha_ini=fecha_ini,@fecha_fin=fecha_fin,@ProviderID=id_proveedor FROM inventario_fisico WHERE id_inventario_fisico=@InventoryID

	IF OBJECT_ID('tempdb..#items') IS NOT NULL DROP TABLE #items

	SELECT cod_barras, ISNULL(cod_asociado, cod_barras) cod_group, cantidad_um, tipo_articulo INTO #items 
	FROM articulo WHERE kit=0 AND id_proveedor=@ProviderID
	 
	UPDATE a SET a.stock= i.inventario_captura + i.entradas + i.compras -i.salidas - i.venta - i.venta_kit + i.devoluciones
	FROM articulo a JOIN
	( SELECT	a.cod_group, 
	   SUM(ISNULL(ia.stock_fisico,0)) stock_fisico, 
	   SUM(ISNULL(ic.cantidad,0)) inventario_captura,
	   SUM(ISNULL(ent.cantidad,0)) entradas,
	   SUM(ISNULL(com.cantidad,0)) compras,
	   SUM(ISNULL(sal.cantidad,0)) salidas,
	   SUM(ISNULL(vta.cantidad,0)) venta,
	   SUM(ISNULL(vk.cantidad,0)) venta_kit,
	   SUM(ISNULL(dev.cantidad,0)) devoluciones
	  FROM #items a
	   LEFT JOIN inventario_fisico_articulo ia ON a.cod_barras=ia.cod_barras
	   LEFT JOIN ( SELECT icap.cod_barras, SUM(icap.cant_pza) cantidad
				   FROM inventario_captura icap
				    JOIN #items i ON icap.cod_barras=i.cod_barras AND icap.id_inventario_fisico=@InventoryID
				   GROUP BY icap.cod_barras) ic ON a.cod_barras=ic.cod_barras
	   LEFT JOIN ( SELECT i.cod_barras, SUM(i.cantidad_um * ea.cant_pza) cantidad
				   FROM entrada e 
				    JOIN entrada_articulo ea ON e.id_entrada=ea.id_entrada
			        JOIN #items i ON ea.cod_barras=i.cod_barras
				   WHERE e.fecha_entrada BETWEEN @fecha_ini AND @fecha_fin
				   GROUP BY i.cod_barras) ent ON a.cod_barras=ent.cod_barras
	   LEFT JOIN ( SELECT i.cod_barras, SUM(i.cantidad_um * ca.cant_pza) cantidad
				   FROM compra c 
				    JOIN compra_articulo ca ON c.id_compra=ca.id_compra
			        JOIN #items i ON ca.cod_barras=i.cod_barras
				   WHERE c.fecha_compra BETWEEN @fecha_ini AND @fecha_fin
				   GROUP BY i.cod_barras) com ON a.cod_barras=com.cod_barras
	   LEFT JOIN ( SELECT i.cod_barras, SUM(i.cantidad_um * sa.cant_pza) cantidad
				   FROM salida s 
				    JOIN salida_articulo sa ON s.id_salida=sa.id_salida
			        JOIN #items i ON sa.cod_barras=i.cod_barras
				   WHERE s.fecha_salida BETWEEN @fecha_ini AND @fecha_fin
				   GROUP BY i.cod_barras) sal ON a.cod_barras=sal.cod_barras
	   LEFT JOIN ( SELECT i.cod_barras, SUM(i.cantidad_um * va.cantidad) cantidad
				   FROM venta v 
				    JOIN venta_articulo va ON v.id_venta=va.id_venta
			        JOIN #items i ON va.cod_barras=i.cod_barras
				   WHERE v.fecha_venta BETWEEN @fecha_ini AND @fecha_fin
				   GROUP BY i.cod_barras) vta ON a.cod_barras=vta.cod_barras
	   LEFT JOIN ( SELECT k.cod_barras_pro, SUM(k.cantidad * va.cantidad) cantidad
			       FROM #items a 
			        JOIN kit_articulos k ON a.cod_barras=k.cod_barras_pro
			        JOIN venta_articulo va ON k.cod_barras_kit=va.cod_barras
			        JOIN venta v ON va.id_venta=v.id_venta
			       WHERE v.fecha_venta BETWEEN @fecha_ini AND @fecha_fin
				   GROUP BY k.cod_barras_pro) vk ON a.cod_barras=vk.cod_barras_pro
	   LEFT JOIN ( SELECT i.cod_barras, SUM(i.cantidad_um * vda.cantidad) cantidad
				   FROM venta_devolucion vd 
				    JOIN venta_devolucion_articulo vda ON vd.id_devolucion=vda.id_devolucion
			        JOIN #items i ON vda.cod_barras=i.cod_barras
				   WHERE vd.fecha_dev BETWEEN @fecha_ini AND @fecha_fin
				   GROUP BY i.cod_barras) dev ON a.cod_barras=dev.cod_barras
	  GROUP BY a.cod_group) i ON a.cod_barras=i.cod_group
END
GO
/****** Object:  StoredProcedure [dbo].[sp_corte_caja]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_corte_caja]
        @fechaIni	DATETIME,
		@fechaFin	DATETIME,
		@vendedor	VARCHAR(15),
		@idPos		INT
AS
BEGIN

SELECT	vd.id_pos,
		vd.vendedor,
		@fechaIni			[fecha_ini],
		@fechaFin			[fecha_fin],
		MIN(vd.folio)		[folio_ini],
		MAX(vd.folio)		[folio_fin],
		SUM(vd.efectivo)	[efectivo],
		SUM(vd.cheques)		[cheques],
		SUM(vd.vales)		[vales],
		SUM(vd.tc)			[tc],
		COUNT(vd.id_pos)	[no_transacciones],
		SUM(vd.total_vendido) [total_vendido],
		SUM(vd.total_desglosado) [total_desglosado],
		SUM(vd.iva)			[iva],
		SUM(vd.total_exentos) [total_exentos],
		AVG(vde.cant_dev)	[total_devuelto]
FROM	  (SELECT vp.id_pos,
				   vp.id_venta,
				   vp.folio,
				   vp.vendedor,
				   SUM(vd.total_venta)-(vp.pago_cheque+vp.pago_vales+vp.pago_tc) [efectivo],
				   (vp.pago_cheque) [cheques],
				   (vp.pago_vales) [vales],
				   (vp.pago_tc) [tc],
				   SUM(vd.total_iva) [iva],
				   SUM(vd.total_venta) [total_vendido],
				   SUM(vd.total_desglosado) [total_desglosado],
				   SUM(vd.total_exentos) [total_exentos]
			FROM venta vp
			 INNER JOIN (SELECT v.id_venta, v.folio,
								(((va.precio_vta / (1.000 + va.iva)) -  (va.precio_vta / (1.000 + va.iva) *  va.porcent_desc)) + ((va.precio_vta / (1.000 + va.iva)) -  (va.precio_vta / (1.000 + va.iva) *  va.porcent_desc)) * va.iva) * va.cantidad [total_venta],
								CASE WHEN va.iva > 0.000 THEN (va.precio_vta / (1.000+va.iva) - (va.precio_vta / (1.000 + va.iva) *  va.porcent_desc)) * va.cantidad ELSE 0.000 END [total_desglosado],
								((va.precio_vta / (1.000 + va.iva)) -  (va.precio_vta / (1.000 + va.iva) *  va.porcent_desc)) * va.iva * va.cantidad  [total_iva],
								CASE WHEN va.iva > 0.000 THEN 0.000 ELSE (va.precio_vta - va.precio_vta * va.porcent_desc) * va.cantidad END [total_exentos]
						 FROM venta v
						  INNER JOIN venta_articulo va ON v.id_venta=va.id_venta AND v.id_pos=@idPos
						 WHERE v.vendedor=@vendedor
						   AND v.fecha_venta BETWEEN @fechaIni AND @fechaFin) vd ON vp.id_venta=vd.id_venta
			GROUP BY vp.id_pos,vp.id_venta,vp.folio, vp.vendedor, vp.fecha_venta, vp.pago_cheque, vp.pago_vales,vp.pago_tc) vd
 LEFT JOIN (SELECT dev.id_pos,SUM(dev.cant_dev) [cant_dev]
			FROM venta_devolucion dev
			WHERE dev.id_pos=@idPos
			  AND dev.fecha_dev BETWEEN @fechaIni AND @fechaFin
			GROUP BY dev.id_pos) vde ON vde.id_pos = vd.id_pos 
GROUP BY vd.id_pos, vd.vendedor
END
GO
/****** Object:  StoredProcedure [dbo].[sp_estadistica_oferta]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_estadistica_oferta]
        @offer_id	UNIQUEIDENTIFIER
AS
BEGIN

	DECLARE @bar_code	VARCHAR(15),
			@fec_ini	DATETIME,
			@fec_fin	DATETIME,
			@cant_vta	DECIMAL(19,3),
			@cant_dev	DECIMAL(19,3),
			@umc		DECIMAL(19,3)


	IF OBJECT_ID('tempdb..#items') IS NOT NULL DROP TABLE #items

	SELECT oa.cod_barras,oa.cod_barras cod_group, a.descripcion, um.descripcion um, a.cantidad_um umc, CONVERT(DECIMAL(19,3), 0.000) venta, CONVERT(DECIMAL(19,3), 0.000) devolucion,o.fecha_ini,ISNULL(oa.fecha_cancelacion,o.fecha_fin) fecha_fin INTO #items 
	FROM oferta o JOIN oferta_articulo oa ON o.id_oferta=oa.id_oferta JOIN articulo a ON oa.cod_barras=a.cod_barras JOIN unidad_medida um ON a.id_unidad=um.id_unidad
	WHERE o.id_oferta=@offer_id ORDER BY a.descripcion

	INSERT INTO #items
	SELECT a.cod_barras,a.cod_asociado,i.descripcion,i.um,i.umc,0.000,0.000,i.fecha_ini,i.fecha_fin 
	FROM #items i JOIN articulo a ON a.tipo_articulo='asociado' AND i.cod_barras=a.cod_asociado

	DECLARE cursor_estadistica CURSOR FOR
	SELECT a.cod_barras,a.umc,fecha_ini,a.fecha_fin FROM #items a

	OPEN cursor_estadistica

	FETCH NEXT FROM cursor_estadistica
	INTO @bar_code, @umc, @fec_ini, @fec_fin

	WHILE @@FETCH_STATUS=0
	BEGIN
	
		SELECT @cant_vta=ISNULL(SUM(va.cantidad*@umc),0.000) 
		FROM venta v JOIN venta_articulo va ON v.id_venta=va.id_venta
		WHERE ((v.fecha_venta BETWEEN @fec_ini AND @fec_fin) AND va.cod_barras=@bar_code) AND va.articulo_ofertado=1

		SELECT @cant_dev=ISNULL(SUM(vda.cantidad),0.000)
		FROM venta_devolucion vd JOIN venta_devolucion_articulo vda ON vd.id_devolucion=vda.id_devolucion JOIN venta_articulo va ON ((vd.id_venta=va.id_venta AND vda.cod_barras=va.cod_barras) AND va.no_articulo=vda.no_articulo) AND va.articulo_ofertado=1
		WHERE (vd.fecha_dev BETWEEN @fec_ini AND @fec_fin) AND vda.cod_barras=@bar_code

		UPDATE #items SET venta=@cant_vta, devolucion=@cant_dev	WHERE cod_barras=@bar_code

		FETCH NEXT FROM cursor_estadistica
		INTO @bar_code, @umc, @fec_ini, @fec_fin
	END

	CLOSE cursor_estadistica
	DEALLOCATE cursor_estadistica

	SELECT i.cod_group cod_barras,descripcion,um,umc,SUM(venta) venta,SUM(devolucion) devolucion
	FROM #items i
	GROUP BY i.cod_group,descripcion,um,umc
	ORDER BY descripcion

END
GO
/****** Object:  StoredProcedure [dbo].[sp_exportToDAT]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_exportToDAT]
AS
BEGIN
	SELECT
	 '1'																												Campo1
	,'1'																												Campo2
	,ISNULL(RIGHT('000000' + RTRIM(a.cod_interno), 6), '000000')														Interno
	,CONVERT(NCHAR(20),SUBSTRING(a.descripcion, 1, 20))																	Descripcion
	,RIGHT(REPLICATE('0' ,8)+CAST((REPLACE(ISNULL(o.precio_oferta,a.precio_venta) ,'.' ,''))/10 AS VARCHAR(8)),8)		Precio
	,CASE u.descripcion WHEN 'KG' THEN '0' Else '1' END																	Pesable
	,'11'																												Campo3
	,CASE u.descripcion WHEN 'KG' THEN '03' Else '02' END																Campo4
	,'0'																												Campo5
	,'0000'																												Campo6
	,'00' + SUBSTRING(a.cod_barras, 3, 10) + '0'																		Codigo
	FROM articulo a
	 INNER JOIN unidad_medida u ON a.id_unidad = u.id_unidad
	 LEFT JOIN (SELECT oa.cod_barras, oa.precio_oferta
				FROM oferta o INNER JOIN oferta_articulo oa ON oa.id_oferta = o.id_oferta
				WHERE NOT(o.status_oferta <> 'disponible' OR oa.status_oferta <> 'disponible')
				  AND ((CONVERT(DATE,GETDATE()) BETWEEN o.fecha_ini AND o.fecha_fin) AND SUBSTRING(oa.cod_barras,1,2) IN ('26','28'))) o ON o.cod_barras=a.cod_barras
	WHERE SUBSTRING(a.cod_barras,1,2) IN ('26','28')
	ORDER BY a.cod_interno
END
GO
/****** Object:  StoredProcedure [dbo].[sp_exportToXLS]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_exportToXLS]
AS
BEGIN

   SELECT
	 '1'														COL01
	,a.cod_interno												COL02
	,CASE WHEN u.descripcion='Kg' THEN '1' Else '3' END			COL04
	,SUBSTRING(a.cod_barras,3,5)								COL11
	,a.descripcion												COL10
	,''															COL30
	,''															COL31
	,''															COL09
	,CASE WHEN u.descripcion='Kg' THEN '74' Else '70' END		COL80
	,''															COL81
	,''															COL55
	,'0'														COL05
	,'0'														COL100
	,''															COL03
	,''															COL14
	,''															COL15
	,''															COL26
	,(Replace(ISNULL(o.precio_oferta,a.precio_venta),'.',''))/10 [Precio]
	,''															COL91
	,''															COL08
	,''															COL13
	,''															COL12
	,''															COL24
	,''															COL23
	,CASE WHEN u.descripcion='Kg' THEN '1' Else '2' END			COL85
	,''															COL86
	,''															COL20
	,'0'														COL18
	,''															COL19
	,''															COL16
	,'0'														COL17
	,''															COL22
	,''															COL25
	,''															COL35
	,''															COL50
	,''															COL70
	,''															COL90
	,''															COL71
	,''															COL69
	,''															COL64
	,''															COL68
	,''															COL60
	,''															COL61
	,''															COL65
	,''															COL62
	,''															COL66
	,''															COL99
	,''															COL101
	,''															COL102
	FROM articulo a
	 INNER JOIN unidad_medida u ON a.id_unidad=u.id_unidad
	 LEFT JOIN (SELECT oa.cod_barras, oa.precio_oferta
				FROM oferta o INNER JOIN oferta_articulo oa ON oa.id_oferta = o.id_oferta
				WHERE NOT(o.status_oferta <> 'disponible' OR oa.status_oferta <> 'disponible')
				  AND ((CONVERT(DATE,GETDATE()) BETWEEN o.fecha_ini AND o.fecha_fin) AND SUBSTRING(oa.cod_barras,1,2) IN ('26','28'))) o ON o.cod_barras=a.cod_barras
	WHERE LEFT(a.[cod_barras],2) IN ('28','26')

END
GO
/****** Object:  StoredProcedure [dbo].[sp_fromAsociadoToPrincipal]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_fromAsociadoToPrincipal]
 @cod_barras VARCHAR(15)
AS
BEGIN
	DECLARE @cod_asociado VARCHAR(15),
			@stock_aa DECIMAL(19,3),
			@stock_ap DECIMAL(19,3)

	IF EXISTS(SELECT a.cod_barras FROM articulo a WHERE a.cod_barras=@cod_barras AND tipo_articulo='asociado')
	 BEGIN
	  
	  SELECT @cod_asociado=a.cod_asociado, @stock_aa=a.stock FROM articulo a WHERE a.cod_barras=@cod_barras

	  SELECT @stock_ap=a.stock FROM articulo a WHERE a.cod_barras=@cod_asociado
	  
	  UPDATE articulo SET cod_asociado=NULL, tipo_articulo='principal', stock=@stock_ap, fecha_registro=GETDATE() WHERE cod_barras=@cod_barras
	  UPDATE articulo SET cod_asociado=@cod_barras, tipo_articulo='asociado', stock=@stock_aa, fecha_registro=GETDATE() WHERE cod_barras=@cod_asociado
	  UPDATE articulo SET cod_asociado=@cod_barras, tipo_articulo='anexo', fecha_registro=GETDATE() WHERE cod_asociado=@cod_asociado
	  UPDATE articulo SET cod_asociado=@cod_barras WHERE cod_asociado=@cod_asociado

	  IF NOT EXISTS(SELECT * FROM estadistica WHERE cod_barras=@cod_barras)
	   BEGIN
	    INSERT INTO estadistica
		SELECT anio,@cod_barras,ene,feb,mar,abr,may,jun,jul,ago,sep,oct,nov,dic FROM estadistica WHERE cod_barras=@cod_asociado
	   END
	  ELSE
	   BEGIN
	    UPDATE e SET e.ene=sc.ene
		FROM estadistica e, (SELECT * FROM estadistica WHERE cod_barras=@cod_asociado) sc 
		WHERE e.cod_barras=@cod_barras AND e.anio=sc.anio
	   END

	 END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_pedido_anio]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_pedido_anio]
 @proveedor UNIQUEIDENTIFIER,
 @anio		SMALLINT,
 @mes		SMALLINT,
 @dias_mes  SMALLINT,
 @dias_ped  SMALLINT
AS
BEGIN
	
	
	SELECT 	a.cod_barras,
			a.cod_anexo,
			a.descripcion [articulo],
			um.descripcion [unidad],
			a.cantidad_um,
			a.costo,
			a.stock_cja,
			a.stock_pza,
			CASE WHEN a.existencia < ( a.estadistica / @dias_mes  * @dias_ped ) THEN ROUND( a.estadistica / @dias_mes  * @dias_ped , 0) - a.existencia ELSE 0 END [sugerido]
	FROM (	SELECT	ap.cod_barras,
					CASE WHEN aa.cod_barras IS NULL THEN  ap.cod_barras ELSE aa.cod_barras END cod_anexo,
					CASE WHEN aa.cod_barras IS NULL THEN  ap.descripcion ELSE aa.descripcion END descripcion,
					CASE WHEN aa.cod_barras IS NULL THEN  ap.id_unidad ELSE aa.id_unidad END id_unidad,
					CASE WHEN aa.cod_barras IS NULL THEN  ap.cantidad_um ELSE aa.cantidad_um END cantidad_um,
					CASE WHEN aa.cod_barras IS NULL THEN  CAST(ap.precio_compra AS DECIMAL(19,2)) ELSE CAST(aa.precio_compra AS DECIMAL(19,2)) END costo,
					CASE WHEN aa.cod_barras IS NULL THEN FLOOR(ap.stock) ELSE CASE WHEN ap.stock > 0 THEN FLOOR(ap.stock / aa.cantidad_um) ELSE FLOOR(ap.stock * -1 / aa.cantidad_um) * -1 END END existencia,
					CASE WHEN aa.cod_barras IS NULL THEN  0 ELSE CASE WHEN ap.stock > 0 THEN FLOOR(ap.stock / aa.cantidad_um) ELSE FLOOR(ap.stock * -1 / aa.cantidad_um) * -1 END END stock_cja,
					CASE WHEN aa.cod_barras IS NULL THEN  FLOOR(ap.stock) ELSE CASE WHEN ap.stock > 0 THEN FLOOR(ap.stock - FLOOR(ap.stock/aa.cantidad_um) * aa.cantidad_um) ELSE FLOOR(ap.stock * -1 - FLOOR(ap.stock * -1 /aa.cantidad_um) * aa.cantidad_um) * -1 END END stock_pza,
					CASE WHEN aa.cod_barras IS NULL THEN  ROUND(e.mes/ap.cantidad_um,0) ELSE ROUND(e.mes/aa.cantidad_um,0) END estadistica
			FROM articulo ap
			  LEFT JOIN (SELECT	aso.cod_barras,
								aso.cod_asociado,
								aso.descripcion,
								aso.cantidad_um,
								aso.precio_compra,
								aso.id_unidad
						 FROM articulo aso
						 WHERE aso.tipo_articulo='anexo'
						  AND aso.id_proveedor=@proveedor
						  AND aso.cod_barras=(SELECT TOP 1 sa.cod_barras 
											  FROM articulo sa
											   JOIN unidad_medida um ON sa.id_unidad=um.id_unidad 
											  WHERE sa.cod_asociado=aso.cod_asociado
												AND sa.tipo_articulo='anexo' 
												AND sa.id_proveedor=@proveedor
												AND um.descripcion='cja'
											  ORDER BY aso.fecha_registro DESC)) aa ON ap.cod_barras=aa.cod_asociado
			 INNER JOIN unidad_medida ump ON ap.id_unidad=ump.id_unidad
			 LEFT JOIN (SELECT	es.cod_barras,
							CASE @mes WHEN 1  THEN es.ene
									  WHEN 2  THEN es.feb
									  WHEN 3  THEN es.mar
									  WHEN 4  THEN es.abr
									  WHEN 5  THEN es.may
									  WHEN 6  THEN es.jun
									  WHEN 7  THEN es.jul
									  WHEN 8  THEN es.ago
									  WHEN 9  THEN es.sep 
									  WHEN 10 THEN es.oct
									  WHEN 11 THEN es.nov
									  WHEN 12 THEN es.dic END mes
						 FROM estadistica es
						 WHERE es.anio = @anio) e ON ap.cod_barras=e.cod_barras 
			WHERE ap.id_proveedor=@proveedor
			  AND ap.tipo_articulo='principal' 
			  AND ap.kit=0) a
	 INNER JOIN unidad_medida um ON a.id_unidad=um.id_unidad
	ORDER BY a.descripcion

END
GO
/****** Object:  StoredProcedure [dbo].[sp_pedido_captura_pendiente]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_pedido_captura_pendiente]
 @Idpedido AS UNIQUEIDENTIFIER
AS
BEGIN
DECLARE @proveedor  UNIQUEIDENTIFIER

	SELECT @proveedor=p.id_proveedor FROM pedido p WHERE p.id_pedido=@Idpedido
	
	SELECT pa.cod_barras,art.articulo,um.descripcion [unidad],art.cantidad_um,art.stock_cja,art.stock_pza,pa.precio_articulo,pa.cantidad,pa.cant_original,pa.sugerido
	FROM pedido_articulo pa JOIN 
	(SELECT	ap.cod_barras,
					CASE WHEN aa.cod_barras IS NULL THEN  ap.descripcion ELSE aa.descripcion END [articulo],
					CASE WHEN aa.cod_barras IS NULL THEN  ap.id_unidad ELSE aa.id_unidad END id_unidad,
					CASE WHEN aa.cod_barras IS NULL THEN  ap.cantidad_um ELSE aa.cantidad_um END cantidad_um,
					CASE WHEN aa.cod_barras IS NULL THEN  CAST(ap.precio_compra AS DECIMAL(19,2)) ELSE CAST(aa.precio_compra AS DECIMAL(19,2)) END costo,
					CASE WHEN aa.cod_barras IS NULL THEN FLOOR(ap.stock) ELSE CASE WHEN ap.stock > 0 THEN FLOOR(ap.stock / aa.cantidad_um) ELSE FLOOR(ap.stock * -1 / aa.cantidad_um) * -1 END END existencia,
					CASE WHEN aa.cod_barras IS NULL THEN  0 ELSE CASE WHEN ap.stock > 0 THEN FLOOR(ap.stock / aa.cantidad_um) ELSE FLOOR(ap.stock * -1 / aa.cantidad_um) * -1 END END stock_cja,
					CASE WHEN aa.cod_barras IS NULL THEN  FLOOR(ap.stock) ELSE CASE WHEN ap.stock > 0 THEN FLOOR(ap.stock - FLOOR(ap.stock/aa.cantidad_um) * aa.cantidad_um) ELSE FLOOR(ap.stock * -1 - FLOOR(ap.stock * -1 /aa.cantidad_um) * aa.cantidad_um) * -1 END END stock_pza
			FROM articulo ap
			  LEFT JOIN (SELECT	aso.cod_barras,
								aso.cod_asociado,
								aso.descripcion,
								aso.cantidad_um,
								aso.precio_compra,
								aso.id_unidad
						 FROM articulo aso
						 WHERE aso.tipo_articulo='anexo'
						  AND aso.id_proveedor=@proveedor
						  AND aso.cod_barras=(SELECT TOP 1 sa.cod_barras 
											  FROM articulo sa
											   JOIN unidad_medida um ON sa.id_unidad=um.id_unidad 
											  WHERE sa.cod_asociado=aso.cod_asociado
												AND sa.tipo_articulo='anexo' 
												AND sa.id_proveedor=@proveedor
												AND um.descripcion='cja'
											  ORDER BY aso.fecha_registro DESC)) aa ON ap.cod_barras=aa.cod_asociado
			 INNER JOIN unidad_medida ump ON ap.id_unidad=ump.id_unidad
			WHERE ap.id_proveedor=@proveedor
			  AND ap.tipo_articulo='principal' 
			  AND ap.kit=0) art ON pa.cod_barras=art.cod_barras
			 JOIN unidad_medida um ON art.id_unidad=um.id_unidad
			WHERE pa.id_pedido=@Idpedido
			ORDER BY art.articulo
END
GO
/****** Object:  StoredProcedure [dbo].[sp_pedido_promedio]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_pedido_promedio]
 @proveedor UNIQUEIDENTIFIER,
 @anio		SMALLINT,
 @mes		SMALLINT,
 @dias_mes  SMALLINT,
 @dias_ped  SMALLINT
AS
BEGIN
	
	
	SELECT 	a.cod_barras,
			a.cod_anexo,
			a.descripcion [articulo],
			um.descripcion [unidad],
			a.cantidad_um,
			a.costo,
			a.stock_cja,
			a.stock_pza,
			CASE WHEN a.existencia < CEILING( a.estadistica / @dias_mes  * @dias_ped ) THEN CEILING( a.estadistica / @dias_mes  * @dias_ped ) - a.existencia ELSE 0 END [sugerido]
		
	FROM (	SELECT	ap.cod_barras,
					CASE WHEN aa.cod_barras IS NULL THEN  ap.cod_barras ELSE aa.cod_barras END cod_anexo,
					CASE WHEN aa.cod_barras IS NULL THEN  ap.descripcion ELSE aa.descripcion END descripcion,
					CASE WHEN aa.cod_barras IS NULL THEN  ap.id_unidad ELSE aa.id_unidad END id_unidad,
					CASE WHEN aa.cod_barras IS NULL THEN  ap.cantidad_um ELSE aa.cantidad_um END cantidad_um,
					CASE WHEN aa.cod_barras IS NULL THEN FLOOR(ap.stock) ELSE CASE WHEN ap.stock > 0 THEN FLOOR(ap.stock / aa.cantidad_um) ELSE FLOOR(ap.stock * -1 / aa.cantidad_um) * -1 END END existencia,
					CASE WHEN aa.cod_barras IS NULL THEN  CAST(ap.precio_compra AS DECIMAL(19,2)) ELSE CAST(aa.precio_compra AS DECIMAL(19,2)) END costo,
					CASE WHEN aa.cod_barras IS NULL THEN  0 ELSE CASE WHEN ap.stock > 0 THEN FLOOR(ap.stock / aa.cantidad_um) ELSE FLOOR(ap.stock * -1 / aa.cantidad_um) * -1 END END stock_cja,
					CASE WHEN aa.cod_barras IS NULL THEN  FLOOR(ap.stock) ELSE CASE WHEN ap.stock > 0 THEN FLOOR(ap.stock - FLOOR(ap.stock/aa.cantidad_um) * aa.cantidad_um) ELSE FLOOR(ap.stock * -1 - FLOOR(ap.stock * -1 /aa.cantidad_um) * aa.cantidad_um) * -1 END END stock_pza,
					CASE WHEN aa.cod_barras IS NULL THEN  FLOOR(e.mes/ap.cantidad_um) ELSE FLOOR(e.mes/aa.cantidad_um) END estadistica
			FROM articulo ap
			  LEFT JOIN (SELECT	aso.cod_barras,
								aso.cod_asociado,
								aso.descripcion,
								aso.cantidad_um,
								aso.precio_compra,
								aso.id_unidad
						 FROM articulo aso
						 WHERE aso.tipo_articulo='anexo'
						  AND aso.id_proveedor=@proveedor
						  AND aso.cod_barras=(SELECT TOP 1 sa.cod_barras 
											  FROM articulo sa
											   JOIN unidad_medida um ON sa.id_unidad=um.id_unidad 
											  WHERE sa.cod_asociado=aso.cod_asociado
												AND sa.tipo_articulo='anexo' 
												AND sa.id_proveedor=@proveedor
												AND um.descripcion='cja'
											  ORDER BY aso.fecha_registro DESC)) aa ON ap.cod_barras=aa.cod_asociado
			 INNER JOIN unidad_medida ump ON ap.id_unidad=ump.id_unidad
			 LEFT JOIN (SELECT	es.cod_barras,
							CASE @mes WHEN 1  THEN AVG(es.ene)
									  WHEN 2  THEN AVG(es.feb)
									  WHEN 3  THEN AVG(es.mar)
									  WHEN 4  THEN AVG(es.abr)
									  WHEN 5  THEN AVG(es.may)
									  WHEN 6  THEN AVG(es.jun)
									  WHEN 7  THEN AVG(es.jul)
									  WHEN 8  THEN AVG(es.ago)
									  WHEN 9  THEN AVG(es.sep)
									  WHEN 10 THEN AVG(es.oct)
									  WHEN 11 THEN AVG(es.nov)
									  WHEN 12 THEN AVG(es.dic) END mes
						 FROM estadistica es
						 WHERE es.anio BETWEEN YEAR(GETDATE())-1 AND YEAR(GETDATE())
						 GROUP BY es.cod_barras) e ON ap.cod_barras=e.cod_barras 
			WHERE ap.id_proveedor=@proveedor
			  AND ap.tipo_articulo='principal' 
			  AND ap.kit=0) a
	 INNER JOIN unidad_medida um ON a.id_unidad=um.id_unidad
	ORDER BY a.descripcion

END
GO
/****** Object:  StoredProcedure [dbo].[sp_pedido_suspendido]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_pedido_suspendido]
 @pedido_id UNIQUEIDENTIFIER,
 @dias_mes	SMALLINT
AS
BEGIN
	DECLARE @anio		SMALLINT,
			@mes		SMALLINT,
			@dias_ped	SMALLINT,
			@proveedor  UNIQUEIDENTIFIER

	SELECT @anio=p.anio, @proveedor=p.id_proveedor, @mes=p.mes, @dias_ped=p.no_dias FROM pedido p WHERE p.id_pedido=@pedido_id

	SELECT 	a.cod_barras,
			a.cod_anexo,
			a.descripcion [articulo],
			um.descripcion [unidad],
			a.cantidad_um,
			a.costo,
			a.stock_cja,
			a.stock_pza,
			CASE WHEN a.existencia < CEILING( a.estadistica / @dias_mes  * @dias_ped ) THEN CEILING( a.estadistica / @dias_mes  * @dias_ped ) - a.existencia ELSE 0 END [sugerido],
			a.pedir
	FROM (	SELECT	ap.cod_barras,
					CASE WHEN aa.cod_barras IS NULL THEN  ap.cod_barras ELSE aa.cod_barras END cod_anexo,
					CASE WHEN aa.cod_barras IS NULL THEN  ap.descripcion ELSE aa.descripcion END descripcion,
					CASE WHEN aa.cod_barras IS NULL THEN  ap.id_unidad ELSE aa.id_unidad END id_unidad,
					CASE WHEN aa.cod_barras IS NULL THEN  ap.cantidad_um ELSE aa.cantidad_um END cantidad_um,
					CASE WHEN aa.cod_barras IS NULL THEN  CAST(ap.precio_compra AS DECIMAL(19,2)) ELSE CAST(aa.precio_compra AS DECIMAL(19,2)) END costo,
					CASE WHEN aa.cod_barras IS NULL THEN  0 ELSE FLOOR( ap.stock/aa.cantidad_um) END stock_cja,
					CASE WHEN aa.cod_barras IS NULL THEN  FLOOR(ap.stock) ELSE FLOOR(ap.stock - FLOOR(ap.stock/aa.cantidad_um) * aa.cantidad_um) END stock_pza,
					CASE WHEN aa.cod_barras IS NULL THEN FLOOR(ap.stock) ELSE CASE WHEN ap.stock > 0 THEN FLOOR(ap.stock / aa.cantidad_um) ELSE FLOOR(ap.stock * -1 / aa.cantidad_um) * -1 END END existencia,
					CASE WHEN aa.cod_barras IS NULL THEN  FLOOR(e.mes/ap.cantidad_um) ELSE FLOOR(e.mes/aa.cantidad_um) END estadistica,
					pa.cantidad [pedir]
			FROM articulo ap
			  LEFT JOIN (SELECT	aso.cod_barras,
								aso.cod_asociado,
								aso.descripcion,
								aso.cantidad_um,
								aso.precio_compra,
								aso.id_unidad
						 FROM articulo aso
						 WHERE aso.tipo_articulo='anexo'
						  AND aso.id_proveedor=@proveedor
						  AND aso.cod_barras=(SELECT TOP 1 sa.cod_barras 
											  FROM articulo sa
											   JOIN unidad_medida um ON sa.id_unidad=um.id_unidad 
											  WHERE sa.cod_asociado=aso.cod_asociado
												AND sa.tipo_articulo='anexo' 
												AND sa.id_proveedor=@proveedor
												AND um.descripcion='cja'
											  ORDER BY aso.fecha_registro DESC)) aa ON ap.cod_barras=aa.cod_asociado
			 INNER JOIN unidad_medida ump ON ap.id_unidad=ump.id_unidad
			 INNER JOIN pedido_articulo pa ON ap.cod_barras=pa.cod_barras AND pa.id_pedido=@pedido_id
			 LEFT JOIN (SELECT	es.cod_barras,
							CASE @mes WHEN 1  THEN (es.ene)
									  WHEN 2  THEN (es.feb)
									  WHEN 3  THEN (es.mar)
									  WHEN 4  THEN (es.abr)
									  WHEN 5  THEN (es.may)
									  WHEN 6  THEN (es.jun)
									  WHEN 7  THEN (es.jul)
									  WHEN 8  THEN (es.ago)
									  WHEN 9  THEN (es.sep)
									  WHEN 10 THEN (es.oct)
									  WHEN 11 THEN (es.nov)
									  WHEN 12 THEN (es.dic) END mes
						 FROM estadistica es
						 WHERE es.anio=@anio) e ON ap.cod_barras=e.cod_barras
			WHERE ap.id_proveedor=@proveedor
			  AND ap.tipo_articulo='principal' 
			  AND ap.kit=0) a
	 INNER JOIN unidad_medida um ON a.id_unidad=um.id_unidad

END
GO
/****** Object:  StoredProcedure [dbo].[sp_pedido_suspendido_promedio]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_pedido_suspendido_promedio]
 @pedido_id UNIQUEIDENTIFIER,
 @dias_mes	SMALLINT
AS
BEGIN
	DECLARE @mes		SMALLINT,
			@dias_ped	SMALLINT,
			@proveedor  UNIQUEIDENTIFIER

	SELECT @proveedor=p.id_proveedor, @mes=p.mes, @dias_ped=p.no_dias FROM pedido p WHERE p.id_pedido=@pedido_id

	SELECT 	a.cod_barras,
			a.cod_anexo,
			a.descripcion [articulo],
			um.descripcion [unidad],
			a.cantidad_um,
			a.costo,
			a.stock_cja,
			a.stock_pza,
			CASE WHEN a.existencia < CEILING( a.estadistica / @dias_mes  * @dias_ped ) THEN CEILING( a.estadistica / @dias_mes  * @dias_ped ) - a.existencia ELSE 0 END [sugerido],
			a.pedir
	FROM (	SELECT	ap.cod_barras,
					CASE WHEN aa.cod_barras IS NULL THEN  ap.cod_barras ELSE aa.cod_barras END cod_anexo,
					CASE WHEN aa.cod_barras IS NULL THEN  ap.descripcion ELSE aa.descripcion END descripcion,
					CASE WHEN aa.cod_barras IS NULL THEN  ap.id_unidad ELSE aa.id_unidad END id_unidad,
					CASE WHEN aa.cod_barras IS NULL THEN  ap.cantidad_um ELSE aa.cantidad_um END cantidad_um,
					CASE WHEN aa.cod_barras IS NULL THEN  CAST(ap.precio_compra AS DECIMAL(19,2)) ELSE CAST(aa.precio_compra AS DECIMAL(19,2)) END costo,
					CASE WHEN aa.cod_barras IS NULL THEN  0 ELSE FLOOR( ap.stock/aa.cantidad_um) END stock_cja,
					CASE WHEN aa.cod_barras IS NULL THEN  FLOOR(ap.stock) ELSE FLOOR(ap.stock - FLOOR(ap.stock/aa.cantidad_um) * aa.cantidad_um) END stock_pza,
					CASE WHEN aa.cod_barras IS NULL THEN FLOOR(ap.stock) ELSE CASE WHEN ap.stock > 0 THEN FLOOR(ap.stock / aa.cantidad_um) ELSE FLOOR(ap.stock * -1 / aa.cantidad_um) * -1 END END existencia,
					CASE WHEN aa.cod_barras IS NULL THEN  FLOOR(e.mes/ap.cantidad_um) ELSE FLOOR(e.mes/aa.cantidad_um) END estadistica,
					pa.cantidad [pedir]
			FROM articulo ap
			  LEFT JOIN (SELECT	aso.cod_barras,
								aso.cod_asociado,
								aso.descripcion,
								aso.cantidad_um,
								aso.precio_compra,
								aso.id_unidad
						 FROM articulo aso
						 WHERE aso.tipo_articulo='anexo'
						  AND aso.id_proveedor=@proveedor
						  AND aso.cod_barras=(SELECT TOP 1 sa.cod_barras 
											  FROM articulo sa
											   JOIN unidad_medida um ON sa.id_unidad=um.id_unidad 
											  WHERE sa.cod_asociado=aso.cod_asociado
												AND sa.tipo_articulo='anexo' 
												AND sa.id_proveedor=@proveedor
												AND um.descripcion='cja'
											  ORDER BY aso.fecha_registro DESC)) aa ON ap.cod_barras=aa.cod_asociado
			 INNER JOIN unidad_medida ump ON ap.id_unidad=ump.id_unidad
			 INNER JOIN pedido_articulo pa ON ap.cod_barras=pa.cod_barras AND pa.id_pedido=@pedido_id
			 LEFT JOIN (SELECT	es.cod_barras,
							CASE @mes WHEN 1  THEN AVG(es.ene)
									  WHEN 2  THEN AVG(es.feb)
									  WHEN 3  THEN AVG(es.mar)
									  WHEN 4  THEN AVG(es.abr)
									  WHEN 5  THEN AVG(es.may)
									  WHEN 6  THEN AVG(es.jun)
									  WHEN 7  THEN AVG(es.jul)
									  WHEN 8  THEN AVG(es.ago)
									  WHEN 9  THEN AVG(es.sep)
									  WHEN 10 THEN AVG(es.oct)
									  WHEN 11 THEN AVG(es.nov)
									  WHEN 12 THEN AVG(es.dic) END mes
						 FROM estadistica es
						 WHERE es.anio BETWEEN YEAR(GETDATE())-1 AND YEAR(GETDATE())
						 GROUP BY es.cod_barras) e ON ap.cod_barras=e.cod_barras
			WHERE ap.id_proveedor=@proveedor
			  AND ap.tipo_articulo='principal' 
			  AND ap.kit=0) a
	 INNER JOIN unidad_medida um ON a.id_unidad=um.id_unidad
END
GO
/****** Object:  StoredProcedure [dbo].[sp_reporte_entrada_almacen]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_reporte_entrada_almacen]
 @IdEntrada		UNIQUEIDENTIFIER
AS
BEGIN
	SELECT	e.id_entrada,
			e.num_entrada,
			ea.cod_barras,
			um.descripcion [unidad],
			a.descripcion [articulo],
			a.cantidad_um,
			a.cod_interno,
			e.observacion,
			emp.nombre_usuario,
			a.precio_compra,
			(ea.cant_pza+ea.cant_reg) total_piezas,
			CONVERT(DECIMAL(19,3),((ea.cant_pza+ea.cant_reg) * ea.costo)) total_entrada,
			CONVERT(VARCHAR(10),e.fecha_entrada,103) fecha_entrada,
			CASE WHEN EXISTS(SELECT aso.cantidad_um FROM articulo aso WHERE a.cod_barras = aso.cod_asociado AND aso.tipo_articulo = 'anexo')
				 THEN (SELECT TOP 1 aso.cantidad_um FROM articulo aso WHERE a.cod_barras = aso.cod_asociado AND aso.tipo_articulo = 'anexo') END cantidad_um_anexo 
	FROM unidad_medida um
	 INNER JOIN articulo a ON um.id_unidad = a.id_unidad
	 INNER JOIN entrada_articulo ea ON a.cod_barras = ea.cod_barras
	 INNER JOIN entrada e ON ea.id_entrada = e.id_entrada
	 LEFT JOIN ( SELECT em.[user_name],
						em.nombre +' '+em.a_paterno+' '+em.a_materno [nombre_usuario]
				 FROM empleado em) emp ON e.[user_name] = emp.[user_name]
	WHERE e.id_entrada = @IdEntrada
	ORDER BY a.descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[sp_reporte_formato]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_reporte_formato]
 @IdInventario UNIQUEIDENTIFIER
AS
BEGIN
	SELECT	art.cod_barras,
			art.descripcion [articulo],
			um.descripcion [unidad],
			art.stock,
			p.razon_social
	FROM inventario_fisico i
	 INNER JOIN inventario_fisico_articulo ia ON i.id_inventario_fisico = ia.id_inventario_fisico
	 INNER JOIN ( SELECT	ap.cod_barras,
							ap.stock,
							ap.id_proveedor,
							CASE WHEN EXISTS(SELECT a.descripcion FROM articulo a WHERE ap.cod_barras = a.cod_asociado AND a.tipo_articulo = 'anexo')
								 THEN (SELECT TOP 1 a.descripcion FROM articulo a WHERE ap.cod_barras = a.cod_asociado AND a.tipo_articulo = 'anexo')
								 ELSE ap.descripcion END descripcion,
							CASE WHEN EXISTS(SELECT a.id_unidad FROM articulo a WHERE ap.cod_barras = a.cod_asociado AND a.tipo_articulo = 'anexo')
								 THEN (SELECT TOP 1 a.id_unidad FROM articulo a WHERE ap.cod_barras = a.cod_asociado AND a.tipo_articulo = 'anexo')
								 ELSE ap.id_unidad END id_unidad
				  FROM articulo ap
				  WHERE ap.tipo_articulo = 'principal') art ON ia.cod_barras = art.cod_barras
	 INNER JOIN unidad_medida um ON um.id_unidad = art.id_unidad 
	 INNER JOIN proveedor p ON p.id_proveedor = art.id_proveedor
	WHERE ia.id_inventario_fisico = @IdInventario
	ORDER BY art.id_unidad
END
GO
/****** Object:  StoredProcedure [dbo].[sp_reporte_inventario_actual]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[sp_reporte_inventario_actual]
 @IdProveedor AS UNIQUEIDENTIFIER
AS
BEGIN
	SELECT	 a.cod_barras
			,a.descripcion [articulo]
			,CASE WHEN ap.cod_anexo IS NULL THEN ap.unidad_principal ELSE ap.unidad_anexo END unidad
			,CASE WHEN ap.cod_anexo IS NULL THEN  0 ELSE CASE WHEN a.stock > 0 THEN FLOOR(a.stock / ap.cantidad_uma) ELSE FLOOR(a.stock * -1 / ap.cantidad_uma) * -1 END END stock_cja
			,CASE WHEN ap.cod_anexo IS NULL THEN  FLOOR(a.stock) ELSE CASE WHEN a.stock > 0 THEN FLOOR(a.stock - FLOOR(a.stock/ap.cantidad_uma) * ap.cantidad_uma) ELSE FLOOR(a.stock * -1 - FLOOR(a.stock * -1 /ap.cantidad_uma) * ap.cantidad_uma) * -1 END END stock_pza
			,p.razon_social
			,(a.precio_compra * a.stock) total
			,CASE WHEN ap.cod_anexo IS NULL THEN a.precio_compra ELSE ap.precio_compra_anexo END precio_compra
			,CASE WHEN ap.cod_anexo IS NULL THEN a.cantidad_um ELSE ap.cantidad_uma END cantidad_um
			,a.stock
	FROM articulo a
	 JOIN vw_articulos_principales ap ON a.cod_barras=ap.cod_principal
	 JOIN proveedor p ON a.id_proveedor=p.id_proveedor
	WHERE a.tipo_articulo='principal' AND a.id_proveedor=@IdProveedor
	ORDER BY a.descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[sp_reporte_inventario_fisico]    Script Date: 16/03/2022 07:24:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_reporte_inventario_fisico]
 @InventoryID AS UNIQUEIDENTIFIER
AS
BEGIN

DECLARE @ProviderID UNIQUEIDENTIFIER,
		@fecha_ini   DATETIME

SELECT @fecha_ini=fecha_ini,@ProviderID=id_inventario_fisico FROM inventario_fisico WHERE id_inventario_fisico=@InventoryID

SELECT inv.id_inventario_fisico,p.razon_social,inv.cod_barras,a.desc_principal [articulo],inv.stock_estimado,(inv.stock_fisico-(inv.cant_vendida+inv.cant_vendida_kit)) [stock_fisico],a.unidad_principal [unidad],a.cantidad_uma [cantidad_um],a.precio_compra, ((inv.stock_fisico-(inv.cant_vendida+inv.cant_vendida_kit))*a.precio_compra) [total]
FROM vw_articulos_principales a INNER JOIN proveedor p ON a.id_proveedor=p.id_proveedor INNER JOIN (
SELECT ifa.id_inventario_fisico,ifa.cod_barras,ifa.stock_estimado,ISNULL(ic.stock_fisico_pza,0.000) stock_fisico, ISNULL(vta.cantidad,0.000) [cant_vendida], ISNULL(cantidad_kit,0.000) [cant_vendida_kit]
FROM inventario_fisico inf INNER JOIN inventario_fisico_articulo ifa ON inf.id_inventario_fisico=ifa.id_inventario_fisico
LEFT JOIN (SELECT id_inventario_fisico,cod_barras,SUM(cant_cja) stock_fisico_cja,SUM(cant_pza) stock_fisico_pza FROM inventario_captura WHERE id_inventario_fisico=@InventoryID GROUP BY id_inventario_fisico,cod_barras) ic ON ifa.cod_barras=ic.cod_barras
LEFT JOIN (SELECT cod_asociado [cod_barras],SUM(va.cantidad*a.cantidad_um) [cantidad] FROM vw_articulo a INNER JOIN venta_articulo va ON a.cod_barras=va.cod_barras INNER JOIN venta v ON va.id_venta=v.id_venta WHERE (id_proveedor=@ProviderID AND fecha_venta>=@fecha_ini) AND kit=0 GROUP BY cod_asociado) vta ON ifa.cod_barras=vta.cod_barras
LEFT JOIN (SELECT cod_barras_pro [cod_barras],SUM(va.cantidad*k.cantidad) [cantidad_kit] FROM articulo a INNER JOIN kit_articulos k ON a.cod_barras=k.cod_barras_kit INNER JOIN venta_articulo va ON a.cod_barras=va.cod_barras INNER JOIN venta v ON va.id_venta=v.id_venta WHERE fecha_venta>=@fecha_ini GROUP BY cod_barras_pro) kit ON ifa.cod_barras=kit.cod_barras
WHERE inf.id_inventario_fisico=@InventoryID
) inv ON a.cod_principal=inv.cod_barras
ORDER BY a.desc_principal

END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "articulo"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 22
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'colector_articulo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'colector_articulo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "compra"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'colector_compra'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'colector_compra'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "inventario_fisico"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'colector_inventario_fisico'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'colector_inventario_fisico'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "orden"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 217
            End
            DisplayFlags = 280
            TopColumn = 7
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'colector_orden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'colector_orden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "orden_articulo"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'colector_orden_articulo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'colector_orden_articulo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "proveedor"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 221
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'colector_proveedor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'colector_proveedor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "unidad_medida"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'colector_unidad_medida'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'colector_unidad_medida'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "usuario"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'colector_usuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'colector_usuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "usuario_permiso"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'colector_usuario_permiso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'colector_usuario_permiso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "articulo"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 795
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_items'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_items'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "oferta"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "oferta_articulo"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 136
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_offers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_offers'
GO
USE [master]
GO
ALTER DATABASE [pos_admin] SET  READ_WRITE 
GO
