<?xml version="1.0"?>

<queryset>
  <rdbms>
    <type>oracle</type>
    <version>8.1.6</version>
  </rdbms>

  <fullquery name="insert_new_comment">      
    <querytext>
      insert into ec_product_comments
      (comment_id, product_id, user_id, user_comment, one_line_summary,
      rating, comment_date, last_modified, last_modifying_user, modified_ip_address)
      values
      (:comment_id, :product_id, :user_id, :user_comment, :one_line_summary,
      :rating, sysdate, sysdate, :user_id, :ns_conn_peeraddr)
    </querytext>
  </fullquery>

</queryset>
