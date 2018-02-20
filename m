From: michal.simek@xilinx.com (Michal Simek)
Date: Tue, 20 Feb 2018 11:14:46 +0100
Subject: [PATCH] watchdog: add SPDX identifiers for watchdog subsystem
In-Reply-To: <20180220093119.23720-1-marcus.folkesson@gmail.com>
References: <20180220093119.23720-1-marcus.folkesson@gmail.com>
Message-ID: <c7eae315-c8b8-3a4c-af1d-f7d713beb7c8@xilinx.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 20.2.2018 10:31, Marcus Folkesson wrote:
> - Add SPDX identifier
> - Remove boiler plate license text
> - If MODULE_LICENSE and boiler plate does not match, go for boiler plate
>   license
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
> 
> Notes:
>     v1: Please have an extra look at meson_gxbb_wdt.c
> 
>  drivers/watchdog/cadence_wdt.c         |  5 +---
>  drivers/watchdog/of_xilinx_wdt.c       |  8 ++---


Acked-by: Michal Simek <michal.simek@xilinx.com> (For cadence_wdt and
of_xilinx_wdt)

Thanks,
Michal
