#  www/[ec_url_concat [ec_url] /admin]/products/index.tcl
ad_page_contract {
  The main admin page for products.

  @author Eve Andersson (eveander@arsdigita.com)
  @creation-date Summer 1999
  @cvs-id $Id$
  @author ported by Jerry Asher (jerry@theashergroup.com)
} {
}

ad_require_permission [ad_conn package_id] admin

set page_title "Product Administration"
set context_bar [template::adp_parse [acs_root_dir]/packages/[ad_conn package_key]/www/contextbar [list context_addition "Product Administration"]]

# For Audit tables
set table_names_and_id_column [list ec_products ec_products_audit product_id]



db_1row products_select "select count(*) as n_products, round(avg(price),2) as avg_price from ec_products_displayable"

