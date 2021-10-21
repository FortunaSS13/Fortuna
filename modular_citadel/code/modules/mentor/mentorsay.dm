//fortuna edit. simply changes mentor chat to staff chat as opposed to making an entirely new chat system needlessly
/client/proc/cmd_staff_say(msg as text)
	set category = "OOC"
	set name = "Staff" //Gave this shit a shorter name so you only have to time out "msay" rather than "mentor say" to use it --NeoFite
	set hidden = 1
	if(!is_mentor())
		return

	msg = copytext_char(sanitize(msg), 1, MAX_MESSAGE_LEN)
	if(!msg)
		return

	msg = emoji_parse(msg)
	log_admin("Staff Chat: [key_name(src)] : [msg]")

	if(check_rights_for(src, R_ADMIN,0))
		msg = "<span class='mentorsay_admin filter_MSAY'><span class='prefix'>Staff Chat:</span> <EM>[key_name(src, 0, 0)]</EM>: <span class='message'>[msg]</span></span>"
	else
		msg = "<span class='mentorsay filter_MSAY'><span class='prefix'>Staff Chat:</span> <EM>[key_name(src, 0, 0)]</EM>: <span class='message'>[msg]</span></span>"
	to_chat(GLOB.admins | GLOB.mentors, msg, confidential = TRUE)
