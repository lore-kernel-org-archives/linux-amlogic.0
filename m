Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD5DC00140
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Aug 2022 08:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:To:From:References:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CrDWPeQNJLfPbGMJGtLuzVHGHj7ei3wCg2Q6DLHsBWw=; b=GTcGrWGFCzV9+g
	tdIWf1GXZg+Oar4LSRmOR/+3v/AOOZUOg3FQv87Zb1g/WRXbNGXkp4FDERCZSFXns62oMDv7xaTfq
	eHKeSZCl3+g/Wnp/LiX5u1o/Fgras9DbcJpQ2segoJhOlEZLK4iETK1FwVNd1tO1X/eMdyUIkyT6U
	e6ohD3VT0kwYcUsNdD6eXh9em9t+gs6Q4lxWLkYYKMsealjW7E2/65LLg9U8q7mXdR67zyp2IdJAv
	NG+n7fW5Tzx01xQSdOgBj1WS/RSPbErAySA3KnoI3AtkVGBECdv7jcTpeAyfBiwcd2LfWgDPb0TkM
	5UHYo6EZ4KVw2hGKPrTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMPzX-0032ol-3v; Fri, 12 Aug 2022 08:26:03 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMPzT-0032fS-7Y
	for linux-amlogic@lists.infradead.org; Fri, 12 Aug 2022 08:26:01 +0000
Received: by mail-wm1-x32d.google.com with SMTP id s23so232186wmj.4
        for <linux-amlogic@lists.infradead.org>; Fri, 12 Aug 2022 01:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:to:from:user-agent
         :references:from:to:cc;
        bh=6ehiMB0+39tML8IE5wmDSuzaTlzDcKsQgUz9LzCsjzs=;
        b=7HdXztEsGi5VAuAuBJddokRjToU81wjSb1LlaONQoHq5CsO99VNK4gVmjghlQcmzA1
         +LEe6jr/wD5yfO1CEtO/rJYrIJe2eRRjoFWYqRNvAqU1hgUCvPaiWHDxzNJn9OQKsRQj
         Ux99mx4nbhviGZfJOZ3e1DxZHknVClaXB/UIKpJ7KsanmpaegcLP8SIkLM+RrSMa/xML
         UudN1Cj8txPl+u7UY7bApCFjj8x5wfjK+g1BzYit05Eg26lY8jaRCx7jaGJs/HMNcTyc
         zgMJW1FyeC8nL/BeNSBq/CD9BKOJlOg4mds2RYcNWCnLRp7InOawH0wF4QJ7vXNG63cu
         Kjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:to:from:user-agent
         :references:x-gm-message-state:from:to:cc;
        bh=6ehiMB0+39tML8IE5wmDSuzaTlzDcKsQgUz9LzCsjzs=;
        b=HdRXCjPTUbN60n8rUIGC/cM1OtrCVWsBiAEVzrZT5nYHTk2Ngl4P/u3Q4RWILYbMa1
         eGu5kKk1/wfSjCz1S9gomRDjwgkYrPieQ4zH127s3kW+OxH6BdtHDYRZTQWjQibN1GEn
         /91XkTnFAPlBBiFFyGBPFHeQLmn15Bi4yri96W1+Wq+EVzNCeTy5VvYUcTrWJLQZT3iq
         pmhNY9rOtRPa1O8+MtZHdgpNc+dPEfZlqhda+5Ry1mmLRLDLdhSnHxv5C5myrr7IhA8+
         gD1ROFeQ4xWOUNg4p5pJ68gN038G/FnvfdjV7BGLkwKuWQrqtDH5uaxf0DaghDpoE2K3
         jdVg==
X-Gm-Message-State: ACgBeo00IWBT1ZiIh4ySCJQN3iP8MYeg+Wwk7uLA0k8DmvD6vlT/WuNV
	Rah5UFLqNnEPrUYLMlYPMD7/IA==
