ad_page_contract {
    @param address_type
    @param usca_p:optional
    @param address_id:optional

    @author
    @creation-date
    @author ported by Jerry Asher (jerry@theashergroup.com)
    @author revised by Bart Teeuwisse <bart.teeuwisse@7-sisters.com>
    @revision-date April 2002

} {
    address_type
    usca_p:optional
    address_id:optional
}

ec_redirect_to_https_if_possible_and_necessary

# we need them to be logged in

set user_id [ad_verify_and_get_user_id]
if {$user_id == 0} {
    set return_url "[ad_conn url]"
    ad_returnredirect "/register?[export_url_vars return_url]"
    return
}

# Retrieve the saved address with address_id. 

if { [info exists address_id] } {
    db_0or1row select_address "
	select attn, line1, line2, city, usps_abbrev, zip_code, phone, country_code, full_state_name, phone_time 
	from ec_addresses 
	where address_id=:address_id"

    # Redirect to the international address form if the address is
    # outside the United States.

    if { ![string equal $country_code "US"] } {
	ad_returnredirect "address-international?[export_url_vars address_id address_type]"
    }

    if { [info exists usps_abbrev] } {
	set state_widget [state_widget $usps_abbrev]
    }
} else {

    # Retrieve the default name.

    set attn [db_string get_full_name "
	select first_names || ' ' || last_name as name 
	from cc_users 
	where user_id=:user_id"]

}
if { ![info exists state_widget] } {
    set state_widget [state_widget]
}

# User session tracking

set user_session_id [ec_get_user_session_id]
ec_create_new_session_if_necessary
ec_log_user_as_user_id_for_this_session

# Get the location from which delete-address was called.

set header_set [ns_conn headers]
set action [ns_set get [ns_conn headers] Referer]

# Get the form vars that were passed on delete-address so that they
# can be passed back to the calling url. gift-certificate-billing has
# a bunch of form vars that should not be lost.

set hidden_form_vars "[export_form_vars action]"
set form_set [ns_getform]
for {set i 0} {$i < [ns_set size $form_set]} {incr i} {
    set [ns_set key $form_set $i] [ns_set value $form_set $i]
    append hidden_form_vars "[export_form_vars [ns_set key $form_set $i]]"
}

set user_name_with_quotes_escaped [ad_quotehtml $attn]
db_release_unused_handles