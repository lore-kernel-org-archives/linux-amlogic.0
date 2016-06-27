From: khilman@baylibre.com (Kevin Hilman)
Date: Mon, 27 Jun 2016 10:18:02 -0700
Subject: RTC support for AMlogic devies
In-Reply-To: <1467039135-26588-1-git-send-email-ben.dooks@codethink.co.uk>
 (Ben Dooks's message of "Mon, 27 Jun 2016 15:52:11 +0100")
References: <1467039135-26588-1-git-send-email-ben.dooks@codethink.co.uk>
Message-ID: <m2bn2mtut1.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Ben Dooks <ben.dooks@codethink.co.uk> writes:

> This series is support for the RTC block on some of the AMLogic
> Meson ARM SoCs.
>
> The first patch is the driver, followed by device-tree patches
> and enablement for the ODRoid-C1 (where it has been tested)

In the cover letter, please be explicit about any dependencies that are
not upstream.  This series applies to mainline (v4.7-rc*) but does not
build.  I tested it with my v4.7/integ branch and it seems to work.

The series also has a handful of checkpatch warnings that should be
addressed (see: http://hastebin.com/tacurokasu.pas)

Other than that, I gave it a quick spin on meson8b-odroidc1 using
tools/testing/selftests/timers/rtctest.c, and the basic time stuff seems
to be working:

/ # ./rtctest

                        RTC Driver Test Example.


...Update IRQs not supported.


Current RTC date/time is 27-6-2016, 00:01:41.
RTC_ALM_READ ioctl: Invalid argument
