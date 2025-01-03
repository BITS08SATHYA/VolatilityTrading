# Volatility-Based Options Trading Strategy

This project focuses on designing and implementing a **volatility-driven options trading strategy** tailored for the Indian equity market, specifically the NSE Nifty 50 index options. The strategy systematically analyzes implied, realized, and forecasted volatility to identify mispriced options and generate actionable trading signals.

## Key Features:
- **Data Preparation:** Automated extraction, cleaning, and storage of historical options data using Python and PostgreSQL.
- **Volatility Metrics:** Computed implied, realized, and forecasted volatility using advanced statistical and GARCH models.
- **Trading Strategies:** Implemented short and long straddles based on the relative alignment of volatility metrics.
- **Backtesting Framework:** Developed a robust backtesting pipeline to evaluate Sharpe ratios, payoffs, and strategy performance.
- **Visualization and Insights:** Provided clear visualizations of volatility dynamics and trade signal performance.

## Technologies Used:
- Python (pandas, numpy, arch, matplotlib)
- PostgreSQL for data management
- Docker for database hosting
- REST API for data extraction

## Repository Link
[Volatility-Based Options Trading Strategy GitHub Repository](https://github.com/BITS08SATHYA/VolatilityTrading.git)
