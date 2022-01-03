Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41A6C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jan 2022 11:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ll5mMPPWAmcxC5bNIwfwSPdeySaDuUXhBy3kYVm8EeM=; b=3uza2iywmdY+URvHyA7eiDIUAG
	NffXhm5IKuO+KwfQ7qRGZ0xG318Ac0rg2wqQlCdPzxJ0etxImsWnpX0hJ0+yxJ0BcjloSGEIOP8bs
	HokbKfUGT7qP8Ujh1Gg2DFI2sN2GC1PaknND5RwtH4f8vaTiVp6jbr4lUXng7WLHhKRaSWZ540bDT
	xHvpRoAbHGjyDg6eYTRgu3NkiXa47iZKsy6pTqYE3K/4ov0onpxu0XcoO7FOiA0Ci6GQiVOi0u1Qv
	ulKGUSI2sTVc3XD37KWjlAATD7Gkp5t7/e29ZNIyiztZkAME4iEPh//z6SokfKyKT8LFYnTAiXRWI
	FoqIiCVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4LRh-008rQ5-5X; Mon, 03 Jan 2022 11:24:09 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4LRe-008rN8-D6
 for linux-amlogic@lists.infradead.org; Mon, 03 Jan 2022 11:24:08 +0000
Received: by mail-wr1-x435.google.com with SMTP id o3so11080414wrh.10
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jan 2022 03:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2dv9Hcmjjw1FzIuVQIEUrbWYPOhjppSzFw4j3ji+cvw=;
 b=p1A8zhsW34Y6hfKcU3Cl6FKoAaCWBqChoRCCXmx02JjKsR37084KYg2ghbLSYQqzCO
 zfl5V4ZgDlIW+vSMlPCHHP2mMf/Q9f75sh968W4crfS3Ycausn9uUZyInMD+C9Y4uaoy
 vx5c9pTDm0IXYIBkWyK5Y1v98e5B54/hLx5FeH5r7eZQY0Um8nNbeJGg1RDAlWDG6+MW
 MReiqHK4O2qSrt5dJ7vepMhMDd94Nk+dL8hl0PYuSA59WXLyIbTSS5ya8Zk+viqKdEPw
 GAHOYHjzBP2whw7jlIdXm5AtPCbkwWM49VMVQMGo4v/ob01dc/ZRXuKICdK1RWKsZua2
 oHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2dv9Hcmjjw1FzIuVQIEUrbWYPOhjppSzFw4j3ji+cvw=;
 b=vylgVxM9qzvEtzDNdZ+dxUi7X8MS0x89CQP8R96svLslQuRCVReAgXdl93ztF9iUq/
 UwS1b2P9T5wajuTJOjLDNuNrPn15Ai0hY5/NWQueCxKg3vbwh6NjHB1HTGKsiW+BeXnE
 RN1D8acFu4Vjt+IN4RSGvfJ5xB4Y4GglukwMnxKaD8keD9YEAlWrTG0A2QSyJ4mK3h6O
 W4pn+KWBNtTSC+4wW8EMd+BS/LeNtBy3VxUAfmx6LYRmIouS7DrVB+L69RE+SaZI16au
 Xo+8iq37ynsroV63uXDT5Qjzb1TYfrYYqvadm2zH7T3hQROb7h0LWe8eJrsIWIyoNS8S
 89xw==
X-Gm-Message-State: AOAM530rCvjZcMtIsKww/FDXH55Fi1VocRgQPe0eHr8iZV2QF1/+8oDz
 KrRKDPY5+Q8Pf3p9Sge4XkYM0A==
X-Google-Smtp-Source: ABdhPJxqIDs6Gfcxd5z3nw52PWsAzBuULElaTR3XlFu5xQkEIITr8wmCYJ5y4bKPzOY3ZSaSYrpN+Q==
X-Received: by 2002:a5d:648b:: with SMTP id o11mr36907792wri.227.1641209041965; 
 Mon, 03 Jan 2022 03:24:01 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:7c9d:a967:38e2:5220?
 ([2001:861:44c0:66c0:7c9d:a967:38e2:5220])
 by smtp.gmail.com with ESMTPSA id z5sm33695129wru.87.2022.01.03.03.24.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 03:24:01 -0800 (PST)
Subject: Re: [PATCH 1/2] drm/meson: osd_afbcd: Add an exit callback to struct
 meson_afbcd_ops
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20211230235515.1627522-1-martin.blumenstingl@googlemail.com>
 <20211230235515.1627522-2-martin.blumenstingl@googlemail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <4a4b40fd-b9d7-b38d-b4d4-4aaaf03693f2@baylibre.com>
Date: Mon, 3 Jan 2022 12:24:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211230235515.1627522-2-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_032406_503052_D8056BF7 
X-CRM114-Status: GOOD (  20.67  )
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

