From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 03 Mar 2017 10:17:07 -0800
Subject: [PATCH v3 1/10] mmc: meson-gx: simplify bounce buffer setting in
 meson_mmc_start_cmd
In-Reply-To: <9259ab6f-fc7e-bcb3-ddd0-5ff3da3b391a@gmail.com> (Heiner
 Kallweit's message of "Wed, 1 Mar 2017 21:20:19 +0100")
References: <583f6496-68a9-b8e1-6b25-1f073f819a3c@gmail.com>
 <m2d1e0zx5l.fsf@baylibre.com>
 <9259ab6f-fc7e-bcb3-ddd0-5ff3da3b391a@gmail.com>
Message-ID: <m2y3wm2pjw.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Heiner Kallweit <hkallweit1@gmail.com> writes:

> Am 01.03.2017 um 19:09 schrieb Kevin Hilman:
>> Hi Heinar,
>> 
>> Heiner Kallweit <hkallweit1@gmail.com> writes:
>> 
>>> Core ensures that there are no commands with cmd->data being set and
>>> nothing to transfer. And we don't have to reset bit CMD_CFG_DATA_NUM
>>> because cmd_cfg was zero-initialized and this bit isn't set.
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>> Acked-by: Kevin Hilman <khilman@baylibre.com>
>> 
>> Could you send this series one more time, collecting the remaining tags
>> and including the patches from Micha? Zegan?
>> 
> Patchwork tracks all the tags coming in for a patch, there it's visible
> that you acked my 10 patches + the two from Michal.

Yes, I'm well aware of how patchwork works, yet my request still stands.

> So I would leave it up to Ulf whether he prefers to have the series
> re-sent (with just the few remaining acks as changes).

That's your choice, but some friendly advice from a kernel maintainer:
making things as easy as possible for maintainers/reviewers greatly
improves speed your code will get merged.

Kevin
