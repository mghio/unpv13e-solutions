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
		make sctp_serv_01
		make hostent
		make daytimetcpcli1
		make daytimetcpnamescli
		make daytimetcpnamesserv
		make daytimetcpnamesserv2
		make daytimeudpnamecli
		make daytimeudpnameserv
		make 11.1
		make 11.4
		make 11.5
		make 11.8
		make inetd_daytimetcpserv2
		make inetd_daytimetcpserv3
		make unixdomain_unixbind
		make unixdomain_unixstrserv01
		make unixdomain_unixstrcli01
		make unixdomain_unixdgserv01
		make unixdomain_unixdgcli01
		make unixdomain_mycat
		make 15.4
		make ioctl_prifinfo
		make route_getrt
		make route_checkudpsum
		make key_dump
		make bcast_dgclicast1
		make advio_udpserv03
		make 22.5

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

sctp_serv_01: ./example_programs/sctpserv01.o ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/wrapunix.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/readline.o ./example_programs/sctpserv01.o ${WRAPERS} -o ./example_programs/sctpserv01.o

hostent: ./example_programs/hostent.o ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/wrapunix.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/readline.o ./example_programs/hostent.o ${WRAPERS} -o ./example_programs/hostent.o

daytimetcpcli1: ./example_programs/daytimetcpcli1.o ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/wrapunix.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/readline.o ./example_programs/daytimetcpcli1.o ${WRAPERS} -o ./example_programs/daytimetcpcli1.o

daytimetcpnamescli: ./example_programs/daytimetcpnamescli.o ./lib/error.o ./lib/sock_ntop.o ./lib/sock_ntop_host.o ./lib/writen.o ./lib/wrapunix.o ./lib/tcp_connect.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/sock_ntop.o ./lib/sock_ntop_host.o ./lib/writen.o ./lib/readline.o ./lib/tcp_connect.o ./example_programs/daytimetcpnamescli.o ${WRAPERS} -o ./example_programs/daytimetcpnamescli.o

daytimetcpnamesserv: ./example_programs/daytimetcpnamesserv.o ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/wrapunix.o ./lib/tcp_listen.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/readline.o ./lib/tcp_listen.o ./example_programs/daytimetcpnamesserv.o ${WRAPERS} -o ./example_programs/daytimetcpnamesserv.o

daytimetcpnamesserv2: ./example_programs/daytimetcpnamesserv2.o ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/wrapunix.o ./lib/tcp_listen.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/readline.o ./lib/tcp_listen.o ./example_programs/daytimetcpnamesserv2.o ${WRAPERS} -o ./example_programs/daytimetcpnamesserv2.o

daytimeudpnamecli: ./example_programs/daytimeudpnamecli.o ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/wrapunix.o ./lib/udp_client.o ./lib/sock_ntop_host.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/readline.o ./lib/udp_client.o ./lib/sock_ntop_host.o ./example_programs/daytimeudpnamecli.o ${WRAPERS} -o ./example_programs/daytimeudpnamecli.o

daytimeudpnameserv: ./example_programs/daytimeudpnameserv.o ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/wrapunix.o ./lib/udp_server.o ./lib/sock_ntop_host.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/readline.o ./lib/udp_server.o ./lib/sock_ntop_host.o ./example_programs/daytimeudpnameserv.o ${WRAPERS} -o ./example_programs/daytimeudpnameserv.o														

11.1: ./exercise/e11.1.o ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ./lib/readline.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/writen.o ./lib/readline.o ./exercise/e11.1.o ${WRAPERS} -o ./exercise/e11.1.o

11.4: ./exercise/e11.4.o ./lib/error.o ./lib/sock_ntop.o ./lib/writen.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/writen.o ./lib/sock_ntop.o ./exercise/e11.4.o ${WRAPERS} -o ./exercise/e11.4.o

11.5: ./exercise/e11.5.o ./lib/error.o ./lib/sock_ntop.o ./lib/sock_set_addr.o ./lib/sock_set_port.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/sock_set_addr.o ./lib/sock_set_port.o ./lib/sock_ntop.o ./exercise/e11.5.o ${WRAPERS} -o ./exercise/e11.5.o

11.8: ./exercise/e11.8.o ./lib/error.o ./lib/sock_ntop.o ./lib/sock_set_addr.o ./lib/sock_set_port.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/sock_set_addr.o ./lib/sock_set_port.o ./lib/sock_ntop.o ./exercise/e11.8.o ${WRAPERS} -o ./exercise/e11.8.o

inetd_daytimetcpserv2: ./example_programs/inetd_daytimetcpserv2.o ./lib/sock_ntop.o ./lib/tcp_listen.o ./lib/daemon_init.o ./lib/signal.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/daemon_init.o ./lib/signal.o ./lib/tcp_listen.o ./lib/sock_ntop.o ./example_programs/inetd_daytimetcpserv2.o ${WRAPERS} -o ./example_programs/inetd_daytimetcpserv2.o

inetd_daytimetcpserv3: ./example_programs/inetd_daytimetcpserv3.o ./lib/sock_ntop.o ./lib/tcp_listen.o ./lib/daemon_inetd.o ./lib/signal.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/daemon_inetd.o ./lib/signal.o ./lib/tcp_listen.o ./lib/sock_ntop.o ./example_programs/inetd_daytimetcpserv3.o ${WRAPERS} -o ./example_programs/inetd_daytimetcpserv3.o	

