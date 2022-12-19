Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91181C4332F
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Dec 2022 13:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90ir/2J3869GgBtOxlB9ZXA/8+p72oCTbYimJmV2xpc=; b=Ww/cs59Y2I2PPOPOJgEr/Re/Ae
	i/aiokML4UeLkKufgYFZDVTH3ptof4wcmqyJ53QcE0sJE7VwocsbFAJdUoJWzWAfRguQibRM7M+BA
	KmlbEHTLfTeoz0wTmL5Q+T+DJUIWNs7Fb+gBqzzELjHcRqBf7dPZJeqT4NSe76OstYzsTZaSNgjey
	xMUe9MtFzbDTu/qlgaJAyjwY3buAgU6QgL7KrNy7c6RxZT+aqAs+k0kXDQsAb4uif2pQQThq4PTrv
	zXW4wDUvXr9DiAsyzwAUgMHC8bAj6D3z6iGJtEPYvZbFY+54uWU/honKgADEk6K0TdKsNuaYzy5Vo
	caYbhxLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7GQg-00EDEk-2w; Mon, 19 Dec 2022 13:43:42 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7GQM-00ECsr-7S
	for linux-amlogic@lists.infradead.org; Mon, 19 Dec 2022 13:43:23 +0000
Received: by mail-wm1-x329.google.com with SMTP id m19so6413398wms.5
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Dec 2022 05:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FcJ82GGLWcA9YJ8tR5Iaod2DuXgS0nv7MKzMcf1yMiM=;
        b=okHBtBIhbvCRep+pxNLz9lBYrDAmFORXzEx6qK8V0FRSuRR0jezAYYpXAzZTwxe3qj
         gETGKsaOF6cK37DyiAQp8BOkWzIgFzepwajcjCqCT8hfhnnJBEFMoQrBGdIxO2K6BVSd
         lkxt0flRjnIPfe7A1RKSfqQbMe2pwzRh9X06sAChU5eeyiHqRH/hZXDDgVsow7nHlAR5
         p1r6/UUrkupYkijuId+Vll4GwY04Dmr6BzhC6oGs95yAV75N90ZxyKpoVvjRNUhnVIW2
         Kw4OLsGqNuqB/cdGTu4Lq9+ecqa1m2xQ4iHqwU5/Jai1D2LsRk3WoxDruckJ2S62PmPJ
         vltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FcJ82GGLWcA9YJ8tR5Iaod2DuXgS0nv7MKzMcf1yMiM=;
        b=6NkQ2+u1287cqK52I/JnCJZyhndF3JaXxGoKfZx3HhCUXp5e448ZgRgd0l6PQfASW2
         wQIkWWxug+rsC/FcIUxHJd7TIold7Y9tFUCmI3PXkaYKr+b1ha/DemIja8fNFO4NIDz/
         zW2UmRPkw/D8QYf+a+A21mon6hoh9Fm55AzkicZOwO0HPW1MvDlz0xGxsdbZbvNwvvSn
         9CcLNIE3cmgCCrb4QQexkttxgChLjSnUaTjJnyWzuQzIrbsYA11uhhzhBeIitM55eckB
         D+Nygomz7mLcf+c+s4gUWlhhPPM9apzY/VSZKUfx732JOPU8P4VLM6lQ0fmIfSVmcEv/
         QUwg==
X-Gm-Message-State: ANoB5pkOauFZDFePd0orqyTDVNKrxs0fLIU0juOlweNrvBxGCnP8SCZQ
	k2qvK7GcbesQ0ZPgqs/7cE8hRA==
X-Google-Smtp-Source: AA0mqf53Kpb/M5xFybthDz4K5oNolr3LAaNDmyfZESzL/sgF3C0EEbJieuv2vvb8y2QRsRkV2N9sVA==
X-Received: by 2002:a05:600c:5570:b0:3d1:ee6c:f897 with SMTP id ja16-20020a05600c557000b003d1ee6cf897mr32073903wmb.3.1671457400483;
        Mon, 19 Dec 2022 05:43:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:976a:eb00:7b11:28de? ([2a01:e0a:982:cbb0:976a:eb00:7b11:28de])
        by smtp.gmail.com with ESMTPSA id f9-20020a05600c154900b003b49bd61b19sm17513376wmg.15.2022.12.19.05.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 05:43:20 -0800 (PST)
Message-ID: <19de9bfc-2012-451d-f5d1-59a04ea9d813@linaro.org>
Date: Mon, 19 Dec 2022 14:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 0/2] Make ILI9486 driver working with 16-bits SPI
 controllers
Content-Language: en-US
To: Carlo Caione <ccaione@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
References: <20221116-s905x_spi_ili9486-v4-0-f86b4463b9e4@baylibre.com>
Organization: Linaro Developer Services
In-Reply-To: <20221116-s905x_spi_ili9486-v4-0-f86b4463b9e4@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_054322_321292_02AD226B 
X-CRM114-Status: GOOD (  15.40  )
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

Hi Kamlesh,

On 19/12/2022 10:02, Carlo Caione wrote:
> This patchset is trying to fix problems seen on S905X boards when interfacing
> with an ILI9486 equipped SPI panel.

I fully reviewed both patches, but I'd like a review from the maintainer,
can you have a look ?

Thanks,
Neil

> 
> To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> To: David Airlie <airlied@gmail.com>
> To: Daniel Vetter <daniel@ffwll.ch>
> To: Mark Brown <broonie@kernel.org>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Kevin Hilman <khilman@baylibre.com>
> To: Jerome Brunet <jbrunet@baylibre.com>
> To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-amlogic@lists.infradead.org
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> 
> ---
> Changes in v4:
> - Removed NAK-ed patch from patchset
> - Link to v3: https://lore.kernel.org/r/20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com
> 
> Changes in v3:
> - Added trailers
> - Added new patch to use drm_aperture_remove_framebuffers()
> - Link to v2: https://lore.kernel.org/r/20221116-s905x_spi_ili9486-v2-0-084c6e3cd930@baylibre.com
> 
> Changes in v2:
> - Removed SPICC patch
> - Reworked commit message
> - Link to v1: https://lore.kernel.org/r/20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com
> 
> ---
> Carlo Caione (2):
>        drm/tiny: ili9486: Enable driver module autoloading
>        drm/tiny: ili9486: Do not assume 8-bit only SPI controllers
> 
>   drivers/gpu/drm/tiny/ili9486.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> ---
> base-commit: 84e57d292203a45c96dbcb2e6be9dd80961d981a
> change-id: 20221116-s905x_spi_ili9486-aed54ff3cb21
> 
> Best regards,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
