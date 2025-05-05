
CC := $(CROSS_COMPILE)gcc
SRC := writer.c
TARGET := writer
OBJS := $(SRC:.c=.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) $(OBJS) -o $(TARGET) $(LDFLAGS)

.PHONY: all clean
clean:
	rm -f $(OBJS) $(TARGET) *elf *.map