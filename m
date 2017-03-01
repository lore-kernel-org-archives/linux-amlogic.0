From: khilman@baylibre.com (Kevin Hilman)
Date: Wed, 01 Mar 2017 10:09:42 -0800
Subject: [PATCH v3 1/10] mmc: meson-gx: simplify bounce buffer setting in
 meson_mmc_start_cmd
In-Reply-To: <583f6496-68a9-b8e1-6b25-1f073f819a3c@gmail.com> (Heiner
 Kallweit's message of "Sat, 18 Feb 2017 12:50:31 +0100")
References: <583f6496-68a9-b8e1-6b25-1f073f819a3c@gmail.com>
Message-ID: <m2d1e0zx5l.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Heinar,

Heiner Kallweit <hkallweit1@gmail.com> writes:

> Core ensures that there are no commands with cmd->data being set and
> nothing to transfer. And we don't have to reset bit CMD_CFG_DATA_NUM
> because cmd_cfg was zero-initialized and this bit isn't set.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> Acked-by: Kevin Hilman <khilman@baylibre.com>

Could you send this series one more time, collecting the remaining tags
and including the patches from Micha? Zegan?

I think the MMC maintainers would appreciate one final batch with
everything collected together, and including a cover letter.

Thanks for all your great work on improving this driver,

Kevin
