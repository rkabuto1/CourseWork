#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

int sys_fork(void)
{
  return fork();
}

int sys_exit(void)
{
  exit();
  return 0; // not reached
}

int sys_wait(void)
{
  return wait();
}

int sys_kill(void)
{
  int pid;

  if (argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int sys_getpid(void)
{
  return myproc()->pid;
}

int sys_sbrk(void)
{
  int addr;
  int n;

  if (argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if (growproc(n) < 0)
    return -1;
  return addr;
}

int sys_sleep(void)
{
  int n;
  uint ticks0;

  if (argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while (ticks - ticks0 < n)
  {
    if (myproc()->killed)
    {
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

// added ->
int sys_shutdown(void) 
{
  shutdown();
  return 0; 
}
int sys_shutdown2(void)
{
  char *msg;
  if (argstr(0, &msg) < 0)
    return -1;
  shutdown2(msg);
  return 0; 
}
int sys_exit2(void) 
{
  int x;
  struct proc *p = myproc();  
  if (argint(0, &x) < 0) 
    return -1;
  cprintf("exi2 system call invoked: The process -> %d is exiting with status integer -> %d\n", p->pid, x);
  exit(); 
  return 0; 
}

int sys_logmessage(void) //Extra-Credit
{
  char *msg;
  if (argstr(0, &msg) < 0)
    return -1;
  logmessage(msg);
  return 0;
}

