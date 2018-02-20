From: Adam.Thomson.Opensource@diasemi.com (Adam Thomson)
Date: Tue, 20 Feb 2018 10:29:12 +0000
Subject: [PATCH] watchdog: add SPDX identifiers for watchdog subsystem
In-Reply-To: <20180220093119.23720-1-marcus.folkesson@gmail.com>
References: <20180220093119.23720-1-marcus.folkesson@gmail.com>
Message-ID: <2E89032DDAA8B9408CB92943514A0337014C1C3ADA@SW-EX-MBX01.diasemi.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 20 February 2018 09:31, Marcus Folkesson wrote:

> - Add SPDX identifier
> - Remove boiler plate license text
> - If MODULE_LICENSE and boiler plate does not match, go for boiler plate
>   license
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

[...]

> diff --git a/drivers/watchdog/da9052_wdt.c b/drivers/watchdog/da9052_wdt.c
> index d6d5006efa71..e263bad99574 100644
> --- a/drivers/watchdog/da9052_wdt.c
> +++ b/drivers/watchdog/da9052_wdt.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0+
>  /*
>   * System monitoring driver for DA9052 PMICs.
>   *
> @@ -5,11 +6,6 @@
>   *
>   * Author: Anthony Olech <Anthony.Olech@diasemi.com>
>   *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
>   */
> 
>  #include <linux/module.h>
> diff --git a/drivers/watchdog/da9055_wdt.c b/drivers/watchdog/da9055_wdt.c
> index 50bdd1022186..26a5b2984094 100644
> --- a/drivers/watchdog/da9055_wdt.c
> +++ b/drivers/watchdog/da9055_wdt.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0+
>  /*
>   * System monitoring driver for DA9055 PMICs.
>   *
> @@ -5,11 +6,6 @@
>   *
>   * Author: David Dajun Chen <dchen@diasemi.com>
>   *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
>   */
> 
>  #include <linux/module.h>
> diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
> index 814dff6045a4..a001782bbfdb 100644
> --- a/drivers/watchdog/da9062_wdt.c
> +++ b/drivers/watchdog/da9062_wdt.c
> @@ -1,16 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0+
>  /*
>   * Watchdog device driver for DA9062 and DA9061 PMICs
>   * Copyright (C) 2015  Dialog Semiconductor Ltd.
>   *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU General Public License
> - * as published by the Free Software Foundation; either version 2
> - * of the License, or (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
>   */
> 
>  #include <linux/kernel.h>
> diff --git a/drivers/watchdog/da9063_wdt.c b/drivers/watchdog/da9063_wdt.c
> index 2a20fc163ed0..b17ac1bb1f28 100644
> --- a/drivers/watchdog/da9063_wdt.c
> +++ b/drivers/watchdog/da9063_wdt.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0+
>  /*
>   * Watchdog driver for DA9063 PMICs.
>   *
> @@ -5,10 +6,6 @@
>   *
>   * Author: Mariusz Wojtasik <mariusz.wojtasik@diasemi.com>
>   *
> - * This program is free software; you can redistribute  it and/or modify it
> - * under  the terms of  the GNU General  Public License as published by the
> - * Free Software Foundation;  either version 2 of the  License, or (at your
> - * option) any later version.
>   */

For Dialog drivers,

Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
