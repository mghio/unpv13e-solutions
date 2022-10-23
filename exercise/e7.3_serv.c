#include <unp.h>

void str_echo(int sockfd);

int main(int argc, char **argv)
{
    int listenfd, connfd;
    pid_t childpid;
    socklen_t clilen;
    struct sockaddr_in cliaaddr, servaddr;
    listenfd = Socket(AF_INET, SOCK_STREAM, 0);
    bzero(&servaddr, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
    servaddr.sin_port = htons(SERV_PORT);
    Bind(listenfd, (SA *) &servaddr, sizeof(servaddr));
    Listen(listenfd, LISTENQ);
    for ( ; ; ) 
    {
        clilen = sizeof(cliaaddr);
        connfd = Accept(listenfd, (SA *) &cliaaddr, &clilen);
        if ( (childpid = Fork()) == 0)  /* child process */
        {
            Close(listenfd);  /* close listening socket */
            str_echo(connfd); /* process the request */ 
            struct linger linger;
            linger.l_onoff = 1;
            linger.l_linger = 0;
            if (setsockopt(connfd, SOL_SOCKET, SO_LINGER, &linger, sizeof(linger)))
            {
                err_sys("setsockopt error");
            }          
            exit(0);
        }
        Close(connfd);  /* parent closes connected socket */
    }
}

void str_echo(int sockfd)
{
    ssize_t n;
    char buf[MAXLINE];
again:
    while ( (n = read(sockfd, buf, MAXLINE)) > 0)
    {
        Writen(sockfd, buf, n);
    }
    if (n < 0 && errno == EINTR)
    {
        goto again;
    }
    else if (n < 0)
    {
        err_sys("str_echo: read error");
    }
}
