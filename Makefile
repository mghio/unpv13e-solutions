CC		= gcc
OPT		= -I./lib -g -pthread
CFLAGS	= -I./lib -g -O2 -D_REENTRANT -Wall

# when new executables created, added to EXECS, needed by 'make clean'
EXECS   = daytimetcpcli daytimetcpcliv6 daytimetcpserv 1.3

DEPS    = config.h ./lib/unp.h ./lib/unpthread.h
WRAPERS = ./lib/wraplib.o ./lib/wrappthread.o ./lib/wrapsock.o ./lib/wrapunix.o ./lib/wrapstdio.o

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
		make 4.5
		make 5.1_serv
		make 5.1_cli
		make 5.6_serv
		make 5.6_cli
		make 6.4

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
		${CC} ${OPT} ./lib/error.o ./intro/exercise/e4.4.o ${WRAPERS} -o ./intro/exercise/e4.4.o

4.5: ./intro/exercise/e4.5.o ./lib/error.o ./lib/sock_ntop.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./intro/exercise/e4.5.o ${WRAPERS} -o ./intro/exercise/e4.5.o

5.1_serv: ./intro/exercise/e5.1_serv.o ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/writen.o ./intro/exercise/e5.1_serv.o ${WRAPERS} -o ./intro/exercise/e5.1_serv.o

5.1_cli: ./intro/exercise/e5.1_cli.o ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/readline.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/writen.o ./lib/readline.o ./intro/exercise/e5.1_cli.o ${WRAPERS} -o ./intro/exercise/e5.1_cli.o

5.6_serv: ./intro/exercise/e5.6_serv.o ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/signal.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/writen.o ./lib/signal.o ./intro/exercise/e5.6_serv.o ${WRAPERS} -o ./intro/exercise/e5.6_serv.o		

5.6_cli: ./intro/exercise/e5.6_cli.o ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/signal.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/writen.o ./lib/signal.o ./intro/exercise/e5.6_cli.o ${WRAPERS} -o ./intro/exercise/e5.6_cli.o

6.4: ./intro/exercise/e6.4.o ./lib/error.o ./lib/sock_ntop.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./intro/exercise/e6.4.o ${WRAPERS} -o ./intro/exercise/e6.4.o														