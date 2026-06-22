
IF EXISTS
	(SELECT *
	FROM sysobjects
	WHERE id = OBJECT_ID(N'Fact_Valuations')) -- Menjamo naziv tabele
BEGIN
	-- KOMANDA ZA DROP TABLE
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Fact_Valuations]') AND type in (N'U'))
	DROP TABLE [dbo].[Fact_Valuations]


	-- KOMANDA ZA CREATE TABLE
CREATE TABLE [dbo].[Fact_Valuations](
	[valuation_id] [int] IDENTITY(1,1) NOT NULL,
	[date_sid] [int] NULL,
	[player_sid] [int] NULL,
	[club_sid] [int] NULL,
	[market_value] [decimal](12, 2) NULL,
	[market_value_change] [decimal](12, 2) NULL,
	[max_market_value_lifetime] [decimal](12, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[valuation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Fact_Valuations] UNIQUE NONCLUSTERED 
(
	[date_sid] ASC,
	[player_sid] ASC,
	[club_sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[Fact_Valuations]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Valuations_Dim_Club] FOREIGN KEY([club_sid])
REFERENCES [dbo].[Dim_Club] ([club_sid])


ALTER TABLE [dbo].[Fact_Valuations] CHECK CONSTRAINT [FK_Fact_Valuations_Dim_Club]


ALTER TABLE [dbo].[Fact_Valuations]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Valuations_Dim_Date] FOREIGN KEY([date_sid])
REFERENCES [dbo].[Dim_Date] ([date_sid])


ALTER TABLE [dbo].[Fact_Valuations] CHECK CONSTRAINT [FK_Fact_Valuations_Dim_Date]


ALTER TABLE [dbo].[Fact_Valuations]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Valuations_Dim_Player] FOREIGN KEY([player_sid])
REFERENCES [dbo].[Dim_Player] ([player_sid])


ALTER TABLE [dbo].[Fact_Valuations] CHECK CONSTRAINT [FK_Fact_Valuations_Dim_Player]


ALTER TABLE Fact_Valuations
ADD CONSTRAINT UQ_Fact_Valuations UNIQUE (date_sid, player_sid, club_sid)







END
