Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A76EC25B0C
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Aug 2022 08:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAZHYy3ctAZ8Rlj/VBNSMk9FSnxJXDZxZlwX2EjBNb8=; b=EHW/TYkADneTfbmaoRI3tLocgS
	gLskn6rUeVj9jsTBswOOaKYMRwb4IcK3bvykS+B4lCRHlAG1um/STCKIUHGvmzcNbGS9jC1awMniH
	NkaBoH9Q33tWcaj8WfEpef2Zklpd085kuUcLXPI3GDQyOS6A6FAtWEUVGodclG/KwkotCiB+lT2dV
	5dxgkUanamZrWff1f4LYQG+fvz4JRUK7Zd80ljP2oDqx7Tx5LHNJOOCMgmNLR1gZ8s/EY4QDpjhWf
	I94PUS/xfYxYQHrNX3kIXh8A58Ti3AdXElhsuBd00VOAH1aLFOpR0by4SKLpfAD+xRpfIoYyBHi+P
	3GrDigVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxnM-00CJLu-5W; Mon, 08 Aug 2022 08:07:28 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxnI-00CJJT-I2
	for linux-amlogic@lists.infradead.org; Mon, 08 Aug 2022 08:07:26 +0000
Received: by mail-wm1-x32b.google.com with SMTP id a18-20020a05600c349200b003a30de68697so5599968wmq.0
        for <linux-amlogic@lists.infradead.org>; Mon, 08 Aug 2022 01:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=PV9WM4eNKKqpG2ekxx8fNamaeKEa49rWuU6gMD3fErE=;
        b=47EEpt8HfNey33s26NW0mjmzun8WcLN9pJrL/M7KCLXWwJqCkDNnAH7RrGoXFKcU1X
         ArX84kBX5c6+MkUKVX/o571qRD0WWB9AgxSVBQhWxMH2UZm+OHDys/0xX3AF23fucZMo
         jEKikbUCQBH94aVMtL1U6xyPaOcuO1isIhjKdpwX6M9HMEMYClt4TC8abWFNDSp0gs1S
         ChO5YJa0o5XvpIEXXVGjEFCSloFNnLFtiQdUUYhZgBjuF3KqCowQh2PiMQzxx3mRBi6u
         p7a8fWuoVj0+sBGguxAZNqxCz9hFX0z+l8+tLCbz3xU9+hMFV72sRuDsJjJEmYxvjYWK
         CGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=PV9WM4eNKKqpG2ekxx8fNamaeKEa49rWuU6gMD3fErE=;
        b=s11U9j50zufqWbfIjs0sxBCXHfpLyTcQmRZEKDhua36nWNIpFT3dwvcQOeUJhFg1y3
         34eKdZRzt79WRBbLQzgYbCFETy3+7A+0rd5J+KxDtA03zyktZC7ZrXS5T9wwV5L+uUrv
         bgPeToLw+/H/Brw2rWfyFaAQDHtvqVKow8Q0MXrvVRF2nSmztewliOpwiNolYrjZIuKd
         HYxbs6weGWVl1lmArfFo3Ccvvl1bpYBqXeRhdy8oM9h2urtiM0iw3/qXGAZURk4r83zD
         HUIWHY5pBc73Edc4qoHeCJzjtrl0lAJHdkcoKVB4XaZCpuaWmmIYuiVhJmglwpdMwPq3
         M6bg==
X-Gm-Message-State: ACgBeo1u86wNlHYhtPjaOz91Ft7rZ8KzKFQ5yX04zd4m7mboH3IeUKi7
	JkbJp64XgNLE63UHuJKAgiCfbA==
X-Google-Smtp-Source: AA6agR6JdumKVKZQaiyKSOrwaqiFUqUtMtVBnAJZufhob3AvsmkS5N5A+4grCdvnRikCqJY56xRC8w==
X-Received: by 2002:a1c:ed05:0:b0:3a2:ebae:c5e7 with SMTP id l5-20020a1ced05000000b003a2ebaec5e7mr11463472wmh.78.1659946042037;
        Mon, 08 Aug 2022 01:07:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:1832:7d81:d0f6:dc4b? ([2a01:e0a:982:cbb0:1832:7d81:d0f6:dc4b])
        by smtp.gmail.com with ESMTPSA id t18-20020a05600c199200b003a31c4f6f74sm19376214wmq.32.2022.08.08.01.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 01:07:21 -0700 (PDT)
Message-ID: <5a2d281d-92c1-97e3-69a5-22a5d2942b52@baylibre.com>
Date: Mon, 8 Aug 2022 10:07:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] soc: amlogic: meson-pwrc: Hold reference returned by
 of_get_parent()
Content-Language: en-US
To: Liang He <windhl@126.com>, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, p.zabel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20220726073841.1320509-1-windhl@126.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220726073841.1320509-1-windhl@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_010724_641073_AFD666B7 
X-CRM114-Status: GOOD (  15.75  )
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

On 26/07/2022 09:38, Liang He wrote:
> We should hold the reference returned by of_get_parent() and use
> it to call of_node_put() for refcount balance.
> 
> Signed-off-by: Liang He <windhl@126.com>
> ---
>   drivers/soc/amlogic/meson-ee-pwrc.c     | 5 ++++-
>   drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 5 ++++-
>   2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
> index 2be3afe6c2e3..dd5f2a13ceb5 100644
> --- a/drivers/soc/amlogic/meson-ee-pwrc.c
> +++ b/drivers/soc/amlogic/meson-ee-pwrc.c
> @@ -469,6 +469,7 @@ static int meson_ee_pwrc_probe(struct platform_device *pdev)
>   {
>   	const struct meson_ee_pwrc_domain_data *match;
>   	struct regmap *regmap_ao, *regmap_hhi;
> +	struct device_node *parent_np;
>   	struct meson_ee_pwrc *pwrc;
>   	int i, ret;
>   
> @@ -495,7 +496,9 @@ static int meson_ee_pwrc_probe(struct platform_device *pdev)
>   
>   	pwrc->xlate.num_domains = match->count;
>   
> -	regmap_hhi = syscon_node_to_regmap(of_get_parent(pdev->dev.of_node));
> +	parent_np = of_get_parent(pdev->dev.of_node);
> +	regmap_hhi = syscon_node_to_regmap(parent_np);
> +	of_node_put(parent_np);
>   	if (IS_ERR(regmap_hhi)) {
>   		dev_err(&pdev->dev, "failed to get HHI regmap\n");
>   		return PTR_ERR(regmap_hhi);
> diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> index b4615b288625..312fd9afccb0 100644
> --- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> +++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> @@ -273,6 +273,7 @@ static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
>   	const struct meson_gx_pwrc_vpu *vpu_pd_match;
>   	struct regmap *regmap_ao, *regmap_hhi;
>   	struct meson_gx_pwrc_vpu *vpu_pd;
> +	struct device_node *parent_np;
>   	struct reset_control *rstc;
>   	struct clk *vpu_clk;
>   	struct clk *vapb_clk;
> @@ -291,7 +292,9 @@ static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
>   
>   	memcpy(vpu_pd, vpu_pd_match, sizeof(*vpu_pd));
>   
> -	regmap_ao = syscon_node_to_regmap(of_get_parent(pdev->dev.of_node));
> +	parent_np = of_get_parent(pdev->dev.of_node);
> +	regmap_ao = syscon_node_to_regmap(parent_np);
> +	of_node_put(parent_np);
>   	if (IS_ERR(regmap_ao)) {
>   		dev_err(&pdev->dev, "failed to get regmap\n");
>   		return PTR_ERR(regmap_ao);

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
