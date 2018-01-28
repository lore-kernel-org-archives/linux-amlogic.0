From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 28 Jan 2018 21:03:30 +0100
Subject: [PATCH 0/3] DWC3 support for Amlogic Meson AXG and GXL SoCs
Message-ID: <20180128200333.20093-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Amlogic Meson AXG and GXL SoCs can use the dwc3-of-simple with little
modifications. These SoCs use:
- a gate clock for the USB components (DWC3, USB PHYs)
- a reset line which is shared across all USB components (DWC3, USB2 and
  USB3 PHYs, OTG detection logic inside the USB3 PHY registers)
- a reset pulse to trigger the reset
- depending on the SoC two or more PHYs (AXG: 1x USB2 and 1x USB3 PHY,
  GXL: 2x USB2 and 1x USB3 PHY)

This extends the dwc3-of-simple so it supports (depending on the
platform) shared and level resets. Additionally it adds new bindings
for the Amlogic Meson AXG and GXL SoCs, along with the documentation
(dt-bindings).

NOTE: for full support on Amlogic Meson GXL SoCs my other series called
"initialize (multiple) PHYs for a HCD" (see [0] for v8 of that series)
is required. However, there is no direct dependency on that series.
Especially since Meson AXG doesn't need it (since it only has one USB2
and one USB3 PHY, which is already supported by the current dwc3 driver,
unlike the 2x USB2 and 1x USB3 PHYs on Meson GXL).
So I believe that this series can still be merged, even if the other
patchset is not ready yet.


[0] http://lists.infradead.org/pipermail/linux-amlogic/2018-January/006274.html


Martin Blumenstingl (3):
  dt-bindings: usb: add support for dwc3 controller on Amlogic Meson GX
  usb: dwc3: of-simple: add support for shared and pulsed reset lines
  usb: dwc3: of-simple: add support for the Amlogic Meson GXL and AXG
    SoCs

 .../devicetree/bindings/usb/amlogic,dwc3.txt       | 42 ++++++++++++
 drivers/usb/dwc3/dwc3-of-simple.c                  | 78 +++++++++++++++++++---
 2 files changed, 109 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/amlogic,dwc3.txt

-- 
2.16.1
