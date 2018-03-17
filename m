From: linus.luessing@c0d3.blue (Linus =?utf-8?Q?L=C3=BCssing?=)
Date: Sat, 17 Mar 2018 18:11:25 +0100
Subject: [RFC PATCH] ARM: dts: meson8b-odroidc1: add microSD support
In-Reply-To: <CAFBinCDZCkrB2aWvjtwaF-DSa5Zs_gmDKei_+wB4g3nxau8kbg@mail.gmail.com>
References: <20180125042313.20927-1-linus.luessing@c0d3.blue>
 <CAFBinCA8eWBEqeJCM3La0sm1BvMNkKjbxfZ5GA2sEzXb4AN=8w@mail.gmail.com>
 <CAFBinCDZCkrB2aWvjtwaF-DSa5Zs_gmDKei_+wB4g3nxau8kbg@mail.gmail.com>
Message-ID: <20180317171125.GK2681@otheros>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Martin,

Sorry for the late reply.

On Mon, Mar 12, 2018 at 10:00:17PM +0100, Martin Blumenstingl wrote:
> >> Not sure whether this error message could potentially point to some
> >> error in the changes in here.
> > these errors may be a problem with the meson-mx-sdio (MMC) driver
> > can you please show the output of /sys/kernel/debug/mmc0/ios ?
> some users on IRC have successfully tested this patch (together with
> the two patches from my series which fix the GPIO handling)
> can you please re-send this patch so Kevin can queue it for the next
> development cycle?

Glad to hear! I also just retried it with a 4.16-rc5 kernel and
your latest fixes and microSD still works for me, too :-).

Regarding the error message, I can't reproduce it anymore. With
the 4.16-rc5 kernel I did not see it. Nevertheless, here's the
output of mmc/ios:

-----
$ cat /sys/kernel/debug/mmc0/ios
clock:		50000000 Hz
actual clock:	39843750 Hz
vdd:		21 (3.3 ~ 3.4 V)
bus mode:	2 (push-pull)
chip select:	0 (don't care)
power mode:	2 (on)
bus width:	2 (4 bits)
timing spec:	2 (sd high-speed)
signal voltage:	0 (3.30 V)
driver type:	0 (driver type B)
-----

Out of curiousity, is the "actual clock" supposed to be so
much lower than "clock"?

Anyway, will resend the patch without the "RFC" now.

Regards, Linus
