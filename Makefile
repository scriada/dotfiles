# Fun Makefile

.PHONY : null love war me a sandwich

# simulate typing 
# c.f. http://www.commandlinefu.com/commands/view/4583/simulate-typing
say = echo $1 | pv -qL 10

null :
	@$(call say, "make what?")

love :
	@$(call say, "not war?")

war :
	@$(call say, "not love?")

me a :
	@true

sandwich :
	@if [ `whoami` = 'root' ]; \
		then $(call say, "okay."); \
		else $(call say, "make it yourself."); fi
