From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 17 Feb 2018 15:08:17 +0100
Subject: [net-next PATCH v1 0/3] dwmac-meson8b: small cleanup
Message-ID: <20180217140820.30257-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This is a follow-up to my previous series "dwmac-meson8b: clock fixes for
Meson8b" from [0].
during the review of that series it was found that the clock registration
could be simplified. now that the previous series has landed we can start
cleaning up the clock registration.

the goal of this series is to simplify the code in the dwmac-meson8b
driver. no functional changes are intended.

I have tested this on my Khadas VIM2 (GXM SoC, with RGMII PHY) and my
Endless Mini (EC-100, Meson8b SoC with RMII PHY, .dts support is not part
of mainline yet). no problems were found.


[0] http://lists.infradead.org/pipermail/linux-amlogic/2018-January/006143.html

Martin Blumenstingl (3):
  net: stmmac: dwmac-meson8b: simplify clock registration
  net: stmmac: dwmac-meson8b: only keep struct device around
  net: stmmac: dwmac-meson8b: make the clock configurations private

 .../net/ethernet/stmicro/stmmac/dwmac-meson8b.c    | 208 +++++++++------------
 1 file changed, 92 insertions(+), 116 deletions(-)

-- 
2.16.1
