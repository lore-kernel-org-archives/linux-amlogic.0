From: mans@mansr.com (=?iso-8859-1?Q?M=E5ns_Rullg=E5rd?=)
Date: Tue, 20 Feb 2018 10:58:59 +0000
Subject: [PATCH v2] watchdog: add SPDX identifiers for watchdog subsystem
In-Reply-To: <20180220104542.32286-1-marcus.folkesson@gmail.com> (Marcus
 Folkesson's message of "Tue, 20 Feb 2018 11:45:31 +0100")
References: <20180220104542.32286-1-marcus.folkesson@gmail.com>
Message-ID: <yw1xvaeskjv0.fsf@mansr.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

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

[...]

>  drivers/watchdog/tangox_wdt.c          |  6 +---

For tangox_wdt:
Acked-by: Mans Rullgard <mans@mansr.com>

-- 
M?ns Rullg?rd
