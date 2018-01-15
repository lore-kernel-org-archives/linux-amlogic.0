From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 15 Jan 2018 13:08:36 +0100
Subject: [RFT net-next v4 3/5] net: stmmac: dwmac-meson8b: fix internal
 RGMII clock configuration
In-Reply-To: <1516016986.2608.16.camel@baylibre.com>
References: <20180114214858.7217-1-martin.blumenstingl@googlemail.com>
 <20180114214858.7217-4-martin.blumenstingl@googlemail.com>
 <1516016986.2608.16.camel@baylibre.com>
Message-ID: <CAFBinCDCFAY3Mh7Oo3c-yUeRMBhReRjpqGCCadkWq=yqFFnqtg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Jerome,

On Mon, Jan 15, 2018 at 12:49 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Sun, 2018-01-14 at 22:48 +0100, Martin Blumenstingl wrote:
>> Tests (using an oscilloscope and an Odroid-C1 board with a RTL8211F
>> RGMII PHY) have shown that the PRG_ETH0 register behaves as follows:
>> - bit 4 is a mux to choose between two parent clocks. according to the
>>   public S805 datasheet the only supported parent clock is MPLL2 (this
>>   was not verified using the oscilloscope).
>>   The public S805/S905 datasheet claims that this bit is reserved.
>> - bits 9:7 control a one-based divider (register value 1 means "divide
>>   by 1", etc.) for the input clock. we call this clock the "m250_div"
>>   clock because it's value is always supposed to be (close to) 250MHz
>>   (see below for an explanation).
>>   The description in the public S805/S905 datasheet is a bit cryptic,
>>   but it comes down to "input clock = 250MHz * value" (which could also
>>   be expressed as "250MHz = input clock / value")
>> - there seems to be an internal fixed divide-by-2 clock which takes the
>>   output from the m250_div and divides it by 2. This is not unusual on
>>   Amlogic SoCs, since the SDIO (MMC) driver also uses an internal fixed
>>   divide-by-2 clock.
>>   This is not documented in the public S805/S905 datasheet
>> - bit 10 controls a gate clock which enables or disables the RGMII TX
>>   clock (which is an output on the MAC/SoC and an input in the PHY). we
>>   call this the "rgmii_tx_en" clock. if this bit is set to "0" the RGMII
>>   TX clock output is close to 0
>>   The description for this bit in the public S805/S905 datasheet is
>>   "Generate 25MHz clock for PHY". Based on these tests it's believed
>>   that this is wrong, and should probably read "Generate the 125MHz
>>   RGMII TX clock for the PHY"
>> - the RGMII TX clock has to be set to 125MHz - the IP block adjusts the
>>   output (automatically) depending on the line speed (RGMII specifies
>>   that Gbit connections use a 125MHz clock, 100Mbit/s connections use a
>>   25MHz clock and 10Mbit/s connections use a 2.5MHz clock. only Gbit and
>>   100Mbit/s were tested with an oscilloscope). Due to the requirement
>>   that this clock always has to be set to 125MHz and due to the fixed
>>   divide-by-2 parent clock this means that m250_div will always end up
>>   with a rate of (close to) 250MHz.
>> - bits 6:5 are the TX delay, which is also named "clock phase" in some
>>   of Amlogic's older GPL kernel sources.
>>
>> The PHY also has an XTAL_IN pin where a 25MHz clock has to be provided.
>> Tests with the oscilloscope have shown that this is routed to a crystal
>> right next to the RTL8211F PHY. The same seems to be true on the Khadas
>> VIM2 (which uses a GXM SoC) board - however the 25MHz crystal is on the
>> other side of the PCB there.
>>
>> This updates the clocks in the dwmac-meson8b driver by replacing the
>> "m25_div" with the "rgmii_tx_en" clock and additionally introducing a
>> fixed divide-by-2 clock between "m250_div" and "rgmii_tx_en".
>> Now we also need to set a frequency of 125MHz on the RGMII clock
>> (opposed to the 25MHz we set before, with that non-existing
>> divide-by-5-or-10 divider).
>>
>> Special thanks go to Linus L?ssing for testing the various bits and
>> checking the results with an oscilloscope on his Odroid-C1!
>>
>> Fixes: 566e8251625304 ("net: stmmac: add a glue driver for the Amlogic Meson 8b / GXBB DWMAC")
>> Reported-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> Looks Good
> Acked-by: Jerome Brunet <jbrunet@baylibre.com>
thank you!

> Not related to this particular change but we still need to re-factor the clock
> registration of this driver. We carry a lot of useless pointers in our private
> data. I guess this is something for another day.
can you share your thoughts how to do this?
I can devm_kzalloc the memory for struct clk_mux, clk_divider and
clk_fixed_factor in the function which registers these clocks. but I
cannot declare them on the stack, because the clk-* implementations
still need it during runtime
this would leave us with only the struct clk instances in meson8_dwmac


Regards
Martin
