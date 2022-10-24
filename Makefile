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
		make 6.5
		make 6.8
		make 7.1
		make 7.2_serv
		make 7.2_cli
		make 7.3_serv
		make 7.3_cli
		make udp_cli_01
		make udp_serv_01

1-5: ./example_programs/daytimetcpcli.o ./lib/error.o
		${CC} ${OPT} ./lib/error.o ./example_programs/daytimetcpcli.o -o ./example_programs/daytimetcpcli.o

1-6: ./example_programs/daytimetcpcliv6.o ./lib/error.o	
		${CC} ${OPT} ./lib/error.o ./example_programs/daytimetcpcliv6.o -o ./example_programs/daytimetcpcliv6.o

1-9: ./example_programs/daytimetcpsrv.o ./lib/error.o	${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./example_programs/daytimetcpsrv.o ${WRAPERS} -o ./example_programs/daytimetcpsrv.o

1.3: ./exercise/e1.3.o ./lib/error.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./exercise/e1.3.o ${WRAPERS} -o ./exercise/e1.3.o

1.4: ./exercise/e1.4.o ./lib/error.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./exercise/e1.4.o ${WRAPERS} -o ./exercise/e1.4.o
		
1.5: ./exercise/e1.5.o ./lib/error.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./exercise/e1.5.o ${WRAPERS} -o ./exercise/e1.5.o

4-11: ./example_programs/daytimetcpsrv1.o ./lib/error.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./example_programs/daytimetcpsrv1.o ${WRAPERS} -o ./example_programs/daytimetcpsrv1.o						

4.2: ./exercise/e4.2.o ./lib/error.o ./lib/sock_ntop.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/sock_ntop.o ./exercise/e4.2.o ${WRAPERS} -o ./exercise/e4.2.o

4.4: ./exercise/e4.4.o ./lib/error.o ./lib/sock_ntop.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./exercise/e4.4.o ${WRAPERS} -o ./exercise/e4.4.o

4.5: ./exercise/e4.5.o ./lib/error.o ./lib/sock_ntop.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./exercise/e4.5.o ${WRAPERS} -o ./exercise/e4.5.o

5.1_serv: ./exercise/e5.1_serv.o ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/writen.o ./exercise/e5.1_serv.o ${WRAPERS} -o ./exercise/e5.1_serv.o

5.1_cli: ./exercise/e5.1_cli.o ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/readline.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/writen.o ./lib/readline.o ./exercise/e5.1_cli.o ${WRAPERS} -o ./exercise/e5.1_cli.o

5.6_serv: ./exercise/e5.6_serv.o ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/signal.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/writen.o ./lib/signal.o ./exercise/e5.6_serv.o ${WRAPERS} -o ./exercise/e5.6_serv.o		

5.6_cli: ./exercise/e5.6_cli.o ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/signal.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/writen.o ./lib/signal.o ./exercise/e5.6_cli.o ${WRAPERS} -o ./exercise/e5.6_cli.o

6.4: ./exercise/e6.4.o ./lib/error.o ./lib/sock_ntop.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./exercise/e6.4.o ${WRAPERS} -o ./exercise/e6.4.o


6.5: ./exercise/e6.5.o ./lib/error.o ./lib/sock_ntop.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./exercise/e6.5.o ${WRAPERS} -o ./exercise/e6.5.o																

6.8: ./exercise/e6.8.o ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/writen.o ./exercise/e6.8.o ${WRAPERS} -o ./exercise/e6.8.o

7.1: ./exercise/e7.1.o ./lib/error.o ./lib/sock_ntop.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./exercise/e7.1.o ${WRAPERS} -o ./exercise/e7.1.o		

7.2_serv: ./exercise/e7.2_serv.o ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/signal.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/writen.o ./lib/signal.o ./exercise/e7.2_serv.o ${WRAPERS} -o ./exercise/e7.2_serv.o		

7.2_cli: ./exercise/e7.2_cli.o ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/signal.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/writen.o ./lib/signal.o ./exercise/e7.2_cli.o ${WRAPERS} -o ./exercise/e7.2_cli.o

7.3_serv: ./exercise/e7.3_serv.o ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/signal.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/writen.o ./lib/signal.o ./exercise/e7.3_serv.o ${WRAPERS} -o ./exercise/e7.3_serv.o

7.3_cli: ./exercise/e7.3_cli.o ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/readline.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/writen.o ./lib/readline.o ./exercise/e7.3_cli.o ${WRAPERS} -o ./exercise/e7.3_cli.o						

udp_cli_01: ./example_programs/udpcli01.o ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/readline.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/readline.o ./example_programs/udpcli01.o ${WRAPERS} -o ./example_programs/udpcli01.o 		

udp_serv_01: ./example_programs/udpserv01.o ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/wrapunix.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/readline.o ./example_programs/udpserv01.o ${WRAPERS} -o ./example_programs/udpserv01.o