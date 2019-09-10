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
    } \
    dotlrn_dotlrn__keys {

        Simple test for the various dotlrn_dotlrn::..._key procs.

        @author Héctor Romojaro <hector.romojaro@gmail.com>
        @creation-date 2019-09-10
} {
    aa_equals "Portal element key" "[dotlrn_dotlrn::portal_element_key]" "dotlrn-portlet"
    aa_equals "My Package key" "[dotlrn_dotlrn::my_package_key]" "dotlrn-dotlrn"
    aa_equals "Applet key" "[dotlrn_dotlrn::applet_key]" "dotlrn_dotlrn"
}

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
