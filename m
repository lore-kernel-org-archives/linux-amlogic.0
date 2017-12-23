From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 24 Dec 2017 00:40:57 +0100
Subject: [RFT net-next v2 0/3] dwmac-meson8b: RGMII clock fixes for Meson8b
Message-ID: <20171223234100.11814-1-martin.blumenstingl@googlemail.com>
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


changes since v1 at [1]:
- changed the subject of the cover-letter to indicate that this is all
  about the RGMII clock
- added PATCH #1 which ensures that we don't unnecessarily change the
  parent clocks in RMII mode (and also makes the code easier to
  understand)
- changed subject of PATCH #2 (formerly PATCH #1) to state that this
  is about the RGMII clock
- added Jerome's Reviewed-by to PATCH #2 (formerly PATCH #1)
- replaced PATCH #3 (formerly PATCH #2) with one that sets
  CLK_SET_RATE_PARENT on the mux and thus re-configures the MPLL2 clock
  on Meson8b correctly


[0] http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005596.html
[1] http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005848.html


Martin Blumenstingl (3):
  net: stmmac: dwmac-meson8b: only configure the clocks in RGMII mode
  net: stmmac: dwmac-meson8b: fix setting the RGMII clock on Meson8b
  net: stmmac: dwmac-meson8b: propagate rate changes to the parent clock

 .../net/ethernet/stmicro/stmmac/dwmac-meson8b.c    | 55 +++++++++++-----------
 1 file changed, 27 insertions(+), 28 deletions(-)

-- 
2.15.1
