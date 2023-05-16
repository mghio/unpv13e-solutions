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
