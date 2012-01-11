# PVCS Configuration Builder make file

all: $[f,$(SYNTHESIS),synthesis,def] prototypes $[f,$(SYNTHESIS),synthesis,elb]

net: $[f,$(SYNTHESIS),synthesis,def] $[f,$(SYNTHESIS),synthesis,dll]

SOURCES = assertions commandline compare console coverage elapsedtime fif file gottk \
hash json let ls mapper mapvar memo multisignal oi progn random reducer regex socket telnet transport var version
SOURCES_NET = assertions var commandline compare console elapsedtime fif file gottk \
hash json let ls mapper mapvar memo oi progn random reducer regex socket telnet transport version

clean:
	%PushDir $(PROTO)
	$(RMCMD) synthesis-*.dbh synthesis-*.dbp
	%PopDir
	$(RMCMD) $[f,obj,$(SOURCES),dbo]
	$(RMCMD) $[f,$(SYNTHESIS),synthesis,elb]

cleannet:
	$(RMCMD) $[f,$(SYNTHESIS),synthesis,dll]
	$(RMCMD) $[f,$(SYNTHESIS),synthesis,pdb]

prototypes:
	dblproto $(SOURCES)

$[f,$(SYNTHESIS),synthesis,def]: synthesis.def
	$(CPCMD) synthesis.def $(SYNTHESIS)

$[f,$(SYNTHESIS),synthesis,elb]: $[f,obj,$(SOURCES),dbo]
	dblink $(DBG) -l $(_Target) $(_Sources)

$[f,$(SYNTHESIS),synthesis,dll]: $[f,,$(SOURCES_NET),dbl] $[f,$(MIXINS),*,dbl] $[f,$(SYNTHESIS),synthesis,def]
	dblnet $(DBG) -out=$(_Target) -target=dll $(SOURCES_NET)

.dbl.dbo:
	dbl $(DBG) -qstrict -o $(_Target) $(_Source)
