From: khilman@baylibre.com (Kevin Hilman)
Date: Wed, 07 Sep 2016 14:06:35 -0700
Subject: RFC: RTC v5
In-Reply-To: <20160822221501.21945-1-ben-linux@fluff.org> (Ben Dooks's message
 of "Mon, 22 Aug 2016 23:14:56 +0100")
References: <20160822221501.21945-1-ben-linux@fluff.org>
Message-ID: <7hoa3zs9lw.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Ben Dooks <ben-linux@fluff.org> writes:

> I've reworked the rtc patches, but have no way of testing them
> until I get back from "holiday". Is anyone able to test so that
> they can be submitted?
>
> git at github.com:bendooks/amlogic-kenel.git bjdooks/v48-rc3/rtc-v5 

Just gave it a quick test on meson8b-odroidc1. Something's not right,
but didn't debug further:

/ # ./rtctest

                        RTC Driver Test Example.


...Update IRQs not supported.


Current RTC date/time is 7-9-2016, 21:05:06.
RTC_ALM_READ ioctl: Invalid argument


Kevin
