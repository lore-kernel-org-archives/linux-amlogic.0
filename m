From: ben.dooks@codethink.co.uk (Ben Dooks)
Date: Mon, 27 Jun 2016 20:49:28 +0100
Subject: RTC support for AMlogic devies
In-Reply-To: <m2bn2mtut1.fsf@baylibre.com>
References: <1467039135-26588-1-git-send-email-ben.dooks@codethink.co.uk>
 <m2bn2mtut1.fsf@baylibre.com>
Message-ID: <70b8eaf9-b07c-8a56-8205-58bf6475a3f4@codethink.co.uk>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 27/06/16 18:18, Kevin Hilman wrote:
> Ben Dooks <ben.dooks@codethink.co.uk> writes:
> 
>> This series is support for the RTC block on some of the AMLogic
>> Meson ARM SoCs.
>>
>> The first patch is the driver, followed by device-tree patches
>> and enablement for the ODRoid-C1 (where it has been tested)
> 
> In the cover letter, please be explicit about any dependencies that are
> not upstream.  This series applies to mainline (v4.7-rc*) but does not
> build.  I tested it with my v4.7/integ branch and it seems to work.

I think this is just the DT bindings for the reset controller which
are currently in -next.

> The series also has a handful of checkpatch warnings that should be
> addressed (see: http://hastebin.com/tacurokasu.pas)

The msleep() ones I think are not a big isuse. The line length could
be solved, but at the moment is one of the few issues that are in the
rtc-meson.c driver.

The documentation one is solved by the patch adding the device-tree
binding information.

> Other than that, I gave it a quick spin on meson8b-odroidc1 using
> tools/testing/selftests/timers/rtctest.c, and the basic time stuff seems
> to be working:

Thank you.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