unixdomain_unixbind: ./example_programs/unixdomain_unixbind.o ./lib/sock_ntop.o ./lib/tcp_listen.o ./lib/daemon_inetd.o ./lib/signal.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/daemon_inetd.o ./lib/signal.o ./lib/tcp_listen.o ./lib/sock_ntop.o ./example_programs/unixdomain_unixbind.o ${WRAPERS} -o ./example_programs/unixdomain_unixbind.o	

unixdomain_unixstrserv01: ./example_programs/unixdomain_unixstrserv01.o ./lib/sock_ntop.o ./lib/tcp_listen.o ./lib/daemon_inetd.o ./lib/signal.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/daemon_inetd.o ./lib/signal.o ./lib/tcp_listen.o ./lib/sock_ntop.o ./example_programs/unixdomain_unixstrserv01.o ${WRAPERS} -o ./example_programs/unixdomain_unixstrserv01.o		

unixdomain_unixstrcli01: ./example_programs/unixdomain_unixstrcli01.o ./lib/sock_ntop.o ./lib/tcp_listen.o ./lib/daemon_inetd.o ./lib/signal.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/daemon_inetd.o ./lib/signal.o ./lib/tcp_listen.o ./lib/sock_ntop.o ./example_programs/unixdomain_unixstrcli01.o ${WRAPERS} -o ./example_programs/unixdomain_unixstrcli01.o 		

unixdomain_unixdgserv01: ./example_programs/unixdomain_unixdgserv01.o ./lib/sock_ntop.o ./lib/tcp_listen.o ./lib/daemon_inetd.o ./lib/signal.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/daemon_inetd.o ./lib/signal.o ./lib/tcp_listen.o ./lib/sock_ntop.o ./example_programs/unixdomain_unixdgserv01.o ${WRAPERS} -o ./example_programs/unixdomain_unixdgserv01.o		

unixdomain_unixdgcli01: ./example_programs/unixdomain_unixdgcli01.o ./lib/sock_ntop.o ./lib/tcp_listen.o ./lib/daemon_inetd.o ./lib/signal.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/daemon_inetd.o ./lib/signal.o ./lib/tcp_listen.o ./lib/sock_ntop.o ./example_programs/unixdomain_unixdgcli01.o ${WRAPERS} -o ./example_programs/unixdomain_unixdgcli01.o		

unixdomain_mycat: ./example_programs/unixdomain_mycat.o ./lib/sock_ntop.o ./lib/tcp_listen.o ./lib/daemon_inetd.o ./lib/read_fd.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/daemon_inetd.o ./lib/read_fd.o ./lib/tcp_listen.o ./lib/sock_ntop.o ./example_programs/unixdomain_mycat.o ${WRAPERS} -o ./example_programs/unixdomain_mycat.o 		

15.4: ./exercise/e15.4.o ./lib/error.o ./lib/sock_ntop.o ./lib/sock_set_addr.o ./lib/sock_set_port.o ./lib/signal.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/sock_set_addr.o ./lib/sock_set_port.o ./lib/signal.o ./lib/sock_ntop.o ./exercise/e15.4.o ${WRAPERS} -o ./exercise/e15.4.o		

ioctl_prifinfo: ./example_programs/ioctl_prifinfo.o ./lib/sock_ntop_host.o ./lib/get_ifi_info.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/get_ifi_info.o ./lib/sock_ntop_host.o ./example_programs/ioctl_prifinfo.o ${WRAPERS} -o ./example_programs/ioctl_prifinfo.o

route_getrt: ./example_programs/route_getrt.o ./lib/sock_ntop_host.o ./lib/get_ifi_info.o ./lib/get_rtaddrs.o ./lib/sock_masktop.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/get_ifi_info.o ./lib/sock_ntop_host.o ./lib/get_rtaddrs.o ./lib/sock_masktop.o ./example_programs/route_getrt.o ${WRAPERS} -o ./example_programs/route_getrt.o		

route_checkudpsum: ./example_programs/route_checkudpsum.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./example_programs/route_checkudpsum.o ${WRAPERS} -o ./example_programs/route_checkudpsum.o

key_dump: ./example_programs/key_dump.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./example_programs/key_dump.o ${WRAPERS} -o ./example_programs/key_dump.o		 		

bcast_dgclicast1: ./lib/sock_ntop_host.o ./lib/signal.o ./example_programs/bcast_dgclicast1.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/signal.o ./lib/sock_ntop_host.o ./example_programs/bcast_dgclicast1.o ${WRAPERS} -o ./example_programs/bcast_dgclicast1.o		

advio_udpserv03: ./lib/sock_ntop.o ./lib/get_ifi_info.o ./example_programs/advio_udpserv03.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/sock_ntop.o ./lib/get_ifi_info.o ./example_programs/advio_udpserv03.o ${WRAPERS} -o ./example_programs/advio_udpserv03.o

22.5: ./exercise/e22.5.o ./lib/error.o ./lib/sock_ntop.o ./lib/sock_set_addr.o ./lib/sock_get_port.o ./lib/sock_set_port.o ./lib/sock_set_wild.o ./lib/get_ifi_info.o ./lib/udp_client.o ${WRAPERS}
		${CC} ${OPT} ./lib/error.o ./lib/sock_set_addr.o ./lib/sock_get_port.o ./lib/sock_set_port.o ./lib/sock_set_wild.o ./lib/sock_ntop.o ./lib/get_ifi_info.o ./lib/udp_client.o ./exercise/e22.5.o ${WRAPERS} -o ./exercise/e22.5.o			