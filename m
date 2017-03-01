From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 1 Mar 2017 21:20:19 +0100
Subject: [PATCH v3 1/10] mmc: meson-gx: simplify bounce buffer setting in
 meson_mmc_start_cmd
In-Reply-To: <m2d1e0zx5l.fsf@baylibre.com>
References: <583f6496-68a9-b8e1-6b25-1f073f819a3c@gmail.com>
 <m2d1e0zx5l.fsf@baylibre.com>
Message-ID: <9259ab6f-fc7e-bcb3-ddd0-5ff3da3b391a@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am 01.03.2017 um 19:09 schrieb Kevin Hilman:
> Hi Heinar,
> 
> Heiner Kallweit <hkallweit1@gmail.com> writes:
> 
>> Core ensures that there are no commands with cmd->data being set and
>> nothing to transfer. And we don't have to reset bit CMD_CFG_DATA_NUM
>> because cmd_cfg was zero-initialized and this bit isn't set.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> Acked-by: Kevin Hilman <khilman@baylibre.com>
> 
> Could you send this series one more time, collecting the remaining tags
> and including the patches from Micha? Zegan?
> 
Patchwork tracks all the tags coming in for a patch, there it's visible
that you acked my 10 patches + the two from Michal.
So I would leave it up to Ulf whether he prefers to have the series
re-sent (with just the few remaining acks as changes).

Heiner

> I think the MMC maintainers would appreciate one final batch with
> everything collected together, and including a cover letter.
> 
> Thanks for all your great work on improving this driver,
> 
> Kevin
> 
