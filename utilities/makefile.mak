# make file

all: utils

LIBS = SYNTHESIS:synthesis.elb
SOURCES = cover htmlcover
SOURCES_NET =

utils: $[f,$(SYNTHESIS),$(SOURCES),dbr]

net: $[f,$(SYNTHESIS),$(SOURCES_NET),exe]

clean:
	$(RMCMD) $[f,obj,$(SOURCES),dbo]
	$(RMCMD) $[f,$(SYNTHESIS),$(SOURCES),dbr]

cleannet:
	$(RMCMD) $[f,$(SYNTHESIS),$(SOURCES_NET),exe]
	$(RMCMD) $[f,$(SYNTHESIS),$(SOURCES_NET),pdb]

.dbo.dbr:
	dblink $(DBG) -o $(_Target) $(_Source) $(LIBS)
.dbl.dbo:
	dbl $(DBG) -qstrict -o $(_Target) $(_Source)

.dbl.exe:
	dblnet $(DBG) -out=$(_Target) -target=exe -ref=$[f,exe,synthesis,dll] $(_Source)

.SOURCE.dbo : obj
.SOURCE.dbr : $(SYNTHESIS)
