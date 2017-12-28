From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Thu, 28 Dec 2017 17:16:58 +0100
Subject: [RFT net-next v2 0/3] dwmac-meson8b: RGMII clock fixes for Meson8b
In-Reply-To: <20171223234100.11814-1-martin.blumenstingl@googlemail.com>
References: <20171223234100.11814-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171228161658.GA22727@ingrassia.epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Martin, Hi Dave,

On Sun, Dec 24, 2017 at 12:40:57AM +0100, Martin Blumenstingl wrote:
> Hi Dave,
> 
> please do not apply this series until it got a Tested-by from Emiliano.
> 
> 
> Hi Emiliano,
> 
> you reported [0] that you couldn't get dwmac-meson8b to work on your
> Odroid-C1. With your findings (register dumps, clk_summary output, etc.)
> I think I was able to find a fix: it consists of two patches (which you
> find in this series)
> 
> Unfortunately I don't have any Meson8b boards with RGMII PHY so I could
> only partially test this (I could only check if the clocks were
> calculated correctly when using a dummy 500002394Hz input clock instead
> of MPLL2).
> 
> Could you please give this series a try and let me know about the
> results?
> You obviously still need your two "ARM: dts: meson8b" patches which
> - add the amlogic,meson8b-dwmac" compatible to meson8b.dtsi
> - enable Ethernet on the Odroid-C1
> 
> I have tested this myself on a Khadas VIM (GXL SoC, internal RMII PHY)
> and a Khadas VIM2 (GXM SoC, external RGMII PHY). Both are still working
> fine (so let's hope that this also fixes your Meson8b issue :)).
> 
> 
> changes since v1 at [1]:
> - changed the subject of the cover-letter to indicate that this is all
>   about the RGMII clock
> - added PATCH #1 which ensures that we don't unnecessarily change the
>   parent clocks in RMII mode (and also makes the code easier to
>   understand)
> - changed subject of PATCH #2 (formerly PATCH #1) to state that this
>   is about the RGMII clock
> - added Jerome's Reviewed-by to PATCH #2 (formerly PATCH #1)
> - replaced PATCH #3 (formerly PATCH #2) with one that sets
>   CLK_SET_RATE_PARENT on the mux and thus re-configures the MPLL2 clock
>   on Meson8b correctly
>

Really thank you for your help and effort. I tried your patch but
unfortunately it didn't solve the problem.

Here is the new clk_summary:

xtal                            1            1    24000000          0 0
 sys_pll                        0            0  1200000000          0 0
  cpu_clk                       0            0  1200000000          0 0
 vid_pll                        0            0   732000000          0 0
 fixed_pll                      2            2  2550000000          0 0
  mpll2                         1            1   106250000          0 0
   c9410000.ethernet#m250_sel   1            1   106250000          0 0
    c9410000.ethernet#m250_div  1            1   106250000          0 0
     c9410000.ethernet#m25_div  1            1    21250000          0 0

which leads to a value of 0x70a1 in the prg0 ethernet register.
As you can see, something is changed but the RGMII clock is not at 25 MHz.
In particular, the bit 10 of prg0, which enables the "generation of 25 MHz
clock for PHY" (see S805 manual), is 0.

Please, if you have other suggestions let me know.

Best regards,

Emiliano

> 
> [0] http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005596.html
> [1] http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005848.html
> 
> 
> Martin Blumenstingl (3):
>   net: stmmac: dwmac-meson8b: only configure the clocks in RGMII mode
>   net: stmmac: dwmac-meson8b: fix setting the RGMII clock on Meson8b
>   net: stmmac: dwmac-meson8b: propagate rate changes to the parent clock
> 
>  .../net/ethernet/stmicro/stmmac/dwmac-meson8b.c    | 55 +++++++++++-----------
>  1 file changed, 27 insertions(+), 28 deletions(-)
> 
> -- 
> 2.15.1
> 
