

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
	# Callback to get node_id from community
	# REVISIT this (ben)
#	set node_id [site_node_id [ad_conn url]]

	# create the dotlrn package instance (all in one, I've mounted it)
#	set package_key [package_key]
	#set package_id [site_node_mount_application -return package_id $node_id $package_key $package_key $package_key]

	# set up a forum inside that instance
	#dotlrn_forum_new -context_id $package_id -short_name "Discussions"

	# aks - I think we just return the community_id here?
	# return the package_id
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

	# Call the portal element to be added correctly
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

	# remove user permissions to see dotlrns
	# nothing to do here
    }
	
}
