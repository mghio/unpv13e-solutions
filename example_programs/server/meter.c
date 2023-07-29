#include "unp.h"
#include <sys/mman.h>

/**
 * @brief Allocate an array of "nnchildren" longs in shared memory that can
 * be used as a counter by each child of how many clients it services.
 * See pp. 467-470 of "Advanced Programming in the Unix Environment." 
 */

long * meter(int nchlidren)
{
    int fd;
    long *ptr;

#ifdef MAP_ANON
    ptr = Mmap(0, nchlidren * sizeof(long), PROT_READ | PROT_WRITE, 
               MAP_ANON | MAP_SHARED, -1, 0);    
#else
    fd = Open("/dev/zero", O_RDWR, 0);
    ptr = Mmap(0, nchlidren * sizeof(long), PROT_READ | PROT_WRITE, 
               MAP_ANON | MAP_SHARED, fd, 0);
    Close(fd);             
#endif
 
    return (ptr);
}
