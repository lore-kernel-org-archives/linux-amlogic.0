From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 30 Dec 2017 00:40:28 +0100
Subject: [RFT net-next v3 3/5] net: stmmac: dwmac-meson8b: fix internal
 RGMII clock configuration
In-Reply-To: <1514570234.7439.15.camel@baylibre.com>
References: <20171228222128.15215-1-martin.blumenstingl@googlemail.com>
 <20171228222128.15215-4-martin.blumenstingl@googlemail.com>
 <1514570234.7439.15.camel@baylibre.com>
Message-ID: <CAFBinCAXy+cgju3peA=YBHJReUu=vh8to4UVU5qebN67AZOgPg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Jerome,

On Fri, Dec 29, 2017 at 6:57 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Thu, 2017-12-28 at 23:21 +0100, Martin Blumenstingl wrote:
>> While testing the dwmac-meson8b with an RGMII PHY on Meson8b we
>> discovered that the m25_div is not actually a divider but rather a gate.
>> This matches with the datasheet which describes bit 10 as "Generate
>> 25MHz clock for PHY". Back when the driver was written it was assumed
>> that this was a divider (which could divide by 5 or 10) because other
>> clock bits in the datasheet were documented incorrectly.
>
> Maybe this bit 10 is indeed a 5/10 divider, as amlogic claims it is. Maybe, as
> Emiliano suggested, the output rate of div250 actually needs to be 250Mhz in
> RGMII, before being divided by 10 to produce the 25MHz of div25
>
> IOW, maybe we need this intermediate rate.
I am starting to believe that you (Emiliano and Jerome) are both right
does anyone of you have access to a scope so we can measure the actual
clock output?

> It would not be surprising, 1GBps usually requires a 125MHz clock somewhere.
this could mean that two clocks are derived from m250_div (names are
not final obviously):
- phy_ref_clk (25MHz or 50MHz)
- rgmii_tx_clk (fixed divide by 2, 125MHz)

> This is still doable:
> * Keep the divider
> * drop CLK_SET_RATE_PARENT on div25
> * call set_rate on div250 with 250MHz then on div25 with 25Mhz
yep, I will try this next
this would also be work with the assumption that the rgmii_tx_clk is
derived from m250_div

>
>>
>> Tests have shown that without bit 10 set the RTL8211F RGMII PHY on
>> Odroid-C1 (using a Meson8b SoC) does not work.
>> On GXBB and newer SoCs (where the driver was initially tested with RGMII
>> PHYs) this is not a problem because the input clock is running at 1GHz.
>> The m250_div clock's biggest possible divider is 7 (3-bit divider, with
>> value 0 being reserved). Thus we end up with a m250_div of 4 and a
>> "m25_div" of 10 (= register value 1).
>>
>> Instead it turns out that the Ethernet IP block seems to have a fixed
>> "divide by 10" clock internally. This means that bit 10 is a gate clock
>> which enables the RGMII clock output.
>>
>> This replaces the "m25_div" clock with a clock gate called "m25_en"
>> which ensures that we can set this bit to 1 whenever we enable RGMII
>> mode. This however means that we are now missing a "divide by 10" after
>> the m250_div (and before our new m25_en), otherwise the common clock
>> framework thinks that the rate of the m25_en clock is 10-times higher
>> than it is in the actual hardware. That is solved by adding a
>> fixed-factor clock which divides the m250_div output by 10.
>>
>> Fixes: 566e8251625304 ("net: stmmac: add a glue driver for the Amlogic Meson 8b / GXBB DWMAC")
>> Reported-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> ---
>>  .../net/ethernet/stmicro/stmmac/dwmac-meson8b.c    | 66 +++++++++++++---------
>>  1 file changed, 38 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
>> index 1c14210df465..7199e8c08536 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
>> @@ -40,9 +40,7 @@
>>  #define PRG_ETH0_CLK_M250_DIV_SHIFT    7
>>  #define PRG_ETH0_CLK_M250_DIV_WIDTH    3
>>
>> -/* divides the result of m25_sel by either 5 (bit unset) or 10 (bit set) */
>> -#define PRG_ETH0_CLK_M25_DIV_SHIFT     10
>> -#define PRG_ETH0_CLK_M25_DIV_WIDTH     1
>> +#define PRG_ETH0_GENERATE_25M_PHY_CLOCK        10
>>
>>  #define PRG_ETH0_INVERTED_RMII_CLK     BIT(11)
>>  #define PRG_ETH0_TX_AND_PHY_REF_CLK    BIT(12)
>> @@ -63,8 +61,11 @@ struct meson8b_dwmac {
>>         struct clk_divider      m250_div;
>>         struct clk              *m250_div_clk;
>>
>> -       struct clk_divider      m25_div;
>> -       struct clk              *m25_div_clk;
>> +       struct clk_fixed_factor fixed_div10;
>> +       struct clk              *fixed_div10_clk;
>> +
>> +       struct clk_gate         m25_en;
>> +       struct clk              *m25_en_clk;
>
> Maybe it could be the topic of another series but we don't need to keep all
> those structures around, thanks to devm
>
> all clk_divider, fixed_factor, gate and mux can go away
> You only need to keep  the'struct clk*' you are going to use later on
>
> at the moment it would be m25_en_clk only.
let's get the whole thing to work first, then I will have another look
at the struct members (it already annoyed me too)


PS: on another note: the title of this series and most patches is
wrong as I just discovered:
the 25MHz clock is *NOT* the RGMII clock, but it's the "PHY reference
clock". Hardkernel calls it "ETH_PHY_REF_CLK_25MOUT" in their
Odroid-C1 schematics [4] on page 23, which is the only actual
description I could find for this pin (on the Khadas VIM2 schematics
for example there's a 25MHz clock seemingly coming out of nowhere)

I used three publicly available datasheets for reference:
1) TI DP83822 (MII/RMII/RGMII): [0]
page: 5
pin: XI
description for MII and RGMII: Reference clock 25-MHz ?50
ppm-tolerance crystal or oscillator input. The device supports either
an external crystal resonator connected across pins XI and XO, or an
external CMOS-level oscillator connected to pin XI only
description for RMII: RMII reference clock: Reference clock 50-MHz ?50
ppm-tolerance CMOS-level oscillator in RMII Slave mode. Reference
clock 25-MHz ?50 ppm-tolerance crystal or oscillator in RMII Master
mode.

2) micrel DP83822 (RGMII): [1]
page: 13
pin: XI
description: Crystal / Oscillator / External Clock Input
25MHz ?50ppm tolerance

3) Realtek RTL8211E (RGMII, should be close to the RTL8211F PHY on our
Amlogic boards): [2]
page: 17
pin: CKXTAL1
description: 25/50MHz Crystal Input

this shows that Ethernet PHYs "typically" support 25MHz and 50MHz as
"reference clock input"
it also supports Emiliano's and Jerome's suggestion that m250_div
should run at 250MHz and m25_div might act as a divide-by-5 or
divide-by-10 bit.


Regards
Martin


[0] http://www.ti.com/lit/ds/symlink/dp83822h.pdf
[1] https://datasheet.lcsc.com/szlcsc/KSZ9031RNXCA_C58758.pdf
[2] https://www.pine64.pro/download/documents/realtek-10-100-1000-ethernet.pdf
[3] https://dn.odroid.com/S805/Schematics/odroid-c1+_rev0.4_20160226.pdf
