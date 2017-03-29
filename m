From: khilman@baylibre.com (Kevin Hilman)
Date: Wed, 29 Mar 2017 13:17:32 -0700
Subject: [PATCH] mmc: sdio: fix alignment issue in struct sdio_func
In-Reply-To: <b4221ed8-1e85-2b8f-31c6-d57bc86d122e@gmail.com> (Heiner
 Kallweit's message of "Wed, 29 Mar 2017 20:54:37 +0200")
References: <b4221ed8-1e85-2b8f-31c6-d57bc86d122e@gmail.com>
Message-ID: <m237dv7s83.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Heiner Kallweit <hkallweit1@gmail.com> writes:

> Certain 64-bit systems (e.g. Amlogic Meson GX) require buffers to be
> used for DMA to be 8-byte-aligned. struct sdio_func has an embedded
> small DMA buffer not meeting this requirement.
> When testing switching to descriptor chain mode in meson-gx driver
> SDIO is broken therefore. Fix this by allocating the small DMA buffer
> separately as kmalloc ensures that the returned memory area is
> properly aligned for every basic data type.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> Tested-by: Helmut Klein <hgkr.klein@gmail.com>

This should work too, without the need to do a tiny kmalloc.

diff --git a/include/linux/mmc/sdio_func.h b/include/linux/mmc/sdio_func.h
index aab032a6ae61..071addf23931 100644
--- a/include/linux/mmc/sdio_func.h
+++ b/include/linux/mmc/sdio_func.h
@@ -53,7 +53,7 @@ struct sdio_func {
 	unsigned int		state;		/* function state */
 #define SDIO_STATE_PRESENT	(1<<0)		/* present in sysfs */
 
-	u8			tmpbuf[4];	/* DMA:able scratch buffer */
+	u8			tmpbuf[4] __aligned(8);	/* DMA:able scratch buffer */
 
 	unsigned		num_info;	/* number of info strings */
 	const char		**info;		/* info strings */

Kevin
