From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sun, 19 Feb 2017 21:30:58 +0100
Subject: [PATCH 0/2] hwrng: meson: add clock handling
Message-ID: <00b2a4cc-686e-0cc0-43e8-552b70a1e868@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The HW randon number generator requires a clock and we shouldn't rely
on the boot loader to enable it.

Heiner Kallweit (2):
  hwrng: meson: expose RNG0 clock via DT
  hwrng: meson: add clock handling to driver

 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi |  5 +++++
 drivers/char/hw_random/meson-rng.c          | 27 ++++++++++++++++++++++++++-
 include/dt-bindings/clock/gxbb-clkc.h       |  1 +
 4 files changed, 33 insertions(+), 2 deletions(-)

-- 
2.11.1
