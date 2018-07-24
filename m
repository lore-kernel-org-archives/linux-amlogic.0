From: khilman@baylibre.com (Kevin Hilman)
Date: Tue, 24 Jul 2018 17:49:13 -0500
Subject: [PATCH 0/2] fix clock controller register size on Meson8/Meson8b
In-Reply-To: <20180721190553.13940-1-martin.blumenstingl@googlemail.com>
 (Martin Blumenstingl's message of "Sat, 21 Jul 2018 21:05:51 +0200")
References: <20180721190553.13940-1-martin.blumenstingl@googlemail.com>
Message-ID: <7hsh482qs6.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> While working on some clock controller changes I found that the
> register size cannot be correct as it overlaps with the reset
> controller.
> Amlogic's GPL kernel sources confirm this, as well as a discussion
> I had (privately) with Yixun Lan a while ago:
>> I think 0x460 is too big, and we could narrow it down (to a small
>> size) but I haven't looked at the meson8 datasheet for what the
>> exact size of this
>
> The clock controller itself doesn't have a dedicated size because
> (just like on GXBB/GXL/GXM) the clock controller is part of a
> register area called "HHI". On GXBB this is 0x400 wide, which
> matches Meson8/Meson8b/Meson8m2 because the reset controller
> begins at CBUS + 0x4404 (0x4400 is some kind of version register),
> so "HHI" starting at 0x4000 and ending at 0x4400 sounds reasonable.

Agreed.

Applied to v4.19/dt.  Not sure if I'll get another PR out for the v4.19
merge window, but if not, I'll queue with fixes v4.19-rc.

Thanks for the fixes,

Kevin
