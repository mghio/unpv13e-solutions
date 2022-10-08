CC		= gcc
OPT		= -I./lib -g -pthread
CFLAGS	= -I./lib -g -O2 -D_REENTRANT -Wall

# when new executables created, added to EXECS, needed by 'make clean'
EXECS   = daytimetcpcli daytimetcpcliv6 daytimetcpserv 1.3

DEPS    = config.h ./lib/unp.h ./lib/unpthread.h
WRAPERS = ./lib/wraplib.o ./lib/wrappthread.o ./lib/wrapsock.o ./lib/wrapunix.o

%.o: %.c ${DEPS}
		${CC} -c -o $@ $< ${CFLAGS}

all:
		make 1-5
		make 1-6
		make 1-9
		make 1.3
		make 1.4
		make 1.5
		make 4-11
		make 4.2
		make 4.4

1-5: ./intro/example_programs/daytimetcpcli.o ./lib/error.o
		${CC} ${OPT} ./lib/error.o ./intro/example_programs/daytimetcpcli.o -o ./intro/example_programs/daytimetcpcli.o

1-6: ./intro/example_programs/daytimetcpcliv6.o ./lib/error.o	
		${CC} ${OPT} ./lib/error.o ./intro/example_programs/daytimetcpcliv6.o -o ./intro/example_programs/daytimetcpcliv6.o

1-9: ./intro/example_programs/daytimetcpsrv.o ./lib/error.o	${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./intro/example_programs/daytimetcpsrv.o ${WRAPERS} -o ./intro/example_programs/daytimetcpsrv.o

1.3: ./intro/exercise/e1.3.o ./lib/error.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./intro/exercise/e1.3.o ${WRAPERS} -o ./intro/exercise/e1.3.o

1.4: ./intro/exercise/e1.4.o ./lib/error.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./intro/exercise/e1.4.o ${WRAPERS} -o ./intro/exercise/e1.4.o
		
1.5: ./intro/exercise/e1.5.o ./lib/error.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./intro/exercise/e1.5.o ${WRAPERS} -o ./intro/exercise/e1.5.o

4-11: ./intro/example_programs/daytimetcpsrv1.o ./lib/error.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./intro/example_programs/daytimetcpsrv1.o ${WRAPERS} -o ./intro/example_programs/daytimetcpsrv1.o						

4.2: ./intro/exercise/e4.2.o ./lib/error.o ./lib/sock_ntop.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/sock_ntop.o ./intro/exercise/e4.2.o ${WRAPERS} -o ./intro/exercise/e4.2.o

4.4: ./intro/exercise/e4.4.o ./lib/error.o ./lib/sock_ntop.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/sock_ntop.o ./intro/exercise/e4.4.o ${WRAPERS} -o ./intro/exercise/e4.4.o				