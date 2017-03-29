From: khilman@baylibre.com (Kevin Hilman)
Date: Wed, 29 Mar 2017 15:58:10 -0700
Subject: [PATCH v2] mmc: sdio: fix alignment issue in struct sdio_func
In-Reply-To: <3a6258f3-35e3-e2f5-aa6b-e509f603fa45@gmail.com> (Heiner
 Kallweit's message of "Wed, 29 Mar 2017 22:56:50 +0200")
References: <3a6258f3-35e3-e2f5-aa6b-e509f603fa45@gmail.com>
Message-ID: <m24lyb667x.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Heiner Kallweit <hkallweit1@gmail.com> writes:

> Certain 64-bit systems (e.g. Amlogic Meson GX) require buffers to be
> used for DMA to be 8-byte-aligned. struct sdio_func has an embedded
> small DMA buffer not meeting this requirement.
> Testing an extension to meson-gx driver for switching to descriptor
> chain mode broke SDIO therefore. Aligning tmpbuf to a 8-byte
> boundary fixed the driver behavior.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> Tested-by: Helmut Klein <hgkr.klein@gmail.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Kevin
