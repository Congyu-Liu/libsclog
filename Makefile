all: ./src/Makefile strace libsclog.a sclog_test

./src/Makefile: ./src/Makefile.am ./src/bootstrap ./src/configure.ac 
	cd ./src && ./bootstrap && ./configure
	
libsclog.a: ./src/src/libsclog.a 
	cp ./src/src/libsclog.a ./

./sclog_test: sclog_test.c sclog.h libsclog.a
	cc sclog_test.c libsclog.a -lrt -lselinux -lsepol -o sclog_test

.PHONY: test clean strace

# force execution
strace: 
	make -C ./src

test: ./sclog_test
	./sclog_test

clean:
	rm ./sclog_test
	rm ./libsclog.a
	cd ./src && make clean