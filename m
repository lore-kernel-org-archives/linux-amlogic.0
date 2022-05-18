Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9B3C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 May 2022 07:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5zF/8qBDL9IsvzMcGZmaSv8uqjJ5QJSozXjPm8GPtgM=; b=KLfdczISqHQr07
	jJgkMGolbXwbBlDxQflbm3EzIlq/sdKlC824iQ/I+p0GaR3kWTtZUPcJSbPOsC482alcl1QfIzXqf
	pXHOH7HDl/dXXbYN7BcSzbIaE44tFDDGaI2QeQUMCAbzH+qEk7SsZszaFsS6go3o6GO9LtRjpqRzZ
	7GjqTaOTiZIUjJKjCTJd9T8/39goq5DuR7kYirKgjOGYlGCycYMuK/+2VqWpieJD0JPH0sDOlIuFc
	KZfGLRG0qn9JuGkOUdgHIDc0ImDP2rIQMpNy7t4uP4r/0cLa/NDV/PnTjF42IkIGdTYzFkqcqjgEG
	5KbvBaTMQyksXGaA50Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrDp6-00HZaO-IA; Wed, 18 May 2022 07:10:20 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrDot-00HZUL-97
 for linux-amlogic@lists.infradead.org; Wed, 18 May 2022 07:10:09 +0000
Received: by mail-wr1-x429.google.com with SMTP id r30so1260089wra.13
 for <linux-amlogic@lists.infradead.org>; Wed, 18 May 2022 00:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZCNKI5woerPUrmPCB0wU/T9brPPBMRmt8DMnLhy8VFA=;
 b=3ZiEMpESJJSEUhffXP/IpwU9L2ho0mVvu018crv9SbiP4Y91EhmpwbxBkut6kmW1uv
 bSEKpuWdEwxM4fOwpWwLa+ybzQ6DPAj15+PJQtxz1og9wv16KN7EX41jzdDipCfRiAfE
 m97bekTjXB9iaz45+9UF8ZyqSm3JWC1Gnoz2RY9fb1AlsbWUtLXVsrrbV93IpKJlleVb
 f18fBUCx5xabxRATX6cxrdH0wMsUzwTgi6gS9Rp+poGVHR4ba/RPti6wCFBtgJRdMQDC
 3yjk4jRLsWEewxBy/ZCKewsTZ7kzOLG6TVMXyjkBHA0LY9YwDI5igpSRV4tILoOJ258e
 p+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZCNKI5woerPUrmPCB0wU/T9brPPBMRmt8DMnLhy8VFA=;
 b=jUBRGOcJEu5TgWGM4rJ5/pQnlhyjJE0kh2yTsXGdm81yN23+F/CNqScqNn4R6REj7y
 X2tIa3Qe7DopaRGjz3qlvNvmDhfcQbiZrfUPjr16Gj7gucrdHvAgY87KMbZQ+Jw48KZ5
 OZkV++PMWys2LGrZaDswRSBHQlKtk1Mqtcf/zT9StTzR29lee/iIxz8kB+r2kw4sN5T2
 2oeiLps9Eu8E98V/xLuyBwPBvVEQHm9PEwBDFe9unJp4KOMPDpfkUvTDzchO1dBoRrDi
 B5azWVdsafG8xkVyEnwueC5sQGmfIr3tBJcSJ+/STYmbGs1HqdNkd8PD3RBpNVstqZ/M
 OPIw==
X-Gm-Message-State: AOAM533ms5RyO2LNA4Aw10piZV29qR9hC5siYgsJLDvh+RpUQRis3oBN
 jlgLHw71ip14tkix6pawVU167Q==
X-Google-Smtp-Source: ABdhPJyOF3VINKLZf/L/OcxPy0tS8BWcAs3AlYPYrG5qnl7HqufB62jEn9h9Q2demM7n5Qsnkh6J/w==
X-Received: by 2002:a5d:584b:0:b0:20c:6317:1f77 with SMTP id
 i11-20020a5d584b000000b0020c63171f77mr21948376wrf.355.1652857803413; 
 Wed, 18 May 2022 00:10:03 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:dea9:338d:d500:c574?
 ([2001:861:44c0:66c0:dea9:338d:d500:c574])
 by smtp.gmail.com with ESMTPSA id
 bg26-20020a05600c3c9a00b003942a244ee0sm962397wmb.37.2022.05.18.00.10.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 00:10:02 -0700 (PDT)
Message-ID: <bb8e1955-b82f-bb6d-69ce-bd0845aa2ec1@baylibre.com>
Date: Wed, 18 May 2022 09:10:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/meson: add YUV422 output support
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Dongjin Kim <tobetter@gmail.com>, Furkan Kardame <f.kardame@manjaro.org>
References: <20220516072245.10745-1-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220516072245.10745-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_001007_416722_980418EF 
X-CRM114-Status: GOOD (  23.88  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 16/05/2022 09:22, Christian Hewitt wrote:
> From: Dongjin Kim <tobetter@gmail.com>
> 
> Support YUV422 output from the Amlogic Meson SoC VPU to the HDMI
> controller. Without this YUV422 format out of the HDMI encoder
> leads to using the dw-hdmi YUV444 to YUV422 color conversion which
> gives wrong colors and a green line on the left edge of the screen.
> 
> Signed-off-by: Dongjin Kim <tobetter@gmail.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Tested-by: Furkan Kardame <f.kardame@manjaro.org>
> ---
> I've had this patch in my sources for some time now; originally picked
> from Dongjin's mainline branches for Hardkernel boards and tweaked for
> some minor renaming after DRM bridge changes were merged. Furkhan has
> reminded me this is still needed a couple of days ago and now the same
> issue is reported on the mailing list [0] so best to submit it. If a
> fixes tag is required? please advise the commit and i'll resend.
> 
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 5e306de6f485..08529efb4405 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -218,7 +218,8 @@ static void meson_encoder_hdmi_atomic_enable(struct drm_bridge *bridge,
>   	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24) {
>   		ycrcb_map = VPU_HDMI_OUTPUT_CRYCB;
>   		yuv420_mode = true;
> -	}
> +	} else if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYVY8_1X16)
> +		ycrcb_map = VPU_HDMI_OUTPUT_CRYCB;
>   
>   	/* VENC + VENC-DVI Mode setup */
>   	meson_venc_hdmi_mode_set(priv, vic, ycrcb_map, yuv420_mode, mode);
> @@ -230,6 +231,10 @@ static void meson_encoder_hdmi_atomic_enable(struct drm_bridge *bridge,
>   		/* Setup YUV420 to HDMI-TX, no 10bit diphering */
>   		writel_relaxed(2 | (2 << 2),
>   			       priv->io_base + _REG(VPU_HDMI_FMT_CTRL));
> +	else if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYVY8_1X16)
> +		/* Setup YUV422 to HDMI-TX, no 10bit diphering */
> +		writel_relaxed(1 | (2 << 2),
> +				priv->io_base + _REG(VPU_HDMI_FMT_CTRL));
>   	else
>   		/* Setup YUV444 to HDMI-TX, no 10bit diphering */
>   		writel_relaxed(0, priv->io_base + _REG(VPU_HDMI_FMT_CTRL));
> @@ -257,6 +262,7 @@ static void meson_encoder_hdmi_atomic_disable(struct drm_bridge *bridge,
>   
>   static const u32 meson_encoder_hdmi_out_bus_fmts[] = {
>   	MEDIA_BUS_FMT_YUV8_1X24,
> +	MEDIA_BUS_FMT_UYVY8_1X16,
>   	MEDIA_BUS_FMT_UYYVYY8_0_5X24,
>   };
>   

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
