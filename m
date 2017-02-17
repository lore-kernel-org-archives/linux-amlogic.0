From: webczat@webczatnet.pl (=?UTF-8?Q?Micha=c5=82_Zegan?=)
Date: Fri, 17 Feb 2017 20:49:23 +0100
Subject: [PATCH 1/2] mmc: meson-gx: prevent cfg_div_clk from being
 disabled on init
In-Reply-To: <m2k28o61qj.fsf@baylibre.com>
References: <20170216145222.1577-1-webczat@webczatnet.pl>
 <20170216145222.1577-2-webczat@webczatnet.pl> <m2k28o61qj.fsf@baylibre.com>
Message-ID: <a7ea0b57-efa0-58a5-92d5-8bc97f357f4c@webczatnet.pl>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org



W dniu 17.02.2017 o 20:44, Kevin Hilman pisze:
> Micha? Zegan <webczat@webczatnet.pl> writes:
>
>> At the end of function meson_mmc_clk_init, the cfg_div clock was
>> prepared, enabled and configured, but then immediately disabled due to bogus if statements.
>> That made later calls to clk_disable_unprepare executed during module removal to fail with a kernel warning.
>> Fix that by changing the code to disable clock only when it failed to be configured.
>>
>> Signed-off-by: Micha? Zegan <webczat@webczatnet.pl>
> I believe this one is not needed any more after Heiner's cleanups?
I think it is not needed, yes.
>
> Kevin
