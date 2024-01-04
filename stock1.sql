SELECT * FROM project2.stock;
-- database project2 table name stock--
-- KPI1: Average Daily Trading Volume--
select ticker, sum(volume)/ count(day(date)) as Average_daily_trading from stock group by ticker;

-- KPI2: Most Volatile Stocks--
select ticker, avg(beta) from stock group by ticker;

-- KPI3: Stocks with Highest Dividend and Lowest Dividend--
select ticker, sum(dividendamount*StockSplit) as TotalDividend from stock group by Ticker order by TotalDividend desc;
select  max(Totaldividend), ticker from (select ticker, sum(dividendamount*StockSplit) as TotalDividend from stock group by Ticker order by TotalDividend desc limit 5) as dividend group by ticker;
select  min(totalDividend), ticker from (select ticker, sum(dividendamount*StockSplit) as TotalDividend from stock group by Ticker order by TotalDividend desc limit 5) as dividend;

-- KPI4: Highest and lowest PE Ratio--
select ticker, round(sum(Peratio),5) as PE_Ratio from stock group by ticker order by PE_Ratio desc; 

-- KPI5: Stock with Highest Market Cap--
select ticker, sum(marketcap) as HighestMarketCap from stock group by ticker order by HighestMarketCap desc limit 1;

-- KPI6: MACD AND SIGNAL --

select ticker, round(sum(macd),2),avg(RSI14days) from stock group by ticker;
select ticker,round(avg(RSI14days),2) from stock group by ticker;

-- KPI 6 -- strong buy signal--

select ticker, macd from stock where macd>0 and rsi14days>30 and rsi14days<80;
-- strong sell signal--
select ticker, macd from stock where rsi14days>80;


select avRSI14days from stock group by ticker;