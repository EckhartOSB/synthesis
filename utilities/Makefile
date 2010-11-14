# make file

all: utils

LIBS= SYNTHESIS:synthesis.elb
SOURCES= cover htmlcover
UTILS= $(SYNTHESIS)/utilities

utils: $(SOURCES:C/.*/$(SYNTHESIS)\/&.dbr/)

clean:
	$(RMCMD) $(SOURCES:C/.*/$(UTILS)\/obj\/&.dbo/)
	$(RMCMD) $(SOURCES:C/.*/$(SYNTHESIS)\/&.dbr/)

.for SOURCE in $(SOURCES:C/$/.dbl/)
DBO= $(UTILS)/obj/$(SOURCE:C/\.dbl/.dbo/)
DBR= $(SYNTHESIS)/$(SOURCE:C/\.dbl/.dbr/)
$(DBO): $(SOURCE)
	dbl $(DBG) -qstrict -o $(.TARGET) $(.ALLSRC)
$(DBR): $(DBO)
	dblink $(DBG) -o $(.TARGET) $(.ALLSRC) $(LIBS)
.endfor
