From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Thu, 28 Sep 2017 23:29:03 +0200
Subject: [PATCH 1/4] clk: meson8b: keep mpll2 clock enabled
In-Reply-To: <1506611304.16686.65.camel@baylibre.com>
References: <cover.1506507688.git.ingrassia@epigenesys.com>
 <71634468832113ec4b7e88eaed11ab673ef2bb30.1506507688.git.ingrassia@epigenesys.com>
 <1506582709.16686.56.camel@baylibre.com>
 <20170928095952.GA24801@ingrassia.epigenesys.com>
 <1506611304.16686.65.camel@baylibre.com>
Message-ID: <CAFBinCD1s6pkXW-0ehQ5UNWDE5VOTvik1WWQO0vbQMH2yasJLA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Emiliano, Hi Jerome,

On Thu, Sep 28, 2017 at 5:08 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Thu, 2017-09-28 at 11:59 +0200, Emiliano Ingrassia wrote:
>> Hi Jerome,
>>
>> thanks for review!
>>
>> On Thu, Sep 28, 2017 at 09:11:49AM +0200, Jerome Brunet wrote:
>> > On Wed, 2017-09-27 at 12:40 +0200, Emiliano Ingrassia wrote:
>> > > The mpll2 clock, enabled by the bootloader, is disabled at boot.
>> > > Enabling ethernet on Odroid-C1+ board leads to DMA initialization failure
>> > > caused by a timeout on reset.
>> > > Keeping the mpll2 clock enabled solve this issue.
>> >
>> > Shouldn't the DMA driver emable the clocks it needs itself instead ?
>> > BTW, I'm bit surprised an mpll is used to clock a DMA, is it possible we
>> > missed
>> > something here ?
>> >
>>
originally reported on IRC:
[  416.293456] meson8b-dwmac c9410000.ethernet eth0: stmmac_hw_setup:
DMA engine initialization failed
[  416.302480] meson8b-dwmac c9410000.ethernet eth0: stmmac_open: Hw
setup failed
this issue is mentioned by the stmmac developers - together with a
hint how to fix it: [0]

>> The mpll2 clocks the meson8b ethernet controller which, as one can suppose,
>> internally have a DMA engine. If the controller is enabled, the first
>> operation on hardware is the DMA engine reset which fails if mpll2 is
>> disabled.
>
> I understand. I mentioned that's it strange to use mpll2 because:
> - On gxbb (and following SoCs), There is 2 clockin sources to the mac: FDIV2 and
> MPLL2. There is , of course, an mux in the ethernet device to select the clock
> you need/want.
> - I would not be surprised if it was the same thing on meson8(b). In such case,
> I think it is better to use FDIV2.
I *think* that clock-source 0 (at least on Meson8b) is *NOT* fclk_div2
Amlogic's Meson8 and Meson8b u-boot GPL kernel sources (see [1] for
the Odroid-C1 code) configure HHI_GEN_CLK_CNTL to 0xb803, which
translates to:
- divide by 2+1 = 3
- clock enabled
- parent clock is 0xb (according to the S912 datasheet this is
fclk_div5 - it may be a different input on Meson8 and Meson8b)
(taken from the S912 datasheet released by Khadas)

it also enables HHI_MPLL_CNTL6 bit 27 which is "CKEN[4] MPLL output DIV2 enable"

and finally it uses:
SET_CBUS_REG_MASK(HHI_MPLL_CNTL9, (1638 << 0)
| (0 << 14) | (1 << 15) | (1 << 14)
| (5 << 16)
| (0 << 25) | (0 << 26) | (0 << 30) | (0 << 31));

further up in the S912 datasheet (clock and reset - section 21.1
overview) one finds:
MPLL_CLK_OUT_DIV2_GPIO with comment: to GPIOCLK

I assume that this clock is used as "parent" of the internal mux in
dwmac-meson8b

>> Actually the patch not only solves that issue, but also permits the
>> ethernet controller to work correctly.
>> The correct solution would be to enable the mpll2 clock from dwmac-meson8b
>> driver;
>
> Indeed.
> I would prefer that you fix the ethernet driver rather than adding this to the
> clock driver.
>
>
>> I'm working on this.
>> In the meantime I release this patch to give others the chance
>> to use the ethernet controller on Odroid-C1/C1+.
>>
>
> Ok
Jerome: maybe those MPLL registers mentioned above make sense to you -
if you have an *idea* what they are about then please let us know :)

