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

ad_library {
    
    Procs to set up the core dotLRN portlets. 

    1. the soon-to-be-renamed "dotlrn-main" portlet
    (The thing that lists a users communities on their portal)
    2. the "dotlrn" portlet (aka "subgroups" on comm portals)
    3. the "dotlrn-admin portlet" (basic group admin)

    and experimentally (so we eliminate these 2 applets):

    4. "dotlrn-members" for clubs and subcomms
    5. "dotlrn-members-staff" for classi's

    @author ben@openforce.net,arjun@openforce.net
    @version $Id$
}

namespace eval dotlrn_dotlrn {
    
    ad_proc portal_element_key {
    } {
        What portlet is this applet associated with?
    } {
	return "dotlrn-portlet"
    }

    ad_proc -public get_pretty_name {
    } {
    } {
	return "Core DotLRN Applets"
    }

    ad_proc -public applet_key {
    } {
    } {
        return "dotlrn_dotlrn"
    }

    ad_proc -public add_applet {
    } {
	Add the applet to dotlrn - one time init - must be repeatable!
    } {
        dotlrn_applet::add_applet_to_dotlrn -applet_key [applet_key]
    }

    ad_proc -public remove_applet {
	package_id
    } {
	Remove the applet from dotlrn. 
    } {
        ad_return_complaint \
            1 \
            "[applet_key] remove_applet called - this should not happen ever!"
    }

    ad_proc -public add_applet_to_community {
	community_id
    } {
	Add the core dotlrn applets to a specific community
    } {
        #
        # comm type-specific stuff
        #
        # we call add_self_to_page again with the 
        # real comm_id, and it gets overwritten

        set portal_id [dotlrn_community::get_portal_id \
                           -community_id $community_id
        ]

        set type [dotlrn_community::get_community_type_from_community_id \
                      $community_id
        ]

        if {[string equal $type "dotlrn_club"]} {

            # clubs have the "dotlrn members" portlet
            dotlrn_members_portlet::add_self_to_page \
                -portal_id $portal_id \
                -community_id $community_id \
                -page_name [members_community_default_page]
                
        } elseif {[string equal $type "dotlrn_community"] } {

            # subgroups have the "dotlrn members" portlet
            dotlrn_members_portlet::add_self_to_page \
                -portal_id $portal_id \
                -community_id $community_id \
                -page_name [members_subcomm_default_page]
            
        } else {
            # and class instances have the "dotlrn members staff" portlet
            dotlrn_members_staff_portlet::add_self_to_page \
                -portal_id $portal_id \
                -community_id $community_id
        }

        #
        # common to all comm's
        #

        # set up the admin portlet
        set admin_portal_id [dotlrn_community::get_admin_portal_id \
                                 -community_id $community_id
        ]

        dotlrn_admin_portlet::add_self_to_page \
            -portal_id $admin_portal_id \
            -community_id $community_id


        set portal_id [dotlrn_community::get_portal_id \
                           -community_id $community_id
        ]
        set args [ns_set create]
        ns_set put $args community_id $community_id

        dotlrn_dotlrn::add_portlet_helper $portal_id $args

        # return the empty string 
	return ""
    }

    ad_proc -public remove_applet_from_community {
	community_id
    } {
	remove the dotlrn applet from a specific community
    } {
        ad_return_complaint \
            1 \
            "[applet_key] remove_applet_from_community not implimented!"
    }

    ad_proc -public add_user {
	user_id
    } {
	Called for one time init when this user is added to dotlrn. 
        Do nothing, since the portal system will copy the dotlrn-main
        portal from the user template. that's set up below
    } {
        # noop
    }

    ad_proc -public remove_user {
        user_id
    } {
        remove a user from dotlrn
    } {
        ad_return_complaint 1 "[applet_key] remove_user not implimented!"
    }

    ad_proc -public add_user_to_community {
	community_id
	user_id
    } {
        Add user to a comm
    } {
        # noop
    }

    ad_proc -public remove_user_from_community {
	community_id
	user_id
    } {
	Remove a user from a community. Since this applet is not shown 
        on a user's portal, no action is required here.	
    } {
        # noop
    }
	
    ad_proc -public add_portlet {
        portal_id
    } {
        @param portal_id 
    } {
        set community_id 0
        set args [ns_set create]
        ns_set put $args community_id $community_id

        set type [dotlrn::get_type_from_portal_id -portal_id $portal_id]
        
        if {[string equal $type "user"]} {

            # the user portal type, set up the dotlrn-main portlet
            dotlrn_main_portlet::add_self_to_page \
                -portal_id $portal_id

            # bail out here since we don't want to add the "subgroups"
            # portlet to the user's portal
            return

        } elseif {[string equal $type "dotlrn_club"]} {

            # clubs have the "dotlrn members" portlet
            dotlrn_members_portlet::add_self_to_page \
                -portal_id $portal_id \
                -community_id $community_id \
                -page_name [members_community_default_page]
                
        } elseif {[string equal $type "dotlrn_community"] } {

            # subgroups have the "dotlrn members" portlet
            dotlrn_members_portlet::add_self_to_page \
                -portal_id $portal_id \
                -community_id $community_id \
                -page_name [members_subcomm_default_page]
            
        } else {
            # and class instances have the "dotlrn members staff" portlet
            dotlrn_members_staff_portlet::add_self_to_page \
                -portal_id $portal_id \
                -community_id $community_id
        }

        add_portlet_helper $portal_id $args
    }

    ad_proc -private add_portlet_helper {
        portal_id 
        args        
    } {
        Does the call to add the portlet to the portal. 
        Params for the portlet are sent to this proc by the caller.
    } {
        dotlrn_portlet::add_self_to_page \
            -portal_id $portal_id \
            -community_id [ns_set get $args "community_id"]
    }

    ad_proc -public remove_portlet {
        portal_id
        args
    } {
        A helper proc to remove the underlying portlet from the given portal. 
        
        @param portal_id
        @param args
    } {
        ad_return_complaint 1  "[applet_key] remove_portlet not implimented!"
    }

    ad_proc -public clone {
        old_community_id
        new_community_id
    } {
        Clone this applet's content from the old community to the new one.
        Since there's no data to copy, just add the applet to the new 
        community.
    } {
        ns_log notice "Cloning: [applet_key]"
        return [add_applet_to_community $new_community_id]
    }


    # misc procs

    ad_proc -public members_community_default_page {} {
        Returns the user default page to add the portlet to. 
        FIXME Should be a ad_param.
    } {
        return "People"
    }

    ad_proc -public members_subcomm_default_page {} {
        FIXME Should be a ad_param.
    } {
        return "Subgroup Info"
    }


}
