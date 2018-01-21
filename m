From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 21 Jan 2018 23:14:11 +0100
Subject: [PATCH v2 0/3] Meson8/Meson8b reset improvements
Message-ID: <20180121221414.1060-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Recently reset level support (.assert/.deassert) was added to the
reset-meson driver.
This prepares Meson8b to enable level resets as well (for this we
have to grow the memory zone of the reset controller).

I also noticed that Meson8 does not have the reset controller in it's
.dtsi yet, so this series adds that as well.
It also adds the USB reset lines on Meson8 afterwards to stay
consistent with Meson8b.

changes since v1 at [0]:
- added Neil's Reviewed-by (thank you)
- updated cover-letter since the reset-meson driver changes which
  add level reset support also for Meson8b are queued for v4.16


[0] http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005865.html


Martin Blumenstingl (3):
  ARM: dts: meson8b: grow the reset controller memory zone
  ARM: dts: meson8: add the reset controller
  ARM: dts: meson8: add the USB reset line

 arch/arm/boot/dts/meson8.dtsi  | 9 +++++++++
 arch/arm/boot/dts/meson8b.dtsi | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

-- 
2.16.0
