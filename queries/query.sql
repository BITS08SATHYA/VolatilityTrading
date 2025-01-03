SELECT
                date,
                expiry,
                option_type,
                strike_price,
                underlying_value,
                settle_price,
                iv AS implied_volatility,
                COUNT(*) AS total_options
            FROM
                options_data
            WHERE
                expiry IS NOT NULL
                AND underlying_value IS NOT NULL
                AND underlying_value != 'NaN'
                AND settle_price IS NOT NULL
                AND settle_price != 'NaN'
                AND iv IS NOT NULL
                AND iv != 'NaN'
                AND underlying_value ~ '^[0-9]+(\.[0-9]+)?$'
                AND settle_price ~ '^[0-9]+(\.[0-9]+)?$'
            GROUP BY
                expiry,
                option_type,
                strike_price,
                iv,
                date,
                underlying_value,
                settle_price
            ORDER BY
                TO_DATE(expiry, 'DD-Mon-YYYY') ASC,
                strike_price DESC