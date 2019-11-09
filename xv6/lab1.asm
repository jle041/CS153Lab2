
_lab1:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"

int main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	83 ec 10             	sub    $0x10,%esp
   a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	
	int exitWait(void);
	int waitPid(void);
	int PScheduler(void);

  printf(1, "\n This program tests the correctness of your lab#1\n");
   d:	c7 44 24 04 78 0f 00 	movl   $0xf78,0x4(%esp)
  14:	00 
  15:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1c:	e8 8f 08 00 00       	call   8b0 <printf>
  
  if (atoi(argv[1]) == 1)
  21:	8b 43 04             	mov    0x4(%ebx),%eax
  24:	89 04 24             	mov    %eax,(%esp)
  27:	e8 c4 06 00 00       	call   6f0 <atoi>
  2c:	83 f8 01             	cmp    $0x1,%eax
  2f:	74 40                	je     71 <main+0x71>
	exitWait();
  else if (atoi(argv[1]) == 2)
  31:	8b 43 04             	mov    0x4(%ebx),%eax
  34:	89 04 24             	mov    %eax,(%esp)
  37:	e8 b4 06 00 00       	call   6f0 <atoi>
  3c:	83 f8 02             	cmp    $0x2,%eax
  3f:	74 37                	je     78 <main+0x78>
	waitPid();
  else if (atoi(argv[1]) == 3)
  41:	8b 43 04             	mov    0x4(%ebx),%eax
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 a4 06 00 00       	call   6f0 <atoi>
  4c:	83 f8 03             	cmp    $0x3,%eax
  4f:	74 36                	je     87 <main+0x87>
	PScheduler();
  else 
   printf(1, "\ntype \"lab1 1\" to test exit and wait, \"lab1 2\" to test waitpid and \"lab1 3\" to test the priority scheduler \n");
  51:	c7 44 24 04 ac 0f 00 	movl   $0xfac,0x4(%esp)
  58:	00 
  59:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  60:	e8 4b 08 00 00       	call   8b0 <printf>
  
    // End of test
	 exit(0);
  65:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  6c:	e8 e1 06 00 00       	call   752 <exit>
	exitWait();
  71:	e8 2a 00 00 00       	call   a0 <exitWait>
  76:	eb ed                	jmp    65 <main+0x65>
  78:	90                   	nop
  79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	waitPid();
  80:	e8 1b 01 00 00       	call   1a0 <waitPid>
  85:	eb de                	jmp    65 <main+0x65>
	PScheduler();
  87:	e8 74 03 00 00       	call   400 <PScheduler>
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  90:	eb d3                	jmp    65 <main+0x65>
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <exitWait>:
 }
  
  
