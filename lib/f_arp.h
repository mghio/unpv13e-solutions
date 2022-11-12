#include <unp.h>

struct arpreq {
    struct sockaddr arp_pa;  /* protocol address */
    struct sockaddr arp_ha;  /* hardware address */ 
    int arp_flags;  /* flags */
};

#define ATF_INUSE 0x01  /* entry in use */
#define ATF_COM  /* completed entry (hardware addr valid) */
#define ATF_PERM  /* permanent entry */
#define ATF_PUBL  /* published entry (respord for other host) */