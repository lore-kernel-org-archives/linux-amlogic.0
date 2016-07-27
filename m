From: caldwell_joshua@yahoo.ca (Joshua Caldwell)
Date: Wed, 27 Jul 2016 21:34:34 +0000 (UTC)
Subject: Fun with the M8S+ S812 box, and boy is this listserv picky about
 headers.
References: <1491292432.6724636.1469655274480.JavaMail.yahoo.ref@mail.yahoo.com>
Message-ID: <1491292432.6724636.1469655274480.JavaMail.yahoo@mail.yahoo.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi guys. I just bought an M8S+ box for a few bucks to see whether the S812 SoC is any good for a project I'm working on. I soldered on a serial header and have been playing with the recovery.img that comes with the OpenELEC build for it. I extracted the .dtb for the device, and tried a build of 4.6.4 for the thing. Serial console wasn't happy, so no joy there.

The eventual goal is to turn the thing into an x terminal and run tests at 2160p.

Any tips on building for the S812? I've never built for ARM before. I've been able to get init started off of an SD card on the thing, but systemd is a pain.... It wants modules the prebuilt image doesn't have. I won't go into the whole thing.

If there is a better Amlogic chip for UHD/4k applications, I'd like to know about it :) If anybody wants an account to play around with this thing on one of my servers with serial console, I'm up for it.

TL;DR How do I build a regular linux-style kernel+ramfs with the amlogic supplied or stock source for this board?

TIA,

Joshua
