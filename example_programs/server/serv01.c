#include "unp.h"

int main(int argc, int **argv)
{
    int listenfd, connfd;
    pid_t childpid;
    void sig_chld(int), sig_int(int), web_child(int);
    socklen_t clilen, addrlen;
    struct sockaddr *cliaddr;

    if (argc == 2)
    {
        listenfd = Tcp_listen(NULL, argv[1], &addrlen);
    }
    else if (argc == 3)
    {
        listenfd = Tcp_listen(argv[1], argv[2], &addrlen);
    }
    else 
    {
        err_quit("usage: serv01 [ <host> ] <port#>");
    }

    cliaddr = Malloc(addrlen);

    Signal(SIGCHLD, sig_chld);
    Signal(SIGINT, sig_int);
    
    for ( ; ; )
    {
        clilen = addrlen;
        if ( (connfd = accept(listenfd, cliaddr, &clilen)) < 0)
        {
            if (errno == EINTR)
            {
                continue;  /* back to for() */
            }
            else
            {
                err_sys("accept error");
            }
        }
        
        if ( (childpid = Fork()) == 0)  /* child process */
        {
            Close(listenfd);  /* close listening socket */
            web_child(connfd);  /* process request */
            exit(0);
        }
        Close(connfd);  /* parent closes connected socket */
    }
}
