#include "unp.h"
#include <netinet/in_systm.h>
#include <netinet/ip.h>

static u_char *optr;
static u_char *lenptr;
static int ocnt;

u_char * inet_srcrt_init(int type)
{
    optr = Malloc(44);
    bzero(optr, 44);
    ocnt = 0;
    *optr++ = IPOPT_NOP;
    *optr++ = type ? IPOPT_SSRR : IPOPT_LSRR;
    lenptr = optr++;
    *optr++ = 4;
    return (optr - 4);
}

int inet_srcrt_add(char *hostptr)
{
    int len;
    struct addrinfo *ai;
    struct sockaddr_in *sin;

    if (ocnt > 9)
    {
        err_quit("too many source routes with: %s", hostptr);
    }

    ai = Host_serv(hostptr, NULL, AF_INET, 0);
    sin = (struct sockaddr_in *) ai->ai_addr;
    memcpy(optr, &sin->sin_addr, sizeof(struct in_addr));
    freeaddrinfo(ai);
    
    optr += sizeof(struct in_addr);
    ocnt++;
    len = 3 + (ocnt * sizeof(struct in_addr);
    *lenptr = len;
    return (len + 1);
}
