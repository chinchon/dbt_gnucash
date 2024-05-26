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

select
    guid,
    commodity_namespace,
    commodity_mnemonic,
    currency_mnemonic,
    value,
    date,
    case
        currency_mnemonic
        when 'MYR'
        then value
        when 'SGD'
        then value * {{ sgd_myr }}
        when 'USD'
        then value * {{ usd_myr }}
    end as value_myr
from {{ ref("int_prices_joined_commodities") }}
where is_latest
