#include "param.h"
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "fcntl.h"
#include "syscall.h"
#include "traps.h"
#include "memlayout.h"

int main(int argc, char * argv[]){
  int pid;
  pid = fork();
  if(pid < 0) {
    printf(1,"fork dun goofed");
    exit(1);
  }
  else if(pid == 0) {
    printf(1,"in child");
  }
  else {
    int status = 1;
    printf(1,"in parent");
    waitpid(pid,&status,0);
  }

  //int status = 1;
  //waitpid(pid,&status,0);
  printf(1,"waitpid ended, child exited");

  return 0;
}
