-- macro adapted from dim_listings_minimum_nights

{% test positive_value(model, column_name) %}
SELECT *
FROM {{ model }}
WHERE {{ column_name }} < 1
{% endtest %}