From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Tue, 26 Dec 2017 12:43:42 +0100
Subject: [PATCH 0/3] Meson8/Meson8b reset improvements
Message-ID: <20171226114345.23905-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Recently Neil landed reset level support (.assert/.deassert) for the
reset-meson driver.
While the driver does not support level resets on Meson8b yet we can
already prepare the .dts to do so (I actually found out that level
resets are implemented identical on Meson8/Meson8b/GX - a patch for
the reset-meson driver will follow in a separate series).

I also noticed that Meson8 does not have the reset controller in it's
.dtsi yet, so this series adds that as well.
It also adds the USB reset lines on Meson8 afterwards to stay
consistent with Meson8b.


Martin Blumenstingl (3):
  ARM: dts: meson8b: grow the reset controller memory zone
  ARM: dts: meson8: add the reset controller
  ARM: dts: meson8: add the USB reset line

 arch/arm/boot/dts/meson8.dtsi  | 9 +++++++++
 arch/arm/boot/dts/meson8b.dtsi | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

-- 
2.15.1
