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
	return "Group Admin and Subgroup Info"
    }

    ad_proc -public add_applet {
    } {
	Add the dotlrn applet to dotlrn - one time init - must be repeatable!
    } {
        dotlrn_applet::add_applet_to_dotlrn -applet_key "dotlrn_dotlrn"
    }

    ad_proc -public remove_applet {
	package_id
    } {
	remove the applet from dotlrn
    } {
    }

    ad_proc -public add_applet_to_community {
	community_id
    } {
	Add the dotlrn applet to a specific community
    } {
        set portal_id [dotlrn_community::get_portal_id \
                           -community_id $community_id
        ]
        set args [ns_set create args]
        ns_set put $args community_id $community_id

        dotlrn_dotlrn::add_portlet $portal_id $args

        # this is not supposed to return anything, since
        # any return value here is interpreted as a valid package_id!
	return
    }

    ad_proc -public remove_applet_from_community {
	community_id
    } {
	remove the dotlrn applet from a specific community
    } {
        set portal_id portal_id [dotlrn_community::get_portal_id \
                                     -community_id $community_id
        ]
        set args [ns_set create args]
        ns_set put $args community_id $community_id

        dotlrn_dotlrn::remove_portlet $portal_id $args
    }

    ad_proc -public add_user {
	user_id
    } {
	Called for one time init when this user is added to dotlrn
    } {
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
	Remove a user from a community. Since this applet is not shown 
        on a user's portal, no action is required here.	
    } {
    }
	
    ad_proc -public add_portlet {
        portal_id
        args
    } {
        A helper proc to add the underlying portlet to the given portal. 
        
        @param portal_id 
        @param args An ns_set of key-value pairs. (community_id?) 
    } {
        # since this portlet is only added to community portals or portal templates
        # we only need to check for community_id in the ns_set
        set community_id [ns_set get $args "community_id"]

        if {![empty_string_p $community_id]} {
            # portal_id is a community portal 
            # set up the DS for the admin page
            set admin_portal_id  [dotlrn_community::get_admin_portal_id \
                                      -community_id $community_id]
            dotlrn_admin_portlet::add_self_to_page \
                -portal_id $admin_portal_id \
                -community_id $community_id
        } else {
            # portal_id is a portal template
            set community_id 0
        }

        dotlrn_portlet::add_self_to_page \
            -portal_id $portal_id \
            -community_id $community_id
    }

    ad_proc -public remove_portlet {
        portal_id
        args
    } {
        A helper proc to remove the underlying portlet from the given portal. 
        
        @param portal_id
        @param args ns_set (community_id?)
    } {
        # since this portlet is only added to community portals or portal templates
        # we only need to check for community_id in the ns_set
        set community_id [ns_set get $args "community_id"]

        if {![empty_string_p $community_id]} {
            # portal_id is a community portal 
            # set up the DS for the admin page
            set admin_portal_id  [dotlrn_community::get_admin_portal_id \
                                      -community_id $community_id]
            dotlrn_admin_portlet::remove_self_to_page \
                -portal_id $admin_portal_id \
                -community_id $community_id
        } else {
            # portal_id is a portal template
            set community_id 0
        }

        dotlrn_portlet::remove_self_to_page \
            -portal_id $portal_id \
            -community_id $community_id
    }

    ad_proc -public clone {
        old_community_id
        new_community_id
    } {
        Clone this applet's content from the old community to the new one.
        Since there's no data to copy, just add the applet to the new community.
        
    } {
        dotlrn_dotlrn::add_applet_to_community $new_community_id
    }

}
