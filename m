From: jdelvare@suse.de (Jean Delvare)
Date: Wed, 5 Oct 2016 17:17:04 +0200
Subject: [PATCH] i2c: don't print error when adding adapter fails
In-Reply-To: <1470742581-12971-2-git-send-email-wsa-dev@sang-engineering.com>
References: <1470742581-12971-1-git-send-email-wsa-dev@sang-engineering.com>
 <1470742581-12971-2-git-send-email-wsa-dev@sang-engineering.com>
Message-ID: <20161005171704.18fe1b9f@endymion>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue,  9 Aug 2016 13:36:17 +0200, Wolfram Sang wrote:
> The core will do this for us now.
> 
> Signed-off-by: Wolfram Sang <wsa-dev@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-amd756.c         | 5 +----
>  drivers/i2c/busses/i2c-at91.c           | 2 --
>  drivers/i2c/busses/i2c-axxia.c          | 8 +-------
>  drivers/i2c/busses/i2c-bcm-iproc.c      | 8 +-------
>  drivers/i2c/busses/i2c-bcm-kona.c       | 4 +---
>  drivers/i2c/busses/i2c-bfin-twi.c       | 4 +---
>  drivers/i2c/busses/i2c-brcmstb.c        | 4 +---
>  drivers/i2c/busses/i2c-cadence.c        | 4 +---
>  drivers/i2c/busses/i2c-cpm.c            | 4 +---
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c | 4 +---
>  drivers/i2c/busses/i2c-davinci.c        | 4 +---
>  drivers/i2c/busses/i2c-diolan-u2c.c     | 4 +---
>  drivers/i2c/busses/i2c-dln2.c           | 4 +---
>  drivers/i2c/busses/i2c-efm32.c          | 1 -
>  drivers/i2c/busses/i2c-exynos5.c        | 4 +---
>  drivers/i2c/busses/i2c-hix5hd2.c        | 4 +---
>  drivers/i2c/busses/i2c-i801.c           | 1 -
>  drivers/i2c/busses/i2c-ibm_iic.c        | 4 +---
>  drivers/i2c/busses/i2c-img-scb.c        | 4 +---
>  drivers/i2c/busses/i2c-imx.c            | 4 +---
>  drivers/i2c/busses/i2c-isch.c           | 4 +---
>  drivers/i2c/busses/i2c-ismt.c           | 4 +---
>  drivers/i2c/busses/i2c-jz4780.c         | 4 +---
>  drivers/i2c/busses/i2c-lpc2k.c          | 4 +---
>  drivers/i2c/busses/i2c-meson.c          | 1 -
>  drivers/i2c/busses/i2c-mpc.c            | 4 +---
>  drivers/i2c/busses/i2c-mt65xx.c         | 4 +---
>  drivers/i2c/busses/i2c-mxs.c            | 1 -
>  drivers/i2c/busses/i2c-nforce2.c        | 1 -
>  drivers/i2c/busses/i2c-nomadik.c        | 4 +---
>  drivers/i2c/busses/i2c-ocores.c         | 4 +---
>  drivers/i2c/busses/i2c-octeon.c         | 4 +---
>  drivers/i2c/busses/i2c-omap.c           | 4 +---
>  drivers/i2c/busses/i2c-piix4.c          | 1 -
>  drivers/i2c/busses/i2c-pmcmsp.c         | 4 +---
>  drivers/i2c/busses/i2c-pnx.c            | 4 +---
>  drivers/i2c/busses/i2c-puv3.c           | 5 +----
>  drivers/i2c/busses/i2c-pxa.c            | 4 +---
>  drivers/i2c/busses/i2c-rcar.c           | 4 +---
>  drivers/i2c/busses/i2c-riic.c           | 4 +---
>  drivers/i2c/busses/i2c-rk3x.c           | 4 +---
>  drivers/i2c/busses/i2c-s3c2410.c        | 1 -
>  drivers/i2c/busses/i2c-sh7760.c         | 4 +---
>  drivers/i2c/busses/i2c-sh_mobile.c      | 1 -
>  drivers/i2c/busses/i2c-sirf.c           | 4 +---
>  drivers/i2c/busses/i2c-st.c             | 4 +---
>  drivers/i2c/busses/i2c-stu300.c         | 5 +----
>  drivers/i2c/busses/i2c-tegra.c          | 4 +---
>  drivers/i2c/busses/i2c-uniphier-f.c     | 7 +------
>  drivers/i2c/busses/i2c-uniphier.c       | 7 +------
>  drivers/i2c/busses/i2c-wmt.c            | 4 +---
>  drivers/i2c/busses/i2c-xgene-slimpro.c  | 1 -
>  drivers/i2c/busses/i2c-xiic.c           | 1 -
>  drivers/i2c/busses/i2c-xlp9xx.c         | 4 +---
>  drivers/i2c/busses/i2c-xlr.c            | 4 +---
>  55 files changed, 44 insertions(+), 161 deletions(-)
> (...)

I like the idea.

For i2c-amd756, i2c-diolan-u2c, i2c-i801, i2c-isch, i2c-ismt,
i2c-nforce and i2c-piix4:

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
