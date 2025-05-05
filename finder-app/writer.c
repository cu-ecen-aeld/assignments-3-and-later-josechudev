#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>


int main(int argc, char *argv[]) {

    // Setup syslog logging for your utility using the LOG_USER facility.

    openlog("write", LOG_PID | LOG_CONS, LOG_USER);
    syslog(LOG_INFO, "writer started");

    // Check if the correct number of arguments is provided.    

    if (argc != 3) {
        syslog(LOG_ERR, "Usage: %s <filename> <string>", argv[0]);
        exit(EXIT_FAILURE);
    }

    const char *writefile = argv[1];
    const char *writestr = argv[2];

    FILE *file = fopen(writefile, "w");

    if (file == NULL) {
        syslog(LOG_ERR, "Error opening file %s", writefile);
        closelog();
        exit(EXIT_FAILURE);
    }

    if (fputs(writestr, file) == EOF) {
        syslog(LOG_ERR, "Error writing %s to file %s", writestr, writefile);
        fclose(file);
        closelog();
        exit(EXIT_FAILURE);
    }

    fclose(file);

    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);

    return 0;
    
}