OBJS=bye.o
all:$(OBJS)

$(OBJS):%o:%c
	$(CC) -c $< -o $(OBJSDIR)/$@ $(CFLAGS)

clean:
	$(RM) $(OBJS)
