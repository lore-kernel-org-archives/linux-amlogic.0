From: p.zabel@pengutronix.de (Philipp Zabel)
Date: Tue, 02 Jan 2018 12:35:15 +0100
Subject: [PATCH] reset: meson: enable level reset support on Meson8b
In-Reply-To: <20171226115041.4786-1-martin.blumenstingl@googlemail.com>
References: <20171226115041.4786-1-martin.blumenstingl@googlemail.com>
Message-ID: <1514892915.5080.5.camel@pengutronix.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Martin,

On Tue, 2017-12-26 at 12:50 +0100, Martin Blumenstingl wrote:
> Commit a5a10afe04ef ("reset: meson: add level reset support for GX SoC
> family") only enabled the level resets for the newer GX SoC family.
> However, the older 32-Meson SoCs (Meson8, Meson8b and Meson8m2) also
> support level resets using the same offset as the newer GX SoCs.
> 
> This removes the separation between Meson8b and the GX SoCs from the
> reset-meson driver to enable the level resets also on Meson8b.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thank you for the patch.?It looks fine to me, not knowing the hardware
details.
The referenced commit made it sound like reset level handling on Meson8
is different from GX, though. Could somebody clarify?

regards
Philipp