int exitWait(void) {
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	56                   	push   %esi
  a4:	53                   	push   %ebx
       int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");

  for (i = 0; i < 2; i++) {
  a5:	31 db                	xor    %ebx,%ebx
int exitWait(void) {
  a7:	83 ec 20             	sub    $0x20,%esp
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");
  aa:	c7 44 24 04 18 0c 00 	movl   $0xc18,0x4(%esp)
  b1:	00 
      {
	 printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
      exit(-1);
  } 
    } else if (pid > 0) { // only the parent exeecutes this code
      ret_pid = wait(&exit_status);
  b2:	8d 75 f4             	lea    -0xc(%ebp),%esi
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");
  b5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  bc:	e8 ef 07 00 00       	call   8b0 <printf>
    pid = fork();
  c1:	e8 84 06 00 00       	call   74a <fork>
    if (pid == 0) { // only the child executed this code
  c6:	83 f8 00             	cmp    $0x0,%eax
  c9:	74 45                	je     110 <exitWait+0x70>
  cb:	90                   	nop
  cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if (pid > 0) { // only the parent exeecutes this code
  d0:	0f 8e a3 00 00 00    	jle    179 <exitWait+0xd9>
      ret_pid = wait(&exit_status);
  d6:	89 34 24             	mov    %esi,(%esp)
  for (i = 0; i < 2; i++) {
  d9:	83 c3 01             	add    $0x1,%ebx
      ret_pid = wait(&exit_status);
  dc:	e8 79 06 00 00       	call   75a <wait>
      printf(1, "\n This is the parent: child with PID# %d has exited with status %d\n", ret_pid, exit_status);
  e1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  e4:	c7 44 24 04 90 0c 00 	movl   $0xc90,0x4(%esp)
  eb:	00 
  ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f3:	89 54 24 0c          	mov    %edx,0xc(%esp)
  f7:	89 44 24 08          	mov    %eax,0x8(%esp)
  fb:	e8 b0 07 00 00       	call   8b0 <printf>
  for (i = 0; i < 2; i++) {
 100:	83 fb 02             	cmp    $0x2,%ebx
 103:	75 bc                	jne    c1 <exitWait+0x21>
	  printf(2, "\nError using fork\n");
      exit(-1);
    }
  }
  return 0;
}
 105:	83 c4 20             	add    $0x20,%esp
 108:	31 c0                	xor    %eax,%eax
 10a:	5b                   	pop    %ebx
 10b:	5e                   	pop    %esi
 10c:	5d                   	pop    %ebp
 10d:	c3                   	ret    
 10e:	66 90                	xchg   %ax,%ax
      if (i == 0)
 110:	85 db                	test   %ebx,%ebx
 112:	75 34                	jne    148 <exitWait+0xa8>
      printf(1, "\nThis is child with PID# %d and I will exit with status %d\n", getpid(), 0);
 114:	e8 c1 06 00 00       	call   7da <getpid>
 119:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 120:	00 
 121:	c7 44 24 04 54 0c 00 	movl   $0xc54,0x4(%esp)
 128:	00 
 129:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 130:	89 44 24 08          	mov    %eax,0x8(%esp)
 134:	e8 77 07 00 00       	call   8b0 <printf>
      exit(0);
 139:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 140:	e8 0d 06 00 00       	call   752 <exit>
 145:	8d 76 00             	lea    0x0(%esi),%esi
	 printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
 148:	e8 8d 06 00 00       	call   7da <getpid>
 14d:	c7 44 24 0c ff ff ff 	movl   $0xffffffff,0xc(%esp)
 154:	ff 
 155:	c7 44 24 04 54 0c 00 	movl   $0xc54,0x4(%esp)
 15c:	00 
 15d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 164:	89 44 24 08          	mov    %eax,0x8(%esp)
 168:	e8 43 07 00 00       	call   8b0 <printf>
      exit(-1);
 16d:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 174:	e8 d9 05 00 00       	call   752 <exit>
	  printf(2, "\nError using fork\n");
 179:	c7 44 24 04 1c 10 00 	movl   $0x101c,0x4(%esp)
 180:	00 
 181:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 188:	e8 23 07 00 00       	call   8b0 <printf>
      exit(-1);
 18d:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 194:	e8 b9 05 00 00       	call   752 <exit>
 199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001a0 <waitPid>:

int waitPid(void){
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	56                   	push   %esi
 1a4:	53                   	push   %ebx
 1a5:	83 ec 30             	sub    $0x30,%esp
  int ret_pid, exit_status;
  int i;
  int pid_a[5]={0, 0, 0, 0, 0};
 // use this part to test wait(int pid, int* status, int options)

 printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");
 1a8:	c7 44 24 04 d4 0c 00 	movl   $0xcd4,0x4(%esp)
 1af:	00 
 1b0:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 1b3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1ba:	8d 75 f8             	lea    -0x8(%ebp),%esi
  int pid_a[5]={0, 0, 0, 0, 0};
 1bd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 1c4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 1cb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 1d2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 1d9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");
 1e0:	e8 cb 06 00 00       	call   8b0 <printf>

  for (i = 0; i <5; i++) {
    pid_a[i] = fork();
 1e5:	e8 60 05 00 00       	call   74a <fork>
	
    if (pid_a[i] == 0) { // only the child executed this code
 1ea:	85 c0                	test   %eax,%eax
    pid_a[i] = fork();
 1ec:	89 03                	mov    %eax,(%ebx)
    if (pid_a[i] == 0) { // only the child executed this code
 1ee:	0f 84 d5 01 00 00    	je     3c9 <waitPid+0x229>
 1f4:	83 c3 04             	add    $0x4,%ebx
  for (i = 0; i <5; i++) {
 1f7:	39 f3                	cmp    %esi,%ebx
 1f9:	75 ea                	jne    1e5 <waitPid+0x45>
     
     
      printf(1, "\n The is child with PID# %d and I will exit with status %d\n", getpid(), 0);
      exit(0);}}
       
      sleep(5);
 1fb:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[3]);
      ret_pid = waitpid(pid_a[3], &exit_status, 0);
 202:	8d 5d e0             	lea    -0x20(%ebp),%ebx
      sleep(5);
 205:	e8 e0 05 00 00       	call   7ea <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[3]);
 20a:	8b 75 f0             	mov    -0x10(%ebp),%esi
 20d:	c7 44 24 04 50 0d 00 	movl   $0xd50,0x4(%esp)
 214:	00 
 215:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 21c:	89 74 24 08          	mov    %esi,0x8(%esp)
 220:	e8 8b 06 00 00       	call   8b0 <printf>
      ret_pid = waitpid(pid_a[3], &exit_status, 0);
 225:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 229:	89 34 24             	mov    %esi,(%esp)
 22c:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 233:	00 
 234:	e8 29 05 00 00       	call   762 <waitpid>
      printf(1, "\n This is the parent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 239:	8b 55 e0             	mov    -0x20(%ebp),%edx
 23c:	c7 44 24 04 8c 0d 00 	movl   $0xd8c,0x4(%esp)
 243:	00 
 244:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 24b:	89 54 24 0c          	mov    %edx,0xc(%esp)
 24f:	89 44 24 08          	mov    %eax,0x8(%esp)
 253:	e8 58 06 00 00       	call   8b0 <printf>
      sleep(5);
 258:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 25f:	e8 86 05 00 00       	call   7ea <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[1]);
 264:	8b 75 e8             	mov    -0x18(%ebp),%esi
 267:	c7 44 24 04 50 0d 00 	movl   $0xd50,0x4(%esp)
 26e:	00 
 26f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 276:	89 74 24 08          	mov    %esi,0x8(%esp)
 27a:	e8 31 06 00 00       	call   8b0 <printf>
      ret_pid = waitpid(pid_a[1], &exit_status, 0);
 27f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 283:	89 34 24             	mov    %esi,(%esp)
 286:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 28d:	00 
 28e:	e8 cf 04 00 00       	call   762 <waitpid>
      printf(1, "\n This is the parent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 293:	8b 55 e0             	mov    -0x20(%ebp),%edx
 296:	c7 44 24 04 8c 0d 00 	movl   $0xd8c,0x4(%esp)
 29d:	00 
 29e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2a5:	89 54 24 0c          	mov    %edx,0xc(%esp)
 2a9:	89 44 24 08          	mov    %eax,0x8(%esp)
 2ad:	e8 fe 05 00 00       	call   8b0 <printf>
      sleep(5);
 2b2:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 2b9:	e8 2c 05 00 00       	call   7ea <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[2]);
 2be:	8b 75 ec             	mov    -0x14(%ebp),%esi
 2c1:	c7 44 24 04 50 0d 00 	movl   $0xd50,0x4(%esp)
 2c8:	00 
 2c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2d0:	89 74 24 08          	mov    %esi,0x8(%esp)
 2d4:	e8 d7 05 00 00       	call   8b0 <printf>
      ret_pid = waitpid(pid_a[2], &exit_status, 0);
 2d9:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 2dd:	89 34 24             	mov    %esi,(%esp)
 2e0:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 2e7:	00 
 2e8:	e8 75 04 00 00       	call   762 <waitpid>
      printf(1, "\n This is the parent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 2ed:	8b 55 e0             	mov    -0x20(%ebp),%edx
 2f0:	c7 44 24 04 8c 0d 00 	movl   $0xd8c,0x4(%esp)
 2f7:	00 
 2f8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2ff:	89 54 24 0c          	mov    %edx,0xc(%esp)
 303:	89 44 24 08          	mov    %eax,0x8(%esp)
 307:	e8 a4 05 00 00       	call   8b0 <printf>
      sleep(5);
 30c:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 313:	e8 d2 04 00 00       	call   7ea <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[0]);
 318:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 31b:	c7 44 24 04 50 0d 00 	movl   $0xd50,0x4(%esp)
 322:	00 
 323:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 32a:	89 74 24 08          	mov    %esi,0x8(%esp)
 32e:	e8 7d 05 00 00       	call   8b0 <printf>
      ret_pid = waitpid(pid_a[0], &exit_status, 0);
 333:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 337:	89 34 24             	mov    %esi,(%esp)
 33a:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 341:	00 
 342:	e8 1b 04 00 00       	call   762 <waitpid>
      printf(1, "\n This is the parent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 347:	8b 55 e0             	mov    -0x20(%ebp),%edx
 34a:	c7 44 24 04 8c 0d 00 	movl   $0xd8c,0x4(%esp)
 351:	00 
 352:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 359:	89 54 24 0c          	mov    %edx,0xc(%esp)
 35d:	89 44 24 08          	mov    %eax,0x8(%esp)
 361:	e8 4a 05 00 00       	call   8b0 <printf>
      sleep(5);
 366:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 36d:	e8 78 04 00 00       	call   7ea <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[4]);
 372:	8b 75 f4             	mov    -0xc(%ebp),%esi
 375:	c7 44 24 04 50 0d 00 	movl   $0xd50,0x4(%esp)
 37c:	00 
 37d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 384:	89 74 24 08          	mov    %esi,0x8(%esp)
 388:	e8 23 05 00 00       	call   8b0 <printf>
      ret_pid = waitpid(pid_a[4], &exit_status, 0);
 38d:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 391:	89 34 24             	mov    %esi,(%esp)
 394:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 39b:	00 
 39c:	e8 c1 03 00 00       	call   762 <waitpid>
      printf(1, "\n This is the parent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 3a1:	8b 55 e0             	mov    -0x20(%ebp),%edx
 3a4:	c7 44 24 04 8c 0d 00 	movl   $0xd8c,0x4(%esp)
 3ab:	00 
 3ac:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3b3:	89 54 24 0c          	mov    %edx,0xc(%esp)
 3b7:	89 44 24 08          	mov    %eax,0x8(%esp)
 3bb:	e8 f0 04 00 00       	call   8b0 <printf>
      
      return 0;
  }
 3c0:	83 c4 30             	add    $0x30,%esp
 3c3:	31 c0                	xor    %eax,%eax
 3c5:	5b                   	pop    %ebx
 3c6:	5e                   	pop    %esi
 3c7:	5d                   	pop    %ebp
 3c8:	c3                   	ret    
      printf(1, "\n The is child with PID# %d and I will exit with status %d\n", getpid(), 0);
 3c9:	e8 0c 04 00 00       	call   7da <getpid>
 3ce:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 3d5:	00 
 3d6:	c7 44 24 04 14 0d 00 	movl   $0xd14,0x4(%esp)
 3dd:	00 
 3de:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3e5:	89 44 24 08          	mov    %eax,0x8(%esp)
 3e9:	e8 c2 04 00 00       	call   8b0 <printf>
      exit(0);}}
 3ee:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3f5:	e8 58 03 00 00       	call   752 <exit>
 3fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000400 <PScheduler>:
      
      
     int PScheduler(void){
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	53                   	push   %ebx
    printf(1, "\n  Step 2: testing the priority scheduler and setpriority(int priority)) systema call:\n");
    printf(1, "\n  Step 2: Assuming that the priorities range between range between 0 to 31\n");
    printf(1, "\n  Step 2: 0 is the highest priority. All processes have a default priority of 10\n");
    printf(1, "\n  Step 2: The parent processes will switch to priority 0\n");
    setpriority(0);
    for (i = 0; i <  3; i++) {
 404:	31 db                	xor    %ebx,%ebx
     int PScheduler(void){
 406:	83 ec 14             	sub    $0x14,%esp
    printf(1, "\n  Step 2: testing the priority scheduler and setpriority(int priority)) systema call:\n");
 409:	c7 44 24 04 c8 0d 00 	movl   $0xdc8,0x4(%esp)
 410:	00 
 411:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 418:	e8 93 04 00 00       	call   8b0 <printf>
    printf(1, "\n  Step 2: Assuming that the priorities range between range between 0 to 31\n");
 41d:	c7 44 24 04 20 0e 00 	movl   $0xe20,0x4(%esp)
 424:	00 
 425:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 42c:	e8 7f 04 00 00       	call   8b0 <printf>
    printf(1, "\n  Step 2: 0 is the highest priority. All processes have a default priority of 10\n");
 431:	c7 44 24 04 70 0e 00 	movl   $0xe70,0x4(%esp)
 438:	00 
 439:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 440:	e8 6b 04 00 00       	call   8b0 <printf>
    printf(1, "\n  Step 2: The parent processes will switch to priority 0\n");
 445:	c7 44 24 04 c4 0e 00 	movl   $0xec4,0x4(%esp)
 44c:	00 
 44d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 454:	e8 57 04 00 00       	call   8b0 <printf>
    setpriority(0);
 459:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 460:	e8 95 03 00 00       	call   7fa <setpriority>
	pid = fork();
 465:	e8 e0 02 00 00       	call   74a <fork>
	if (pid > 0 ) {
 46a:	83 f8 00             	cmp    $0x0,%eax
 46d:	7e 48                	jle    4b7 <PScheduler+0xb7>
    for (i = 0; i <  3; i++) {
 46f:	83 c3 01             	add    $0x1,%ebx
 472:	83 fb 03             	cmp    $0x3,%ebx
 475:	75 ee                	jne    465 <PScheduler+0x65>
	}

	if(pid > 0) {
		for (i = 0; i <  3; i++) {
			
			wait(0);
 477:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 47e:	e8 d7 02 00 00       	call   75a <wait>
 483:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 48a:	e8 cb 02 00 00       	call   75a <wait>
 48f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 496:	e8 bf 02 00 00       	call   75a <wait>
			}
                     printf(1,"\n if processes with highest priority finished first then its correct \n");
 49b:	c7 44 24 04 30 0f 00 	movl   $0xf30,0x4(%esp)
 4a2:	00 
 4a3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4aa:	e8 01 04 00 00       	call   8b0 <printf>
}
			
	return 0;}
 4af:	83 c4 14             	add    $0x14,%esp
 4b2:	31 c0                	xor    %eax,%eax
 4b4:	5b                   	pop    %ebx
 4b5:	5d                   	pop    %ebp
 4b6:	c3                   	ret    
	else if ( pid == 0) {
 4b7:	75 57                	jne    510 <PScheduler+0x110>
		setpriority(30-10*i);	
 4b9:	6b db f6             	imul   $0xfffffff6,%ebx,%ebx
 4bc:	83 c3 1e             	add    $0x1e,%ebx
 4bf:	89 1c 24             	mov    %ebx,(%esp)
 4c2:	e8 33 03 00 00       	call   7fa <setpriority>
 4c7:	ba 50 c3 00 00       	mov    $0xc350,%edx
 4cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for (i = 0; i <  3; i++) {
 4d0:	b8 e8 03 00 00       	mov    $0x3e8,%eax
 4d5:	8d 76 00             	lea    0x0(%esi),%esi
				asm("nop"); }}
 4d8:	90                   	nop
			for(k=0;k<1000;k++) {
 4d9:	83 e8 01             	sub    $0x1,%eax
 4dc:	75 fa                	jne    4d8 <PScheduler+0xd8>
		for (j=0;j<50000;j++) {
 4de:	83 ea 01             	sub    $0x1,%edx
 4e1:	75 ed                	jne    4d0 <PScheduler+0xd0>
		printf(1, "\n child# %d with priority %d has finished! \n",getpid(),30-10*i);		
 4e3:	e8 f2 02 00 00       	call   7da <getpid>
 4e8:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 4ec:	c7 44 24 04 00 0f 00 	movl   $0xf00,0x4(%esp)
 4f3:	00 
 4f4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4fb:	89 44 24 08          	mov    %eax,0x8(%esp)
 4ff:	e8 ac 03 00 00       	call   8b0 <printf>
		exit(0);
 504:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 50b:	e8 42 02 00 00       	call   752 <exit>
			printf(2," \n Error \n");
 510:	c7 44 24 04 2f 10 00 	movl   $0x102f,0x4(%esp)
 517:	00 
 518:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 51f:	e8 8c 03 00 00       	call   8b0 <printf>
			exit(-1);
 524:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 52b:	e8 22 02 00 00       	call   752 <exit>

00000530 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	8b 45 08             	mov    0x8(%ebp),%eax
 536:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 539:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 53a:	89 c2                	mov    %eax,%edx
 53c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 540:	83 c1 01             	add    $0x1,%ecx
 543:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 547:	83 c2 01             	add    $0x1,%edx
 54a:	84 db                	test   %bl,%bl
 54c:	88 5a ff             	mov    %bl,-0x1(%edx)
 54f:	75 ef                	jne    540 <strcpy+0x10>
    ;
  return os;
}
 551:	5b                   	pop    %ebx
 552:	5d                   	pop    %ebp
 553:	c3                   	ret    
 554:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 55a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000560 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	8b 55 08             	mov    0x8(%ebp),%edx
 566:	53                   	push   %ebx
 567:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 56a:	0f b6 02             	movzbl (%edx),%eax
 56d:	84 c0                	test   %al,%al
 56f:	74 2d                	je     59e <strcmp+0x3e>
 571:	0f b6 19             	movzbl (%ecx),%ebx
 574:	38 d8                	cmp    %bl,%al
 576:	74 0e                	je     586 <strcmp+0x26>
 578:	eb 2b                	jmp    5a5 <strcmp+0x45>
 57a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 580:	38 c8                	cmp    %cl,%al
 582:	75 15                	jne    599 <strcmp+0x39>
    p++, q++;
 584:	89 d9                	mov    %ebx,%ecx
 586:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 589:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 58c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 58f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 593:	84 c0                	test   %al,%al
 595:	75 e9                	jne    580 <strcmp+0x20>
 597:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 599:	29 c8                	sub    %ecx,%eax
}
 59b:	5b                   	pop    %ebx
 59c:	5d                   	pop    %ebp
 59d:	c3                   	ret    
 59e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 5a1:	31 c0                	xor    %eax,%eax
 5a3:	eb f4                	jmp    599 <strcmp+0x39>
 5a5:	0f b6 cb             	movzbl %bl,%ecx
 5a8:	eb ef                	jmp    599 <strcmp+0x39>
 5aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000005b0 <strlen>:

uint
strlen(const char *s)
{
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 5b6:	80 39 00             	cmpb   $0x0,(%ecx)
 5b9:	74 12                	je     5cd <strlen+0x1d>
 5bb:	31 d2                	xor    %edx,%edx
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
 5c0:	83 c2 01             	add    $0x1,%edx
 5c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 5c7:	89 d0                	mov    %edx,%eax
 5c9:	75 f5                	jne    5c0 <strlen+0x10>
    ;
  return n;
}
 5cb:	5d                   	pop    %ebp
 5cc:	c3                   	ret    
  for(n = 0; s[n]; n++)
 5cd:	31 c0                	xor    %eax,%eax
}
 5cf:	5d                   	pop    %ebp
 5d0:	c3                   	ret    
 5d1:	eb 0d                	jmp    5e0 <memset>
 5d3:	90                   	nop
 5d4:	90                   	nop
 5d5:	90                   	nop
 5d6:	90                   	nop
 5d7:	90                   	nop
 5d8:	90                   	nop
 5d9:	90                   	nop
 5da:	90                   	nop
 5db:	90                   	nop
 5dc:	90                   	nop
 5dd:	90                   	nop
 5de:	90                   	nop
 5df:	90                   	nop

000005e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	8b 55 08             	mov    0x8(%ebp),%edx
 5e6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 5e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 5ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 5ed:	89 d7                	mov    %edx,%edi
 5ef:	fc                   	cld    
 5f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 5f2:	89 d0                	mov    %edx,%eax
 5f4:	5f                   	pop    %edi
 5f5:	5d                   	pop    %ebp
 5f6:	c3                   	ret    
 5f7:	89 f6                	mov    %esi,%esi
 5f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000600 <strchr>:

char*
strchr(const char *s, char c)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	8b 45 08             	mov    0x8(%ebp),%eax
 606:	53                   	push   %ebx
 607:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 60a:	0f b6 18             	movzbl (%eax),%ebx
 60d:	84 db                	test   %bl,%bl
 60f:	74 1d                	je     62e <strchr+0x2e>
    if(*s == c)
 611:	38 d3                	cmp    %dl,%bl
 613:	89 d1                	mov    %edx,%ecx
 615:	75 0d                	jne    624 <strchr+0x24>
 617:	eb 17                	jmp    630 <strchr+0x30>
 619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 620:	38 ca                	cmp    %cl,%dl
 622:	74 0c                	je     630 <strchr+0x30>
  for(; *s; s++)
 624:	83 c0 01             	add    $0x1,%eax
 627:	0f b6 10             	movzbl (%eax),%edx
 62a:	84 d2                	test   %dl,%dl
 62c:	75 f2                	jne    620 <strchr+0x20>
      return (char*)s;
  return 0;
 62e:	31 c0                	xor    %eax,%eax
}
 630:	5b                   	pop    %ebx
 631:	5d                   	pop    %ebp
 632:	c3                   	ret    
 633:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000640 <gets>:

char*
gets(char *buf, int max)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	57                   	push   %edi
 644:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 645:	31 f6                	xor    %esi,%esi
{
 647:	53                   	push   %ebx
 648:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 64b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 64e:	eb 31                	jmp    681 <gets+0x41>
    cc = read(0, &c, 1);
 650:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 657:	00 
 658:	89 7c 24 04          	mov    %edi,0x4(%esp)
 65c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 663:	e8 0a 01 00 00       	call   772 <read>
    if(cc < 1)
 668:	85 c0                	test   %eax,%eax
 66a:	7e 1d                	jle    689 <gets+0x49>
      break;
    buf[i++] = c;
 66c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 670:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 672:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 675:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 677:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 67b:	74 0c                	je     689 <gets+0x49>
 67d:	3c 0a                	cmp    $0xa,%al
 67f:	74 08                	je     689 <gets+0x49>
  for(i=0; i+1 < max; ){
 681:	8d 5e 01             	lea    0x1(%esi),%ebx
 684:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 687:	7c c7                	jl     650 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 689:	8b 45 08             	mov    0x8(%ebp),%eax
 68c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 690:	83 c4 2c             	add    $0x2c,%esp
 693:	5b                   	pop    %ebx
 694:	5e                   	pop    %esi
 695:	5f                   	pop    %edi
 696:	5d                   	pop    %ebp
 697:	c3                   	ret    
 698:	90                   	nop
 699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006a0 <stat>:

int
stat(const char *n, struct stat *st)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	56                   	push   %esi
 6a4:	53                   	push   %ebx
 6a5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 6a8:	8b 45 08             	mov    0x8(%ebp),%eax
 6ab:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 6b2:	00 
 6b3:	89 04 24             	mov    %eax,(%esp)
 6b6:	e8 df 00 00 00       	call   79a <open>
  if(fd < 0)
 6bb:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 6bd:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 6bf:	78 27                	js     6e8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 6c1:	8b 45 0c             	mov    0xc(%ebp),%eax
 6c4:	89 1c 24             	mov    %ebx,(%esp)
 6c7:	89 44 24 04          	mov    %eax,0x4(%esp)
 6cb:	e8 e2 00 00 00       	call   7b2 <fstat>
  close(fd);
 6d0:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 6d3:	89 c6                	mov    %eax,%esi
  close(fd);
 6d5:	e8 a8 00 00 00       	call   782 <close>
  return r;
 6da:	89 f0                	mov    %esi,%eax
}
 6dc:	83 c4 10             	add    $0x10,%esp
 6df:	5b                   	pop    %ebx
 6e0:	5e                   	pop    %esi
 6e1:	5d                   	pop    %ebp
 6e2:	c3                   	ret    
 6e3:	90                   	nop
 6e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 6e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 6ed:	eb ed                	jmp    6dc <stat+0x3c>
 6ef:	90                   	nop

000006f0 <atoi>:

int
atoi(const char *s)
{
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 6f6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 6f7:	0f be 11             	movsbl (%ecx),%edx
 6fa:	8d 42 d0             	lea    -0x30(%edx),%eax
 6fd:	3c 09                	cmp    $0x9,%al
  n = 0;
 6ff:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 704:	77 17                	ja     71d <atoi+0x2d>
 706:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 708:	83 c1 01             	add    $0x1,%ecx
 70b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 70e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 712:	0f be 11             	movsbl (%ecx),%edx
 715:	8d 5a d0             	lea    -0x30(%edx),%ebx
 718:	80 fb 09             	cmp    $0x9,%bl
 71b:	76 eb                	jbe    708 <atoi+0x18>
  return n;
}
 71d:	5b                   	pop    %ebx
 71e:	5d                   	pop    %ebp
 71f:	c3                   	ret    

00000720 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 720:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 721:	31 d2                	xor    %edx,%edx
{
 723:	89 e5                	mov    %esp,%ebp
 725:	56                   	push   %esi
 726:	8b 45 08             	mov    0x8(%ebp),%eax
 729:	53                   	push   %ebx
 72a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 72d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 730:	85 db                	test   %ebx,%ebx
 732:	7e 12                	jle    746 <memmove+0x26>
 734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 738:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 73c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 73f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 742:	39 da                	cmp    %ebx,%edx
 744:	75 f2                	jne    738 <memmove+0x18>
  return vdst;
}
 746:	5b                   	pop    %ebx
 747:	5e                   	pop    %esi
 748:	5d                   	pop    %ebp
 749:	c3                   	ret    

0000074a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 74a:	b8 01 00 00 00       	mov    $0x1,%eax
 74f:	cd 40                	int    $0x40
 751:	c3                   	ret    

00000752 <exit>:
SYSCALL(exit)
 752:	b8 02 00 00 00       	mov    $0x2,%eax
 757:	cd 40                	int    $0x40
 759:	c3                   	ret    

0000075a <wait>:
SYSCALL(wait)
 75a:	b8 03 00 00 00       	mov    $0x3,%eax
 75f:	cd 40                	int    $0x40
 761:	c3                   	ret    

00000762 <waitpid>:
SYSCALL(waitpid)
 762:	b8 16 00 00 00       	mov    $0x16,%eax
 767:	cd 40                	int    $0x40
 769:	c3                   	ret    

0000076a <pipe>:
SYSCALL(pipe)
 76a:	b8 04 00 00 00       	mov    $0x4,%eax
 76f:	cd 40                	int    $0x40
 771:	c3                   	ret    

00000772 <read>:
SYSCALL(read)
 772:	b8 05 00 00 00       	mov    $0x5,%eax
 777:	cd 40                	int    $0x40
 779:	c3                   	ret    

0000077a <write>:
SYSCALL(write)
 77a:	b8 10 00 00 00       	mov    $0x10,%eax
 77f:	cd 40                	int    $0x40
 781:	c3                   	ret    

00000782 <close>:
SYSCALL(close)
 782:	b8 15 00 00 00       	mov    $0x15,%eax
 787:	cd 40                	int    $0x40
 789:	c3                   	ret    

0000078a <kill>:
SYSCALL(kill)
 78a:	b8 06 00 00 00       	mov    $0x6,%eax
 78f:	cd 40                	int    $0x40
 791:	c3                   	ret    

00000792 <exec>:
SYSCALL(exec)
 792:	b8 07 00 00 00       	mov    $0x7,%eax
 797:	cd 40                	int    $0x40
 799:	c3                   	ret    

0000079a <open>:
SYSCALL(open)
 79a:	b8 0f 00 00 00       	mov    $0xf,%eax
 79f:	cd 40                	int    $0x40
 7a1:	c3                   	ret    

000007a2 <mknod>:
SYSCALL(mknod)
 7a2:	b8 11 00 00 00       	mov    $0x11,%eax
 7a7:	cd 40                	int    $0x40
 7a9:	c3                   	ret    

000007aa <unlink>:
SYSCALL(unlink)
 7aa:	b8 12 00 00 00       	mov    $0x12,%eax
 7af:	cd 40                	int    $0x40
 7b1:	c3                   	ret    

000007b2 <fstat>:
SYSCALL(fstat)
 7b2:	b8 08 00 00 00       	mov    $0x8,%eax
 7b7:	cd 40                	int    $0x40
 7b9:	c3                   	ret    

000007ba <link>:
SYSCALL(link)
 7ba:	b8 13 00 00 00       	mov    $0x13,%eax
 7bf:	cd 40                	int    $0x40
 7c1:	c3                   	ret    

000007c2 <mkdir>:
SYSCALL(mkdir)
 7c2:	b8 14 00 00 00       	mov    $0x14,%eax
 7c7:	cd 40                	int    $0x40
 7c9:	c3                   	ret    

000007ca <chdir>:
SYSCALL(chdir)
 7ca:	b8 09 00 00 00       	mov    $0x9,%eax
 7cf:	cd 40                	int    $0x40
 7d1:	c3                   	ret    

000007d2 <dup>:
SYSCALL(dup)
 7d2:	b8 0a 00 00 00       	mov    $0xa,%eax
 7d7:	cd 40                	int    $0x40
 7d9:	c3                   	ret    

000007da <getpid>:
SYSCALL(getpid)
 7da:	b8 0b 00 00 00       	mov    $0xb,%eax
 7df:	cd 40                	int    $0x40
 7e1:	c3                   	ret    

000007e2 <sbrk>:
SYSCALL(sbrk)
 7e2:	b8 0c 00 00 00       	mov    $0xc,%eax
 7e7:	cd 40                	int    $0x40
 7e9:	c3                   	ret    

000007ea <sleep>:
SYSCALL(sleep)
 7ea:	b8 0d 00 00 00       	mov    $0xd,%eax
 7ef:	cd 40                	int    $0x40
 7f1:	c3                   	ret    

000007f2 <uptime>:
SYSCALL(uptime)
 7f2:	b8 0e 00 00 00       	mov    $0xe,%eax
 7f7:	cd 40                	int    $0x40
 7f9:	c3                   	ret    

000007fa <setpriority>:
SYSCALL(setpriority)
 7fa:	b8 17 00 00 00       	mov    $0x17,%eax
 7ff:	cd 40                	int    $0x40
 801:	c3                   	ret    
 802:	66 90                	xchg   %ax,%ax
 804:	66 90                	xchg   %ax,%ax
 806:	66 90                	xchg   %ax,%ax
 808:	66 90                	xchg   %ax,%ax
 80a:	66 90                	xchg   %ax,%ax
 80c:	66 90                	xchg   %ax,%ax
 80e:	66 90                	xchg   %ax,%ax

00000810 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 810:	55                   	push   %ebp
 811:	89 e5                	mov    %esp,%ebp
 813:	57                   	push   %edi
 814:	56                   	push   %esi
 815:	89 c6                	mov    %eax,%esi
 817:	53                   	push   %ebx
 818:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 81b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 81e:	85 db                	test   %ebx,%ebx
 820:	74 09                	je     82b <printint+0x1b>
 822:	89 d0                	mov    %edx,%eax
 824:	c1 e8 1f             	shr    $0x1f,%eax
 827:	84 c0                	test   %al,%al
 829:	75 75                	jne    8a0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 82b:	89 d0                	mov    %edx,%eax
  neg = 0;
 82d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 834:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 837:	31 ff                	xor    %edi,%edi
 839:	89 ce                	mov    %ecx,%esi
 83b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 83e:	eb 02                	jmp    842 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 840:	89 cf                	mov    %ecx,%edi
 842:	31 d2                	xor    %edx,%edx
 844:	f7 f6                	div    %esi
 846:	8d 4f 01             	lea    0x1(%edi),%ecx
 849:	0f b6 92 41 10 00 00 	movzbl 0x1041(%edx),%edx
  }while((x /= base) != 0);
 850:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 852:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 855:	75 e9                	jne    840 <printint+0x30>
  if(neg)
 857:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 85a:	89 c8                	mov    %ecx,%eax
 85c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 85f:	85 d2                	test   %edx,%edx
 861:	74 08                	je     86b <printint+0x5b>
    buf[i++] = '-';
 863:	8d 4f 02             	lea    0x2(%edi),%ecx
 866:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 86b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 86e:	66 90                	xchg   %ax,%ax
 870:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 875:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 878:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 87f:	00 
 880:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 884:	89 34 24             	mov    %esi,(%esp)
 887:	88 45 d7             	mov    %al,-0x29(%ebp)
 88a:	e8 eb fe ff ff       	call   77a <write>
  while(--i >= 0)
 88f:	83 ff ff             	cmp    $0xffffffff,%edi
 892:	75 dc                	jne    870 <printint+0x60>
    putc(fd, buf[i]);
}
 894:	83 c4 4c             	add    $0x4c,%esp
 897:	5b                   	pop    %ebx
 898:	5e                   	pop    %esi
 899:	5f                   	pop    %edi
 89a:	5d                   	pop    %ebp
 89b:	c3                   	ret    
 89c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 8a0:	89 d0                	mov    %edx,%eax
 8a2:	f7 d8                	neg    %eax
    neg = 1;
 8a4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 8ab:	eb 87                	jmp    834 <printint+0x24>
 8ad:	8d 76 00             	lea    0x0(%esi),%esi

000008b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 8b0:	55                   	push   %ebp
 8b1:	89 e5                	mov    %esp,%ebp
 8b3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 8b4:	31 ff                	xor    %edi,%edi
{
 8b6:	56                   	push   %esi
 8b7:	53                   	push   %ebx
 8b8:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8bb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 8be:	8d 45 10             	lea    0x10(%ebp),%eax
{
 8c1:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 8c4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 8c7:	0f b6 13             	movzbl (%ebx),%edx
 8ca:	83 c3 01             	add    $0x1,%ebx
 8cd:	84 d2                	test   %dl,%dl
 8cf:	75 39                	jne    90a <printf+0x5a>
 8d1:	e9 c2 00 00 00       	jmp    998 <printf+0xe8>
 8d6:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 8d8:	83 fa 25             	cmp    $0x25,%edx
 8db:	0f 84 bf 00 00 00    	je     9a0 <printf+0xf0>
  write(fd, &c, 1);
 8e1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 8e4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 8eb:	00 
 8ec:	89 44 24 04          	mov    %eax,0x4(%esp)
 8f0:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 8f3:	88 55 e2             	mov    %dl,-0x1e(%ebp)
  write(fd, &c, 1);
 8f6:	e8 7f fe ff ff       	call   77a <write>
 8fb:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 8fe:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 902:	84 d2                	test   %dl,%dl
 904:	0f 84 8e 00 00 00    	je     998 <printf+0xe8>
    if(state == 0){
 90a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 90c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 90f:	74 c7                	je     8d8 <printf+0x28>
      }
    } else if(state == '%'){
 911:	83 ff 25             	cmp    $0x25,%edi
 914:	75 e5                	jne    8fb <printf+0x4b>
      if(c == 'd'){
 916:	83 fa 64             	cmp    $0x64,%edx
 919:	0f 84 31 01 00 00    	je     a50 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 91f:	25 f7 00 00 00       	and    $0xf7,%eax
 924:	83 f8 70             	cmp    $0x70,%eax
 927:	0f 84 83 00 00 00    	je     9b0 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 92d:	83 fa 73             	cmp    $0x73,%edx
 930:	0f 84 a2 00 00 00    	je     9d8 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 936:	83 fa 63             	cmp    $0x63,%edx
 939:	0f 84 35 01 00 00    	je     a74 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 93f:	83 fa 25             	cmp    $0x25,%edx
 942:	0f 84 e0 00 00 00    	je     a28 <printf+0x178>
  write(fd, &c, 1);
 948:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 94b:	83 c3 01             	add    $0x1,%ebx
 94e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 955:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 956:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 958:	89 44 24 04          	mov    %eax,0x4(%esp)
 95c:	89 34 24             	mov    %esi,(%esp)
 95f:	89 55 d0             	mov    %edx,-0x30(%ebp)
 962:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 966:	e8 0f fe ff ff       	call   77a <write>
        putc(fd, c);
 96b:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 96e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 971:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 978:	00 
 979:	89 44 24 04          	mov    %eax,0x4(%esp)
 97d:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 980:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 983:	e8 f2 fd ff ff       	call   77a <write>
  for(i = 0; fmt[i]; i++){
 988:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 98c:	84 d2                	test   %dl,%dl
 98e:	0f 85 76 ff ff ff    	jne    90a <printf+0x5a>
 994:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
}
 998:	83 c4 3c             	add    $0x3c,%esp
 99b:	5b                   	pop    %ebx
 99c:	5e                   	pop    %esi
 99d:	5f                   	pop    %edi
 99e:	5d                   	pop    %ebp
 99f:	c3                   	ret    
        state = '%';
 9a0:	bf 25 00 00 00       	mov    $0x25,%edi
 9a5:	e9 51 ff ff ff       	jmp    8fb <printf+0x4b>
 9aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 9b0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 9b3:	b9 10 00 00 00       	mov    $0x10,%ecx
      state = 0;
 9b8:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 9ba:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 9c1:	8b 10                	mov    (%eax),%edx
 9c3:	89 f0                	mov    %esi,%eax
 9c5:	e8 46 fe ff ff       	call   810 <printint>
        ap++;
 9ca:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 9ce:	e9 28 ff ff ff       	jmp    8fb <printf+0x4b>
 9d3:	90                   	nop
 9d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 9d8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 9db:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 9df:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 9e1:	b8 3a 10 00 00       	mov    $0x103a,%eax
 9e6:	85 ff                	test   %edi,%edi
 9e8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 9eb:	0f b6 07             	movzbl (%edi),%eax
 9ee:	84 c0                	test   %al,%al
 9f0:	74 2a                	je     a1c <printf+0x16c>
 9f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 9f8:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 9fb:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 9fe:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 a01:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 a08:	00 
 a09:	89 44 24 04          	mov    %eax,0x4(%esp)
 a0d:	89 34 24             	mov    %esi,(%esp)
 a10:	e8 65 fd ff ff       	call   77a <write>
        while(*s != 0){
 a15:	0f b6 07             	movzbl (%edi),%eax
 a18:	84 c0                	test   %al,%al
 a1a:	75 dc                	jne    9f8 <printf+0x148>
      state = 0;
 a1c:	31 ff                	xor    %edi,%edi
 a1e:	e9 d8 fe ff ff       	jmp    8fb <printf+0x4b>
 a23:	90                   	nop
 a24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 a28:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 a2b:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 a2d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 a34:	00 
 a35:	89 44 24 04          	mov    %eax,0x4(%esp)
 a39:	89 34 24             	mov    %esi,(%esp)
 a3c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 a40:	e8 35 fd ff ff       	call   77a <write>
 a45:	e9 b1 fe ff ff       	jmp    8fb <printf+0x4b>
 a4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 a50:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 a53:	b9 0a 00 00 00       	mov    $0xa,%ecx
      state = 0;
 a58:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
 a5b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a62:	8b 10                	mov    (%eax),%edx
 a64:	89 f0                	mov    %esi,%eax
 a66:	e8 a5 fd ff ff       	call   810 <printint>
        ap++;
 a6b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 a6f:	e9 87 fe ff ff       	jmp    8fb <printf+0x4b>
        putc(fd, *ap);
 a74:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 a77:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 a79:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 a7b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 a82:	00 
 a83:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 a86:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 a89:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 a8c:	89 44 24 04          	mov    %eax,0x4(%esp)
 a90:	e8 e5 fc ff ff       	call   77a <write>
        ap++;
 a95:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 a99:	e9 5d fe ff ff       	jmp    8fb <printf+0x4b>
 a9e:	66 90                	xchg   %ax,%ax

00000aa0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 aa0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 aa1:	a1 38 13 00 00       	mov    0x1338,%eax
{
 aa6:	89 e5                	mov    %esp,%ebp
 aa8:	57                   	push   %edi
 aa9:	56                   	push   %esi
 aaa:	53                   	push   %ebx
 aab:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 aae:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 ab0:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ab3:	39 d0                	cmp    %edx,%eax
 ab5:	72 11                	jb     ac8 <free+0x28>
 ab7:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ab8:	39 c8                	cmp    %ecx,%eax
 aba:	72 04                	jb     ac0 <free+0x20>
 abc:	39 ca                	cmp    %ecx,%edx
 abe:	72 10                	jb     ad0 <free+0x30>
 ac0:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ac2:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ac4:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ac6:	73 f0                	jae    ab8 <free+0x18>
 ac8:	39 ca                	cmp    %ecx,%edx
 aca:	72 04                	jb     ad0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 acc:	39 c8                	cmp    %ecx,%eax
 ace:	72 f0                	jb     ac0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 ad0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 ad3:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 ad6:	39 cf                	cmp    %ecx,%edi
 ad8:	74 1e                	je     af8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 ada:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 add:	8b 48 04             	mov    0x4(%eax),%ecx
 ae0:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 ae3:	39 f2                	cmp    %esi,%edx
 ae5:	74 28                	je     b0f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 ae7:	89 10                	mov    %edx,(%eax)
  freep = p;
 ae9:	a3 38 13 00 00       	mov    %eax,0x1338
}
 aee:	5b                   	pop    %ebx
 aef:	5e                   	pop    %esi
 af0:	5f                   	pop    %edi
 af1:	5d                   	pop    %ebp
 af2:	c3                   	ret    
 af3:	90                   	nop
 af4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 af8:	03 71 04             	add    0x4(%ecx),%esi
 afb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 afe:	8b 08                	mov    (%eax),%ecx
 b00:	8b 09                	mov    (%ecx),%ecx
 b02:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b05:	8b 48 04             	mov    0x4(%eax),%ecx
 b08:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 b0b:	39 f2                	cmp    %esi,%edx
 b0d:	75 d8                	jne    ae7 <free+0x47>
    p->s.size += bp->s.size;
 b0f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 b12:	a3 38 13 00 00       	mov    %eax,0x1338
    p->s.size += bp->s.size;
 b17:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 b1a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 b1d:	89 10                	mov    %edx,(%eax)
}
 b1f:	5b                   	pop    %ebx
 b20:	5e                   	pop    %esi
 b21:	5f                   	pop    %edi
 b22:	5d                   	pop    %ebp
 b23:	c3                   	ret    
 b24:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 b2a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000b30 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b30:	55                   	push   %ebp
 b31:	89 e5                	mov    %esp,%ebp
 b33:	57                   	push   %edi
 b34:	56                   	push   %esi
 b35:	53                   	push   %ebx
 b36:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b39:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 b3c:	8b 1d 38 13 00 00    	mov    0x1338,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b42:	8d 48 07             	lea    0x7(%eax),%ecx
 b45:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 b48:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b4a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 b4d:	0f 84 9b 00 00 00    	je     bee <malloc+0xbe>
 b53:	8b 13                	mov    (%ebx),%edx
 b55:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 b58:	39 fe                	cmp    %edi,%esi
 b5a:	76 64                	jbe    bc0 <malloc+0x90>
 b5c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 b63:	bb 00 80 00 00       	mov    $0x8000,%ebx
 b68:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 b6b:	eb 0e                	jmp    b7b <malloc+0x4b>
 b6d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b70:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 b72:	8b 78 04             	mov    0x4(%eax),%edi
 b75:	39 fe                	cmp    %edi,%esi
 b77:	76 4f                	jbe    bc8 <malloc+0x98>
 b79:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b7b:	3b 15 38 13 00 00    	cmp    0x1338,%edx
 b81:	75 ed                	jne    b70 <malloc+0x40>
  if(nu < 4096)
 b83:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 b86:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 b8c:	bf 00 10 00 00       	mov    $0x1000,%edi
 b91:	0f 43 fe             	cmovae %esi,%edi
 b94:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 b97:	89 04 24             	mov    %eax,(%esp)
 b9a:	e8 43 fc ff ff       	call   7e2 <sbrk>
  if(p == (char*)-1)
 b9f:	83 f8 ff             	cmp    $0xffffffff,%eax
 ba2:	74 18                	je     bbc <malloc+0x8c>
  hp->s.size = nu;
 ba4:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 ba7:	83 c0 08             	add    $0x8,%eax
 baa:	89 04 24             	mov    %eax,(%esp)
 bad:	e8 ee fe ff ff       	call   aa0 <free>
  return freep;
 bb2:	8b 15 38 13 00 00    	mov    0x1338,%edx
      if((p = morecore(nunits)) == 0)
 bb8:	85 d2                	test   %edx,%edx
 bba:	75 b4                	jne    b70 <malloc+0x40>
        return 0;
 bbc:	31 c0                	xor    %eax,%eax
 bbe:	eb 20                	jmp    be0 <malloc+0xb0>
    if(p->s.size >= nunits){
 bc0:	89 d0                	mov    %edx,%eax
 bc2:	89 da                	mov    %ebx,%edx
 bc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 bc8:	39 fe                	cmp    %edi,%esi
 bca:	74 1c                	je     be8 <malloc+0xb8>
        p->s.size -= nunits;
 bcc:	29 f7                	sub    %esi,%edi
 bce:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 bd1:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 bd4:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 bd7:	89 15 38 13 00 00    	mov    %edx,0x1338
      return (void*)(p + 1);
 bdd:	83 c0 08             	add    $0x8,%eax
  }
}
 be0:	83 c4 1c             	add    $0x1c,%esp
 be3:	5b                   	pop    %ebx
 be4:	5e                   	pop    %esi
 be5:	5f                   	pop    %edi
 be6:	5d                   	pop    %ebp
 be7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 be8:	8b 08                	mov    (%eax),%ecx
 bea:	89 0a                	mov    %ecx,(%edx)
 bec:	eb e9                	jmp    bd7 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 bee:	c7 05 38 13 00 00 3c 	movl   $0x133c,0x1338
 bf5:	13 00 00 
    base.s.size = 0;
 bf8:	ba 3c 13 00 00       	mov    $0x133c,%edx
    base.s.ptr = freep = prevp = &base;
 bfd:	c7 05 3c 13 00 00 3c 	movl   $0x133c,0x133c
 c04:	13 00 00 
    base.s.size = 0;
 c07:	c7 05 40 13 00 00 00 	movl   $0x0,0x1340
 c0e:	00 00 00 
 c11:	e9 46 ff ff ff       	jmp    b5c <malloc+0x2c>
