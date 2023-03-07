Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099F9C76195
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Mar 2023 16:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:Message-ID:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mCq9v/jbSIuCJPWHRXctzflcAdI9dIM+k8VYVsFfaZE=; b=WdSWT4VEI2w2xy
	1GimFMxsKEg1iBpKdSBObuUKqU1tjgCncqfHee40IGW9xoBRDozb7sRL6PcamgV8Mype0/K8F5/df
	lFPTisLUy9sNXU27qEQdbtBor5O6W7nNL9vIiOihrCcV+ugz+SCda/OL2dPiCmrnxdT6cORTpZc9V
	BedLa5eye8uTrl9S1VBuspYutgdNRvL4Q2ezMPFu/bL7lGswRDXDN7CzZ5TDHSMdbTbPFFTa8cf6H
	Lvk33UiiHxlOnwal5kjM+JzVJ4jn/AxbvlsATqKfKdlkRb2akuK/vhJRkEI3Mru+LasSZVxQvxUEV
	lYIfBL3ZGpX+NZgwvs9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdvUc-006yrT-2G;
	Sun, 19 Mar 2023 16:02:46 +0000
Received: from mail.kapsi.fi ([2001:67c:1be8::25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXz7-000eZy-RG; Tue, 07 Mar 2023 14:08:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:Cc:To:Message-ID:From:Content-Transfer-Encoding:
	Content-Type:Date:MIME-Version:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5DMLJzQKqdF6oeNoZF8t9+eClq9ynzLjSSrN4tmUXPA=; b=BXjkskeT2aCDjWBkFBi1gJSE0o
	KxttfCw6RT9DA1gOSi4J8shGJu4zeme59ibiNNsvkb2rcdRzl+RzXgjtRJUQHlpW9ES6pOJXlcMkQ
	1YUunvfpuepMFk47fKFBEH+mHsl/MVkWXlkZMKwvtMZzfk5wOgCVTk5Dy+lPayv9jc9+Cq1I4kveh
	sRcaJZ6kguPGCQxRbtimP/mOXWCLp6qzl6IBCYsIw0WnrMvQuWcqIHof8zj4Mvy/2HNbKpmJr3vt2
	GfvjpvMMFUnBZZSI07Rxijc/DJ7u8UP3CCDrVyYwjMBmB67yAbqwP2ef5iI8eloeedS7kNS9dDn/k
	F60VybOw==;
Received: from [2001:67c:1be8::200] (helo=rainloop.kapsi.fi)
	by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sarha@kapsi.fi>)
	id 1pZXxt-005UaU-Pn; Tue, 07 Mar 2023 16:06:54 +0200
MIME-Version: 1.0
Date: Tue, 07 Mar 2023 14:06:52 +0000
From: sarha@kapsi.fi
Message-ID: <25a439e6a6d58701e5a73b33ed0d7a4a0d9a68e2@kapsi.fi>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, andrew@aj.id.au, laurentiu.palcu@oss.nxp.com,
 l.stach@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 p.zabel@pengutronix.de, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, alain.volmat@foss.st.com,
 yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, jernej.skrabec@gmail.com,
 samuel@sholland.org, jyri.sarha@iki.fi, tomba@kernel.org,
 linus.walleij@linaro.org, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
X-SA-Exim-Connect-IP: 2001:67c:1be8::200
X-SA-Exim-Mail-From: sarha@kapsi.fi
Subject: Re: [PATCH 18/22] drm/tilcdc: Use GEM DMA fbdev emulation
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_060810_291418_716B5880 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Sun, 19 Mar 2023 09:02:32 -0700
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

March 1, 2023 at 5:30 PM, "Thomas Zimmermann" <tzimmermann@suse.de mailto:tzimmermann@suse.de?to=%22Thomas%20Zimmermann%22%20%3Ctzimmermann%40suse.de%3E > wrote:

> 
> Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> 

Acked-by: Jyri Sarha <jyri.s

> 
> ---
> drivers/gpu/drm/tilcdc/tilcdc_drv.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> index 4ca426007dc8..fe56beea3e93 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> @@ -16,7 +16,7 @@
> #include <drm/drm_atomic_helper.h>
> #include <drm/drm_debugfs.h>
> #include <drm/drm_drv.h>
> -#include <drm/drm_fbdev_generic.h>
> +#include <drm/drm_fbdev_dma.h>
> #include <drm/drm_fourcc.h>
> #include <drm/drm_gem_dma_helper.h>
> #include <drm/drm_gem_framebuffer_helper.h>
> @@ -384,7 +384,7 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
> goto init_failed;
> priv->is_registered = true;
> 
> - drm_fbdev_generic_setup(ddev, bpp);
> + drm_fbdev_dma_setup(ddev, bpp);
> return 0;
> 
> init_failed:
> -- 
> 2.39.2
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
