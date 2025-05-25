#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        printf(1, "Please provide a message to log\n");
        exit();
    }

    logmessage(argv[1]);
    exit(); // return 0;
}