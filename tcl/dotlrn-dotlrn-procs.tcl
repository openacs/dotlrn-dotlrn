

#
# Procs for DOTLRN Dotlrn Applet
# Copyright 2001 OpenForce, inc.
# Distributed under the GNU GPL v2
#
# October 5th, 2001
#

ad_library {
    
    Procs to set up the dotLRN Dotlrn applet
    
    @author ben@openforce.net,arjun@openforce.net
    @creation-date 2001-10-05
    
}

namespace eval dotlrn_dotlrn {
    
    ad_proc -public package_key {
    } {
	get the package_key this applet deals with
    } {
	return "dotlrn"
    }

    ad_proc portal_element_key {
    } {
	return the portal element key
    } {
	return "dotlrn-portlet"
    }

    ad_proc -public get_pretty_name {
    } {
	returns the pretty name
    } {
	return "dotLRN Community Info"
    }

    ad_proc -public add_applet {
	community_id
    } {
	Add the dotlrn applet to dotlrn - one time init
    } {
	return
    }

    ad_proc -public add_applet_to_community {
	community_id
    } {
	Add the dotlrn applet to a specific community
    } {
	# No mounting of anything

	# Non-member page stuff
	# Get the non-member portal_id
	set portal_id [dotlrn_community::get_community_non_members_portal_id $community_id]

	# Add the element there, too
	dotlrn_portlet::make_self_available $portal_id
	dotlrn_portlet::add_self_to_page $portal_id $community_id

	# portal template stuff
	# get the portal_template_id
	set pt_id [dotlrn_community::get_portal_template_id $community_id]

	# set up the DS for the portal template
	dotlrn_portlet::make_self_available $pt_id
	dotlrn_portlet::add_self_to_page $pt_id $community_id


	return $community_id
    }

    ad_proc -public remove_applet {
	community_id
	package_id
    } {
	remove the applet from the community
    } {
	# Remove all instances of the dotlrn portlet! (this is some serious stuff!)

	# Dropping all messages, forums

	# Killing the package
    
    }

    ad_proc -public add_user {
	community_id
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
	# Get the portal_id by callback
	set portal_id [dotlrn_community::get_portal_id $community_id $user_id]

	# Allow user to see the dotlrn forums
	# nothing for now

	# Make dotlrn DS available to this page
	dotlrn_portlet::make_self_available $portal_id
	dotlrn_portlet::add_self_to_page $portal_id $community_id
    }

    ad_proc -public remove_user {
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
	dotlrn_portlet::remove_self_from_page $portal_id $community_id

	# Buh Bye.
	dotlrn_portlet::make_self_unavailable $portal_id

	# remove user permissions to see dotlrns
	# nothing to do here
    }
	
}
