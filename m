From: vilhelm.gray@gmail.com (William Breathitt Gray)
Date: Wed, 21 Feb 2018 07:40:25 -0500
Subject: [PATCH v3] watchdog: add SPDX identifiers for watchdog subsystem
In-Reply-To: <20180221122744.28300-1-marcus.folkesson@gmail.com>
References: <20180221122744.28300-1-marcus.folkesson@gmail.com>
Message-ID: <20180221124024.GA3773@sophia>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, Feb 21, 2018 at 01:27:34PM +0100, Marcus Folkesson wrote:
>- Add SPDX identifier
>- Remove boiler plate license text
>- If MODULE_LICENSE and boiler plate does not match, go for boiler plate
>  license
>
>Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
>Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
>Acked-by: Mans Rullgard <mans@mansr.com>
>Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
>Acked-by: Michal Simek <michal.simek@xilinx.com>
>Acked-by: Neil Armstrong <narmstrong@baylibre.com>
>Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
>Acked-by: Thierry Reding <treding@nvidia.com>
>Reviewed-by: Eric Anholt <eric@anholt.net>
>---
>
>Notes:
>    v3:
>    	- Keep license text for ebc-c384_wdt
>    v2:
>    	- Put back removed copyright texts for meson_gxbb_wdt and coh901327_wdt
>    	- Change to BSD-3-Clause for meson_gxbb_wdt
>    v1: Please have an extra look at meson_gxbb_wdt.c

[...]

>diff --git a/drivers/watchdog/ebc-c384_wdt.c b/drivers/watchdog/ebc-c384_wdt.c
>index 2170b275ea01..4c4c8ce78021 100644
>--- a/drivers/watchdog/ebc-c384_wdt.c
>+++ b/drivers/watchdog/ebc-c384_wdt.c
>@@ -1,3 +1,4 @@
>+// SPDX-License-Identifier: GPL-2.0
> /*
>  * Watchdog timer driver for the WinSystems EBC-C384
>  * Copyright (C) 2016 William Breathitt Gray

For ebc-c384_wdt.c,

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

William Breathitt Gray
