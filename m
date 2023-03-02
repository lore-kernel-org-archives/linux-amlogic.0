Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9236CC678D4
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Mar 2023 19:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UY/JNqc7UYwVLP916QAxwG6PGLHQtsoP9vvl1W4IaFE=; b=td08KC3NTNn5vY
	MKN2K162+JWu9pXC5JHmFlpmFGeBhn6cGtFIYobgfmIbk9H+OG9g9zxYsZcb9X+CyExzl1DlGy7NJ
	BUA3lCMewG9839VLGk0P2Cgw9PQhOne4GeCf76U4Ca6unD8QbggCHIgW4uDm0+o5CXhNfmQCVohnD
	UVPTLMPaHnbz78JaDThnbyRWmCOePba6+yBpVXGDHtRKWfoIJHsZAOgPFJ0+JupywPBMoJoTAf53p
	k/i/7csm9Oo5AbTvortGymN8/oyAUgkqFMGroK2EJPDolEFcj1tjyLdH0hgfdaOzrUNJwNK6gaIkW
	adwXXvtHqD5rGqT8ghuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXouF-003BjO-Nr; Thu, 02 Mar 2023 19:47:59 +0000
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com ([2a02:2350:5:404::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXou3-003Bg5-Jp
	for linux-amlogic@lists.infradead.org; Thu, 02 Mar 2023 19:47:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=BtNi97NVqmGApn3BCpFm47tB4evorZmaN6Pi5IgjHRY=;
	b=TYQvjvixOf/3rzSA5RmgEfx7465TZ4sZXzQtCp7dAVX3dgOixLCPjD+rbwhqy+CDyF+qXDx1/jUSx
	 rcsdK7CMokFMUVYsTaNX7BG0G+QVYdP9DiUpqrYGRxRZCvK1UsPA+r8d1Ah8sNPtH5fo6e9OidjQjM
	 cShBXyNDlYWFwEe7499JUEKg6hb5tSsiqaVT8jPzzimGo22ryQxRNW9lsNP9V3tJr60ogap68Hft82
	 j7Z2VAram2dQ4f8wUTTwSk/sTr4zxoypWxXn2UJ/rJsdGJ09+rgmt6PH03mGL4u2h6Jl2YL0nn2QHR
	 JYeihHU7gOcMm5Aku6byl6o9rOadexg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=BtNi97NVqmGApn3BCpFm47tB4evorZmaN6Pi5IgjHRY=;
	b=Z7zbinB+9V6oieKcPqyRWSc+qnO8WPOFDAC9HEXYAK2WDzv6DzcUA32mQ0nEibyXIJDKJL+pbTnKq
	 OxtBCqcBQ==
X-HalOne-ID: 155bb931-b933-11ed-8805-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay5 (Halon) with ESMTPSA
	id 155bb931-b933-11ed-8805-7703b0afff57;
	Thu, 02 Mar 2023 19:47:40 +0000 (UTC)
Date: Thu, 2 Mar 2023 20:47:38 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
	andrew@aj.id.au, laurentiu.palcu@oss.nxp.com,
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
	laurent.pinchart@ideasonboard.com, linux-aspeed@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/22] drm/atmel-hlcdc: Use GEM DMA fbdev emulation
Message-ID: <ZAD9WnhAcwAdQPqT@ravnborg.org>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230301153101.4282-6-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_114748_669946_05FBB502 
X-CRM114-Status: GOOD (  15.18  )
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

On Wed, Mar 01, 2023 at 04:30:44PM +0100, Thomas Zimmermann wrote:
> Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> index 4e806b06d35d..29603561d501 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> @@ -19,7 +19,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_fbdev_generic.h>
> +#include <drm/drm_fbdev_dma.h>
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_module.h>
> @@ -760,7 +760,7 @@ static int atmel_hlcdc_dc_drm_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_unload;
>  
> -	drm_fbdev_generic_setup(ddev, 24);
> +	drm_fbdev_dma_setup(ddev, 24);
>  
>  	return 0;
>  
> -- 
> 2.39.2

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
