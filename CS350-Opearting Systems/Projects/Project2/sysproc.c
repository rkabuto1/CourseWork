#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "spinlock.h"

extern struct
{
  struct spinlock lock;
  struct proc proc[NPROC];
} ptable;

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

int sys_shutdown(void)
{
  /* Either of the following will work. Does not harm to put them together. */
  outw(0xB004, 0x0 | 0x2000); // working for old qemu
  outw(0x604, 0x0 | 0x2000);  // working for newer qemu

  return 0;
}

extern int sched_trace_enabled;
extern int sched_trace_counter;
int sys_enable_sched_trace(void)
{
  if (argint(0, &sched_trace_enabled) < 0)
  {
    cprintf("enable_sched_trace() failed!\n");
  }

  sched_trace_counter = 0;

  return 0;
}
// added ->
int sys_fork_winner(void)
{
  int winner;

  if (!argint(0, &winner))
  {
    if (winner == 1)
    {
      whose_winner = 1;
    }
    else
    {
      whose_winner = 0;
    }
  }
  return 0;
}
// added ->
int sys_set_sched(void)
{
  int scheduler;

  if (!argint(0, &scheduler))
  {
    if (scheduler == 1)
    {
      policy = 1;
    }
    else
    {
      policy = 0;
    }
  }
  return 0;
}
// added ->
int sys_tickets_owned(void)
{
  int pid;
  struct proc *p;
  if (argint(0, &pid) < 0)
  {
    cprintf("tickets_owned() failed!\n");
    return -1;
  }
  acquire(&ptable.lock);
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if (p->pid == pid)
    {
      release(&ptable.lock);
      return p->tickets;
    }
  }
  release(&ptable.lock);
  return 0;
}

// added ->
int sys_transfer_tickets(void)
{
  int pid;
  int tickets;
  struct proc *p;
  struct proc *curproc = myproc();

  if (argint(0, &pid) < 0 || argint(1, &tickets) < 0)
  {
    cprintf("transfer_tickets() failed!\n");
    return -1;
  }
  if (tickets < 0)
  {
    // cprintf("transfer_tickets() failed! tickets must be positive!\n");
    return -1;
  }
  if (tickets > curproc->tickets - 1)
  {

    return -2;
  }

  acquire(&ptable.lock);
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if (p->pid == pid)
    {
      p->tickets += tickets;
      curproc->tickets -= tickets;
      p->strides = (100 * 10) / p->tickets;
      curproc->strides = (100 * 10) / curproc->tickets;
      release(&ptable.lock);
      return curproc->tickets;
    }
  }
  release(&ptable.lock);
  return -3;
}