X-Google-Smtp-Source: AA6agR54QE+hN8Ju7DTkIazxJPW5QIo7EsNEoEP0MXXqd+n+3q+eLAs0p3AavhTMwpzHhqygcu3p2g==
X-Received: by 2002:a05:600c:3555:b0:3a5:d319:35cd with SMTP id i21-20020a05600c355500b003a5d31935cdmr432849wmq.161.1660292757271;
        Fri, 12 Aug 2022 01:25:57 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id s13-20020adff80d000000b002206ba7430bsm1337991wrp.15.2022.08.12.01.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 01:25:56 -0700 (PDT)
References: <20220726073841.1320509-1-windhl@126.com>
User-agent: mu4e 1.8.7; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: narmstrong@baylibre.com, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, p.zabel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 windhl@126.com
Subject: Re: [PATCH v2] soc: amlogic: meson-pwrc: Hold reference returned by
  of_get_parent()
Date: Fri, 12 Aug 2022 10:23:19 +0200
In-reply-to: <20220726073841.1320509-1-windhl@126.com>
Message-ID: <1jsfm1zx4c.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_012559_332602_66D98B36 
X-CRM114-Status: GOOD (  16.02  )
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


On Tue 26 Jul 2022 at 15:38, Liang He <windhl@126.com> wrote:

> We should hold the reference returned by of_get_parent() and use
> it to call of_node_put() for refcount balance.

Considering you are making this type of changes more or less everywhere
in the tree it would be good to propose an helper function instead of
repeating the of_get_parent(), syscon_node_to_regmap(), of_node_put()
pattern.

A coccinelle script would be nice too.

Thx

>
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  drivers/soc/amlogic/meson-ee-pwrc.c     | 5 ++++-
>  drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 5 ++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
> index 2be3afe6c2e3..dd5f2a13ceb5 100644
> --- a/drivers/soc/amlogic/meson-ee-pwrc.c
> +++ b/drivers/soc/amlogic/meson-ee-pwrc.c
> @@ -469,6 +469,7 @@ static int meson_ee_pwrc_probe(struct platform_device *pdev)
>  {
>  	const struct meson_ee_pwrc_domain_data *match;
>  	struct regmap *regmap_ao, *regmap_hhi;
> +	struct device_node *parent_np;
>  	struct meson_ee_pwrc *pwrc;
>  	int i, ret;
>  
> @@ -495,7 +496,9 @@ static int meson_ee_pwrc_probe(struct platform_device *pdev)
>  
>  	pwrc->xlate.num_domains = match->count;
>  
> -	regmap_hhi = syscon_node_to_regmap(of_get_parent(pdev->dev.of_node));
> +	parent_np = of_get_parent(pdev->dev.of_node);
> +	regmap_hhi = syscon_node_to_regmap(parent_np);
> +	of_node_put(parent_np);
>  	if (IS_ERR(regmap_hhi)) {
>  		dev_err(&pdev->dev, "failed to get HHI regmap\n");
>  		return PTR_ERR(regmap_hhi);
> diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> index b4615b288625..312fd9afccb0 100644
> --- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> +++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> @@ -273,6 +273,7 @@ static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
>  	const struct meson_gx_pwrc_vpu *vpu_pd_match;
>  	struct regmap *regmap_ao, *regmap_hhi;
>  	struct meson_gx_pwrc_vpu *vpu_pd;
> +	struct device_node *parent_np;
>  	struct reset_control *rstc;
>  	struct clk *vpu_clk;
>  	struct clk *vapb_clk;
> @@ -291,7 +292,9 @@ static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
>  
>  	memcpy(vpu_pd, vpu_pd_match, sizeof(*vpu_pd));
>  
> -	regmap_ao = syscon_node_to_regmap(of_get_parent(pdev->dev.of_node));
> +	parent_np = of_get_parent(pdev->dev.of_node);
> +	regmap_ao = syscon_node_to_regmap(parent_np);
> +	of_node_put(parent_np);
>  	if (IS_ERR(regmap_ao)) {
>  		dev_err(&pdev->dev, "failed to get regmap\n");
>  		return PTR_ERR(regmap_ao);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
