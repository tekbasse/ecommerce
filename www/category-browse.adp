<master>
  <property name="title">@the_category_name;noquote@</property>
  <property name="context_bar">@context_bar;noquote@</property>
  <property name="signatory">@ec_system_owner;noquote@</property>

  <include src="toolbar">

<blockquote>
  <table width="90%">
    <tr valign="top">
      <if @subcategories@ >
        <td width="50%">
	  <h4>Browse:</h4>
	  <ul>
	    @subcategories;noquote@
	  </ul>
        </td>
      </if>
      <if @recommendations@ >
        <td>
	  <h4>We recommend:</h4>
	  @recommendations;noquote@
        </td>
     </if>
    </tr>
  </table>      

  <h4>@category_name@ products:</h4>
  @products;noquote@

  @prev_link;noquote@ @separator;noquote@ @next_link;noquote@
</blockquote>

<p><a href="mailing-list-add?category_id=@the_category_id@">Add yourself to the @the_category_name@ mailing list!</a></p>
