
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


begin
	-- create the implementation
	select acs_sc_impl__new (
		'dotlrn_applet',
		'dotlrn_members_staff',
		'dotlrn_members_staff'
	);

	-- add all the hooks

	-- GetPrettyName
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_members_staff',
	       'GetPrettyName',
	       'dotlrn_members_staff::get_pretty_name',
	       'TCL'
	);

	-- AddApplet
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_members_staff',
	       'AddApplet',
	       'dotlrn_members_staff::add_applet',
	       'TCL'
	);


	-- AddAppletToCommunity
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_members_staff',
	       'AddAppletToCommunity',
	       'dotlrn_members_staff::add_applet_to_community',
	       'TCL'
	);


	-- RemoveApplet
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_members_staff',
	       'RemoveApplet',
	       'dotlrn_members_staff::remove_applet',
	       'TCL'
	);

	-- AddUser
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_members_staff',
	       'AddUser',
	       'dotlrn_members_staff::add_user',
	       'TCL'
	);


	-- AddUserToCommunity
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_members_staff',
	       'AddUserToCommunity',
	       'dotlrn_members_staff::add_user_to_community',
	       'TCL'
	);

	-- RemoveUser
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_members_staff',
	       'RemoveUser',
	       'dotlrn_members_staff::remove_user',
	       'TCL'
	);

	-- RemoveUserFromCommunity
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_members_staff',
	       'RemoveUserFromCommunity',
	       'dotlrn_members_staff::remove_user_from_community',
	       'TCL'
	);


	-- AddUserToCommunity
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_members_staff',
	       'AddUserToCommunity',
	       'dotlrn_members_staff::add_user_to_community',
	       'TCL'
	);

	-- RemoveUser
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_members_staff',
	       'RemoveUser',
	       'dotlrn_members_staff::remove_user',
	       'TCL'
	);

	-- RemoveUserFromCommunity
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_members_staff',
	       'RemoveUserFromCommunity',
	       'dotlrn_members_staff::remove_user_from_community',
	       'TCL'
	);

	-- Add the binding
	select acs_sc_binding__new (
	    contract_name => 'dotlrn_applet',
	    impl_name => 'dotlrn_members_staff_staff'
	);
end;
