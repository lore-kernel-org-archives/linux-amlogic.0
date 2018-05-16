From: thierry.moreau@connotech.com (Thierry Moreau)
Date: Wed, 16 May 2018 19:47:53 +0000
Subject: Suggestion for better HDMI console support
Message-ID: <5AFC8AE9.1000104@connotech.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Dear kernel developers,

I experimented with Odroid C2 Linux installation and I wanted an HDMI 
display console. I succeeded but I needed a workaround which I report below.

My suggestion today is to implement the workaround logic inside the 
kernel, which should be (technically at least) easy for some of you.

I noticed that the serial console is often suggested as a highly 
recommended alternative for Amlogic SOC development. Maybe my suggestion 
would change this (making the HDMI console working out of the box).

The problem I experienced with the Odroid C2 hdmi console display 
output: for unknown reason, the kernel initializes the hdmi output in a 
blank screen state that is exited only if the kernel receives two 
requests: first to blank the (already blanked) screen and then to 
unblank the screen. This sequence happens if a connected keyboard is 
idle for 15 minutes and then touched by the user.

The workaround: I wrote a small C program that makes the two kernel 
requests without wait.

Here is a snapshot:

#include <sys/ioctl.h>
#include <linux/vt.h>
#include <linux/tiocl.h>

static int blank_code=TIOCL_BLANKSCREEN;
static int unblank_code=TIOCL_UNBLANKSCREEN;

int main(int argc, char *argv[])
{
   int td;
   td=open("/dev/tty0",O_RDWR|O_NOCTTY);
   if (td>=0) {
     ioctl(td,TIOCLINUX,&blank_code);
     ioctl(td,TIOCLINUX,&unblank_code);
   }
}

My kernel version is 3.16.56 as customized to Odroid C2 by Hardkernel.

"Hope it helps!"

- Thierry Moreau

P.S. I am chasing installation hints for the Amlogic closed source 
libraries for X.11 support in an otherwise plain vanilla Linux 
innstallation (headless and server working fine). Any suggestion as 
sources of info?
