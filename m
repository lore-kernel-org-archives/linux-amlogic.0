From: mpe@ellerman.id.au (Michael Ellerman)
Date: Fri, 23 Feb 2018 09:38:21 +1100
Subject: [PATCH v3] watchdog: add SPDX identifiers for watchdog subsystem
In-Reply-To: <20180221122744.28300-1-marcus.folkesson@gmail.com>
References: <20180221122744.28300-1-marcus.folkesson@gmail.com>
Message-ID: <87po4wps4i.fsf@concordia.ellerman.id.au>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Marcus Folkesson <marcus.folkesson@gmail.com> writes:
> - Add SPDX identifier
> - Remove boiler plate license text
> - If MODULE_LICENSE and boiler plate does not match, go for boiler plate
>   license
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

<snip>

> diff --git a/drivers/watchdog/wdrtas.c b/drivers/watchdog/wdrtas.c
> index 0240c60d14e3..af07f746b7cc 100644
> --- a/drivers/watchdog/wdrtas.c
> +++ b/drivers/watchdog/wdrtas.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0+
>  /*
>   * FIXME: add wdrtas_get_status and wdrtas_get_boot_status as soon as
>   * RTAS calls are available
> @@ -10,20 +11,6 @@
>   * device driver to exploit watchdog RTAS functions
>   *
>   * Authors : Utz Bacher <utz.bacher@de.ibm.com>
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2, or (at your option)
> - * any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
>   */

LGTM.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
