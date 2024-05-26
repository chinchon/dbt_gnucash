{% set sql_statement %}
    select value from {{ ref("int_prices_joined_commodities") }}
    where is_latest and commodity_mnemonic = 'SGD' and currency_mnemonic = 'MYR'
{% endset %}

{%- set sgd_myr = dbt_utils.get_single_value(sql_statement) -%}

{% set sql_statement %}
    select value from {{ ref("int_prices_joined_commodities") }}
    where is_latest and commodity_mnemonic = 'USD' and currency_mnemonic = 'MYR'
{% endset %}

{%- set usd_myr = dbt_utils.get_single_value(sql_statement) -%}

with
    int_prices_joined_commodities as (
        select
            guid,
            commodity_namespace,
            commodity_mnemonic,
            currency_mnemonic,
            value,
            date,
            case
                when commodity_mnemonic = 'MYR'
                then 1
                when currency_mnemonic = 'MYR'
                then value
                when currency_mnemonic = 'SGD'
                then value * {{ sgd_myr }}
                when currency_mnemonic = 'USD'
                then value * {{ usd_myr }}
            end as value_myr
        from {{ ref("int_prices_joined_commodities") }}
        where is_latest
    )
select *, value_myr / {{ sgd_myr }} as value_sgd, value_myr / {{ usd_myr }} as value_usd
from int_prices_joined_commodities
