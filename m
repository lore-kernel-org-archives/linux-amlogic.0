From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 29 Mar 2017 22:40:02 +0200
Subject: [PATCH] mmc: sdio: fix alignment issue in struct sdio_func
In-Reply-To: <m237dv7s83.fsf@baylibre.com>
References: <b4221ed8-1e85-2b8f-31c6-d57bc86d122e@gmail.com>
 <m237dv7s83.fsf@baylibre.com>
Message-ID: <eb5bf590-1076-e9e9-9dfd-be1eb8e100f5@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am 29.03.2017 um 22:17 schrieb Kevin Hilman:
> Heiner Kallweit <hkallweit1@gmail.com> writes:
> 
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
> This should work too, without the need to do a tiny kmalloc.
> 
> diff --git a/include/linux/mmc/sdio_func.h b/include/linux/mmc/sdio_func.h
> index aab032a6ae61..071addf23931 100644
> --- a/include/linux/mmc/sdio_func.h
> +++ b/include/linux/mmc/sdio_func.h
> @@ -53,7 +53,7 @@ struct sdio_func {
>  	unsigned int		state;		/* function state */
>  #define SDIO_STATE_PRESENT	(1<<0)		/* present in sysfs */
>  
> -	u8			tmpbuf[4];	/* DMA:able scratch buffer */
> +	u8			tmpbuf[4] __aligned(8);	/* DMA:able scratch buffer */
>  
Yes, that's possible too. Actually I wasn't 100% sure whether the alignment
is applied to each member of the array or the array itself. But after a small
test it seems to be applied to the array.

So let's go with this version, thanks for the hint.

Heiner

>  	unsigned		num_info;	/* number of info strings */
>  	const char		**info;		/* info strings */
> 
> Kevin
> 
