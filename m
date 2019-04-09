Return-Path: <SRS0=8EGG=SL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6A3C10F0E
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2019 08:43:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3DAC20663
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2019 08:43:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vr/yKSYY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1xCaqXat"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3DAC20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DSWNuWh7qOH9CGBsmSDLh7Q0OH4GUm1Zre5tG3oPXNE=; b=Vr/yKSYYUeSQMc
	khVuH3wI8Kw4A1+t21nkaRvdIIsOaHFEvuSSJoimClntiYcjenm5TtSLvVZZQ/2MnbFGiKe8hvmz0
	dvwbL1O+LfULO5YU+zY8lELKW/JOHw5EflKllDPG40mcv+B6iO24ot7/SJ/q5rJx53ODUYzEdoxtJ
	UWsDpBTFzkny1QYlaeMlsdqcoowsJn3nq8kEmLgvIJ/3Tj80kUTMIQRG8EvtC5lL7cGdv4KYbDWAl
	+OH6ZG2Vd5Ep/RxEkH768W6X8aDzHlN9uQAiCrhQsxyM5gzISvAUM/cXzjsxLJqIaZ1jh/VlXMVDZ
	T6ktwCJCImHEEpHsFs/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDmLZ-0007Ey-9K; Tue, 09 Apr 2019 08:43:13 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDmLW-0007EV-D8
 for linux-amlogic@lists.infradead.org; Tue, 09 Apr 2019 08:43:11 +0000
Received: by mail-wr1-x444.google.com with SMTP id y13so19731989wrd.3
 for <linux-amlogic@lists.infradead.org>; Tue, 09 Apr 2019 01:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=KAZxw+3mOFVwbslpEdHkWVoUlhDM2ubwqAkMagRw97E=;
 b=1xCaqXatmKFPyJXfGBXDjJ1e1XWRSLnrb7VpGmKew7uBjpdMfNqUXEl7LwDTrjaUti
 RVEMEKu8kWtxYo2CGPfC1nWYAgCCsjMUku1ZB4eoLy/E0QyjNvY1nR3J7aFK8Qwvuxlz
 Z0r07xADbQdYJbBfpYoZ30U8AX2//zyGw1969wj/GOwzx/vcHMR7KU4RCBySA2OWqMFr
 RdeZENQzMybkSYGRQQ3g6CxF/BFrturs3B1zNjHLgysLkEJwqbi5OulnSjw5SoHPGQxo
 mRMYHeVbrTGRrEjLt1KMqilQjsMGqgmtd2DWN2D+cKOcqkJBCPRiqGy+egyGopAT9ejS
 BAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=KAZxw+3mOFVwbslpEdHkWVoUlhDM2ubwqAkMagRw97E=;
 b=V2YsjzNaRqy8Y3Ohuy652PEdLxpIWQHK71ASGUfWSTz935fhsRZ5Z0tC4FNbqSgsgo
 FyS4ZcWS7IVJnuwjarDo3ofiYC4fZBlZ3hW1mYLugbricXB8xFloSNH8GmsAO0CtdsbU
 qbyF5llPreDZOKw5GfV3mxF/U7ftiLjgO5W/2LDhpOvOKa/lxUUp6jQdKTnIyox+ghD/
 7dcwUdhpCuFb4IfRq3JWSj5sx1q2bNU/WuhcxHmdRuvVoHIYqFnzv8C1Ab8FbSuMeHO8
 2/RsHymx+CPqdDEJC9nMAP5i1XPMEY91kfPdU6oTe8U6BfMx7lJJO2VMuYP15bUA5lln
 gZpQ==
X-Gm-Message-State: APjAAAW2E/QkI3M4n4sHQ83ktzJRqCKX7z8ng5efHosnMQJ0rUDkYfSg
 I3B0wYmuopw35+C7sNO/8KkRsVZaZDA=
X-Google-Smtp-Source: APXvYqyVVNJbXKW6iCvbL43NrgEMaRl3RcrJGfAs90s9HE81BilJhEohbQ/3sGcGn5RWjXClnLZ37Q==
X-Received: by 2002:adf:f78c:: with SMTP id q12mr450173wrp.172.1554799388599; 
 Tue, 09 Apr 2019 01:43:08 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 c20sm60034366wre.28.2019.04.09.01.43.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Apr 2019 01:43:07 -0700 (PDT)
Message-ID: <e5199bf4ff4a125414a8843ab4be0eb641ac5d91.camel@baylibre.com>
Subject: Re: [PATCH 08/11] drm/meson: Add G12A support for CVBS Encoer
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
Date: Tue, 09 Apr 2019 10:43:06 +0200
In-Reply-To: <20190325141824.21259-9-narmstrong@baylibre.com>
References: <20190325141824.21259-1-narmstrong@baylibre.com>
 <20190325141824.21259-9-narmstrong@baylibre.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_014310_441641_15693A25 
