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
	return "Group Members Info"
    }

    ad_proc -public add_applet {
    } {
	Add the dotlrn applet to dotlrn - one time init - must be repeatable!
    } {
        dotlrn_applet::add_applet_to_dotlrn -applet_key "dotlrn_members"
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

        dotlrn_members::add_portlet $portal_id $args

        # this is not supposed to return anything, since
        # any return value here is interpreted as a valid package_id!
	return
    }

    ad_proc -public remove_applet_from_community {
        community_id
    } {
        remove the dotlrn members applet from a specific community
    } {
	set portal_id [dotlrn_community::get_portal_id -community_id $community_id]
        dotlrn_members::remove_portlet $portal_id "" 
    }

    ad_proc -public add_user {
	user_id
    } {
    } {
        # noop
    }

    ad_proc -public remove_user {
        user_id
    } {
    } {
        # noop
    }

    ad_proc -public add_user_to_community {
	community_id
	user_id
    } {
    } {
    }

    ad_proc -public remove_user_from_community {
	community_id
	user_id
    } {
    } {
    }

    ad_proc -public add_portlet {
        portal_id
        args
    } {
        A helper proc to add the underlying portlet to the given portal. 
        
        @portal_id 
        @param args ns_set (community_id?)
    } {
        # since this portlet is only added to community portals or portal templates
        # we only need to check for community_id in the ns_set
        set community_id [ns_set get $args "community_id"]

        if {![empty_string_p $community_id]} {
            # portal_id is a community portal 
            set community_type \
                [dotlrn_community::get_community_type_from_community_id \
                     $community_id]
            
            if {[string equal $community_type "dotlrn_community"]} {
                set page_name [get_subcomm_default_page]
            } else {
                set page_name [get_community_default_page]
            }
        } else {
            # portal_id is a portal template
            set community_id 0

            # FIXME - AKS - how do we find the right page without a type
            # for a  template? Maybe they should just pass it in.
            set page_name ""
        }

	dotlrn_members_portlet::add_self_to_page \
            -portal_id $portal_id \
            -page_name $page_name \
            -community_id $community_id

    }

    ad_proc -public remove_portlet {
        portal_id
        args
    } {
        A helper proc to remove the underlying portlet from the given portal. 
    } {
        # this is simple since there's no admin portlet or portal type stuff to do
        dotlrn_members_portlet::remove_self_from_page -portal_id $portal_id
    }
    
    ad_proc -public clone {
        old_community_id
        new_community_id
    } {
        Clone this applet's content from the old community to the new one.
        Since there's no data, just add the applet to the clone
    } {
        dotlrn_members::add_applet_to_community $new_community_id
    }

    #
    # misc procs
    #

    ad_proc -public get_community_default_page {} {
        Returns the user default page to add the portlet to. 
        FIXME Should be a ad_param.
    } {
        return "People"
    }

    ad_proc -public get_subcomm_default_page {} {
        FIXME Should be a ad_param.
    } {
        return "Subgroup Info"
    }

}
