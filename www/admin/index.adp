<master>
<property name="title">@page_title@</property>
<property name="context_bar">@context_bar;noquote@</property>

<property name="show_toolbar_p">t</property>

<h2>@page_title@</h2>

<hr>
Documentation: <a href="/doc/ecommerce">/doc/ecommerce</a> or <a href="@ec_url@doc/">@ec_url@doc/</a>
<hr>

<h3>business operations</h3>
<ul>
<li><a href="orders/">Orders / Shipments / Refunds</a> <font size=-1>(@n_in_last_24_hours@ orders in last 24 hours; @n_in_last_7_days@ in last 7 days)</font></li>
<li><a href="customer-service/">Customer Service</a> <font size=-1>(@num_open_issues@ open issues)</font></li>

<if @user_classes_reqs_approval@>
<li><a href="user-classes/">User Classes</a> <font size=-1>(@n_not_yet_approved@ not yet approved user@num_classes_not_yet_approved_plural@)</font></li>
</if>

<if @product_comments_allowed@>
<li><a href="customer-reviews/">Customer Reviews</a> <font size=-1>(@num_non_approved_comments@ not yet approved)</font></li>
</if>

<li><a href="products/recommendations">Recommend Products</a> <font size=-1>(@n_products@ products; average price: @pretty_avg_price@)</font></li>

</ul>

<h3>website administration</h3><ul>

<li><a href="problems/">Potential Problems</a> <font size=-1>(@unresolved_problem_count@ unresolved problem@unresolved_problem_count_plural@)</font></li>

<if @paymentgateway_show@>
<li><a href="/@paymentgateway_key@/admin">Payment Gateway Administration</a></li>
</if>

<li><a href="products/">Products</a> <font size=-1>(@n_products@ products; average price: @pretty_avg_price@)</font></li>

<li><a href="templates/">Product Templates</a></li>

<if ! @user_classes_reqs_approval@>
<li><a href="user-classes/">User Classes</a> <font size=-1>(@n_not_yet_approved@ not yet approved user@n_not_yet_approved_plural@)</font></li>
</if>

<if @multiple_retailers_p@>
<li><a href="retailers/">Retailers</a></li>
<else>
<li><a href="shipping-costs/">Shipping Costs</a></li>
<li><a href="sales-tax/">Sales Tax</a></li>
</if>

<li><a href="mailing-lists/">Mailing Lists</a></li>
<li><a href="email-templates/">Email Templates</a></li>
<li><a href="searches">User Search Terms</a></li>
<li><a href="audit-tables">Audit @ec_system_name@</a></li>

</ul>