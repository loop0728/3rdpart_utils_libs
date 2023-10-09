CC = gcc
CFLAGS = -O2 -static -fopenmp -DSTREAM_ARRAY_SIZE=0x100000 -DNTIMES=20

OUTPUT_TARGET = stream

all: ${OUTPUT_TARGET}

${OUTPUT_TARGET}: stream.c
	$(CC) $(CFLAGS) $^ -o $@

clean:
#	rm -f ${OUTPUT_TARGET} *.o
	@rm -f *.o

