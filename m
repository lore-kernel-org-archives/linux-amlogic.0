From: matthias.bgg@gmail.com (Matthias Brugger)
Date: Tue, 20 Feb 2018 17:26:34 +0100
Subject: [PATCH v2] watchdog: add SPDX identifiers for watchdog subsystem
In-Reply-To: <20180220104542.32286-1-marcus.folkesson@gmail.com>
References: <20180220104542.32286-1-marcus.folkesson@gmail.com>
Message-ID: <c5dece62-c129-fdb2-7e91-dbe587055cc0@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org



On 02/20/2018 11:45 AM, Marcus Folkesson wrote:
> - Add SPDX identifier
> - Remove boiler plate license text
> - If MODULE_LICENSE and boiler plate does not match, go for boiler plate
>   license
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> ---
> 
> Notes:
>     v2:
>     	- Put back removed copyright texts for meson_gxbb_wdt and coh901327_wdt
>     	- Change to BSD-3-Clause for meson_gxbb_wdt
>     v1: Please have an extra look at meson_gxbb_wdt.c
> 
>  drivers/watchdog/acquirewdt.c          |  6 +---

[...]

>  drivers/watchdog/mpc8xxx_wdt.c         |  6 +---
>  drivers/watchdog/mt7621_wdt.c          |  5 +---
>  drivers/watchdog/mtk_wdt.c             | 11 +-------
>  drivers/watchdog/mtx-1_wdt.c           | 11 +-------
>  drivers/watchdog/mv64x60_wdt.c         |  6 ++--

[...]

> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 7ed417a765c7..498e7d4e1b66 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0+
>  /*
>   * Mediatek Watchdog Driver
>   *
> @@ -5,16 +6,6 @@
>   *
>   * Matthias Brugger <matthias.bgg@gmail.com>
>   *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
>   * Based on sunxi_wdt.c
>   */
>  

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
