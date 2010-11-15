# Unix makefile for synthesis library

all: $(SYNTHESIS)/synthesis.def prototypes $(SYNTHESIS)/synthesis.elb

SOURCES= assertions commandline compare console coverage elapsedtime fif file gottk hash json let ls mapper mapvar memo progn random reducer regex socket telnet transport var version

clean:
	$(RMCMD) $(PROTO)synthesis-*.dbh $(PROTO)synthesis-*.dbp
	$(RMCMD) $(SOURCES:C/.*/$(SRC)\/obj\/&.dbo/)
	$(RMCMD) $(SYNTHESIS)/synthesis.elb

prototypes:
	dblproto $(SOURCES:C/^/$(SYNTHESIS)\/sources\//)

$(SYNTHESIS)/synthesis.def: synthesis.def
	$(CPCMD) synthesis.def $(SYNTHESIS)

.for SOURCE in $(SOURCES:C/$/.dbl/)
$(SRC)/obj/$(SOURCE:C/\.dbl/.dbo/): $(SOURCE)
	dbl $(DBG) -qstrict -o $(.TARGET) $(.ALLSRC)
.endfor

$(SYNTHESIS)/synthesis.elb: $(SOURCES:C/.*/$(SRC)\/obj\/&.dbo/)
	dblink $(DBG) -l $(.TARGET) $(.ALLSRC)
