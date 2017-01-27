modules = $(shell ls [0-9][0-9]_*)

all:	build/EnterRouterMode.sh 

build/EnterRouterMode.sh: ${modules} Makefile
	@rm -f $@
	@echo Combining ${modules}...
	@for i in ${modules} ; do \
	    head -n1 $$i | grep -q '^#!' && head -n1 $$i || echo "" ;\
	    echo "echo -- ----------------- starting module $$i" ;\
	    head -n1 $$i | grep -q '^#!' && tail -n+2 $$i || cat $$i ;\
	    echo "echo -- ----------------- finished module $$i" ;\
	done \
	     > $@
	@echo Done.
