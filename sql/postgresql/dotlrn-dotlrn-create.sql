--
--  Copyright (C) 2001, 2002 OpenForce, Inc.
--
--  This file is part of dotLRN.
--
--  dotLRN is free software; you can redistribute it and/or modify it under the
--  terms of the GNU General Public License as published by the Free Software
--  Foundation; either version 2 of the License, or (at your option) any later
--  version.
--
--  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
--  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
--  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
--  details.
--


--
-- The "dotLRN" applet for dotLRN
-- copyright 2001, OpenForce
-- distributed under GPL v2.0
--
--
-- ben,arjun@openforce.net
--
-- 10/05/2001
--
-- ported to pg by dan chak (chak@openforce.net)
-- 2002-07-08

create function inline_0()
returns integer as '
declare
	foo integer;
begin
	-- create the implementation
	foo := acs_sc_impl__new (
		''dotlrn_applet'',
		''dotlrn_dotlrn'',
		''dotlrn_dotlrn''
	);

	-- add all the hooks

	-- GetPrettyName
	foo := acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_dotlrn'',
	       ''GetPrettyName'',
	       ''dotlrn_dotlrn::get_pretty_name'',
	       ''TCL''
	);

	-- AddApplet
	foo := acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_dotlrn'',
	       ''AddApplet'',
	       ''dotlrn_dotlrn::add_applet'',
	       ''TCL''
	);

	-- RemoveApplet
	foo := acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_dotlrn'',
	       ''RemoveApplet'',
	       ''dotlrn_dotlrn::remove_applet'',
	       ''TCL''
	);

	-- AddAppletToCommunity
	foo := acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_dotlrn'',
	       ''AddAppletToCommunity'',
	       ''dotlrn_dotlrn::add_applet_to_community'',
	       ''TCL''
	);

	-- RemoveAppletFromCommunity
	foo := acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_dotlrn'',
	       ''RemoveAppletFromCommunity'',
	       ''dotlrn_dotlrn::remove_applet_from_community'',
	       ''TCL''
	);


	-- AddUser
	foo := acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_dotlrn'',
	       ''AddUser'',
	       ''dotlrn_dotlrn::add_user'',
	       ''TCL''
	);

	-- RemoveUser
	foo := acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_dotlrn'',
	       ''RemoveUser'',
	       ''dotlrn_dotlrn::remove_user'',
	       ''TCL''
	);

	-- AddUserToCommunity
	foo := acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_dotlrn'',
	       ''AddUserToCommunity'',
	       ''dotlrn_dotlrn::add_user_to_community'',
	       ''TCL''
	);

	-- RemoveUserFromCommunity
	foo := acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_dotlrn'',
	       ''RemoveUserFromCommunity'',
	       ''dotlrn_dotlrn::remove_user_from_community'',
	       ''TCL''
	);

    -- AddPortlet
    foo := acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_dotlrn'',
        ''AddPortlet'',
        ''dotlrn_dotlrn::add_portlet'',
        ''TCL''
    );

    -- RemovePortlet
    foo := acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_dotlrn'',
        ''RemovePortlet'',
        ''dotlrn_dotlrn::remove_portlet'',
        ''TCL''
    );

    -- Clone
    foo := acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_dotlrn'',
        ''Clone'',
        ''dotlrn_dotlrn::clone'',
        ''TCL''
    );
	-- Add the binding
	perform acs_sc_binding__new (
	    ''dotlrn_applet'',
	    ''dotlrn_dotlrn''
	);

	return 0;

end;' language 'plpgsql';

select inline_0();
drop function inline_0();

