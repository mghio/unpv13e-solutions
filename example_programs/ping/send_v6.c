#include "ping.h"

void send_v6(void)
{
    #ifdef IPV6
    int len;
    struct icmp6_hdr *icmp6;

    icmp = (struct icmp6_hdr *) sendbuf;
    icmp->icmp6_type = ICMP6_ECHO_REQUEST;
    icmp->icmp6_code = 0;
    icmp->icmp6_id = pid;
    icmp->icmp6_seq = nsent++;
    memset(icmp 6 + 1, 0xa5, datalen);  /* fill with pattern */    
    Gettimeofday((struct timeval *) (icmp + 1), NULL);

    len = 8 + datalen;  /* 8-byte ICMPV6 header */

    Sendto(sockfd, sendbuf, len, 0, pr->sasend, pr->salen);

    /* kernel calculates and sotres checksum for us */
    #endif
}
