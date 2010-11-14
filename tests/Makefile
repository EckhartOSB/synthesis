# make file

all: tests run

LIBS = SYNTHESIS:synthesis.elb
SOURCES = test_assertions test_boolean test_commandline test_comparable test_elapsedtime test_fif test_file test_gottk1 test_gottk2 test_gottk3 test_hash test_json test_let test_ls test_memo test_progn test_random test_regex test_singleton test_swap test_telnet test_var test_version

tests: $(SOURCES:C/.*/$(TESTS)\/exe\/&.dbr/)

run:
.for TEST in $(SOURCES:C/.*/$(TESTS)\/exe\/&.dbr/)
	dbr $(TEST)
.endfor

clean:
	$(RMCMD) $(SOURCES:C/.*/$(TESTS)\/obj\/&.dbo/)
	$(RMCMD) $(SOURCES:C/.*/$(TESTS)\/exe\/&.dbr/)

coverage: $(TESTS)/coverage/coverage.css $(SOURCES:C/.*/$(TESTS)\/coverage\/&.html/)

$(TESTS)/coverage/coverage.css: $(TESTS)/coverage.css
	$(CPCMD) $(.ALLSRC) $(.TARGET)

.for TEST in $(SOURCES:C/.*/$(TESTS)\/exe\/&.dbr/)
HTML= $(TEST:C/\/exe\//\/coverage\//:C/\.dbr/.html/)
$(HTML): $(TEST)
	dbr SYNTHESIS:htmlcover -o $(.TARGET) -r $(.ALLSRC)
.endfor

coverall: $(TESTS)/coverage/coverage.css $(TESTS)/coverage/coverall.html

$(TESTS)/coverage/coverall.html: $(SOURCES:C/.*/$(TESTS)\/exe\/&.dbr/)
	dbr SYNTHESIS:htmlcover -o $(.TARGET) -r $(.ALLSRC) -t 'Coverage for full test suite'

.for SOURCE in $(SOURCES:C/$/.dbl/)
DBO= $(TESTS)/obj/$(SOURCE:C/\.dbl/.dbo/)
DBR= $(TESTS)/exe/$(SOURCE:C/\.dbl/.dbr/)
$(DBO): $(SOURCE)
	dbl $(DBG) -qstrict -o $(.TARGET) $(.ALLSRC)
$(DBR): $(DBO)
	dblink $(DBG) -o $(.TARGET) $(.ALLSRC) $(LIBS)
.endfor
