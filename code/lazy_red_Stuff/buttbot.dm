/obj/machinery/bot/buttbot
	name = "buttbot"
	desc = "It's a robotic butt. Are you dense or something??"
	icon_state = "buttbot" // get me an icon omg
	layer = 5.0
	density = 0
	anchored = 0
	var/lastbutt = 0


/obj/machinery/bot/buttbot/New()
	..()
	src.update_icon()

/obj/machinery/bot/buttbot/process()
	if(lastbutt)	lastbutt--
	if(prob(1) && lastbutt == 0)
		for(var/mob/M in hearers(7, src))
			M << "<b>\icon[icon][src]</b> beeps, \"butts.\""
			lastbutt = 60
	..()

//don't hate me deadsnipe but i had to write a more robust butt replacing proc
//-C

/obj/machinery/bot/buttbot/proc/buttsay(phrase)
	var/params = replacetext(phrase, " ", "&")
	var/list/buttphrase = params2list(params)
	var/finalphrase = ""
	for(var/p in buttphrase)
		if(prob(20))
			p="butt"
		finalphrase = finalphrase+p+" "
	finalphrase = replacetext(finalphrase, " #39 ","'")
	finalphrase = replacetext(finalphrase, " s "," ") //this is really dumb and hacky, gets rid of trailing 's' character on the off chance that '#39' gets swapped
	if(findtext(finalphrase,"butt"))
		for(var/mob/M in hearers(src))
			spawn(5)
				M << "\icon[icon]<b>[src]</b> beeps, \"[finalphrase]\""
	else
		return

/obj/item/clothing/head/butt
	name = "butt"
	desc = "extremely treasured body part"
	icon = 'icons/obj/dismemberment.dmi'
	icon_state = "butt"
	item_state = "butt"
	throwforce = 5
	force = 5

/obj/item/clothing/head/butt/attackby(var/obj/item/W, mob/user as mob) // copypasting bot manufucturing process, im a lazy fuck

	if(istype(W, /obj/item/robot_parts/l_arm) || istype(W, /obj/item/robot_parts/r_arm))
		user.drop_item()
		del(W)
		var/turf/T = get_turf(src.loc)
		new /obj/machinery/bot/buttbot(T)
		user << "<span class='notice'>You add the robot arm to the butt and... What?</span>"
		user.drop_item(src)
		del(src)