Emiliano: there's also a "clkmsr" command in u-boot which *MIGHT* help
you to find out the actual frequency of a clock
however, don't blindly trust that output, I had some cases on GXBB
where I think the clkmsr result didn't match my expectations

by the way: on my Meson8m2 board which comes with a RMII PHY I
attached the u-boot clkmsr output and a dump of the clock registers

>> Regards,
>>
>> Emiliano
thank you for your improvements!

>> > >
>> > > Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
>> > > ---
>> > >  drivers/clk/meson/meson8b.c | 1 +
>> > >  1 file changed, 1 insertion(+)
>> > >
>> > > diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
>> > > index 20ab7190d328..5096539e4a63 100644
>> > > --- a/drivers/clk/meson/meson8b.c
>> > > +++ b/drivers/clk/meson/meson8b.c
>> > > @@ -347,6 +347,7 @@ static struct meson_clk_mpll meson8b_mpll2 = {
>> > >           .ops = &meson_clk_mpll_ops,
>> > >           .parent_names = (const char *[]){ "fixed_pll" },
>> > >           .num_parents = 1,
>> > > +         .flags = (CLK_SET_RATE_NO_REPARENT | CLK_IGNORE_UNUSED),
>> > >   },
>> > >  };
>> > >
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


[0] http://lists.infradead.org/pipermail/linux-arm-kernel/2017-March/492629.html
[1] https://github.com/hardkernel/u-boot/blob/odroidc-v2011.03/board/hardkernel/odroidc/odroidc-eth.c#L29
-------------- next part --------------
m8m2_n200_v1#clkmsr
[   0 MHz]  AM_RING_OSC_CLK_OUT0(0)
[   0 MHz]  AM_RING_OSC_CLK_OUT1(1)
[   0 MHz]  SYS_PLL_CLK(2)
[   0 MHz]  DDR_PLL_CLK(3)
[   0 MHz]  MISC_PLL_CLK(4)
[   0 MHz]  AUD_PLL_CLK(5)
[ 216 MHz]  VID_PLL_CLK(6)
[ 142 MHz]  CLK81(7)
[  54 MHz]  CTS_ENCP_CLK(8)
[  54 MHz]  CTS_ENCL_CLK(9)
[   0 MHz]  CTS_ENCT_CLK(10)
[   0 MHz]  CTS_ETH_RMII(11)
[   0 MHz]  VID2_PLL_CLK(12)
[   0 MHz]  CTS_AMCLK(13)
[   0 MHz]  CTS_FEC_CLK_0 (14)
[   0 MHz]  CTS_FEC_CLK_1 (15)
[   0 MHz]  CTS_FEC_CLK_2(16)
[   0 MHz]  CTS_VGHL_PLL_CLK (17)
[  75 MHz]  CTS_LED_PLL_CLK(18)
[  24 MHz]  CTS_HDMI_SYS_CLK(19)
[   0 MHz]  CTS_BTCLK27 (20)
[   0 MHz]  MOD_AUDIN_AMCLK_I  (21)
[   0 MHz]  MOD_ETH_CLK50_I (22)
[   0 MHz]  HDMI_CH3_TMDSCLK(23)
[   0 MHz]  LVDS_FIFO_CLK (24)
[   0 MHz]  USB_CLK_12MHZ (25)
[   0 MHz]  SC_CLK_INT(26)
[   0 MHz]  CTS_ENCI_CL(27)
[   1 MHz]  CTS_SAR_ADC_CLK (28)
[   0 MHz]  CTS_VDAC_CLK0(29)
[   0 MHz]  CTS_DDR_CLK(30)
[   0 MHz]  CTS_A9_CLK(31)
[   0 MHz]  CTS_AUDAC_CLKPI(32)
[   0 MHz]  CTS_SDHC_CLK0(33)
[   0 MHz]  CTS_SDHC_CLK1(34)
[   0 MHz]  CTS_MALI_CLK (35)
[  27 MHz]  CTS_HDMI_TX_PIXEL_CLK(36)
[   0 MHz]  CTS_VDAC_CLK1(37)
[   0 MHz]  CTS_VDIN_MEAS_CLK(38)
[   0 MHz]  CTS_PCM_SCLK(39)
[   0 MHz]  CTS_PCM_MCLK(40)
[  50 MHz]  CTS_ETH_RX_TX (41)
[   0 MHz]  CTS_PWM_D_CLK(42)
[   0 MHz]  CTS_PWM_C_CLK(43)
[   0 MHz]  CTS_PWM_B_CLK(44)
[   0 MHz]  CTS_PWM_A_CLK(45)
m8m2_n200_v1#md 0xC1104000 0x100
c1104000: 00000000 00000000 00000000 00000000    ................
c1104010: 00000000 00000000 00000000 00000000    ................
c1104020: 00000000 00000000 00000000 01ea9612    ................
c1104030: 00000000 00000000 00000000 00000000    ................
c1104040: c00206b6 59c88000 ca463823 0286a027    .......Y#8F.'...
c1104050: 00003000 00000000 00000000 00000000    .0..............
c1104060: 00000000 00000000 00000000 00000000    ................
c1104070: 00000000 00000000 00000000 00000000    ................
c1104080: 00000000 00000000 00000000 00000000    ................
c1104090: 00000000 00000000 00000000 00000000    ................
c11040a0: 00000000 00000000 00000000 00000000    ................
c11040b0: 00000000 00000000 00000000 00000000    ................
c11040c0: 00000000 00000000 00000000 00000000    ................
c11040d0: 00000000 00000000 00000000 00000000    ................
c11040e0: 00000000 00000000 00000000 00000384    ................
c11040f0: 00000000 00000000 00000000 00000000    ................
c1104100: ffff00f3 00000000 00000000 00000000    ................
c1104110: 00000000 00000000 00000000 00000000    ................
c1104120: 00000000 00000000 10000101 00000000    ................
c1104130: 00010000 00000000 00000000 00000000    ................
c1104140: ffffffff ffffffff ffffffff 00000000    ................
c1104150: ffffffff 000000ff 00000000 800016a2    ................
c1104160: 00000000 10000103 00000000 00000000    ................
c1104170: 00000000 0000e185 00000004 00080007    ................
c1104180: 00000000 00000000 00000000 00000000    ................
c1104190: 00000004 000000ff 00010853 000000b1    ........S.......
c11041a0: 00000000 00000000 00000000 00000000    ................
c11041b0: 00000000 00000000 00000000 00000700    ................
c11041c0: 00000000 00000000 00000000 00010100    ................
c11041d0: 00000000 00000000 00000000 00000000    ................
c11041e0: 00000000 00000000 00000000 00000000    ................
c11041f0: 00000000 00000000 00000000 00000000    ................
c1104200: 00000000 00000000 00000000 00000000    ................
c1104210: 00000000 00000000 00000000 00000000    ................
c1104220: 00000000 00000000 00000000 00000000    ................
c1104230: 00000000 00000000 00000000 00000000    ................
c1104240: 00000000 00000000 00000000 00000000    ................
c1104250: 00000b00 00000000 00000000 00000501    ................
c1104260: 00000000 00000000 00000000 00000000    ................
c1104270: 00000000 30000000 00000000 00000000    .......0........
c1104280: c00009a9 59c80000 ca45b822 00014007    .......Y".E.. at ..
c1104290: b5500e1a f4454545 00000000 00000000    ..P.EEE.........
c11042a0: 00000000 00000000 00000000 00000000    ................
c11042b0: 00000000 00000000 00000000 00000000    ................
c11042c0: 00000000 00000000 00000000 00000000    ................
c11042d0: 00000000 00000000 00000000 00000000    ................
c11042e0: 00000000 00000000 00000000 00000000    ................
c11042f0: 00000000 00000001 00000000 00000000    ................
c1104300: c1200232 5ac82000 8e452015 0001d40c    2. .. .Z. E.....
c1104310: 00000870 00000000 00000100 00180007    p...............
c1104320: c0080436 59c88000 ca49b022 0023b100    6......Y".I...#.
c1104330: 00016385 00000003 00000000 00000000    .c..............
c1104340: 00000000 00000003 001e0000 00000000    ................
c1104350: 00000000 00000000 00ffffff 00000000    ................
c1104360: 00000000 00000000 00000000 00000000    ................
c1104370: 00000000 007f0000 00000000 02000000    ................
c1104380: 21001001 0430a800 00000000 00000000    ...!..0.........
c1104390: 00000000 00000002 00000000 00000000    ................
c11043a0: 00000000 00000000 00000000 00000000    ................
c11043b0: 00000000 00000000 00000000 00000000    ................
c11043c0: 00000000 00000000 00000000 00000000    ................
c11043d0: 00000000 00000000 00000000 00000000    ................
c11043e0: 00000000 00000000 00000000 00000000    ................
c11043f0: 00000000 00000000 00000000 00000000    ................
m8m2_n200_v1#
