Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9B2C352A1
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Dec 2022 09:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Bx4jiGdUY1bbcCMCF0dcHrKd4cDwW0uPI/5lc3YvPw=; b=nrIps3JqjrgfDom9NcWNwpNX0l
	e/M+lo6TtxHyM2nDUTDYQ9c/FSwGOTLB/Jn9NRHR76Ll3xQ+4aEa6K5W57HA9Se/n3d/NspnjapcU
	Zk8g1ttRFXTePwG8SNHQGDs90IPR0Sae+Xhf9OFiyHkJMCSQ7iJ16340qhIxU5+Q5T4fkHo6MST+4
	8eX0cWWo00a2EwyE+kBz3RsFn0M8FnkFchWhJAxf0My6sVnHgrF0gakrXyqqq69oiWEiIQ/q0gMqq
	53FoirFT6aW4kOOdRy2WAQ7JikLzXZ5aq/tfngNweaN7vPLzj1zlfw87aRF/RDi01qPzPSeh+t1cN
	Pc/9vwkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2US2-006IAW-PT; Tue, 06 Dec 2022 09:41:22 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2URz-006HsN-Lw
	for linux-amlogic@lists.infradead.org; Tue, 06 Dec 2022 09:41:21 +0000
Received: by mail-wm1-x32f.google.com with SMTP id n9-20020a05600c3b8900b003d0944dba41so7550953wms.4
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Dec 2022 01:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FxokdyaSTsdEUZeAO0dhrrdDTQh5fW0PAMkusaqbnNI=;
        b=hgKt/N5djRerT1RlOcMWnFpuJQ4bX2M6JA9wzFXO6HtaVliekexNJE17RJ88EUN4MZ
         UZg9sFwVIJoZfDmb70Y6nemKwx9p1fMrZV5ncdr3oqCWRxndOEuHEWbWgASwXIIVLK2t
         +SENYm0ShHRRBGfZ3bQ9AD38zn1H/nB4cWJJSRrlBDfKWLVMEmJ/3QOKGLf0+NnMB3UW
         uXr7RihODsoehrFECd7vfHFmevEritm/0bpC64hgwRM10Wn4C8Pd2Ab7WVvUdlwNQY0C
         YvNUV6RdF5gEXafU4GOCRKbDOr8V8g61KBmLFIP9u0yJxT/Bk7tMIdxidPvx66yYGFHX
         zQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FxokdyaSTsdEUZeAO0dhrrdDTQh5fW0PAMkusaqbnNI=;
        b=JyljcENzbCdAiL65ooNdpVws35nBE6y0POvRCskp1Pk5Xgex+dj/Bd9HNo87vxCszR
         0Ft6zcdDatzA47XFpxe/7e21s8HtMahlwXLSzOczW+0dS5JBEV7mGAg7kuybtuxfWAqm
         0uwcIlT/tB6HLiphB15yRLaAXpyVTwWY7hSr0M7XnrqBqCGtFvANJNe5aAxTEHIqypxb
         4ipMuoE6IcrkHOL702H7jz/rVZPWieM7bciFinvwZv3DokTMwSR6hn4DBYZdb6kVvYt7
         MZL/Q/2c2UNA6g0HYW3yaRwrwFoGOa8nbHZf8Anlr9JK/biOvfNv8ntYMpVaamTuH64n
         PlTg==
X-Gm-Message-State: ANoB5pn2FQA+qcUQP/vfdKiARilYu7pRKKcyDJ6TiGFAdYK/bAXYB1gf
	7ZogEEnUOFCrQsfAV5GnPK6LmA==
X-Google-Smtp-Source: AA0mqf4shAeXN1wG69orKehuFKdhFboW8rWmjTs2IHUubgXM5BC17QT0CVMzYAocd2isflrozlyBYA==
X-Received: by 2002:a7b:c00f:0:b0:3cf:7066:cf53 with SMTP id c15-20020a7bc00f000000b003cf7066cf53mr49237478wmb.135.1670319674510;
        Tue, 06 Dec 2022 01:41:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:2d5b:61d6:a067:f8e9? ([2a01:e0a:982:cbb0:2d5b:61d6:a067:f8e9])
        by smtp.gmail.com with ESMTPSA id l9-20020a05600c1d0900b003cf878c4468sm27382120wms.5.2022.12.06.01.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 01:41:14 -0800 (PST)
Message-ID: <14e5c4e4-30dd-8efd-81e4-d680664ab04a@linaro.org>
Date: Tue, 6 Dec 2022 10:41:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/3] drm/tiny: ili9486: remove conflicting framebuffers
Content-Language: en-US
To: Carlo Caione <ccaione@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jerome Brunet <jbrunet@baylibre.com>, David Airlie <airlied@gmail.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com>
 <20221116-s905x_spi_ili9486-v3-3-59c6b58cbfe3@baylibre.com>
Organization: Linaro Developer Services
In-Reply-To: <20221116-s905x_spi_ili9486-v3-3-59c6b58cbfe3@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_014119_800098_B768E50C 
X-CRM114-Status: GOOD (  13.47  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Carlo,

On 06/12/2022 09:34, Carlo Caione wrote:
> For platforms using simplefb / efifb, call
> drm_aperture_remove_framebuffers() to remove the conflicting
> framebuffer.

Conflicting framebuffer on the SPI display ? How is that possible ?

The meson_drm should already do this, no ?

Neil

> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>   drivers/gpu/drm/tiny/ili9486.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
> index 14a9e6ad2d15..6fd4d42437fd 100644
> --- a/drivers/gpu/drm/tiny/ili9486.c
> +++ b/drivers/gpu/drm/tiny/ili9486.c
> @@ -14,6 +14,7 @@
>   
>   #include <video/mipi_display.h>
>   
> +#include <drm/drm_aperture.h>
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_fb_helper.h>
> @@ -238,6 +239,10 @@ static int ili9486_probe(struct spi_device *spi)
>   	if (ret)
>   		return ret;
>   
> +	ret = drm_aperture_remove_framebuffers(false, &ili9486_driver);
> +	if (ret)
> +		return ret;
> +
>   	drm_mode_config_reset(drm);
>   
>   	ret = drm_dev_register(drm, 0);
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
