Return-Path: <SRS0=Dn2N=WI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81EFDC433FF
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 07:18:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BC4220663
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 07:18:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cIVNo1rV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Pf9OF3R8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BC4220663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09/GzVDiSvGoKbDgZj3HQcpZTS8UZT8pvb52lvR5TNE=; b=cIVNo1rVL3owAQ
	Ncv+JVW1RESE9hbv5eb/DJwJzzkAKKIIw55FPeyy+V6zCiOHpJ6iyORUVfCxFnEYJT3paZSLni2ST
	h+eefoBppEhYiQAl+g2TOlCUbmpwk75MdSdEBoA7xFyCh4FRBeybvsy6yeFzm1m4FQrqGbAya4VoF
	RrhctUXGLo+B6wH+S0EeqLWh9JX7oYLvmHvzABINABIDRrqVJ/vPU6kg3vCcRb2145kcehNJhfYJ9
	b0d/Q3zXAXJGTksAlFvsBoGh7SxBZlBbFWkzXf4lFVRfea73dxKp1KAs6CY+hxayDUQR/xUGz98y8
	KcNJ9qhQc+dwXeKd1yzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hx4bL-0007Cx-C4; Mon, 12 Aug 2019 07:18:43 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hx4bH-0007C5-WD
 for linux-amlogic@lists.infradead.org; Mon, 12 Aug 2019 07:18:41 +0000
Received: by mail-wm1-x343.google.com with SMTP id v19so10809895wmj.5
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Aug 2019 00:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4SkoYKJPPUsAqCU0PlnVuHYXLRpiX1FUuP5l6o8DRTE=;
 b=Pf9OF3R8aHE1dbrQXHyEdsudVKwdqgk2u0FfGb31dEzN6ODjEadoGyKMvfAVo6MTE3
 0rYsNcq3uChktN8FHDnZNo3et7gv+VXQmzTKG4gRX3DhF/0mr2PQiuDC/jsFqPwqTIee
 OV6UTR7eb3VbsrmNrpxZ3ysFbPugo3UZ5NkWxAyiqrdig6nbjccP462XsliX6QnhIRUw
 4HS4r8CyVxf9wmcVtaDrCIJhfdq/6XnVXdF4lGHt2ijGr3PVMPnIamVmAP5B+L8vyX8z
 K3t3kmlVPwMUYaSh/UIOCMVTt5rj3w6HpQiSbkYLj/Rop5HIMJdNPf/D9RnkC9ysc5Pd
 B2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4SkoYKJPPUsAqCU0PlnVuHYXLRpiX1FUuP5l6o8DRTE=;
 b=mop9mYy0/quSTyV0uFGs/JSiQ/uBg2B8RzY4gu66bw+I9EWMNujslx3I1ml2Uwkqb+
 J4VSBP1RLk8Q4+RSjxO/6JH4QhvXxpLWLosAiV8T+29/qLv63HgXF4emCdINb+TvYjmA
 x9El8LRHqkq4EVwd8qKDA19ggCGmNkZamKhgo1mXM4smYO3PDb1wIw9MmkoWtDfHPLt1
 U6uI21Hapc0Dp+BSe79hSpfDlP3xgQXwY4+C3JXXu/dQCDRcX0AdZ2lKB+U3VoH4WCpK
 Byh6eCrqhLqw+38xGkIxdqG34R8wxCBzOBOlE+tlB4UP/Yd/lAnJhYiXzfzbkGcpCcFb
 hT7g==
X-Gm-Message-State: APjAAAUwObsGvGp8RNWkI2HZwpt981Yk5VeeAPgvtakXK5XDmYCAXBXN
 ZGYY3U9JvgcSpRdCziApuNK4qZ930wd49w==
X-Google-Smtp-Source: APXvYqwQoqPAYLZlujA5dqq8oLhbBGcWXbcbijK3IPKSprK2R/0DJVhedjeZ2SRUzMlwGWRx9lYxOA==
X-Received: by 2002:a7b:c244:: with SMTP id b4mr6523688wmj.125.1565594315268; 
 Mon, 12 Aug 2019 00:18:35 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 g11sm99804759wrq.92.2019.08.12.00.18.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Aug 2019 00:18:34 -0700 (PDT)
