#
#  Copyright (C) 2001, 2002 OpenForce, Inc.
#
#  This file is part of dotLRN.
#
#  dotLRN is free software; you can redistribute it and/or modify it under the
#  terms of the GNU General Public License as published by the Free Software
#  Foundation; either version 2 of the License, or (at your option) any later
#  version.
#
#  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
#  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
#  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
#  details.
#



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
	return "dotLRN Group Info"
    }

    ad_proc -public add_applet {
    } {
	Add the dotlrn applet to dotlrn - one time init - must be repeatable!
    } {
        dotlrn_applet::add_applet_to_dotlrn -applet_key "dotlrn_dotlrn"
    }

    ad_proc -public add_applet_to_community {
	community_id
    } {
	Add the dotlrn applet to a specific community
    } {
	set pt_id [dotlrn_community::get_portal_id -community_id $community_id]
	dotlrn_portlet::make_self_available $pt_id
        dotlrn_portlet::add_self_to_page $pt_id $community_id                

        if {[dotlrn_community::dummy_comm_p -community_id $community_id]} {
            return
        }

	# set up the DS for the admin page
        set admin_portal_id [dotlrn_community::get_admin_portal_id -community_id $community_id]
	dotlrn_admin_portlet::make_self_available $admin_portal_id
	dotlrn_admin_portlet::add_self_to_page $admin_portal_id $community_id

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
	user_id
    } {
	Called for one time init when this user is added to dotlrn
    } {
	return
    }

    ad_proc -public remove_user {
        user_id
    } {
    } {
    }

    ad_proc -public add_user_to_community {
	community_id
	user_id
    } {
	Called when a user is added to a spceific dotlrn community
    } {
    }

    ad_proc -public remove_user_from_community {
	community_id
	user_id
    } {
	Remove a user from a community
    } {
    }
	
}
