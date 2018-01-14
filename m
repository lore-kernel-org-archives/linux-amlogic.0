From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 14 Jan 2018 22:48:53 +0100
Subject: [RFT net-next v4 0/5] dwmac-meson8b: clock fixes for Meson8b
Message-ID: <20180114214858.7217-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Dave,

please do not apply this series until it got a Tested-by from Emiliano.


Hi Emiliano,

you reported [0] that you couldn't get dwmac-meson8b to work on your
Odroid-C1. With your findings (register dumps, clk_summary output, etc.)
I think I was able to find a fix: it consists of two patches (which you
find in this series)

Due to the fact that the public S805/S905/S912 datasheets all seem to
be outdated regarding the description of the PRG_ETH0 (also called
PRG_ETHERNET_ADDR0) register Linus L?ssing offered to help testing with
an oscilloscope and an Odroid-C1. I would like to say HUGE thanks to him
at this point as he spent hours figuring out the effects of the bits
that are (though to be) relevant to get Ethernet working on the
Odroid-C1.
We tested three scenarios, all based on version 3 of this series:
1) MPLL2 at ~500MHz, m250_div set to 1, bit 10 enabled
this resulted in a clock rate twice as high as expected at the RGMII TX
clock pin (250MHz instead of 125MHz for Gbit connections and 50MHz
instead of 25MHz for 100Mbit/s connections). it did not change the
rate at the XTAL_IN pin of PHY (which stayed consistenly at 25MHz)
2) MPLL2 at ~250MHz, m250_div set to 1, bit 10 disabled
the oscilloscope shows "no clock" for the RGMII TX clock pin at it's
highest resolution (and random rates at lower resolutions). XTAL_IN is
still at 25MHz
3) MPLL2 at ~250MHz, m250_div set to 1, bit 10 enabled
this resulted in a 125MHz signal at the RGMII TX clock pin for Gbit
speeds and 25MHz for 100Mbit/s - both values are as expected. The rate
on the XTAL_IN pin was at 25MHz
-> boot-logs (with the PRG_ETH0 register value) and screenshots from the
readings of the oscilloscope can be found at:
https://metameute.de/~tux/linux/amlogic/odroidc1/ethernet/

Version 4 of this series is based on the results from Linus L?ssing's
help with the oscilloscope and Odroid-C1.
Unfortunately I don't have any Meson8b boards with RGMII PHY so I could
only partially test this. @Emiliano: Could you please give this version
a try and let me know about the results (preferably with a "Tested-by"
if it works)?
You obviously still need your two "ARM: dts: meson8b" patches which
- add the amlogic,meson8b-dwmac" compatible to meson8b.dtsi
- enable Ethernet on the Odroid-C1 (according to your last thest a TX
  delay of 4ns is required to make it work properly)

When testing on Meson8b this also needs a fix for the MPLL clock driver:
"clk: meson: mpll: use 64-bit maths in params_from_rate", see:
https://patchwork.kernel.org/patch/10131677/

I have tested this myself on a Khadas VIM (GXL SoC, internal RMII PHY)
and a Khadas VIM2 (GXM SoC, external RGMII PHY). Both are still working
fine (so let's hope that this also fixes your Meson8b issue :)).


changes since v3 at [3]:
- renamed the function PATCH #1 from meson8b_init_rgmii_clk to
  meson8b_init_rgmii_tx_clk since we now know what the register bits
  mean
- rewrote PATCH #3 because bit 10 is a gate clock and it seems that
  there is an internal fixed divide-by-2 clock. see the patch
  description for a detailed explanation
- updated the description of PATCH #4 and #5 as the clock we're trying
  to fix is the "RGMII TX" clock (old version stated that this is the
  "RGMII clock" or "PHY reference clock"). also updated the numbers in
  the description now that we have the clock hierarchy right (at least
  we hope so)

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
[2] http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005861.html
[3] http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005899.html


Martin Blumenstingl (5):
  net: stmmac: dwmac-meson8b: only configure the clocks in RGMII mode
  net: stmmac: dwmac-meson8b: simplify generating the clock names
  net: stmmac: dwmac-meson8b: fix internal RGMII clock configuration
  net: stmmac: dwmac-meson8b: fix setting the RGMII TX clock on Meson8b
  net: stmmac: dwmac-meson8b: propagate rate changes to the parent clock

 .../net/ethernet/stmicro/stmmac/dwmac-meson8b.c    | 124 +++++++++++----------
 1 file changed, 68 insertions(+), 56 deletions(-)

-- 
2.15.1