Subject: Re: [PATCH/RFT] soc: amlogic: meson-gx-pwrc-vpu: switch to clk_bulk
To: Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20190809230904.28747-1-khilman@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <fee37e05-183b-c764-4749-b71faa59b1eb@baylibre.com>
Date: Mon, 12 Aug 2019 09:18:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809230904.28747-1-khilman@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_001840_042075_A8B6F39F 
X-CRM114-Status: GOOD (  19.81  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 10/08/2019 01:09, Kevin Hilman wrote:
> Instead of expecting a specific number of clocks with specific clock
> names, switch to using the bulk clock API.
> 
> This is a first step towards generalizing this driver to work with
> other domains.
> 
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
> Boot tested on meson-g12a-sei510 and verified that framebuffer console
> comes up and still works.
> 
>  drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 41 ++++++-------------------
>  1 file changed, 10 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> index 511b6856225d..5f6519f43a31 100644
> --- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> +++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> @@ -34,8 +34,8 @@ struct meson_gx_pwrc_vpu {
>  	struct regmap *regmap_ao;
>  	struct regmap *regmap_hhi;
>  	struct reset_control *rstc;
> -	struct clk *vpu_clk;
> -	struct clk *vapb_clk;
> +	struct clk_bulk_data *clks;
> +	int num_clks;
>  };
>  
>  static inline
> @@ -76,8 +76,7 @@ static int meson_gx_pwrc_vpu_power_off(struct generic_pm_domain *genpd)
>  
>  	msleep(20);
>  
> -	clk_disable_unprepare(pd->vpu_clk);
> -	clk_disable_unprepare(pd->vapb_clk);
> +	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
>  
>  	return 0;
>  }
> @@ -119,25 +118,14 @@ static int meson_g12a_pwrc_vpu_power_off(struct generic_pm_domain *genpd)
>  
>  	msleep(20);
>  
> -	clk_disable_unprepare(pd->vpu_clk);
> -	clk_disable_unprepare(pd->vapb_clk);
> +	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
>  
>  	return 0;
>  }
>  
>  static int meson_gx_pwrc_vpu_setup_clk(struct meson_gx_pwrc_vpu *pd)
>  {
> -	int ret;
> -
> -	ret = clk_prepare_enable(pd->vpu_clk);
> -	if (ret)
> -		return ret;
> -
> -	ret = clk_prepare_enable(pd->vapb_clk);
> -	if (ret)
> -		clk_disable_unprepare(pd->vpu_clk);
> -
> -	return ret;
> +	return clk_bulk_prepare_enable(pd->num_clks, pd->clks);
>  }
>  
>  static int meson_gx_pwrc_vpu_power_on(struct generic_pm_domain *genpd)
> @@ -273,8 +261,6 @@ static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
>  	struct regmap *regmap_ao, *regmap_hhi;
>  	struct meson_gx_pwrc_vpu *vpu_pd;
>  	struct reset_control *rstc;
> -	struct clk *vpu_clk;
> -	struct clk *vapb_clk;
>  	bool powered_off;
>  	int ret;
>  
> @@ -310,23 +296,16 @@ static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
>  		return PTR_ERR(rstc);
>  	}
>  
> -	vpu_clk = devm_clk_get(&pdev->dev, "vpu");
> -	if (IS_ERR(vpu_clk)) {
> -		dev_err(&pdev->dev, "vpu clock request failed\n");
> -		return PTR_ERR(vpu_clk);
> -	}
> -
> -	vapb_clk = devm_clk_get(&pdev->dev, "vapb");
> -	if (IS_ERR(vapb_clk)) {
> -		dev_err(&pdev->dev, "vapb clock request failed\n");
> -		return PTR_ERR(vapb_clk);
> +	ret = devm_clk_bulk_get_all(&pdev->dev, &vpu_pd->clks);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "bulk clock request failed\n");
> +		return ret;
>  	}
> +	vpu_pd->num_clks = ret;
>  
>  	vpu_pd->regmap_ao = regmap_ao;
>  	vpu_pd->regmap_hhi = regmap_hhi;
>  	vpu_pd->rstc = rstc;
> -	vpu_pd->vpu_clk = vpu_clk;
> -	vpu_pd->vapb_clk = vapb_clk;
>  
>  	platform_set_drvdata(pdev, vpu_pd);
>  
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
