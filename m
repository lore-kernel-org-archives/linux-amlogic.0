From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 21 Jul 2018 21:05:51 +0200
Subject: [PATCH 0/2] fix clock controller register size on Meson8/Meson8b
Message-ID: <20180721190553.13940-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

While working on some clock controller changes I found that the
register size cannot be correct as it overlaps with the reset
controller.
Amlogic's GPL kernel sources confirm this, as well as a discussion
I had (privately) with Yixun Lan a while ago:
> I think 0x460 is too big, and we could narrow it down (to a small
> size) but I haven't looked at the meson8 datasheet for what the
> exact size of this

The clock controller itself doesn't have a dedicated size because
(just like on GXBB/GXL/GXM) the clock controller is part of a
register area called "HHI". On GXBB this is 0x400 wide, which
matches Meson8/Meson8b/Meson8m2 because the reset controller
begins at CBUS + 0x4404 (0x4400 is some kind of version register),
so "HHI" starting at 0x4000 and ending at 0x4400 sounds reasonable.

I will follow up with more patches which also introduce the HHI
register area on Meson8 and Meson8b (due to the same reasons it
exists on GXBB/GXL/GXM).


Martin Blumenstingl (2):
  ARM: dts: meson8: fix the clock controller register size
  ARM: dts: meson8b: fix the clock controller register size

 arch/arm/boot/dts/meson8.dtsi  | 2 +-
 arch/arm/boot/dts/meson8b.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.18.0
