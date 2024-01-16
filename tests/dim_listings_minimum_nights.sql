SELECT * 
FROM {{ ref('dim_listings_clean') }} 
WHERE MINIMUM_NIGHTS < 1
LIMIT 10