
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


declare
	foo integer;
begin
	-- create the implementation
	foo := acs_sc_impl.new (
		'dotlrn_applet',
		'dotlrn_dotlrn',
		'dotlrn_dotlrn'
	);

	-- add all the hooks

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
end;
/
show errors
