Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0A7EB64D7
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Jun 2023 05:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6eQWiReySt2b8S+exCidOYqLWlDWj+1BTry+ufbwiF4=; b=epvjXuJK11AT3/
	BZvmDa8+ISrFBqk++8E11HNfYDrYCk1w2dUXEdYlfG8jMVBQ/0ngVAbvMUQmX1Uwor/NfKiU0EUMJ
	hNT/5YmCazdO1isSaL7cMuUMbI0j2CI7rqdYhCXPL/pfg586x6TxUwYLAewsKfDIiB2xBscxiV9aC
	U40zoNuRgSa4Xza58N0Y+MgBjwwYc73oW5ulo7m2MZ5AK+H6o0VXwwkruDdViowxy7oQ3gIAZkX8i
	B4mZHfAAbpWvcnGo1MXDTwHgWpLcKPx3VuemrjIZKBzjMcf/e3ALHrUuelu9LN1Cjelomw1/MUkvu
	YYTfLMXHABC0hc2H1+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAlOT-005CkT-0k;
	Sun, 18 Jun 2023 05:56:09 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAlOP-005Cjm-2f;
	Sun, 18 Jun 2023 05:56:07 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31122c346f4so2121428f8f.3;
        Sat, 17 Jun 2023 22:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687067762; x=1689659762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NX5ZV664S/3sQaZAuC+xeosJghTMxUMI70alZxPa5Y=;
        b=paCHA7pjmnWe/IxKblZOvVLJCQMFIcAb2uKzUfv6t5CZ3G1g9hXPWQ58MUXkuXmstv
         O6R1T7qbyg22aeMnmfS9GKuJZkCptCgv8gl02U7bx3vOy2jTgX9WGMkbt+o0JvCUs+kW
         bA+mts79t+1rkGlZnKT8v1xPOjTDI1mljmSht/lqTrAYza1MktBdvcCYHnJBJ3J90SAU
         firfpBvpMPctU6fXBfPySyg6YIq2gUqqEkiphtZ3ZvVVDwpz2lqwWwcsITHzvTMXTJzj
         W+8jF/PwHqlykUASb2AVCXVaYe1soMWghMN1QCjmmR0zFF3GU948sIjFP62ppXVd7WfZ
         ffYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687067762; x=1689659762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NX5ZV664S/3sQaZAuC+xeosJghTMxUMI70alZxPa5Y=;
        b=Rj3zjJcqupnbJ0UbDuO4WDTCDUbeWnmcO6kglyuk3aUptdpjMvemqvKm6g7LnqG530
         pKj6Lt9YbbUsbOiALDOhtvPe6cvxCnp689OTaRKTeasaIQPsurxGdRTt4jmi6IOFUg1y
         sMrLPq+mwjOGWzbIviKz5mxNN9OI8H7/OcRv+0HVcZFZtdK6Fu3hhUtIOEhR/2VpISib
         Ta8Uyo83KHAbHmjthtWZblTtfjrP3qny7++2RdHalRgo6kvGW3KOZ4tH5ltWfvYPE0u3
         Dm4B54oyvMklttnV3gC5Me2g/A+s9M9ocLufyFyrcVdmJA6IAQ11PysbvgRKRyTZ4G7D
         Y71g==
X-Gm-Message-State: AC+VfDyXZBTb5yw8K3Nlif+Td1biyCU0IYKZrm0aW4ekOwHSolzkSPTy
	xnPgfedVEIALCyPxZ5brJAI=
X-Google-Smtp-Source: ACHHUZ6BOZ2LQ6J+Y8YIuDzGK/TfPStSIUARP0Kxc41zdevAjVxrE87pnYjBbRb1udZcUfffG4tAww==
X-Received: by 2002:adf:f5c8:0:b0:307:9473:fe26 with SMTP id k8-20020adff5c8000000b003079473fe26mr4901839wrp.26.1687067762314;
        Sat, 17 Jun 2023 22:56:02 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id s14-20020a170906354e00b009888b71c368sm154616eja.152.2023.06.17.22.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 22:56:01 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: glaroque@baylibre.com, rafael@kernel.org, daniel.lezcano@linaro.org,
 amitk@kernel.org, rui.zhang@intel.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, thara.gopinath@gmail.com, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, anarsoul@gmail.com,
 tiny.windzz@gmail.com, wens@csie.org, samuel@sholland.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, edubezval@gmail.com,
 j-keerthy@ti.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, bchihi@baylibre.com,
 niklas.soderlund+renesas@ragnatech.se, wenst@chromium.org,
 Yangtao Li <frank.li@vivo.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Yangtao Li <frank.li@vivo.com>
Subject: Re: [PATCH v3 02/12] thermal/drivers/sun8i: remove redundant msg in
 sun8i_ths_register()
Date: Sun, 18 Jun 2023 07:55:59 +0200
Message-ID: <2684470.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230613114904.15749-2-frank.li@vivo.com>
References: <20230613114904.15749-1-frank.li@vivo.com>
 <20230613114904.15749-2-frank.li@vivo.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230617_225605_909117_210AB7D1 
X-CRM114-Status: GOOD (  12.32  )
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

Dne torek, 13. junij 2023 ob 13:48:54 CEST je Yangtao Li napisal(a):
> The upper-layer devm_thermal_add_hwmon_sysfs() function can directly
> print error information.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/thermal/sun8i_thermal.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
> index 793ddce72132..066f9fed9b86 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -475,9 +475,7 @@ static int sun8i_ths_register(struct ths_device *tmdev)
>  		if (IS_ERR(tmdev->sensor[i].tzd))
>  			return PTR_ERR(tmdev->sensor[i].tzd);
>  
> -		if (devm_thermal_add_hwmon_sysfs(tmdev->dev, tmdev->sensor[i].tzd))
> -			dev_warn(tmdev->dev,
> -				 "Failed to add hwmon sysfs attributes\n");
> +		devm_thermal_add_hwmon_sysfs(tmdev->dev, tmdev->sensor[i].tzd);
>  	}
>  
>  	return 0;
> 





_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
