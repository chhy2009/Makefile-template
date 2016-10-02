CC=gcc
CXX=gcc
#设置编译器选项
CFLAGS=-O2 -lpthread 
CXXFLAGS+=-g -Wall  #设置传给c++编译器的选项
CPPFLAGS += -I./subDir1 -I./subDir2 -L./ #设置预编译选项

TARGET=main
export OBJSDIR=$(shell pwd)/objs#目标文件目录 export用于传递变量给子Makefile

all:$(TARGET)

$(TARGET):$(OBJSDIR) main.o
	$(MAKE) -C subDir1
	$(MAKE) -C subDir2
	$(CXX) -o $(TARGET) $(OBJSDIR)/*.o

$(OBJSDIR):
	mkdir -p $@

main.o:%o:%c   #表示.o文件对应的.c文件  和.c.o: 有点像.c.o表示把.o文件依赖于对应的.c文件
	$(CXX) -c $< -o $(OBJSDIR)/$@ $(CFLAGS) $(CXXFLAGS) $(CPPFLAGS)

clean:
	$(RM) $(TARGET) $(OBJSDIR)/*.o

