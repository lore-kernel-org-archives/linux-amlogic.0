Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92607CE8375
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2024 16:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C2yHUAMAbPn3u16IconPVNYhOFjuKxUDJmKUTYxgUtk=; b=Y3QTol4p4URFEd
	DlFQO+BxFPcqfYdLFNzIgAJ3Rl4brgWi5dSUzoCPogwhWDymNZx9VjwyFrHow4I35608hQJBYmpyV
	QuyuN03syCnNQufNojf+Z1rkP8Jszk/CR/237B3X4PPSmYsiyoLO07DbV4dP28RpD9kBbPFytYeAn
	sVcK4IEaWd3b/NYdTcHYH2Fx/Bal69BiZasCnoNu0EqJrsDrX9tnEkyZWgLm3x72Pjott+WFALGKY
	8ilYq/ncYH75sa9Wot1PM79wXJ/FcK0IyG2TUbttBv5bh8xRxqK0SON5riAUe1/PGROGQyQPo8Oj7
	24gFOvlRA8byXBgJ/P1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svJjA-00000000Jce-3cbf;
	Mon, 30 Sep 2024 16:58:28 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svJgy-00000000JHN-3BEk
	for linux-amlogic@lists.infradead.org;
	Mon, 30 Sep 2024 16:56:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1svJgs-0003Pg-7Z; Mon, 30 Sep 2024 18:56:06 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1svJgr-002fvN-Eg; Mon, 30 Sep 2024 18:56:05 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1svJgr-000FXL-1G;
	Mon, 30 Sep 2024 18:56:05 +0200
Message-ID: <01aff9c0f129f8c1cf41c7ae53dac38048aa34a8.camel@pengutronix.de>
Subject: Re: [PATCH v5 8/9] reset: amlogic: split the device core and
 platform probe
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Jiucheng Xu
 <jiucheng.xu@amlogic.com>, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 30 Sep 2024 18:56:05 +0200
In-Reply-To: <1jldzwkpsu.fsf@starbuckisacylon.baylibre.com>
References: <20240910-meson-rst-aux-v5-0-60be62635d3e@baylibre.com>
	 <20240910-meson-rst-aux-v5-8-60be62635d3e@baylibre.com>
	 <8cb81058c8f45e378675e078e296336a2cf74308.camel@pengutronix.de>
	 <1jldzwkpsu.fsf@starbuckisacylon.baylibre.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_095612_802495_1EFCD503 
X-CRM114-Status: GOOD (  24.99  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fr, 2024-09-13 at 08:53 +0200, Jerome Brunet wrote:
> On Thu 12 Sep 2024 at 10:12, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> 
> > On Di, 2024-09-10 at 18:32 +0200, Jerome Brunet wrote:
> > > To prepare the addition of the auxiliary device support, split
> > > out the device coomon functions from the probe of the platform device.
> > > 
> > > The device core function will be common to both the platform and auxiliary
> > > driver.
> > > 
> > > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > > ---
> > >  drivers/reset/amlogic/Kconfig              |   7 +-
> > >  drivers/reset/amlogic/Makefile             |   1 +
> > >  drivers/reset/amlogic/reset-meson-common.c | 121 ++++++++++++++++++++++++++++
> > >  drivers/reset/amlogic/reset-meson.c        | 122 ++++-------------------------
> > >  drivers/reset/amlogic/reset-meson.h        |  24 ++++++
> > >  5 files changed, 167 insertions(+), 108 deletions(-)
> > > 
> > > diff --git a/drivers/reset/amlogic/Kconfig b/drivers/reset/amlogic/Kconfig
> > > index 532e6a4f7865..1d77987088f4 100644
> > > --- a/drivers/reset/amlogic/Kconfig
> > > +++ b/drivers/reset/amlogic/Kconfig
> > > @@ -1,10 +1,15 @@
> > > +config RESET_MESON_COMMON
> > > +	tristate
> > > +	select REGMAP
> > > +
> > >  config RESET_MESON
> > >  	tristate "Meson Reset Driver"
> > >  	depends on ARCH_MESON || COMPILE_TEST
> > >  	default ARCH_MESON
> > >  	select REGMAP_MMIO
> > > +	select RESET_MESON_COMMON
> > >  	help
> > > -	  This enables the reset driver for Amlogic Meson SoCs.
> > > +	  This enables the reset driver for Amlogic SoCs.
> > >  
> > >  config RESET_MESON_AUDIO_ARB
> > >  	tristate "Meson Audio Memory Arbiter Reset Driver"
> > > diff --git a/drivers/reset/amlogic/Makefile b/drivers/reset/amlogic/Makefile
> > > index 55509fc78513..74aaa2fb5e13 100644
> > > --- a/drivers/reset/amlogic/Makefile
> > > +++ b/drivers/reset/amlogic/Makefile
> > > @@ -1,2 +1,3 @@
> > >  obj-$(CONFIG_RESET_MESON) += reset-meson.o
> > > +obj-$(CONFIG_RESET_MESON_COMMON) += reset-meson-common.o
> > >  obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
> > > diff --git a/drivers/reset/amlogic/reset-meson-common.c b/drivers/reset/amlogic/reset-meson-common.c
> > > new file mode 100644
> > > index 000000000000..d57544801ae9
> > > --- /dev/null
> > > +++ b/drivers/reset/amlogic/reset-meson-common.c
> > > @@ -0,0 +1,121 @@
> > > +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> > > +/*
> > > + * Amlogic Meson Reset core functions
> > > + *
> > > + * Copyright (c) 2016-2024 BayLibre, SAS.
> > > + * Authors: Neil Armstrong <narmstrong@baylibre.com>
> > > + *          Jerome Brunet <jbrunet@baylibre.com>
> > > + */
> > > +
> > > +#include <linux/device.h>
> > > +#include <linux/module.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/reset-controller.h>
> > > +
> > > +#include "reset-meson.h"
> > > +
> > > +struct meson_reset {
> > > +	const struct meson_reset_param *param;
> > > +	struct reset_controller_dev rcdev;
> > > +	struct regmap *map;
> > > +};
> > > +
> > > +static void meson_reset_offset_and_bit(struct meson_reset *data,
> > > +				       unsigned long id,
> > > +				       unsigned int *offset,
> > > +				       unsigned int *bit)
> > > +{
> > > +	unsigned int stride = regmap_get_reg_stride(data->map);
> > > +
> > > +	*offset = (id / (stride * BITS_PER_BYTE)) * stride;
> > > +	*bit = id % (stride * BITS_PER_BYTE);
> > > +}
> > > +
> > > +static int meson_reset_reset(struct reset_controller_dev *rcdev,
> > > +			     unsigned long id)
> > 
> > checkpatch --strict complains about the alignment here.
> > I'll fix this up when applying, no need to resend.
> 
> Thanks Philipp.
> 
> FYI, those mis-alignement were already present in the original code and
> there has been comments when I re-indented code while moving it
> around so I did not touch it.

Oh, ok.

I've applied them to reset/next them unchanged, at:
https://git.pengutronix.de/cgit/pza/linux/commit/?id=5b93105afcdc
and sent a follow-up patch to fix the alignment.

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
