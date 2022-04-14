cc=gcc
AR=ar
OBJECTS_MAIN=client.o
OBJECTS_SERVER=my_server.o
FLAGS= -Wall -g 

all:server client
client: $(OBJECTS_MAIN)
	$(cc) $(FLAGS) -o client $(OBJECTS_MAIN)

server:$(OBJECTS_SERVER)
	$(cc) $(FLAGS) -o server $(OBJECTS_SERVER) -pthread

# o files 
$(OBJECTS_MAIN):client.c
	$(cc) $(FLAGS) -c client.c

$(OBJECTS_SERVER):my_server.c
	$(cc) $(FLAGS) -c my_server.c

.PHONY: clean all
clean:
	rm -f *.o  *.a *.so main server client