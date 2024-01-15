-- incremental materialization as this table will be continually appended to
{{ config(materialized = 'incremental', on_schema_change='fail') }}

WITH src_reviews AS (
  SELECT * 
  FROM {{ ref('src_reviews') }}
)
SELECT * 
FROM src_reviews
WHERE review_text is not null

-- tell dbt how to increment via jinja if statement
-- if this is an incremental load, then append the below sql condition
-- sql condition: only want records where review_date > max(review_date) of 'this' table
-- 'this' refers to the fct_reviews model which is this sql file we are working on!
{% if is_incremental() %}
  AND review_date > (select max(review_date) from {{ this }})
{% endif %}