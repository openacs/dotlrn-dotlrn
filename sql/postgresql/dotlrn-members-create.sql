
--
-- The "dotLRN members" applet for dotLRN
-- copyright 2001, OpenForce
-- distributed under GPL v2.0
--
-- ported to PG by Ben
-- ben,arjun@openforce.net
--
-- 10/05/2001
--


begin
	-- create the implementation
	select acs_sc_impl__new (
		'dotlrn_applet',
		'dotlrn_members',
		'dotlrn_members'
	);

	-- add all the hooks

	-- GetPrettyName
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_members',
	       'GetPrettyName',
	       'dotlrn_members::get_pretty_name',
	       'TCL'
	);

	-- AddApplet
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_members',
	       'AddApplet',
	       'dotlrn_members::add_applet',
	       'TCL'
	);


	-- AddAppletToCommunity
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_members',
	       'AddAppletToCommunity',
	       'dotlrn_members::add_applet_to_community',
	       'TCL'
	);


	-- RemoveApplet
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_members',
	       'RemoveApplet',
	       'dotlrn_members::remove_applet',
	       'TCL'
	);

	-- AddUser
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_members',
	       'AddUser',
	       'dotlrn_members::add_user',
	       'TCL'
	);


	-- AddUserToCommunity
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_members',
	       'AddUserToCommunity',
	       'dotlrn_members::add_user_to_community',
	       'TCL'
	);

	-- RemoveUser
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_members',
	       'RemoveUser',
	       'dotlrn_members::remove_user',
	       'TCL'
	);

	-- RemoveUserFromCommunity
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_members',
	       'RemoveUserFromCommunity',
	       'dotlrn_members::remove_user_from_community',
	       'TCL'
	);

	-- Add the binding
	select acs_sc_binding__new (
	    contract_name => 'dotlrn_applet',
	    impl_name => 'dotlrn_members'
	);
end;
