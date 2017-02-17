From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 17 Feb 2017 15:03:34 -0800
Subject: [PATCH 2/2] mmc: meson-gx: remove mmc host on device removal
In-Reply-To: <171193cd-e82d-695a-22b3-c10d670baad7@webczatnet.pl>
 (=?utf-8?Q?=22Micha=C5=82?=
 Zegan"'s message of "Fri, 17 Feb 2017 20:50:55 +0100")
References: <20170216145222.1577-1-webczat@webczatnet.pl>
 <20170216145222.1577-3-webczat@webczatnet.pl>
 <m2fujc61mu.fsf@baylibre.com>
 <171193cd-e82d-695a-22b3-c10d670baad7@webczatnet.pl>
Message-ID: <m24lzs5sjd.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Micha? Zegan <webczat@webczatnet.pl> writes:

> W dniu 17.02.2017 o 20:47, Kevin Hilman pisze:
>> Micha? Zegan <webczat@webczatnet.pl> writes:
>>
>>> The mmc host was added in meson_mmc_probe, but never removed in meson_mmc_remove.
>>> Fix that by removing the host before deallocating other resources.
>>>
>>> Signed-off-by: Micha? Zegan <webczat@webczatnet.pl>
>> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
>
> I do not know how the mmc driver looks like after Heiner's cleanup. Does
> this patch get obsoleted by the prior cleanup, or conflict with it in
> some way?

It's not obsoleted, as I don't think Heiner's series fixes this problem,
but it may have minor conflicts.

I suggest you rebase this patch on top of Heiner's v2 to double check,
and resend if necessary, noting in the patch (after the '---') what it
applies on top of so that the MMC maintainers don't have to figure it
out.

Thanks,

Kevin

>>
>>> ---
>>>  drivers/mmc/host/meson-gx-mmc.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
>>> index d444b6bfa02b..bb83446118a3 100644
>>> --- a/drivers/mmc/host/meson-gx-mmc.c
>>> +++ b/drivers/mmc/host/meson-gx-mmc.c
>>> @@ -818,6 +818,8 @@ static int meson_mmc_remove(struct platform_device *pdev)
>>>  	if (WARN_ON(!host))
>>>  		return 0;
>>>  
>>> +	mmc_remove_host(host->mmc);
>>> +
>>>  	if (host->bounce_buf)
>>>  		dma_free_coherent(host->dev, host->bounce_buf_size,
>>>  				  host->bounce_buf, host->bounce_dma_addr);
