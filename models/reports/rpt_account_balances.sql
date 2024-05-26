with
    p1 as (
        select
            parent_guid as guid,
            sum(balance_myr) as subtotal_myr,
            sum(balance_sgd) as subtotal_sgd,
            sum(balance_usd) as subtotal_usd
        from dim_accounts
        group by parent_guid
    ),
    p2 as (
        select
            parent_guid as guid,
            sum(balance_myr) as subtotal_myr,
            sum(balance_sgd) as subtotal_sgd,
            sum(balance_usd) as subtotal_usd
        from dim_accounts a
        where guid in (select guid from p1)
        group by parent_guid
    )
select
    a.guid,
    a.name,
    a.fqn,
    a.account_category,
    a.latest_transaction,
    a.unit,
    round(a.balance, 2) as balance,
    round(a.balance_myr, 2) as balance_myr,
    round(a.balance_sgd, 2) as balance_sgd,
    round(a.balance_usd, 2) as balance_usd,
    ifnull(a.balance_myr, 0)
    + ifnull(p1.subtotal_myr, 0)
    + ifnull(p2.subtotal_myr, 0) as subtotal_myr,
    ifnull(a.balance_sgd, 0)
    + ifnull(p1.subtotal_sgd, 0)
    + ifnull(p2.subtotal_sgd, 0) as subtotal_sgd,
    ifnull(a.balance_usd, 0)
    + ifnull(p1.subtotal_usd, 0)
    + ifnull(p2.subtotal_usd, 0) as subtotal_usd
from dim_accounts a
left join p1 using (guid)
left join p2 using (guid)
