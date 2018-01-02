From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Tue, 2 Jan 2018 22:53:30 +0100
Subject: [PATCH] reset: meson: enable level reset support on Meson8b
In-Reply-To: <1514898067.5080.9.camel@pengutronix.de>
References: <20171226115041.4786-1-martin.blumenstingl@googlemail.com>
 <1514892915.5080.5.camel@pengutronix.de>
 <30459dd9-78ef-e462-1c38-7048aebd0b40@baylibre.com>
 <1514898067.5080.9.camel@pengutronix.de>
Message-ID: <CAFBinCDLLV9XHfwqM+zsEY=tLZZv0XNYKuA2FPc70qApkOvkxw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Philipp,

On Tue, Jan 2, 2018 at 2:01 PM, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> On Tue, 2018-01-02 at 13:49 +0100, Neil Armstrong wrote:
>> On 02/01/2018 12:35, Philipp Zabel wrote:
>> > Hi Martin,
>> >
>> > On Tue, 2017-12-26 at 12:50 +0100, Martin Blumenstingl wrote:
>> > > Commit a5a10afe04ef ("reset: meson: add level reset support for GX SoC
>> > > family") only enabled the level resets for the newer GX SoC family.
>> > > However, the older 32-Meson SoCs (Meson8, Meson8b and Meson8m2) also
>> > > support level resets using the same offset as the newer GX SoCs.
>> > >
>> > > This removes the separation between Meson8b and the GX SoCs from the
>> > > reset-meson driver to enable the level resets also on Meson8b.
>> > >
>> > > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> >
>> > Thank you for the patch. It looks fine to me, not knowing the hardware
>> > details.
>> > The referenced commit made it sound like reset level handling on Meson8
>> > is different from GX, though. Could somebody clarify?
>> >
>> > regards
>> > Philipp
>> >
>>
>> Hi Philipp,
>>
>> This is highly undocumented and needs reading the vendor source code and experimenting,
>> this patch is ok for me. Seems the register mapping did not change for a long time since
>> it's still the same on the latest AXG family.
>>
>> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>
> Thank you, applied it to reset/next with your R-b.
thank you

I guess I could have been a bit more verbose in the commit message:
as Neil already said our public datasheet doesn't mention these
registers (neither on GXBB, GXL, GXM nor Meson8b)
however, the vendor kernel sources contain enough information: [0]
- the reset controller starts at CBUS (0x1101 * 4)
- the RESET0_LEVEL register is at CBUS (0x1120 * 4)
- offset between start and the LEVEL registers: (0x1120 - 0x1101) * 4 = 0x7c

I tested this with the dwmac (Ethernet) reset:
I modified the stmmac driver so it only asserts the reset, but never
de-asserts it:
this breaks ethernet - and even if I reboot into u-boot ethernet is
dead (I have to do a full power-cycle to get it working again)
with the unmodified stmmac driver (which de-asserts the reset line
again) both the stmmac driver itself and u-boot are working fine again


Regards
Martin


[0] https://github.com/endlessm/linux-meson/blob/af743b87ad00dad42a4af84d0445f45ef251d046/arch/arm/mach-meson8b/include/mach/register.h#L1015
