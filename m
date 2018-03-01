From: marcus.folkesson@gmail.com (Marcus Folkesson)
Date: Thu, 1 Mar 2018 08:24:42 +0100
Subject: [PATCH v4] watchdog: add SPDX identifiers for watchdog subsystem
In-Reply-To: <786d740d-f29c-8f09-4648-95244c06e59b@gmail.com>
References: <20180228150209.2525-1-marcus.folkesson@gmail.com>
 <786d740d-f29c-8f09-4648-95244c06e59b@gmail.com>
Message-ID: <20180301072432.GA8901@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Florian,

On Wed, Feb 28, 2018 at 03:45:43PM -0800, Florian Fainelli wrote:
> On 02/28/2018 07:01 AM, Marcus Folkesson wrote:
> > - Add SPDX identifier
> > - Remove boiler plate license text
> > - If MODULE_LICENSE and boiler plate does not match, go for boiler plate
> >   license
> > 
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> > Acked-by: Baruch Siach <baruch@tkos.co.il>
> > Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > Acked-by: Keiji Hayashibara <hayashibara.keiji@socionext.com>
> > Acked-by: Johannes Thumshirn <jth@kernel.org>
> > Acked-by: Mans Rullgard <mans@mansr.com>
> > Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
> > Acked-by: Michal Simek <michal.simek@xilinx.com>
> > Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> > Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> > Acked-by: Thierry Reding <treding@nvidia.com>
> > Acked-by: Tomas Winkler <tomas.winkler@intel.com>
> > Acked-by: Patrice Chotard <patrice.chotard@st.com>
> > Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> > Reviewed-by: Eric Anholt <eric@anholt.net>
> > ---
> > 
> > Notes:
> >     v4:
> >     	- Drop coh901327_wdt since it allready is a pending patch
> >     v3:
> >     	- Keep license text for ebc-c384_wdt
> >     v2:
> >     	- Put back removed copyright texts for meson_gxbb_wdt and coh901327_wdt
> >     	- Change to BSD-3-Clause for meson_gxbb_wdt
> >     v1: Please have an extra look at meson_gxbb_wdt.c
> > 
> 
> >  drivers/watchdog/ar7_wdt.c             | 14 +---------
> 
> >  drivers/watchdog/bcm2835_wdt.c         |  5 +---
> >  drivers/watchdog/bcm47xx_wdt.c         |  5 +---
> >  drivers/watchdog/bcm63xx_wdt.c         |  5 +---
> >  drivers/watchdog/bcm7038_wdt.c         | 12 ++------
> >  drivers/watchdog/bcm_kona_wdt.c        |  9 +-----
> 
> >  drivers/watchdog/mtx-1_wdt.c           | 11 +-------
> 
> For these drivers above:
> 
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> and it looks like you missed rdc321x_wdt.c, is there a specific reason?

Good catch!
I will fix that, thank you.

> -- 
> Florian


Best regards
Marcus Folkesson
