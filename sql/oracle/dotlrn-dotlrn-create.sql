--
--  Copyright (C) 2001, 2002 MIT
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
--
-- ben,arjun@openforce.net
--
-- 10/05/2001
--


declare
	foo integer;
begin
	-- create the implementation
	foo := acs_sc_impl.new (
		impl_contract_name => 'dotlrn_applet',
		impl_name => 'dotlrn_dotlrn',
		impl_pretty_name => 'dotlrn_dotlrn',
		impl_owner_name => 'dotlrn_dotlrn'
	);

	-- add all the hooks

	-- GetPrettyName
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_dotlrn',
	       'GetPrettyName',
	       'dotlrn_dotlrn::get_pretty_name',
	       'TCL'
	);

	-- AddApplet
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_dotlrn',
	       'AddApplet',
	       'dotlrn_dotlrn::add_applet',
	       'TCL'
	);

	-- RemoveApplet
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_dotlrn',
	       'RemoveApplet',
	       'dotlrn_dotlrn::remove_applet',
	       'TCL'
	);

	-- AddAppletToCommunity
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_dotlrn',
	       'AddAppletToCommunity',
	       'dotlrn_dotlrn::add_applet_to_community',
	       'TCL'
	);

	-- RemoveAppletFromCommunity
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_dotlrn',
	       'RemoveAppletFromCommunity',
	       'dotlrn_dotlrn::remove_applet_from_community',
	       'TCL'
	);


	-- AddUser
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_dotlrn',
	       'AddUser',
	       'dotlrn_dotlrn::add_user',
	       'TCL'
	);

	-- RemoveUser
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_dotlrn',
	       'RemoveUser',
	       'dotlrn_dotlrn::remove_user',
	       'TCL'
	);

	-- AddUserToCommunity
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_dotlrn',
	       'AddUserToCommunity',
	       'dotlrn_dotlrn::add_user_to_community',
	       'TCL'
	);

	-- RemoveUserFromCommunity
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_dotlrn',
	       'RemoveUserFromCommunity',
	       'dotlrn_dotlrn::remove_user_from_community',
	       'TCL'
	);

    -- AddPortlet
    foo := acs_sc_impl.new_alias (
        impl_contract_name => 'dotlrn_applet',
        impl_name => 'dotlrn_dotlrn',
        impl_operation_name => 'AddPortlet',
        impl_alias => 'dotlrn_dotlrn::add_portlet',
        impl_pl => 'TCL'
    );

    -- RemovePortlet
    foo := acs_sc_impl.new_alias (
        impl_contract_name => 'dotlrn_applet',
        impl_name => 'dotlrn_dotlrn',
        impl_operation_name => 'RemovePortlet',
        impl_alias => 'dotlrn_dotlrn::remove_portlet',
        impl_pl => 'TCL'
    );

    -- Clone
    foo := acs_sc_impl.new_alias (
        impl_contract_name => 'dotlrn_applet',
        impl_name => 'dotlrn_dotlrn',
        impl_operation_name => 'Clone',
        impl_alias => 'dotlrn_dotlrn::clone',
        impl_pl => 'TCL'
    );

    foo := acs_sc_impl.new_alias (
        impl_contract_name => 'dotlrn_applet',
        impl_name => 'dotlrn_dotlrn',
        impl_operation_name => 'ChangeEventHandler',
        impl_alias => 'dotlrn_dotlrn::change_event_handler',
        impl_pl => 'TCL'
    );

	-- Add the binding
	acs_sc_binding.new (
	    contract_name => 'dotlrn_applet',
	    impl_name => 'dotlrn_dotlrn'
	);
end;
/
show errors

@@ dotlrn-members-create.sql
@@ dotlrn-members-staff-create.sql
