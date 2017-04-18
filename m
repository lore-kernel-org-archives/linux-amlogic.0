From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 18 Apr 2017 21:20:23 +0200
Subject: [PATCH] mmc: sdio: fix alignment issue in struct sdio_func
In-Reply-To: <CAPDyKFp88YiDNFHU366RmDxd7GUnPXZ+nRo+0vvSoxFJPUOn=g@mail.gmail.com>
References: <b4221ed8-1e85-2b8f-31c6-d57bc86d122e@gmail.com>
 <CAPDyKFp88YiDNFHU366RmDxd7GUnPXZ+nRo+0vvSoxFJPUOn=g@mail.gmail.com>
Message-ID: <34df9968-6afb-0334-7061-0735f1b9a376@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am 18.04.2017 um 21:15 schrieb Ulf Hansson:
> On 29 March 2017 at 20:54, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>> Certain 64-bit systems (e.g. Amlogic Meson GX) require buffers to be
>> used for DMA to be 8-byte-aligned. struct sdio_func has an embedded
>> small DMA buffer not meeting this requirement.
>> When testing switching to descriptor chain mode in meson-gx driver
>> SDIO is broken therefore. Fix this by allocating the small DMA buffer
>> separately as kmalloc ensures that the returned memory area is
>> properly aligned for every basic data type.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> Tested-by: Helmut Klein <hgkr.klein@gmail.com>
> 
> Heiner, sorry for the delay!
> 
> I decided to pick this first version as it is more consistent for how
> we deal with DMA friendly buffers in the core.
> 
I also like it more, it's a little more overhead but cleaner.
Thanks a lot!

> Thanks, applied for fixes!
> 
> Kind regards
> Uffe
> 
>> ---
>>  drivers/mmc/core/sdio_bus.c   | 12 +++++++++++-
>>  include/linux/mmc/sdio_func.h |  2 +-
>>  2 files changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mmc/core/sdio_bus.c b/drivers/mmc/core/sdio_bus.c
>> index e992a7f8..2b32b889 100644
>> --- a/drivers/mmc/core/sdio_bus.c
>> +++ b/drivers/mmc/core/sdio_bus.c
>> @@ -267,7 +267,7 @@ static void sdio_release_func(struct device *dev)
>>         sdio_free_func_cis(func);
>>
>>         kfree(func->info);
>> -
>> +       kfree(func->tmpbuf);
>>         kfree(func);
>>  }
>>
>> @@ -282,6 +282,16 @@ struct sdio_func *sdio_alloc_func(struct mmc_card *card)
>>         if (!func)
>>                 return ERR_PTR(-ENOMEM);
>>
>> +       /*
>> +        * allocate buffer separately to make sure it's properly aligned for
>> +        * DMA usage (incl. 64 bit DMA)
>> +        */
>> +       func->tmpbuf = kmalloc(4, GFP_KERNEL);
>> +       if (!func->tmpbuf) {
>> +               kfree(func);
>> +               return ERR_PTR(-ENOMEM);
>> +       }
>> +
>>         func->card = card;
>>
>>         device_initialize(&func->dev);
>> diff --git a/include/linux/mmc/sdio_func.h b/include/linux/mmc/sdio_func.h
>> index aab032a6..97ca1053 100644
>> --- a/include/linux/mmc/sdio_func.h
>> +++ b/include/linux/mmc/sdio_func.h
>> @@ -53,7 +53,7 @@ struct sdio_func {
>>         unsigned int            state;          /* function state */
>>  #define SDIO_STATE_PRESENT     (1<<0)          /* present in sysfs */
>>
>> -       u8                      tmpbuf[4];      /* DMA:able scratch buffer */
>> +       u8                      *tmpbuf;        /* DMA:able scratch buffer */
>>
>>         unsigned                num_info;       /* number of info strings */
>>         const char              **info;         /* info strings */
>> --
>> 2.12.1
>>
> 
