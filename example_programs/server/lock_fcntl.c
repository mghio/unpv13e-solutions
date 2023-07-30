#include "unp.h"

static struct flock lock_it, unlock_it;
static int lock_fd = -1;

/* fcntl() will fail if my_lock_init() not called */
void my_lock_init(char *pathname)
{
    char lock_file[1024];

    /* must copy caller's string, in case it's a constant */
    strncpy(lock_file, pathname, sizeof(lock_file));
    lock_fd = Mkstemp(lock_file);

    Unlink(lock_file);  /* but lock_fd remains open */

    lock_it.l_type = F_WRLCK;
    lock_it.l_whence = SEEK_SET;
    lock_it.l_start = 0;
    lock_it.l_len = 0;

    unlock_it.l_type = F_ULOCK;
    unlock_it.l_whence = SEEK_SET;
    unlock_it.l_start = 0;
    unlock_it.l_len = 0;
}
