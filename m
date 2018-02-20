From: ckeepax@opensource.cirrus.com (Charles Keepax)
Date: Tue, 20 Feb 2018 10:20:57 +0000
Subject: [PATCH] watchdog: add SPDX identifiers for watchdog subsystem
In-Reply-To: <20180220093119.23720-1-marcus.folkesson@gmail.com>
References: <20180220093119.23720-1-marcus.folkesson@gmail.com>
Message-ID: <20180220102057.um6g7gykvrnjx2qs@localhost.localdomain>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Feb 20, 2018 at 10:31:08AM +0100, Marcus Folkesson wrote:
> - Add SPDX identifier
> - Remove boiler plate license text
> - If MODULE_LICENSE and boiler plate does not match, go for boiler plate
>   license
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  drivers/watchdog/wm831x_wdt.c          |  5 +---
>  drivers/watchdog/wm8350_wdt.c          |  5 +---

For the Wolfson parts:

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
