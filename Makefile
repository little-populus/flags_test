all: main.o test.o
	gcc -o build/flags_test build/main.o build/test.o

build:
	mkdir build

main.o: main.c build
	gcc -c main.c -o build/main.o

test.o: test.S build
	gcc -c test.S -o build/test.o

clean:
	rm -rf build

.PHONY: all clean
