From: nicolas.ferre@microchip.com (Nicolas Ferre)
Date: Tue, 20 Feb 2018 11:15:52 +0100
Subject: [PATCH] watchdog: add SPDX identifiers for watchdog subsystem
In-Reply-To: <20180220093119.23720-1-marcus.folkesson@gmail.com>
References: <20180220093119.23720-1-marcus.folkesson@gmail.com>
Message-ID: <5a06150c-6ac4-4836-d8fb-cb0a9a0d9561@microchip.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 20/02/2018 at 10:31, Marcus Folkesson wrote:
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
>   drivers/watchdog/acquirewdt.c          |  6 +---

[..]

>   drivers/watchdog/at91rm9200_wdt.c      |  5 +---
>   drivers/watchdog/at91sam9_wdt.c        |  5 +---
>   drivers/watchdog/at91sam9_wdt.h        |  5 +---

For these 3

[..]

>   drivers/watchdog/sama5d4_wdt.c         |  3 +-

And this one:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks, best regards,
-- 
Nicolas Ferre
