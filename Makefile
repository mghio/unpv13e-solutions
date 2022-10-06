CC		= gcc
OPT		= -I./lib -g -pthread
CFLAGS	= -I./lib -g -O2 -D_REENTRANT -Wall

# when new executables created, added to EXECS, needed by 'make clean'
EXECS   = daytimetcpcli daytimetcpcliv6 daytimetcpserv 1.3

DEPS    = config.h ./lib/unp.h ./lib/unpthread.h
WRAPERS = ./lib/wraplib.o ./lib/wrappthread.o ./lib/wrapsock.o ./lib/wrapunix.o

.PHONY: clean all git

%.o: %.c ${DEPS}
		${CC} -c -o $@ $< ${CFLAGS}

all:
		make 1-5
		make 1-6
		make 1-9
		make 1.3

1-5: ./intro/example_programs/daytimetcpcli.o ./lib/error.o
		${CC} ${OPT} ./lib/error.o ./intro/example_programs/daytimetcpcli.o -o ./intro/example_programs/daytimetcpcli.o

1-6: ./intro/example_programs/daytimetcpcliv6.o ./lib/error.o	
		${CC} ${OPT} ./lib/error.o ./intro/example_programs/daytimetcpcliv6.o -o ./intro/example_programs/daytimetcpcliv6.o

1-9: ./intro/example_programs/daytimetcpsrv.o ./lib/error.o	${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./intro/example_programs/daytimetcpsrv.o ${WRAPERS} -o ./intro/example_programs/daytimetcpsrv.o

1.3: ./intro/exercise/e1.3.o ./lib/error.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./intro/exercise/e1.3.o ${WRAPERS} -o ./intro/exercise/e1.3.o