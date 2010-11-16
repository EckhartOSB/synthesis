all:
	cd $(SRC) && make
	cd $(TESTS) && make
	cd $(SYNTHESIS)/utilities && make

clean:
	cd $(SRC) && make clean
	cd $(TESTS) && make clean
	cd $(SYNTHESIS)/utilities && make clean
