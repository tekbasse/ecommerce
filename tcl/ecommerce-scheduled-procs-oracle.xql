<?xml version="1.0"?>

<queryset>
   <rdbms><type>oracle</type><version>8.1.6</version></rdbms>

<fullquery name="ec_calculate_product_purchase_combinations.confirmed_orders_select">      
      <querytext>
      
      select order_id, ec_order_cost(order_id) as total_order_price
      from ec_orders
      where order_state = 'confirmed' 
      and (sysdate - confirmed_date) > 1/96
  
      </querytext>
</fullquery>

 
<fullquery name="ec_calculate_product_purchase_combinations.problems_log_insert">      
      <querytext>
      
		  insert into ec_problems_log
		  (problem_id, problem_date, problem_details, order_id)
		  values
		  (ec_problem_id_sequence.nextval, sysdate, :problem_details, :order_id)
	      
      </querytext>
</fullquery>

 
<fullquery name="ec_calculate_product_purchase_combinations.gift_certificate_select">      
      <querytext>
      
      select g.gift_certificate_id, t.transaction_id
      from ec_gift_certificates g, ec_financial_transactions t
      where g.gift_certificate_id=t.gift_certificate_id
      and g.gift_certificate_state = 'confirmed' 
      and (sysdate - g.issue_date) > 1/96
  
      </querytext>
</fullquery>

 
<fullquery name="ec_calculate_product_purchase_combinations.financial_transactions_update">      
      <querytext>
      
	      update ec_financial_transactions
	      set authorized_date=sysdate,
	      to_be_captured_p='t'
	      where transaction_id = :transaction_id
	  
      </querytext>
</fullquery>

 
<fullquery name="ec_calculate_product_purchase_combinations.gift_certificate_state_update">      
      <querytext>
      
	      update ec_gift_certificates
	         set authorized_date = sysdate,
	             gift_certificate_state = :cc_result
	       where gift_certificate_id = :gift_certificate_id
	  
      </querytext>
</fullquery>

 
<fullquery name="ec_expire_old_carts.expired_carts_update">      
      <querytext>
      update ec_orders set order_state='expired', expired_date=sysdate where order_state='in_basket' and sysdate-in_basket_date > [util_memoize {ad_parameter -package_id [ec_id] CartDuration ecommerce} [ec_cache_refresh]]
      </querytext>
</fullquery>

 
<fullquery name="ec_expire_old_carts.item_state_update">      
      <querytext>
      update ec_items set item_state='expired', expired_date=sysdate where item_state='in_basket' and order_id in (select order_id from ec_orders where order_state='expired')
      </querytext>
</fullquery>

 
<fullquery name="ec_unauthorized_transactions.unauthorized_transactions_select">      
      <querytext>
      
	select transaction_id, order_id from ec_financial_transactions
	where to_be_captured_p='t'
	and sysdate-to_be_captured_date > 1/48
	and authorized_date is null
	and failed_p='f'
    
      </querytext>
</fullquery>

 
<fullquery name="ec_calculate_product_purchase_combinations.problems_log_insert">      
      <querytext>
      
		  insert into ec_problems_log
		  (problem_id, problem_date, problem_details, order_id)
		  values
		  (ec_problem_id_sequence.nextval, sysdate, :problem_details, :order_id)
	      
      </querytext>
</fullquery>

 
<fullquery name="ec_unauthorized_transactions.problems_insert">      
      <querytext>
      
		insert into ec_problems_log
		(problem_id, problem_date, problem_details, order_id)
		values
		(ec_problem_id_sequence.nextval, sysdate, :problem_details, :order_id)
	    
      </querytext>
</fullquery>

 
<fullquery name="ec_unauthorized_transactions.transaction_success_update">      
      <querytext>
      update ec_financial_transactions set authorized_date=sysdate where transaction_id=:transaction_id
      </querytext>
</fullquery>

 
<fullquery name="ec_calculate_product_purchase_combinations.problems_log_insert">      
      <querytext>
      
		    insert into ec_problems_log
		    (problem_id, problem_date, problem_details, order_id)
		    values
		    (ec_problem_id_sequence.nextval, sysdate, :problem_details, :order_id)
		
      </querytext>
</fullquery>

 
<fullquery name="ec_unmarked_transactions.financial_transaction_success_update">      
      <querytext>
      update ec_financial_transactions set marked_date=sysdate where transaction_id=:transaction_id
      </querytext>
</fullquery>

 
<fullquery name="ec_calculate_product_purchase_combinations.problems_log_insert">      
      <querytext>
      
		  insert into ec_problems_log
		  (problem_id, problem_date, problem_details, order_id)
		  values
		  (ec_problem_id_sequence.nextval, sysdate, :problem_details, :order_id)
	      
      </querytext>
</fullquery>

 
<fullquery name="ec_unsettled_transactions.settled_date_update">      
      <querytext>
      update ec_financial_transactions set settled_date=sysdate where transaction_id=:transaction_id
      </querytext>
</fullquery>

 
<fullquery name="ec_unsettled_transactions.two_days_since_order_was_marked_p">      
      <querytext>
      select case when sign(1 - ((sysdate-marked_date)/2)) = -1 then 1 else 0 end from ec_financial_transactions where transaction_id=:transaction_id
      </querytext>
</fullquery>

 
<fullquery name="ec_calculate_product_purchase_combinations.problems_log_insert">      
      <querytext>
      
		  insert into ec_problems_log
		  (problem_id, problem_date, problem_details, order_id)
		  values
		  (ec_problem_id_sequence.nextval, sysdate, :problem_details, :order_id)
	      
      </querytext>
</fullquery>

 
<fullquery name="ec_unrefunded_transactions.unrefunded_transactions_select">      
      <querytext>
      
	select transaction_id, order_id from ec_financial_transactions
	where transaction_type='refund'
	and sysdate - inserted_date > 1/48
	and refunded_date is null
	and failed_p='f'
    
      </querytext>
</fullquery>

 
<fullquery name="ec_calculate_product_purchase_combinations.financial_transactions_update">      
      <querytext>
      update ec_financial_transactions set refunded_date=sysdate where transaction_id=:transaction_id
      </querytext>
</fullquery>

 
<fullquery name="ec_calculate_product_purchase_combinations.problems_log_insert">      
      <querytext>
      
		  insert into ec_problems_log
		  (problem_id, problem_date, problem_details, order_id)
		  values
		  (ec_problem_id_sequence.nextval, sysdate, :problem_details, :order_id)
	      
      </querytext>
</fullquery>

 
<fullquery name="ec_unrefunded_transactions.financial_transaction_refund_update">      
      <querytext>
      update ec_financial_transactions set refunded_date=sysdate where transaction_id=:transaction_id
      </querytext>
</fullquery>

 
<fullquery name="ec_unrefund_settled_transactions.financial_transaction_refund_settled_update">      
      <querytext>
      update ec_financial_transactions set refund_settled_date=sysdate where transaction_id=:transaction_id
      </querytext>
</fullquery>

 
<fullquery name="ec_unrefund_settled_transactions.two_days_since_order_was_refunded_p">      
      <querytext>
      select case when sign(1 - ((sysdate-refunded_date)/2)) = -1 then 1 else 0 end from ec_financial_transactions where transaction_id=:transaction_id
      </querytext>
</fullquery>

 
<fullquery name="ec_calculate_product_purchase_combinations.problems_log_insert">      
      <querytext>
      insert into ec_problems_log
	  (problem_id, problem_date, problem_details, order_id)
	  values
	  (ec_problem_id_sequence.nextval, sysdate, :problem_details, :order_id)
	  
      </querytext>
</fullquery>

 
</queryset>
