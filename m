From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 23 Dec 2017 18:04:31 +0100
Subject: [RFT net-next 0/2] dwmac-meson8b: clock rounding fixes for Meson8b
Message-ID: <20171223170433.8150-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Dave,

please do not apply this series until it got a Tested-by from Emiliano.


Hi Emiliano,

you reported [0] that you couldn't get dwmac-meson8b to work on your
Odroid-C1. With your findings (register dumps, clk_summary output, etc.)
I think I was able to find a fix: it consists of two patches (which you
find in this series)

Unfortunately I don't have any Meson8b boards with RGMII PHY so I could
only partially test this (I could only check if the clocks were
calculated correctly when using a dummy 500002394Hz input clock instead
of MPLL2).

Could you please give this series a try and let me know about the
results?
You obviously still need your two "ARM: dts: meson8b" patches which
- add the amlogic,meson8b-dwmac" compatible to meson8b.dtsi
- enable Ethernet on the Odroid-C1

I have tested this myself on a Khadas VIM (GXL SoC, internal RMII PHY)
and a Khadas VIM2 (GXM SoC, external RGMII PHY). Both are still working
fine (so let's hope that this also fixes your Meson8b issue :)).


[0] http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005596.html

Martin Blumenstingl (2):
  net: stmmac: dwmac-meson8b: fix setting the PHY clock on Meson8b
  net: stmmac: dwmac-meson8b: don't try to change m250_div parent's rate

 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
2.15.1
