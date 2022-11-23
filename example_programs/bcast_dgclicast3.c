#include <unp.h>

static void recvfrom_alarm(int);

int main(int argc, char **argv)
{
    int sockfd;
    struct sockaddr_in servaddr;
    if (argc != 2)
    {
        err_quit("usage: udpcli <IPaddress>");
    }
    bzero(&servaddr, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(13);
    Inet_pton(AF_INET, argv[1], &servaddr.sin_addr);
    sockfd = Socket(AF_INET, SOCK_DGRAM, 0);
    dg_cli(stdin, sockfd, (SA *) &servaddr, sizeof(servaddr));
    exit(0);
}

void dg_cli(FILE *fp, int sockfd, const SA *pservaddr, socklen_t servlen)
{
    int n;
    const int on = 1;
    char sendline[MAXLINE], recvline[MAXLINE + 1];
    sigset_t sigset_alrm;
    socklen_t len;
    struct sockaddr *preply_addr;
    
    preply_addr = Malloc(servlen);
    Setsockopt(sockfd, SOL_SOCKET, SO_BROADCAST, &on, sizeof(on));
    Sigemptyset(&sigset_alrm);
    Sigaddset(&sigset_alrm, SIGALRM);
    Signal(SIGALRM, recvfrom_alarm);
    while (Fgets(sendline, MAXLINE, fp) != NULL)
    {
        Sendto(sockfd, sendline, strlen(sendline), 0, pservaddr, servlen);
        alarm(5);
        for ( ; ; )
        {
            len = servlen;
            n = recvfrom(sockfd, recvline, MAXLINE, 0, preply_addr, &len);
            if (n < 0)
            {
                if (errno == EINTR)
                {
                    break;  /* waited long enough for replies */
                }
                else
                {
                    err_sys("recvfrom error");
                }
            }
            else
            {
                recvline[n] = 0;  /* null terminate */
                sleep(1);
                printf("form %s: %s", Sock_ntop_host(preply_addr, len), recvline);
            }
        }
    }
    free(preply_addr);
}

static void recvfrom_alarm(int signo)
{
    return;  /* just interrupt the recvfrom() */
}
