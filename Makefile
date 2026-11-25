# Makefile for cust_seek plugin
ifeq ($(OS),Windows_NT)
    SUFFIX = dll
else
    SUFFIX = so
endif

deadbeef_prefix=/opt/deadbeef

CC=gcc
CXX=g++
STD=gnu99
CFLAGS+=-fPIC -I $(deadbeef_prefix)/include -Wall
CXXFLAGS+=-fPIC -I $(deadbeef_prefix)/include -Wall
ifeq ($(DEBUG),1)
CFLAGS +=-g -O0
CXXFLAGS +=-g -O0
endif

PREFIX=$(deadbeef_prefix)/lib/deadbeef
PLUGNAME=cust_seek
LIBS=

all: cust_seek

cust_seek:
	$(CC) -std=$(STD) -c $(CFLAGS) -c $(PLUGNAME).c
	$(CC) -std=$(STD) -shared $(CXXFLAGS) -o $(PLUGNAME).$(SUFFIX) $(PLUGNAME).o $(LIBS) $(LDFLAGS)

install:
	cp $(PLUGNAME).$(SUFFIX) $(PREFIX)

clean:
	rm -fv $(PLUGNAME).o $(PLUGNAME).$(SUFFIX)
