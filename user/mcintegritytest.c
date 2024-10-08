#include <lib.h>

char data[1024];

int main(){
    pid_t pid;
    for(int i = 0; i < 24; i++){
        pid = fork();
        if(pid == 0) break;
    }


    
    return 0;
}