PSQL python
Strata 2056
Write a query that will calculate the number of shipments per month. The unique key for one shipment is a 
combination of shipment_id and sub_id. Output the year_month in format YYYY-MM and the number of shipments in that month.
```sql
WITH cte AS (
SELECT *, TO_CHAR(shipment_date, 'YYYY-MM') AS year_month FROM amazon_shipment
)
select year_month, COUNT(*) FROM cte GROUP BY year_month;
```
```py
import pandas as pd
amazon_shipment.head()
amazon_shipment['year_month'] = amazon_shipment['shipment_date'].dt.strftime('%Y-%m')
result = amazon_shipment.groupby('year_month')['shipment_id'].count().to_frame('count').reset_index().sort_values('year_month')
```