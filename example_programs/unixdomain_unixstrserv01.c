#include <unp.h>

int main(int argc, char **argv)
{
    int listenfd, connfd;
    pid_t childpid;
    socklen_t clilen;
    struct sockaddr_un cliaddr, servaddr;
    void sig_chld(int);

    listenfd = Socket(AF_LOCAL, SOCK_STREAM, 0);
    unlink(UNIXSTR_PATH);
    bzero(&servaddr, sizeof(servaddr));
    servaddr.sun_family = AF_LOCAL;
    strcpy(servaddr.sun_path, UNIXSTR_PATH);
    Bind(listenfd, (SA *) &servaddr, sizeof(servaddr));
    Listen(listenfd, LISTENQ);
    Signal(SIGCHLD, sig_chld);
    for ( ; ; )
    {
        clilen = sizeof(cliaddr);
        if ( (connfd = accept(listenfd, (SA *) &cliaddr, &clilen)) < 0)
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
            Close(listenfd);   /* close listening socket */
            str_echo(connfd);  /* process request */
            exit(0);
        }
        Close(connfd);
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
