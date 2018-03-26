From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 26 Mar 2018 23:17:41 +0200
Subject: [PATCH v2 0/7] Meson GXL/GXM USB host mode support
Message-ID: <20180326211748.16488-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

the goal of this series is to enable USB host mode on Meson GXL and GXM.
there are four dependencies to get this working:
1. "improvements and fixes for the phy-meson-gxl-usb2 driver" from [0]
   (this is already queued for v4.17 and part of linux-next)
2. "DWC3 support for Amlogic Meson AXG and GXL SoCs from" [1] (this is
   also queued for v4.17 and part of linux-next)
3. "initialize (multiple) PHYs for a HCD" from [3] (this is also queued
   for v4.17 and part of linux-next)
4. "Meson GXL USB3 PHY driver" from [3] (this is also queued for v4.17
   and part of linux-next)
there is a soft dependency on the following series (currently dependency
#3 from above breaks suspend on some TI SoCs, so there's a risk that #3
will get reverted if the following series doesn't fix it):
5. "fix HCD PHY suspend handling" from [4] (not queued for v4.17 yet)

select boards get USB enabled. I have tested this myself successfully
on:
- Khadas VIM (GXL S905X)
- Le Potato (GXL S905X)
- Khadas VIM2 (GXM S912)
- a board which is similar to P230 (GXL S905D)

a user on IRC reported that Nexbox A95X (S905X) support is working fine
as well.


changes since RFC v1 at [5]:
- rebased on top of Kevin's v4.17/dt64 branch (c339f0e29ce9f9 "ARM64:
  dts: meson-gx: make efuse read-only")
- dropped RFC prefix because this was also tested and confirmed working
  by a user on IRC on his Nexbox A95X (S905X)


[0] https://lkml.kernel.org/r/20180128202245.25021-1-martin.blumenstingl at googlemail.com
[1] https://lkml.kernel.org/r/20180211211517.5846-1-martin.blumenstingl at googlemail.com
[2] https://lkml.kernel.org/r/20180303214309.25643-1-martin.blumenstingl at googlemail.com
[3] http://lists.infradead.org/pipermail/linux-amlogic/2018-March/006707.html
[4] http://lists.infradead.org/pipermail/linux-amlogic/2018-March/006847.html
[5] http://lists.infradead.org/pipermail/linux-amlogic/2018-March/006711.html


Martin Blumenstingl (7):
  ARM64: dts: meson-gxl: add USB host support
  ARM64: dts: meson-gxm: add GXM specific USB host configuration
  ARM64: dts: meson-gxl-s905x-p212: enable the USB controller
  ARM64: dts: meson-gx-p23x-q20x: enable the USB controller
  ARM64: dts: meson-gxl-s905x-libretech-cc: enable the USB controller
  ARM64: dts: meson-gxl-nexbox-a95x: enable the USB controller
  ARM64: dts: meson-gxm-khadas-vim2: enable the USB controller

 .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |  4 ++
 .../dts/amlogic/meson-gxl-s905x-libretech-cc.dts   | 12 +++++
 .../dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts    |  4 ++
 .../boot/dts/amlogic/meson-gxl-s905x-p212.dtsi     |  4 ++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         | 61 ++++++++++++++++++++++
 .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts     |  4 ++
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi         | 17 ++++++
 7 files changed, 106 insertions(+)

-- 
2.16.3
