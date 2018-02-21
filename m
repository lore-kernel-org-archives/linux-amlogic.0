From: patrice.chotard@st.com (Patrice CHOTARD)
Date: Wed, 21 Feb 2018 12:34:44 +0000
Subject: [PATCH] watchdog: add SPDX identifiers for watchdog subsystem
In-Reply-To: <20180220093119.23720-1-marcus.folkesson@gmail.com>
References: <20180220093119.23720-1-marcus.folkesson@gmail.com>
Message-ID: <9cf6fba8-7708-bbb3-1586-e195a2b440c6@st.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Marcus

On 02/20/2018 10:31 AM, Marcus Folkesson wrote:
> - Add SPDX identifier
> - Remove boiler plate license text
> - If MODULE_LICENSE and boiler plate does not match, go for boiler plate
>    license
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
> 
> Notes:
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
