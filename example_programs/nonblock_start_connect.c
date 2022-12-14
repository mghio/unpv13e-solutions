#include <nonblock_web.h>

void start_connect(struct file *fptr)
{
    int fd, flags, n;
    struct addrinfo *ai;
    
    ai = Host_serv(fptr->f_host, SERV, 0, SOCK_STREAM);
    fd = Socket(ai->ai_family, ai->ai_socktype, ai->ai_protocol);
    fptr->f_fd = fd;
    printf("start connect for %s, fd %d\n", fptr->f_name, fd);

    /* Set socket nonblocking */
    flags = Fcntl(fd, F_GETFL, 0);
    Fcntl(fd, F_SETFL, flags | O_NONBLOCK);

    /* Initiate nonblocking connect to hte server. */
    if ( (n = connect(fd, ai->ai_addr, ai->ai_addrlen)))
    {
        if (errno != EINPROGRESS)
        {
            err_sys("nonblocking connect error");
        }
        
        fptr->f_flags = F_CONNECTING;
        FD_SET(fd, &rset);
        FD_SET(fd, &wset);
        if (fd > maxfd)
        {
            maxfd = fd;
        }
    }
    else if (n >= 0)   /* connect is already done */
    {
        write_get_cmd(fptr);  /* write() the GET command */
    }
}
