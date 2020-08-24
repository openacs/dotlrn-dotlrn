ad_library {

        Automated tests for the dotlrn-dotlrn package.

        @author Héctor Romojaro <hector.romojaro@gmail.com>
        @creation-date 2019-09-10

}

aa_register_case \
    -cats {api smoke production_safe} \
    -procs {
        dotlrn_dotlrn::package_key
        dotlrn_dotlrn::my_package_key
        dotlrn_dotlrn::applet_key
        dotlrn_members::my_package_key
        dotlrn_members::applet_key
        dotlrn_members_staff::my_package_key
        dotlrn_members_staff::applet_key
    } \
    dotlrn_dotlrn__keys {

        Simple test for the various dotlrn_dotlrn::..._key procs.

        @author Héctor Romojaro <hector.romojaro@gmail.com>
        @creation-date 2019-09-10
} {
    aa_equals "Portal element key"  "[dotlrn_dotlrn::portal_element_key]"       "dotlrn-portlet"
    aa_equals "My Package key"      "[dotlrn_dotlrn::my_package_key]"           "dotlrn-dotlrn"
    aa_equals "Applet key"          "[dotlrn_dotlrn::applet_key]"               "dotlrn_dotlrn"
    aa_equals "My Package key"      "[dotlrn_members::my_package_key]"          "dotlrn-dotlrn"
    aa_equals "Applet key"          "[dotlrn_members::applet_key]"              "dotlrn_members"
    aa_equals "My Package key"      "[dotlrn_members_staff::my_package_key]"    "dotlrn-dotlrn"
    aa_equals "Applet key"          "[dotlrn_members_staff::applet_key]"        "dotlrn_members_staff"
}

aa_register_case -procs {
        dotlrn_dotlrn::get_pretty_name
        dotlrn_members::get_pretty_name
        dotlrn_members_staff::get_pretty_name
    } -cats {
        api
        production_safe
    } dotlrn_dotlrn__names {
        Test diverse name procs.
} {
    aa_equals "Pretty name"                 "[dotlrn_dotlrn::get_pretty_name]" "[_ dotlrn-dotlrn.Core_DotLRN_Applets]"
    aa_equals "Members pretty name"         "[dotlrn_members::get_pretty_name]" "[_ dotlrn-dotlrn.Group_Members_Info]"
    aa_equals "Members staff pretty name"   "[dotlrn_members_staff::get_pretty_name]" "[_ dotlrn-dotlrn.lt_dotLRN_Staff_List_Inf]"
}

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
