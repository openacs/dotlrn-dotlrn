

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
	Add the dotlrn applet
    } {
	# No mounting of anything

	# Get the non-member page_id
	set non_member_page_id [dotlrn_community::get_community_non_members_page_id $community_id]

	# Add the element there, too
	dotlrn_portlet::make_self_available $page_id $community_id

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
	Add a user to a community
    } {
	# Get the page_id by callback
	set page_id [dotlrn_community::get_page_id $community_id $user_id]
	
	# Get the package_id by callback
	# set package_id [dotlrn_community::get_package_id $community_id]

	# Allow user to see the dotlrn forums
	# nothing for now

	# Make dotlrn DS available to this page
	dotlrn_portlet::add_self_to_page $page_id $community_id
    }

    ad_proc -public remove_user {
	community_id
	user_id
    } {
	Remove a user from a community
    } {
	# Get the page_id
	set page_id [dotlrn_community::get_page_id $community_id $user_id]
	
	# Get the package_id by callback
	# set package_id [dotlrn_community::get_package_id $community_id]

	# Remove the portal element
	dotlrn_portlet::remove_self_from_page $page_id $community_id

	# Buh Bye.
	dotlrn_portlet::make_self_unavailable $page_id

	# remove user permissions to see dotlrns
	# nothing to do here
    }
	
}
