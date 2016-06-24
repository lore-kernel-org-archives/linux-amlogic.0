From: ben.dooks@codethink.co.uk (Ben Dooks)
Date: Fri, 24 Jun 2016 18:36:09 +0100
Subject: second round of rtc
Message-ID: <1466789773-1609-1-git-send-email-ben.dooks@codethink.co.uk>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This is the second RFC for the RTC support. I have
gone through and applied most of the suggested cleanups
and done a bit more tidying.

The driver has a couple of extra debug prints, and also
has a fixed rtc register write code (wrong order) so that
it can now set a time from hwclock.

This has been tested on the an ODroid-C1 with battery
connected to it.
