From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue, 2 Jan 2018 13:49:38 +0100
Subject: [PATCH] reset: meson: enable level reset support on Meson8b
In-Reply-To: <1514892915.5080.5.camel@pengutronix.de>
References: <20171226115041.4786-1-martin.blumenstingl@googlemail.com>
 <1514892915.5080.5.camel@pengutronix.de>
Message-ID: <30459dd9-78ef-e462-1c38-7048aebd0b40@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 02/01/2018 12:35, Philipp Zabel wrote:
> Hi Martin,
> 
> On Tue, 2017-12-26 at 12:50 +0100, Martin Blumenstingl wrote:
>> Commit a5a10afe04ef ("reset: meson: add level reset support for GX SoC
>> family") only enabled the level resets for the newer GX SoC family.
>> However, the older 32-Meson SoCs (Meson8, Meson8b and Meson8m2) also
>> support level resets using the same offset as the newer GX SoCs.
>>
>> This removes the separation between Meson8b and the GX SoCs from the
>> reset-meson driver to enable the level resets also on Meson8b.
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> Thank you for the patch.?It looks fine to me, not knowing the hardware
> details.
> The referenced commit made it sound like reset level handling on Meson8
> is different from GX, though. Could somebody clarify?
> 
> regards
> Philipp
> 

Hi Philipp,

This is highly undocumented and needs reading the vendor source code and experimenting,
this patch is ok for me. Seems the register mapping did not change for a long time since
it's still the same on the latest AXG family.

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Neil
