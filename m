Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04751EB64DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Jun 2023 15:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RnEakiBiJYyF7MofJVQOdC7MUMm+6P4+dWL02OGu7KQ=; b=gg2K1fJNs/+Bw1
	NPE2kS68eWi35Cw7DynMib1vTvYBCRHn4e76FA8uGzQFdcCCsT77J0N8DZdDdsmafEXZA49ohEGKq
	yu8bHng7O16jz4gY4jfhljdsiW8qJ3Ne8EmzoByPMIrIJ/5G0BJYwjUYtmha4Dbmg2+mVF22uvNiB
	aDcyt8gIkRd9i6oFReJgxF3v8jZS6MQfHfjYX1x9jKm8E+QmtJomXWHopK0Cqq1zzw8LCbbq6T8Wg
	ZtOiklQXaUCGorILIdT/JsJkbSSPX1kExl7f0PSxMddlkKQTsZnvjt0+qEEq5f6aje/J8CtvoI803
	rzCP4bMgD5xwtknDRuiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBGdE-008l8y-09;
	Mon, 19 Jun 2023 15:17:28 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBGdB-008l7y-35;
	Mon, 19 Jun 2023 15:17:27 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f8f3786f1dso39420755e9.2;
        Mon, 19 Jun 2023 08:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687187842; x=1689779842;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C2BCqWZdnOgJLi1yS8YB0jgtq7UEXjCvPUI8CflkrIM=;
        b=fcoarEbtF5e7jxTOdi2dHyVdAjhYmhluM3IFzimhgMrW9R2daBbBYONDuB/o0J7YOr
         bYoFkt5eSY/Qihi9kxiUYuqaZKwp6C/9xXf69fScIaGVS4gjGSSOvIOa3jTRTzaSwqgo
         2gaZezk7u5fR7Kg509bBrm6W/dGDLiGwmt92XSnrUpruNV7ERRTZMtx4PpTBz5mWAvXH
         E6WXnT/ZBDfu65fZkld2fRZj1Frr4AmlNFoCLHOgMTJ+7yEUexlom1z70/90A4OAA2Yh
         NSvi3RBD5Ebu0ss9+0SIJSPmMzhVizmHebLSUqHuIeomQXmB+2xsS8oMi2Q6cDaymSv0
         1KBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687187842; x=1689779842;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C2BCqWZdnOgJLi1yS8YB0jgtq7UEXjCvPUI8CflkrIM=;
        b=AectCQFpuLURNEz7CaHE+MMisDyTlLPXYehKIPLCbHGglmNu9WKa0+yj38K2SyF1IM
         CnsNpdJqY/BVTY2exIhLbag9+4K0eHx74BejMEDyPY4052HgXPlj6ykgYDhZj7dNTCvh
         2sLEWPfoZOhRJnlEMDgNIEHNMaibOU3JCMt7hfQYmTd4ehWPgr454Ew1Oq3hNmaNtIER
         oI4hmpg6nqOEH3Zniq08XQPRVrFCOiJCByr5JpJqYVc4TGQtqVEFbryEub2WRCT5VrRN
         2lQHlnEdRMAvw9kUNNOJpHvAtHxPV8zfK3R3dEpuuZAMpWDjin+xq9lgsWrmDY8r2ZdX
         aIsw==
X-Gm-Message-State: AC+VfDzPeBciyuhlf4U79u0ul0ACckP0rA1dSU6E1A9Ov5jOWK51/nq+
	ZecXZP6/5Dh4yjOP2Ea7aGQ=
X-Google-Smtp-Source: ACHHUZ7K5Wzb9tlqACcOU9KMrL7nII5/kQ/ZHVCVs95ZpIEDFwh9jxtGKtIzb9hQmQ6Nf+bJZPS2NA==
X-Received: by 2002:a7b:ce14:0:b0:3f9:7a15:1716 with SMTP id m20-20020a7bce14000000b003f97a151716mr3720485wmc.5.1687187842081;
        Mon, 19 Jun 2023 08:17:22 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id v18-20020a5d43d2000000b0030ae93bd196sm31712456wrr.21.2023.06.19.08.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 08:17:21 -0700 (PDT)
Message-ID: <91db8e7b-29fb-3c43-ac38-008ebc9b1f6b@gmail.com>
Date: Mon, 19 Jun 2023 17:17:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 11/12] thermal/drivers/generic-adc: Register thermal
 zones as hwmon sensors
Content-Language: en-US, ca-ES, es-ES
To: Yangtao Li <frank.li@vivo.com>, glaroque@baylibre.com, rafael@kernel.org,
 daniel.lezcano@linaro.org, amitk@kernel.org, rui.zhang@intel.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, thara.gopinath@gmail.com,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
 anarsoul@gmail.com, tiny.windzz@gmail.com, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, thierry.reding@gmail.com,
 jonathanh@nvidia.com, edubezval@gmail.com, j-keerthy@ti.com,
 angelogioacchino.delregno@collabora.com, bchihi@baylibre.com,
 niklas.soderlund+renesas@ragnatech.se, wenst@chromium.org
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230613114904.15749-1-frank.li@vivo.com>
 <20230613114904.15749-11-frank.li@vivo.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230613114904.15749-11-frank.li@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_081725_998421_FB460F94 
X-CRM114-Status: GOOD (  16.37  )
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



On 13/06/2023 13:49, Yangtao Li wrote:
> From: Chen-Yu Tsai <wenst@chromium.org>
> 
> Register thermal zones as hwmon sensors to let userspace read
> temperatures using standard hwmon interface.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> [Yangtao change to use dev_warn and remove return]
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   drivers/thermal/thermal-generic-adc.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/thermal/thermal-generic-adc.c b/drivers/thermal/thermal-generic-adc.c
> index 017b0ce52122..9531bc2f2ce7 100644
> --- a/drivers/thermal/thermal-generic-adc.c
> +++ b/drivers/thermal/thermal-generic-adc.c
> @@ -13,6 +13,8 @@
>   #include <linux/slab.h>
>   #include <linux/thermal.h>
>   
> +#include "thermal_hwmon.h"
> +
>   struct gadc_thermal_info {
>   	struct device *dev;
>   	struct thermal_zone_device *tz_dev;
> @@ -153,6 +155,9 @@ static int gadc_thermal_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	if (devm_thermal_add_hwmon_sysfs(&pdev->dev, gti->tz_dev))
> +		dev_warn(&pdev->dev, "Failed to add hwmon sysfs attributes\n");

Isn't that already done by patch 1/12?

Regards,
Matthias

> +
>   	return 0;
>   }
>   

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
