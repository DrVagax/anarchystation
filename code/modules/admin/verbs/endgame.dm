// verb to call in the end music and text
/client/proc/cmd_admin_engame()
	set category = "SpacePunch"
	set name = "Start Endgame"

	if(!holder)
		src << "Only administrators may use this command."
		return

	log_admin("[usr.key] has initiated the Endgame.")
	message_admins("[key_name_admin(usr)] has initiated the Endgame.")

	custom_event_msg = input

	world << sound('sound/misc/endgame.ogg')
	world << "<font size=5 color=red face=arial>Admin Event</font>"
	world << "<font color=blue size=2 face=arial>This cannot be stopped, the end is near, we are all going down one way or the other.</font>"
	world << "<br>"
	world << "<font color=grey><i>For i have become death the destroyer of worlds</i></font>"