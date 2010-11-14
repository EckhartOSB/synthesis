# make file

all: tests run

LIBS = SYNTHESIS:synthesis.elb
SOURCES = test_assertions test_boolean test_commandline test_comparable test_elapsedtime \
	  test_fif test_file test_gottk1 test_gottk2 test_gottk3 test_hash test_json test_let \
	  test_ls test_memo test_progn test_random test_regex test_singleton test_swap test_telnet \
	  test_var test_version
TKLIB_DLL = $(DBLDIR)\bin\Synergex.SynergyDE.tklib.dll

tests: $[f,exe,$(SOURCES),dbr]

run:
	%ForEach test in $[f,exe,$(SOURCES),dbr]
	    dbs $(test)
	%EndFor

net: $[f,exe,synthesis,dll] $[f,exe,synthesis,pdb] $[f,exe,$(SOURCES),exe]

runnet:
	%ForEach test in $[f,exe,$(SOURCES),exe]
	    $(test)
	%EndFor

clean:
	$(RMCMD) $[f,obj,$(SOURCES),dbo]
	$(RMCMD) $[f,exe,$(SOURCES),dbr]

cleannet:
	$(RMCMD) $[f,exe,$(SOURCES),exe]
	$(RMCMD) $[f,exe,$(SOURCES),pdb]

coverage: $[f,coverage,coverage,css] $[f,coverage,$(SOURCES),html]

coverall: $[f,coverage,coverall,html]

tsort: $[f,exe,tsort,dbr]

$[f,coverage,coverage,css]: coverage.css
	$(CPCMD) $(_Source) coverage
$[f,exe,synthesis,dll]: $[f,$(SYNTHESIS),synthesis,dll]
	$(CPCMD) $(_Source) exe
$[f,exe,synthesis,pdb]: $[f,$(SYNTHESIS),synthesis,pdb]
	$(CPCMD) $(_Source) exe
$[f,coverage,coverall,html]: $[f,exe,$(SOURCES),dbr]
	dbs SYNTHESIS:htmlcover -o $(_Target) -r $(_Sources) -t 'Coverage for full test suite'

.dbo.dbr:
	dblink $(DBG) -o $(_Target) $(_Source) $(LIBS)
.dbl.dbo:
	dbl $(DBG) -qstrict -o $(_Target) $(_Source)

.dbl.exe:
	dblnet $(DBG) -out=$(_Target) -target=exe -ref=$[f,exe,synthesis,dll] $(_Source)

.dbr.html:
	dbs SYNTHESIS:htmlcover -o $(_Target) -r $(_Source)

.SOURCE.dbo : obj
.SOURCE.dbr : exe
