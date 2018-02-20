From: vilhelm.gray@gmail.com (William Breathitt Gray)
Date: Tue, 20 Feb 2018 07:49:55 -0500
Subject: [PATCH v2] watchdog: add SPDX identifiers for watchdog subsystem
In-Reply-To: <20180220104542.32286-1-marcus.folkesson@gmail.com>
References: <20180220104542.32286-1-marcus.folkesson@gmail.com>
Message-ID: <20180220124955.GA17814@sophia>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Feb 20, 2018 at 11:45:31AM +0100, Marcus Folkesson wrote:
>- Add SPDX identifier
>- Remove boiler plate license text
>- If MODULE_LICENSE and boiler plate does not match, go for boiler plate
>  license
>
>Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
>Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
>Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
>Acked-by: Michal Simek <michal.simek@xilinx.com>
>---
>
>Notes:
>    v2:
>    	- Put back removed copyright texts for meson_gxbb_wdt and coh901327_wdt
>    	- Change to BSD-3-Clause for meson_gxbb_wdt
>    v1: Please have an extra look at meson_gxbb_wdt.c

[...]

>diff --git a/drivers/watchdog/ebc-c384_wdt.c b/drivers/watchdog/ebc-c384_wdt.c
>index 2170b275ea01..c173b6f5c866 100644
>--- a/drivers/watchdog/ebc-c384_wdt.c
>+++ b/drivers/watchdog/ebc-c384_wdt.c
>@@ -1,15 +1,8 @@
>+// SPDX-License-Identifier: GPL-2.0
> /*
>  * Watchdog timer driver for the WinSystems EBC-C384
>  * Copyright (C) 2016 William Breathitt Gray
>  *
>- * This program is free software; you can redistribute it and/or modify
>- * it under the terms of the GNU General Public License, version 2, as
>- * published by the Free Software Foundation.
>- *
>- * This program is distributed in the hope that it will be useful, but
>- * WITHOUT ANY WARRANTY; without even the implied warranty of
>- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>- * General Public License for more details.
>  */
> #include <linux/device.h>
> #include <linux/dmi.h>

I have no problem with adding a SPDX line to the top of this file, but
use "SPDX-License-Identifier: GPL-2.0-only" as I was very intentional
with the selection of GPL version 2 only when I published this code.

Furthermore, please do not remove the existing copyright text; although
it's just boilerplate for some, I was careful with the selection of
these words, and I worry the SPDX line only -- despite its useful
conciseness -- may lead to misunderstandings about my intentioned
license for this code.

For the time being, I can't Ack this patch with the changes it makes
currently:

        Nacked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

William Breathitt Gray
