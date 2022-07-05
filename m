Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D57C43334
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Jul 2022 07:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7c+lSxmpT5Q3wkoHabYEmJwECAKGBa5ZB37xOCJomc=; b=TbHttazlWPNy9K
	JVuIBmOVgMr/jdsWmIRgcT8HdmVUm3k86z1XZVO8s+Kw5283dv3AMhKL5R9h1H+QQCI1AFqWjr0sx
	y+C5JCHIrtUgsrCUzk/Gw9PDTXR+MrnhWw8BJx37tfLCtPPjyUWytn7fQMligYSmv0qgVvHdw4Hsw
	SrHhUPHa86DLJqTH3Vs2grf4dPve/7rS/aJ16YaySIM84fNY4hPONuuIetl1ouZ9buSbTdevxSMA0
	ArrbP1ZLQ0NNWmA5nhnV31XsfmpcUF1sIabGfIeB8lRz3XVXHbWPTEV+sPYxc04lY6RlGDME3t74h
	sSRI7IFNXtY+A2oIg+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8ctC-00FYaU-Vq; Tue, 05 Jul 2022 07:22:31 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8ct9-00FYKV-Iu
	for linux-amlogic@lists.infradead.org; Tue, 05 Jul 2022 07:22:29 +0000
Received: by mail-wr1-x42b.google.com with SMTP id v14so16190040wra.5
        for <linux-amlogic@lists.infradead.org>; Tue, 05 Jul 2022 00:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:cc:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=8usoLhk9ovXL0VS3GA/YN9J82Mt+1GOJy2yE4dko6a0=;
        b=txG/xRqNc6oEFbK0RW1XEurQ0naCyxCJC/Eiilem93tWdd9hnz85Y8XFr1hgWYsbbK
         RGehH4WkOmGstmSt0iaiJ/MR42Txb6KfIn14+W2PtA0f1Q8ILxDZtelZXLBBbgFSD+0I
         nFA8O/Mv41ABZ7BR5vbmH1iVk6ZiO46+I9adc+oxbLiVk3LD3mLbJUg5ONZMDCXkKDmR
         y2tHcvYlQk50Pip8Gr8Zr2ZTXk+4hd7p2Qr9k4wvJ3Lf/WUXmFosEVFvP2PFBWFYVBAA
         HWCcduzModaFma/1939yHkpuz4SRjld80v/HfDXTw2861sP29uGwpq3XWYH+JH2jFzaY
         MSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:cc:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=8usoLhk9ovXL0VS3GA/YN9J82Mt+1GOJy2yE4dko6a0=;
        b=ljZRnKkF+2omb0duP8Rg+UcfoP515tsI5c85QJQrovek+W3pNqXtr3SvLHMo/nWv/q
         sCU0j1TzOpuNi12PWMynCer6pD+ImGMWElmUD7kipqqxmBy3mSwz3eKWfuKa5M4F7SG/
         n3yOXNdFDaoHblf1Y7nueBz25ipeoVK9MK1qCJ8okihqgLwAMVIOxg/oFWrD3lRjKHgq
         fNzkzcangeKzaIwoO/YXCyK2bo40K+rDEow1o4SZhnGZeIc5Ssg/HIiEONoqblfC3trJ
         e64fon6nebD/zS6s3j6jff1kaTHFIUOwIljXo7hBRmS6wMnK0UraLjf4dXGcYlZQj4Yi
         o14w==
X-Gm-Message-State: AJIora8sxyoSXcDTNBrs+bdH6dHd0blMU11bPOOhzuFqy9D2vFOSBd2b
	2iQCOqHpVo0dsH5ffW0GoA4Ohw==
X-Google-Smtp-Source: AGRyM1uLfoGwkyfaq+jx1rt6UosZKcFRh1dnyTkBvMdLgCBKeSxXdFLJaQ7qcwlcvo2Y2gDyzeuf8A==
X-Received: by 2002:a05:6000:118e:b0:21d:701e:7cc5 with SMTP id g14-20020a056000118e00b0021d701e7cc5mr3214424wrx.376.1657005743778;
        Tue, 05 Jul 2022 00:22:23 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:3c4f:78be:dc90:14f9? ([2001:861:44c0:66c0:3c4f:78be:dc90:14f9])
        by smtp.gmail.com with ESMTPSA id d7-20020a5d5387000000b0021d5c52f4b4sm8416024wrv.34.2022.07.05.00.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 00:22:23 -0700 (PDT)
Message-ID: <da01677e-8a53-060a-f5ff-075106696c46@baylibre.com>
Date: Tue, 5 Jul 2022 09:22:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] soc: amlogic: meson-pwrc: Hold reference returned by
 of_get_parent()
Content-Language: en-US
To: Liang He <windhl@126.com>, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, inux-amlogic@lists.infradead.org
References: <20220705022032.281665-1-windhl@126.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220705022032.281665-1-windhl@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_002227_685450_B4C870E3 
X-CRM114-Status: GOOD (  15.46  )
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

+ linux-amlogic, linux-arm-kernel, linux-kernel

On 05/07/2022 04:20, Liang He wrote:
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
> index 2be3afe6c2e3..872ab8ba90bc 100644
> --- a/drivers/soc/amlogic/meson-ee-pwrc.c
> +++ b/drivers/soc/amlogic/meson-ee-pwrc.c
> @@ -470,6 +470,7 @@ static int meson_ee_pwrc_probe(struct platform_device *pdev)
>   	const struct meson_ee_pwrc_domain_data *match;
>   	struct regmap *regmap_ao, *regmap_hhi;
>   	struct meson_ee_pwrc *pwrc;
> +	struct device_node *np;
>   	int i, ret;
>   
>   	match = of_device_get_match_data(&pdev->dev);
> @@ -495,7 +496,9 @@ static int meson_ee_pwrc_probe(struct platform_device *pdev)
>   
>   	pwrc->xlate.num_domains = match->count;
>   
> -	regmap_hhi = syscon_node_to_regmap(of_get_parent(pdev->dev.of_node));
> +	np = of_get_parent(pdev->dev.of_node);
> +	regmap_hhi = syscon_node_to_regmap(np);
> +	of_node_put(np);
>   	if (IS_ERR(regmap_hhi)) {
>   		dev_err(&pdev->dev, "failed to get HHI regmap\n");
>   		return PTR_ERR(regmap_hhi);
> diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> index b4615b288625..75a4e1cec416 100644
> --- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> +++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> @@ -274,6 +274,7 @@ static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
>   	struct regmap *regmap_ao, *regmap_hhi;
>   	struct meson_gx_pwrc_vpu *vpu_pd;
>   	struct reset_control *rstc;
> +	struct device_node *np;
>   	struct clk *vpu_clk;
>   	struct clk *vapb_clk;
>   	bool powered_off;
> @@ -291,7 +292,9 @@ static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
>   
>   	memcpy(vpu_pd, vpu_pd_match, sizeof(*vpu_pd));
>   
> -	regmap_ao = syscon_node_to_regmap(of_get_parent(pdev->dev.of_node));
> +	np = of_get_parent(pdev->dev.of_node);
> +	regmap_ao = syscon_node_to_regmap(np);
> +	of_node_put(np);
>   	if (IS_ERR(regmap_ao)) {
>   		dev_err(&pdev->dev, "failed to get regmap\n");
>   		return PTR_ERR(regmap_ao);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
