
--
-- The "dotLRN members" applet for dotLRN
-- copyright 2001, OpenForce
-- distributed under GPL v2.0
--
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
		'dotlrn_applet',
		'dotlrn_members',
		'dotlrn_members'
	);

	-- add all the hooks

	-- GetPrettyName
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_members',
	       'GetPrettyName',
	       'dotlrn_members::get_pretty_name',
	       'TCL'
	);

	-- AddApplet
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_members',
	       'AddApplet',
	       'dotlrn_members::add_applet',
	       'TCL'
	);


	-- AddAppletToCommunity
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_members',
	       'AddAppletToCommunity',
	       'dotlrn_members::add_applet_to_community',
	       'TCL'
	);


	-- RemoveApplet
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_members',
	       'RemoveApplet',
	       'dotlrn_members::remove_applet',
	       'TCL'
	);

	-- AddUser
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_members',
	       'AddUser',
	       'dotlrn_members::add_user',
	       'TCL'
	);


	-- AddUserToCommunity
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_members',
	       'AddUserToCommunity',
	       'dotlrn_members::add_user_to_community',
	       'TCL'
	);

	-- RemoveUser
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_members',
	       'RemoveUser',
	       'dotlrn_members::remove_user',
	       'TCL'
	);

	-- RemoveUserFromCommunity
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_members',
	       'RemoveUserFromCommunity',
	       'dotlrn_members::remove_user_from_community',
	       'TCL'
	);

	-- Add the binding
	acs_sc_binding.new (
	    contract_name => 'dotlrn_applet',
	    impl_name => 'dotlrn_members'
	);
end;
/
show errors
