From: patrice.chotard@st.com (Patrice CHOTARD)
Date: Wed, 21 Feb 2018 12:37:19 +0000
Subject: [PATCH v3] watchdog: add SPDX identifiers for watchdog subsystem
In-Reply-To: <20180221122744.28300-1-marcus.folkesson@gmail.com>
References: <20180221122744.28300-1-marcus.folkesson@gmail.com>
Message-ID: <9d7e8b4c-f0b5-a99d-aaaa-08d0b85ef06c@st.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

HI Marcus

On 02/21/2018 01:27 PM, Marcus Folkesson wrote:
> - Add SPDX identifier
> - Remove boiler plate license text
> - If MODULE_LICENSE and boiler plate does not match, go for boiler plate
>    license
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Acked-by: Mans Rullgard <mans@mansr.com>
> Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Reviewed-by: Eric Anholt <eric@anholt.net>
> ---
> 
> Notes:
>      v3:
>      	- Keep license text for ebc-c384_wdt
>      v2:
>      	- Put back removed copyright texts for meson_gxbb_wdt and coh901327_wdt
>      	- Change to BSD-3-Clause for meson_gxbb_wdt
>      v1: Please have an extra look at meson_gxbb_wdt.c
> 

[...]

> diff --git a/drivers/watchdog/st_lpc_wdt.c b/drivers/watchdog/st_lpc_wdt.c
> index e6100e447dd8..177829b379da 100644
> --- a/drivers/watchdog/st_lpc_wdt.c
> +++ b/drivers/watchdog/st_lpc_wdt.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0+
>   /*
>    * ST's LPC Watchdog
>    *
> @@ -5,11 +6,6 @@
>    *
>    * Author: David Paris <david.paris@st.com> for STMicroelectronics
>    *         Lee Jones <lee.jones@linaro.org> for STMicroelectronics
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU General Public Licence
> - * as published by the Free Software Foundation; either version
> - * 2 of the Licence, or (at your option) any later version.
>    */
>   


For st_lpc_wdt.c

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
