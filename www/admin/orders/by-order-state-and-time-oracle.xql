<?xml version="1.0"?>

<queryset>
   <rdbms><type>oracle</type><version>8.1.6</version></rdbms>

<fullquery name="orders_select">      
      <querytext>
      select o.order_id, o.confirmed_date, o.order_state, ec_total_price(o.order_id) as price_to_display, o.user_id, u.first_names, u.last_name, count(*) as n_items
from ec_orders o, cc_users u, ec_items i
where o.user_id=u.user_id(+)
and o.order_id=i.order_id
$confirmed_query_bit $order_state_query_bit
group by o.order_id, o.confirmed_date, o.order_state, ec_total_price(o.order_id), o.user_id, u.first_names, u.last_name
order by $order_by_clause

      </querytext>
</fullquery>

 
</queryset>
