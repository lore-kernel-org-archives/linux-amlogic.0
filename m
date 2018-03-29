From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Fri, 30 Mar 2018 01:00:33 +0200
Subject: [PATCH net-next v1 0/2] Meson8m2 support for dwmac-meson8b
Message-ID: <20180329230035.20958-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The Meson8m2 SoC is an updated version of the Meson8 SoC. Some of the
peripherals are shared with Meson8b (for example the watchdog registers
and the internal temperature sensor calibration procedure).
Meson8m2 also seems to include the same Gigabit MAC register layout as
Meson8b.

The registers in the Amlogic dwmac "glue" seem identical between Meson8b
and Meson8m2. Manual testing seems to confirm this.

To be extra-safe a new compatible string is added because there's no
(public) documentation on the Meson8m2 SoC. This will allow us to
implement any SoC-specific variations later on (if needed).


Martin Blumenstingl (2):
  dt-bindings: net: meson-dwmac: add support for the Meson8m2 SoC
  net: stmmac: dwmac-meson8b: Add support for the Meson8m2 SoC

 Documentation/devicetree/bindings/net/meson-dwmac.txt | 5 +++--
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c   | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.16.3
