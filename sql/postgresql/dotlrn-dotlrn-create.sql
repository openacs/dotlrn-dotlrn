
--
-- The "dotLRN" applet for dotLRN
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
		'dotlrn_dotlrn',
		'dotlrn_dotlrn'
	);

	-- add all the hooks

	-- GetPrettyName
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_dotlrn',
	       'GetPrettyName',
	       'dotlrn_dotlrn::get_pretty_name',
	       'TCL'
	);

	-- AddApplet
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_dotlrn',
	       'AddApplet',
	       'dotlrn_dotlrn::add_applet',
	       'TCL'
	);


	-- AddAppletToCommunity
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_dotlrn',
	       'AddAppletToCommunity',
	       'dotlrn_dotlrn::add_applet_to_community',
	       'TCL'
	);


	-- RemoveApplet
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_dotlrn',
	       'RemoveApplet',
	       'dotlrn_dotlrn::remove_applet',
	       'TCL'
	);

	-- AddUser
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_dotlrn',
	       'AddUser',
	       'dotlrn_dotlrn::add_user',
	       'TCL'
	);


	-- AddUserToCommunity
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_dotlrn',
	       'AddUserToCommunity',
	       'dotlrn_dotlrn::add_user_to_community',
	       'TCL'
	);

	-- RemoveUser
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_dotlrn',
	       'RemoveUser',
	       'dotlrn_dotlrn::remove_user',
	       'TCL'
	);

	-- RemoveUserFromCommunity
	select acs_sc_impl_alias__new (
	       'dotlrn_applet',
	       'dotlrn_dotlrn',
	       'RemoveUserFromCommunity',
	       'dotlrn_dotlrn::remove_user_from_community',
	       'TCL'
	);

	-- Add the binding
	select acs_sc_binding__new (
	    contract_name => 'dotlrn_applet',
	    impl_name => 'dotlrn_dotlrn'
	);
end;

\i dotlrn-members-create.sql
\i dotlrn-members-staff-create.sql
