Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7D2C4708E
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Jan 2023 21:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2KuoJQpHslzhrdlY7hDPIg4QpMXybTnOqaWmhFD22Ac=; b=l/dcUvO9J679rS
	pms8ngX0yrUWCqYBSzKAYQVbNrzNlIK3MWMkDKkPsaqrrfErelvAVQGj8XwmwH06nk8UdVOnEW6vi
	nPnh8YXK2L4rKwP3/48dYwfWCSuWWNylmUvl9EeFWJw35nT0c8KRRo4EDI1rl/2fXcA0V+Ovb3jnG
	78i0Xd5ClmZPUaO23oeEqgyQYFl5MOdTntpa3O8jaAYYzmjlT/0mKYm9NkRIAVIRkpPp1TpBBsBMR
	F2fW17P4SkxkE9KfSC52/BCDSGjhlfv6k6bSq7R4VIxFW9e9pGES4ZqiQ3rnMNyLjR9fZpabeR7zo
	h1xAIPsfalvV2L0yYe1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCodW-0052Yf-Us; Tue, 03 Jan 2023 21:15:54 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCobY-0051nP-5F; Tue, 03 Jan 2023 21:13:53 +0000
Received: by mail-oi1-x231.google.com with SMTP id j130so22484307oif.4;
        Tue, 03 Jan 2023 13:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XE75YtvOdvDomo8uXrOVQKva/Jfq1iADNtB4zYNap7c=;
        b=Lpowg12mxYqoiJ4BdljvIs/bARRrYXIOFjq+fs8Y/8lZbX4Vrm/ihZGZyXrwtTDRGt
         4qarAynnfhSVeEb0jVrmjqG4XpQ+h/HGOyy9J9mlsjT01v+Kg3a6lWnk6Iu2cPUxh9mU
         N+aFsvWoqJ3eezpDT9RQTS391H9EupZbcTGDqamdY2frrRyeDbl+KnGCTFpc25tBDD6+
         dHnvlZYrv2+PTwYEVThC5180SsdwTPnuvgm/LYnlsIgpscPdfIUNimPQsM3RFZ0CHZzl
         Nk2bo61/wgKPFM/6Bzlbhkb7AZUZACncwGR4hObH5YmghEVk5a+vMWgKOwG9L9TyP6ox
         OOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XE75YtvOdvDomo8uXrOVQKva/Jfq1iADNtB4zYNap7c=;
        b=Z4OnAV5/WfuBp7oktRZZdNHunAR59A5YZiG+tvyV4Qi7T6qRHis+LTjBvN1/QNmw11
         nKgO0KRF/vKqzfJWUkRWJ7B0Dp2cZEy0yty0BIKh+ZYwhCmkze7SeCq2LpRScSRtAvd7
         aFmhTNtDROhjMB23zFoBjVKh931E6+q0Eza0+2pjzlL+DANB2QwBWYbY1lFdeTDVvgsr
         sdlc8biLmgY0LnXFoIWu+6PmbN8bKapW+Q3ICvQTxMHeCRtVmb7XzM0FxayIBv4m4nlA
         jKcacf86FL2cFKnnhR2XqYcTrc2nuNB86vCYBIOZbqTIn/BFwIKCmfEo76LYYS3wP0+K
         a5LQ==
X-Gm-Message-State: AFqh2koQVMa4TeBxonHha1Iawrl/u/yfg9KRlEZb2OodO0LkbEzHuPfG
	2Wk4zGEhrJpD3PM8PDVDRpo=
X-Google-Smtp-Source: AMrXdXvnKs27s2VbrRKfzPeMKbw05RGDjEKZXjegoX/C5hhIayzISy2/C4p1r+mZBK8lmDMr+nJaYQ==
X-Received: by 2002:a05:6808:7c9:b0:35e:7748:5899 with SMTP id f9-20020a05680807c900b0035e77485899mr19383004oij.50.1672780429799;
        Tue, 03 Jan 2023 13:13:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s22-20020a0568080b1600b0035b439a4b81sm13513958oij.31.2023.01.03.13.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 13:13:49 -0800 (PST)
Date: Tue, 3 Jan 2023 13:13:48 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] watchdog: meson_gxbb: Use devm_clk_get_enabled() helper
Message-ID: <20230103211348.GB212337@roeck-us.net>
References: <6c5948373d309408095c1a098b7b4c491c5265f7.1672490071.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c5948373d309408095c1a098b7b4c491c5265f7.1672490071.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_131352_275549_97E226A3 
X-CRM114-Status: GOOD (  18.93  )
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

On Sat, Dec 31, 2022 at 01:34:44PM +0100, Christophe JAILLET wrote:
> The devm_clk_get_enabled() helper:
>    - calls devm_clk_get()
>    - calls clk_prepare_enable() and registers what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids the need of a dedicated function used
> with devm_add_action_or_reset().
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/meson_gxbb_wdt.c | 16 +---------------
>  1 file changed, 1 insertion(+), 15 deletions(-)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 981a2f7c3bec..35d80cb39856 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -146,16 +146,10 @@ static const struct of_device_id meson_gxbb_wdt_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, meson_gxbb_wdt_dt_ids);
>  
> -static void meson_clk_disable_unprepare(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
>  static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct meson_gxbb_wdt *data;
> -	int ret;
>  	u32 ctrl_reg;
>  
>  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> @@ -166,18 +160,10 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(data->reg_base))
>  		return PTR_ERR(data->reg_base);
>  
> -	data->clk = devm_clk_get(dev, NULL);
> +	data->clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(data->clk))
>  		return PTR_ERR(data->clk);
>  
> -	ret = clk_prepare_enable(data->clk);
> -	if (ret)
> -		return ret;
> -	ret = devm_add_action_or_reset(dev, meson_clk_disable_unprepare,
> -				       data->clk);
> -	if (ret)
> -		return ret;
> -
>  	platform_set_drvdata(pdev, data);
>  
>  	data->wdt_dev.parent = dev;
> -- 
> 2.34.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
