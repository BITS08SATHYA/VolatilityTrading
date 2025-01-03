SELECT
        expiry,
        strike_price,
        iv AS "IV",
        realized_vol AS "RV",
        option_type ,
        underlying_value,
        settle_price,
        RANK() OVER (
            PARTITION BY expiry
            ORDER BY iv DESC
            ) AS "IV Rank",
        CASE
            WHEN iv > realized_vol THEN 'Short Straddle'
            WHEN iv < realized_vol THEN 'Long Straddle'
            ELSE 'No Signal'
            END AS "Trade Signal"
    FROM options_data_updated AS main
    WHERE expiry = '{expiry_date}' and NOT EXISTS (
        SELECT 1
        FROM options_data_updated AS subquery
        WHERE subquery.strike_price = main.strike_price
          AND subquery.expiry = main.expiry
          AND (subquery.iv < 0 OR subquery.realized_vol < 0)
    )
    GROUP BY
        expiry,
        option_type,
        strike_price,
        iv,
        realized_vol, underlying_value, settle_price
    ORDER BY expiry DESC, strike_price