X-CRM114-Status: GOOD (  17.71  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 2019-03-25 at 15:18 +0100, Neil Armstrong wrote:
> The Meson G12A SoCs uses the exact same CVBS encoder except a simple
> CVBS DAC register offset and settings delta.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/meson/meson_venc.c      | 11 +++++++++--
>  drivers/gpu/drm/meson/meson_venc_cvbs.c | 25 ++++++++++++++++++-------
>  2 files changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
> index 66d73a932d19..6faca7313339 100644
> --- a/drivers/gpu/drm/meson/meson_venc.c
> +++ b/drivers/gpu/drm/meson/meson_venc.c
> @@ -73,7 +73,9 @@
>  /* HHI Registers */
>  #define HHI_GCLK_MPEG2		0x148 /* 0x52 offset in data sheet */
>  #define HHI_VDAC_CNTL0		0x2F4 /* 0xbd offset in data sheet */
> +#define HHI_VDAC_CNTL0_G12A	0x2EC /* 0xbd offset in data sheet */
>  #define HHI_VDAC_CNTL1		0x2F8 /* 0xbe offset in data sheet */
> +#define HHI_VDAC_CNTL1_G12A	0x2F0 /* 0xbe offset in data sheet */
>  #define HHI_HDMI_PHY_CNTL0	0x3a0 /* 0xe8 offset in data sheet */
>  
>  struct meson_cvbs_enci_mode meson_cvbs_enci_pal = {
> @@ -1675,8 +1677,13 @@ void meson_venc_disable_vsync(struct meson_drm *priv)
>  void meson_venc_init(struct meson_drm *priv)
>  {
>  	/* Disable CVBS VDAC */
> -	regmap_write(priv->hhi, HHI_VDAC_CNTL0, 0);
> -	regmap_write(priv->hhi, HHI_VDAC_CNTL1, 8);
> +	if (meson_vpu_is_compatible(priv, "amlogic,meson-g12a-vpu")) {
> +		regmap_write(priv->hhi, HHI_VDAC_CNTL0_G12A, 0);
> +		regmap_write(priv->hhi, HHI_VDAC_CNTL1_G12A, 8);
> +	} else {
> +		regmap_write(priv->hhi, HHI_VDAC_CNTL0, 0);
> +		regmap_write(priv->hhi, HHI_VDAC_CNTL1, 8);
> +	}
>  
>  	/* Power Down Dacs */
>  	writel_relaxed(0xff, priv->io_base + _REG(VENC_VDAC_SETTING));
> diff --git a/drivers/gpu/drm/meson/meson_venc_cvbs.c b/drivers/gpu/drm/meson/meson_venc_cvbs.c
> index d622d817b6df..2c5341c881c4 100644
> --- a/drivers/gpu/drm/meson/meson_venc_cvbs.c
> +++ b/drivers/gpu/drm/meson/meson_venc_cvbs.c
> @@ -37,7 +37,9 @@
>  
>  /* HHI VDAC Registers */
>  #define HHI_VDAC_CNTL0		0x2F4 /* 0xbd offset in data sheet */
> +#define HHI_VDAC_CNTL0_G12A	0x2EC /* 0xbd offset in data sheet */
>  #define HHI_VDAC_CNTL1		0x2F8 /* 0xbe offset in data sheet */
> +#define HHI_VDAC_CNTL1_G12A	0x2F0 /* 0xbe offset in data sheet */
>  
>  struct meson_venc_cvbs {
>  	struct drm_encoder	encoder;
> @@ -166,8 +168,13 @@ static void meson_venc_cvbs_encoder_disable(struct drm_encoder *encoder)
>  	struct meson_drm *priv = meson_venc_cvbs->priv;
>  
>  	/* Disable CVBS VDAC */
> -	regmap_write(priv->hhi, HHI_VDAC_CNTL0, 0);
> -	regmap_write(priv->hhi, HHI_VDAC_CNTL1, 8);
> +	if (meson_vpu_is_compatible(priv, "amlogic,meson-g12a-vpu")) {
> +		regmap_write(priv->hhi, HHI_VDAC_CNTL0_G12A, 0);
> +		regmap_write(priv->hhi, HHI_VDAC_CNTL1_G12A, 0);
> +	} else {
> +		regmap_write(priv->hhi, HHI_VDAC_CNTL0, 0);
> +		regmap_write(priv->hhi, HHI_VDAC_CNTL1, 8);

I imagine 8 stands for BIT(3) ? Could you add a define to explain (quickly)
what it is ?

> +	}
>  }
>  
>  static void meson_venc_cvbs_encoder_enable(struct drm_encoder *encoder)
> @@ -179,13 +186,17 @@ static void meson_venc_cvbs_encoder_enable(struct drm_encoder *encoder)
>  	/* VDAC0 source is not from ATV */
>  	writel_bits_relaxed(BIT(5), 0, priv->io_base + _REG(VENC_VDAC_DACSEL0));
>  
> -	if (meson_vpu_is_compatible(priv, "amlogic,meson-gxbb-vpu"))
> +	if (meson_vpu_is_compatible(priv, "amlogic,meson-gxbb-vpu")) {
>  		regmap_write(priv->hhi, HHI_VDAC_CNTL0, 1);
> -	else if (meson_vpu_is_compatible(priv, "amlogic,meson-gxm-vpu") ||
> -		 meson_vpu_is_compatible(priv, "amlogic,meson-gxl-vpu"))
> +		regmap_write(priv->hhi, HHI_VDAC_CNTL1, 0);
> +	} else if (meson_vpu_is_compatible(priv, "amlogic,meson-gxm-vpu") ||
> +		 meson_vpu_is_compatible(priv, "amlogic,meson-gxl-vpu")) {
>  		regmap_write(priv->hhi, HHI_VDAC_CNTL0, 0xf0001);
> -
> -	regmap_write(priv->hhi, HHI_VDAC_CNTL1, 0);
> +		regmap_write(priv->hhi, HHI_VDAC_CNTL1, 0);
> +	} else if (meson_vpu_is_compatible(priv, "amlogic,meson-g12a-vpu")) {
> +		regmap_write(priv->hhi, HHI_VDAC_CNTL0_G12A, 0x906001);
> +		regmap_write(priv->hhi, HHI_VDAC_CNTL1_G12A, 0);
> +	}

Maybe the values above are just magics taken from the vendor kernel, but if
you can, it would be nice to break them down to help us understand what is
controlled in these CTNL registers.

>  }
>  
>  static void meson_venc_cvbs_encoder_mode_set(struct drm_encoder *encoder,



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
