USE [ankura_dw]
GO

/****** Object:  Table [dbo].[CustomerPaymentsRaas]    Script Date: 8/3/2021 9:32:32 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CustomerPaymentsRaas](
	[PaymentAmountinUSD] [numeric](19, 4) NULL,
	[Status] [varchar](100) NULL,
	[ApplicationStatus] [varchar](100) NULL,
	[Company] [varchar](100) NULL,
	[Customer] [varchar](100) NULL,
	[LastUpdated] [datetime2](7) NULL,
	[Invoices] [varchar](500) NULL,
	[OnAccountAmount] [varchar](100) NULL,
	[PaymentType] [varchar](100) NULL,
	[TransactionNumber] [varchar](100) NULL,
	[PaymentInDepositYN] [char](1) NULL,
	[OverpaymentAmountinUSD] [numeric](19, 4) NULL,
	[PaymentDate] [datetime] NULL,
	[WID] [varchar](100) NULL,
	[PaymentAmount] [numeric](19, 4) NULL,
	[OverpaymentAmount] [numeric](19, 4) NULL,
	[CustomerPayment] [varchar](250) NULL,
	[CustomerID] [varchar](100) NULL,
	[Currency] [varchar](100) NULL,
	[batchId] [bigint] NULL,
	[LoadedDate] [datetime] NULL,
	[DataSourceCode] [varchar](50) NULL,
	[DataSourceID] [varchar](50) NULL
) ON [PRIMARY]
GO