On 31/12/2021 00:55, Martin Blumenstingl wrote:
> Use this to simplify the driver shutdown. It will also come handy when
> fixing the error handling in meson_drv_bind_master().
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/gpu/drm/meson/meson_drv.c       |  6 ++--
>  drivers/gpu/drm/meson/meson_osd_afbcd.c | 41 ++++++++++++++++---------
>  drivers/gpu/drm/meson/meson_osd_afbcd.h |  1 +
>  3 files changed, 30 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 80f1d439841a..b919271a6e50 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -385,10 +385,8 @@ static void meson_drv_unbind(struct device *dev)
>  	free_irq(priv->vsync_irq, drm);
>  	drm_dev_put(drm);
>  
> -	if (priv->afbcd.ops) {
> -		priv->afbcd.ops->reset(priv);
> -		meson_rdma_free(priv);
> -	}
> +	if (priv->afbcd.ops)
> +		priv->afbcd.ops->exit(priv);
>  }
>  
>  static const struct component_master_ops meson_drv_master_ops = {
> diff --git a/drivers/gpu/drm/meson/meson_osd_afbcd.c b/drivers/gpu/drm/meson/meson_osd_afbcd.c
> index ffc6b584dbf8..0cdbe899402f 100644
> --- a/drivers/gpu/drm/meson/meson_osd_afbcd.c
> +++ b/drivers/gpu/drm/meson/meson_osd_afbcd.c
> @@ -79,11 +79,6 @@ static bool meson_gxm_afbcd_supported_fmt(u64 modifier, uint32_t format)
>  	return meson_gxm_afbcd_pixel_fmt(modifier, format) >= 0;
>  }
>  
> -static int meson_gxm_afbcd_init(struct meson_drm *priv)
> -{
> -	return 0;
> -}
> -
>  static int meson_gxm_afbcd_reset(struct meson_drm *priv)
>  {
>  	writel_relaxed(VIU_SW_RESET_OSD1_AFBCD,
> @@ -93,6 +88,16 @@ static int meson_gxm_afbcd_reset(struct meson_drm *priv)
>  	return 0;
>  }
>  
> +static int meson_gxm_afbcd_init(struct meson_drm *priv)
> +{
> +	return 0;
> +}
> +
> +static void meson_gxm_afbcd_exit(struct meson_drm *priv)
> +{
> +	meson_gxm_afbcd_reset(priv);
> +}
> +
>  static int meson_gxm_afbcd_enable(struct meson_drm *priv)
>  {
>  	writel_relaxed(FIELD_PREP(OSD1_AFBCD_ID_FIFO_THRD, 0x40) |
> @@ -172,6 +177,7 @@ static int meson_gxm_afbcd_setup(struct meson_drm *priv)
>  
>  struct meson_afbcd_ops meson_afbcd_gxm_ops = {
>  	.init = meson_gxm_afbcd_init,
> +	.exit = meson_gxm_afbcd_exit,
>  	.reset = meson_gxm_afbcd_reset,
>  	.enable = meson_gxm_afbcd_enable,
>  	.disable = meson_gxm_afbcd_disable,
> @@ -269,6 +275,18 @@ static bool meson_g12a_afbcd_supported_fmt(u64 modifier, uint32_t format)
>  	return meson_g12a_afbcd_pixel_fmt(modifier, format) >= 0;
>  }
>  
> +static int meson_g12a_afbcd_reset(struct meson_drm *priv)
> +{
> +	meson_rdma_reset(priv);
> +
> +	meson_rdma_writel_sync(priv, VIU_SW_RESET_G12A_AFBC_ARB |
> +			       VIU_SW_RESET_G12A_OSD1_AFBCD,
> +			       VIU_SW_RESET);
> +	meson_rdma_writel_sync(priv, 0, VIU_SW_RESET);
> +
> +	return 0;
> +}
> +
>  static int meson_g12a_afbcd_init(struct meson_drm *priv)
>  {
>  	int ret;
> @@ -286,16 +304,10 @@ static int meson_g12a_afbcd_init(struct meson_drm *priv)
>  	return 0;
>  }
>  
> -static int meson_g12a_afbcd_reset(struct meson_drm *priv)
> +static void meson_g12a_afbcd_exit(struct meson_drm *priv)
>  {
> -	meson_rdma_reset(priv);
> -
> -	meson_rdma_writel_sync(priv, VIU_SW_RESET_G12A_AFBC_ARB |
> -			       VIU_SW_RESET_G12A_OSD1_AFBCD,
> -			       VIU_SW_RESET);
> -	meson_rdma_writel_sync(priv, 0, VIU_SW_RESET);
> -
> -	return 0;
> +	meson_g12a_afbcd_reset(priv);
> +	meson_rdma_free(priv);
>  }
>  
>  static int meson_g12a_afbcd_enable(struct meson_drm *priv)
> @@ -380,6 +392,7 @@ static int meson_g12a_afbcd_setup(struct meson_drm *priv)
>  
>  struct meson_afbcd_ops meson_afbcd_g12a_ops = {
>  	.init = meson_g12a_afbcd_init,
> +	.exit = meson_g12a_afbcd_exit,
>  	.reset = meson_g12a_afbcd_reset,
>  	.enable = meson_g12a_afbcd_enable,
>  	.disable = meson_g12a_afbcd_disable,
> diff --git a/drivers/gpu/drm/meson/meson_osd_afbcd.h b/drivers/gpu/drm/meson/meson_osd_afbcd.h
> index 5e5523304f42..e77ddeb6416f 100644
> --- a/drivers/gpu/drm/meson/meson_osd_afbcd.h
> +++ b/drivers/gpu/drm/meson/meson_osd_afbcd.h
> @@ -14,6 +14,7 @@
>  
>  struct meson_afbcd_ops {
>  	int (*init)(struct meson_drm *priv);
> +	void (*exit)(struct meson_drm *priv);
>  	int (*reset)(struct meson_drm *priv);
>  	int (*enable)(struct meson_drm *priv);
>  	int (*disable)(struct meson_drm *priv);
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks for fixing this

Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
