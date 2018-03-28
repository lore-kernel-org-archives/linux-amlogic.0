From: khilman@baylibre.com (Kevin Hilman)
Date: Tue, 27 Mar 2018 17:10:02 -0700
Subject: [PATCH] ARM64: dts: meson: reduce odroid-c2 eMMC maximum rate
In-Reply-To: <20180327062714.GB28908@kroah.com> (Greg KH's message of "Tue, 27
 Mar 2018 08:27:14 +0200")
References: <20180302134436.18844-1-jbrunet@baylibre.com>
 <CAOi56cUO_sPYb+t2g1GmSEULu5aGA8cKqa2Yan2=T0YCYGOmSA@mail.gmail.com>
 <20180327062714.GB28908@kroah.com>
Message-ID: <7htvt1oyat.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Greg KH <gregkh@linuxfoundation.org> writes:

> On Mon, Mar 26, 2018 at 01:23:44PM -0700, Kevin Hilman wrote:
>> On Fri, Mar 2, 2018 at 5:44 AM, Jerome Brunet <jbrunet@baylibre.com> wrote:
>> > Different modules maybe installed by the user on the eMMC connector
>> > of the odroid-c2. While the red modules are working without an issue,
>> > it seems some black modules (apparently Samsung based) are having
>> > issue at 200MHz
>> >
>> > While the tuning algorithm introduced in v4.14 enables high speed modes
>> > on every other tested designs, it seems a problem remains for this
>> > particular combination of board and eMMC module.
>> >
>> > Lowering the maximum frequency of the eMMC on this board until we can
>> > figure out a better solution.
>> >
>> > Fixes: d341ca88eead ("mmc: meson-gx: rework tuning function")
>> > Suggested-by: Ellie Reeves <ellierevves@gmail.com>
>> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> 
>> Now in mainline as commit c04ffa71ff49 upstream.
>
> Really?  I do not see it in Linus's tree, are you sure about that?
>
> $ git show c04ffa71ff49
> fatal: ambiguous argument 'c04ffa71ff49': unknown revision or path not in the working tree.

Oops, you're right.  It's still in arm-soc, not yet in mainline.  Sorry
for the noise.

Kevin
