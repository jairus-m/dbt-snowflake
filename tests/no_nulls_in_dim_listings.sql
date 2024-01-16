-- use no nulls macro
{{ no_nulls_in_columns(ref('dim_listings_clean')) }}