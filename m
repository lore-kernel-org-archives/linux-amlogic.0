From: webczat@webczatnet.pl (=?UTF-8?Q?Micha=c5=82_Zegan?=)
Date: Thu, 16 Feb 2017 15:48:00 +0100
Subject: [PATCH 0/2] mmc: meson-gx: fix mmc module unloading
In-Reply-To: <20170216143955.1233-1-webczat@webczatnet.pl>
References: <20170216143955.1233-1-webczat@webczatnet.pl>
Message-ID: <7318e9b7-79cc-3703-074b-8d9ccb50fbd6@webczatnet.pl>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Sorry, did not send the whole patch series and have to resend.


W dniu 16.02.2017 o 15:39, Micha? Zegan pisze:
> This patch series fixes mmc driver unloading.
> Previously, unloading meson-gx-mmc module would trigger kernel warnings.
>
> Micha? Zegan (2):
>   mmc: meson-gx: prevent cfg_div_clk from being disabled on init
>   mmc: meson-gx: remove mmc host on device removal
>
>  drivers/mmc/host/meson-gx-mmc.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
