#include <unp.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <net/route.h>
#include <sys/param.h>

#ifdef HAVE_SYS_SYSCTL_H
#include <sys/sysctl.h>  /* sysctl() */
#endif

/* function prototypes */
void get_rtaddrs(int, struct sockaddr *, struct sockaddr **);
char *net_rt_iflist(int, int, size_t *);
char *net_rt_dump(int, int, size_t *);
char *sock_masktop(struct sockaddr *, socklen_t);

/* wrapper functions */
char *Net_rt_iflist(int, int, size_t *);
char *Net_rt_dump(int, int, size_t *);
#define	Sock_masktop(a, b) sock_masktop((a), (b))
