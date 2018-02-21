From: tomas.winkler@intel.com (Winkler, Tomas)
Date: Wed, 21 Feb 2018 13:39:35 +0000
Subject: [PATCH v3] watchdog: add SPDX identifiers for watchdog subsystem
In-Reply-To: <20180221122744.28300-1-marcus.folkesson@gmail.com>
References: <20180221122744.28300-1-marcus.folkesson@gmail.com>
Message-ID: <5B8DA87D05A7694D9FA63FD143655C1B9422545A@hasmsx108.ger.corp.intel.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

> 
> - Add SPDX identifier
> - Remove boiler plate license text
> - If MODULE_LICENSE and boiler plate does not match, go for boiler plate
>   license
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
>     v3:
>     	- Keep license text for ebc-c384_wdt
>     v2:
>     	- Put back removed copyright texts for meson_gxbb_wdt and
> coh901327_wdt
>     	- Change to BSD-3-Clause for meson_gxbb_wdt
>     v1: Please have an extra look at meson_gxbb_wdt.c
> 
>   *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms of the GNU General Public License version 2 as published
> - * by the Free Software Foundation.
>   *
> 

>  #include <linux/err.h>
> diff --git a/drivers/watchdog/mei_wdt.c b/drivers/watchdog/mei_wdt.c
> index b8194b02abe0..8023cf28657a 100644
> --- a/drivers/watchdog/mei_wdt.c
> +++ b/drivers/watchdog/mei_wdt.c
> @@ -1,15 +1,7 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Intel Management Engine Interface (Intel MEI) Linux driver
>   * Copyright (c) 2015, Intel Corporation.
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms and conditions of the GNU General Public License,
> - * version 2, as published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope it will be useful, but WITHOUT
> - * ANY WARRANTY; without even the implied warranty of
> MERCHANTABILITY or
> - * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> for
> - * more details.
>   */
> 
>  #include <linux/module.h>
> @@ -687,5 +679,5 @@ static struct mei_cl_driver mei_wdt_driver = {
>  module_mei_cl_driver(mei_wdt_driver);
> 
>  MODULE_AUTHOR("Intel Corporation");
> -MODULE_LICENSE("GPL");
> +MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("Device driver for Intel MEI iAMT watchdog");

Acked-by: Tomas Winkler <tomas.winkler@intel.com>
