#
# Procs for DOTLRN members Applet
# Copyright 2001 OpenForce, inc.
# Distributed under the GNU GPL v2
#
# $Id$
#

ad_library {
    
    Procs to set up the dotLRN "members" applet
    
    @author ben@openforce.net,arjun@openforce.net
}

namespace eval dotlrn_members {
    
    # aks - don't need this, I think
    # ad_proc -public package_key {
    # } {
    #     get the package_key this applet deals with
    # } {
    #     return "dotlrn"
    # }

    ad_proc portal_element_key {
    } {
	Returns the key for the portal element this applet uses
    } {
	return "dotlrn-members-portlet"
    }

    ad_proc -public get_pretty_name {
    } {
	Returns the pretty name of the applet
    } {
	return "dotLRN Members Info"
    }

    ad_proc -public add_applet {
    } {
	Add the dotlrn applet to dotlrn - one time init - must be repeatable!
    } {
        dotlrn_applet::add_applet_to_dotlrn -applet_key "dotlrn_members"
    }

    ad_proc -public get_community_default_page {} {
        Returns the user default page to add the portlet to. 
        FIXME Should be a ad_param.
    } {
        return "People"
    }

    ad_proc -public add_applet_to_community {
	community_id
    } {
	Add the dotlrn applet to a specific community
    } {
	# Not shown on the Non-member page for a comm

	# portal template stuff
	set pt_id [dotlrn_community::get_portal_template_id $community_id]

	# set up the DS for the portal template
	dotlrn_members_portlet::make_self_available $pt_id

        # add the portlet to the correct page for this comm
        set page_id [portal::get_page_id \
            -portal_id $pt_id \
            -page_name [get_community_default_page] \
        ]

	dotlrn_members_portlet::add_self_to_page \
                -page_id $page_id \
                $pt_id \
                $community_id

	return $community_id
    }

    ad_proc -public remove_applet {
	community_id
	package_id
    } {
	remove the applet from the community
    } {
    }

    ad_proc -public add_user {
	user_id
    } {
	Called for one time init when this user is added to dotlrn
    } {
	return
    }


    ad_proc -public add_user_to_community {
	community_id
	user_id
    } {
	Called when a user is added to a spceific dotlrn community
    } {
    }

    ad_proc -public remove_user {
        user_id
    } {
    } {
    }

    ad_proc -public remove_user_from_community {
	community_id
	user_id
    } {
	Remove a user from a community
    } {
	# Get the portal_id
	set portal_id [dotlrn_community::get_portal_id $community_id $user_id]
	
	# Get the package_id by callback
	# set package_id [dotlrn_community::get_package_id $community_id]

	# Remove the portal element
	dotlrn_members_portlet::remove_self_from_page $portal_id $community_id

	# Buh Bye.
	dotlrn_members_portlet::make_self_unavailable $portal_id

	# remove user permissions to see dotlrns
	# nothing to do here
    }
	
}
