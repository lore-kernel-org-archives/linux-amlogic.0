From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Thu, 28 Dec 2017 23:21:23 +0100
Subject: [RFT net-next v3 0/5] dwmac-meson8b: RGMII clock fixes for Meson8b
Message-ID: <20171228222128.15215-1-martin.blumenstingl@googlemail.com>
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

When testing on Meson8b this also needs a fix for the MPLL clock driver:
"clk: meson: mpll: use 64-bit maths in params_from_rate", see:
https://patchwork.kernel.org/patch/10131677/


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

changes since v2 at [2]:
- added PATCH #2 to make the following patch easier
- Emiliano reported that there's currently another bug in the
  dwmac-meson8b driver which prevents it from working with RGMII PHYs on
  Meson8b: bit 10 of the PRG_ETH0 register is configures a clock gate
  (instead of a divide by 5 or divide by 10 clock divider). This has not
  been visible on GXBB and later due to the input clock which always led
  to a selection of "divide by 10" (which is done internally in the IP
  block, but the bit actually means "enable RGMII clock output").
  PATCH #3 was added to address this issue.
- the commit message of PATCH #4 and #5 (formerly PATCH #2 and #3) were
  updated and the patch itself rebased because the m25_div clock was
  removed with the new PATCH #3 (so some of the statements were not
  valid anymore)


[0] http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005596.html
[1] http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005848.html
[2] http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005861.html


Martin Blumenstingl (5):
  net: stmmac: dwmac-meson8b: only configure the clocks in RGMII mode
  net: stmmac: dwmac-meson8b: simplify generating the clock names
  net: stmmac: dwmac-meson8b: fix internal RGMII clock configuration
  net: stmmac: dwmac-meson8b: fix setting the RGMII clock on Meson8b
  net: stmmac: dwmac-meson8b: propagate rate changes to the parent clock

 .../net/ethernet/stmicro/stmmac/dwmac-meson8b.c    | 119 +++++++++++----------
 1 file changed, 63 insertions(+), 56 deletions(-)

-- 
2.15.1
