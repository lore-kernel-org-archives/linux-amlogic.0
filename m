From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 12 Mar 2018 22:42:42 +0100
Subject: [RFC v1 0/7] Meson GXL/GXM USB host mode support
Message-ID: <20180312214249.17846-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

this is for testing USB host mode support on Meson GXL and GXM.
there are four dependencies to get this working:
1. "improvements and fixes for the phy-meson-gxl-usb2 driver" from [0]
   (this is already queued for v4.17 and part of linux-next)
2. "DWC3 support for Amlogic Meson AXG and GXL SoCs from" [1] (this is
   also queued for v4.17 and part of linux-next)
3. "initialize (multiple) PHYs for a HCD" from [3] (this is also queued
   for v4.17 and part of linux-next)
4. "Meson GXL USB3 PHY driver" from [3] (this is NOT queued for v4.17
   yet and thus also not in linux-next yet)

select boards get USB enabled. I have tested this myself successfully
on:
- Khadas VIM (GXL S905X)
- Le Potato (GXL S905X)
- Khadas VIM2 (GXM S912)
- a board which is similar to P230 (GXL S905D)

I don't remember why I have Nexbox A95X (S905X) support in my tree.
Neil: maybe you can test this on your board (if you still have it)?


[0] https://lkml.kernel.org/r/20180128202245.25021-1-martin.blumenstingl at googlemail.com
[1] https://lkml.kernel.org/r/20180211211517.5846-1-martin.blumenstingl at googlemail.com
[2] https://lkml.kernel.org/r/20180303214309.25643-1-martin.blumenstingl at googlemail.com
[3] http://lists.infradead.org/pipermail/linux-amlogic/2018-March/006707.html

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
2.16.2
