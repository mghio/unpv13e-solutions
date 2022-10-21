#include <unp.h>
#include <netinet/tcp.h>

int main(int argc, char **argv)
{
    int sockfd, recvbuf, mss;
    struct sockaddr_in servaddr;
    socklen_t len;

    if (argc != 2)
    {
        err_quit("usage: a.out <IPaddress>");
    }

    sockfd = Socket(AF_INET, SOCK_STREAM, 0);

    len = sizeof(recvbuf);
    Getsockopt(sockfd, SOL_SOCKET, SO_RCVBUF, &recvbuf, &len);
    len = sizeof(mss);
    Getsockopt(sockfd, IPPROTO_TCP, TCP_MAXSEG, &mss, &len);
    printf("defaults: SO_RCVBUF = %d, TCP_MAXSEG = %d\n", recvbuf, mss);
    
    bzero(&servaddr, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(13);  /* daytime server */
    Inet_pton(AF_INET, argv[1], &servaddr.sin_addr);
    Connect(sockfd, (SA *) &servaddr, sizeof(servaddr));

    len = sizeof(recvbuf);
    Getsockopt(sockfd, SOL_SOCKET, SO_RCVBUF, &recvbuf, &len);
    len = sizeof(mss);
    Getsockopt(sockfd, IPPROTO_TCP, TCP_MAXSEG, &mss, &len);
    printf("alter connect: SO_RCVBUF = %d, TCP_MAXSEG = %d\n", recvbuf, mss);

    exit(0);
}