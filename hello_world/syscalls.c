#include <unistd.h>

int _write(int file, char *ptr, int len) {
    for (int i = 0; i < len; i++) {
        // Output a single character (you can modify this to use UART or other output)
        putchar(ptr[i]);
    }
    return len;
}

int _read(int file, char *ptr, int len) {
    // Implement if you need reading capabilities
    return 0;
}

int _close(int file) {
    return -1;
}

int _fstat(int file, struct stat *st) {
    st->st_mode = S_IFCHR;
    return 0;
}

int _isatty(int file) {
    return 1;
}

int _lseek(int file, int ptr, int dir) {
    return 0;
}

int _exit(int status) {
    while(1);  // Endless loop, as we don't have a proper exit in embedded
}
