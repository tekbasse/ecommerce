<?xml version="1.0"?>

<queryset>
  <rdbms>
    <type>oracle</type>
    <version>8.1.6</version>
  </rdbms>

  <fullquery name="select_one">      
    <querytext>
      select 1
      from dual
      where to_date('$start_date(date)','YYYY-MM-DD HH24:MI:SS')  > to_date('$end_date(date)', 'YYYY-MM-DD HH24:MI:SS')
    </querytext>
  </fullquery>

</queryset>
