Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2396FC636CD
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Feb 2023 13:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N9IKl/mYN5qqgDMdipm0lSKaM6FfBRXDzBDYg2Z/OHo=; b=Sw6rzwVTJruZW3
	zzk0LBMa22UvZdCisoZWaVgJQAKQFe1fNUOHB8QsoqrzgNsXXy1+B/ygcWeorABWboQ5ZMA0G0el9
	AoOfCz5KER9f65iUSAMWZ4btoKiiWIYRkIIZNeVKbjqWBvOzMYW8dBNlthexXMUdWqsLgff5P8+hQ
	CalvFKQi3wjEQn9/Zj29ur3YH0iwYQzqF9G4gs1eEvkkHrGNVrxGZs9r4aw8pnzC40htty2SmumP9
	/A1rFj3HZteVpMM4Zc4Oy63XxjYQTm4vI0slXZhJdnCjStlrlxBUhTLpeQP1ytmf1xtkb6VV70zFL
	vnSFdqHhhPidHovzGumw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPO6N-00CJ8A-4E; Tue, 07 Feb 2023 13:33:39 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPO6A-00CJ3H-RK
	for linux-amlogic@lists.infradead.org; Tue, 07 Feb 2023 13:33:29 +0000
Received: by mail-wr1-x434.google.com with SMTP id j25so10028666wrc.4
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Feb 2023 05:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4Gnj8mx6BQv+P/VZTc2ZRvZ4cPWBzn/d/g1R6N3t1SY=;
        b=sywB6VKP5uMO4iMwIfYWNewUXqdyUmfAHNyhyo3OrdI4w9hMA/do0JdT6XDgbayfL+
         hioKOeqNB9gmBTeOJ+GEqRzkacs91bBLXr18APnsVAUBpOFSSsRR/mPgDw2PAZiSngST
         GHN3F7C6RRw0zyStZrcDu6HUwZTZEJW9//HKZNnFr8pbdBYO0ZeQTSQ1wJUc9qr39WDw
         RAZprI560qB9/D7SJ2L2mhHzMzvqn4IkElOgb3RhfyiCRKxMOqVm8can1xTMfSUuQzTl
         3d/Otz4g9TJG3uwzIfUqVNKE0lVe3mXM4bFnaRqiGH/VF2JhF06rxIQG2kcu+KI3CJbC
         UTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Gnj8mx6BQv+P/VZTc2ZRvZ4cPWBzn/d/g1R6N3t1SY=;
        b=NrYl6RanOQVZWXdrIFTujnMRGKzThzBSFELgZYYeiY8PrGwojGKo8wFY/XYtr8owyW
         4fWARY5AKwCPIJ+GXXltWWYd7fuvFqTL0vN58Cs9EWpRRkmXYdaG7S9ny9h4mG+JWivo
         T1PXfBMoxwvoA31tZbzNpFw67KqCu/SfML4Zg3ZfCiMlurtK5/SvApN0ifDhyK+ZAKUO
         oOFhOYXX+txQLW+pQDOxRkF8JaliYhUXGiN0QvLHBHV3BvV2VymmshO/KrM2Ze4pfSZG
         aB/FCSy5sSCArB87TB40TQydh1NsTryYCIeSZvgk185EBHtSMmcPxNb3eoVz2Ow81Ubk
         XzlQ==
X-Gm-Message-State: AO0yUKUQBCW82kRsRV1empSa0BDJifYIbeZU7gOlQrTw6NVGyHROiM4+
	f6IVqb9HqwWlskCIxYjC1mvyBw==
X-Google-Smtp-Source: AK7set9tflq7m2WGhWzU48ho/FGtJPjdoU4DUvNTQOyFDfwfzYJ/cgrUGOgVxSNmGa0o1E+FD6YRHA==
X-Received: by 2002:a05:6000:1b0f:b0:2c3:ea4d:3f01 with SMTP id f15-20020a0560001b0f00b002c3ea4d3f01mr2338118wrz.27.1675776801421;
        Tue, 07 Feb 2023 05:33:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c58c:fc5c:67d6:e5f3? ([2a01:e0a:982:cbb0:c58c:fc5c:67d6:e5f3])
        by smtp.gmail.com with ESMTPSA id t1-20020a5d4601000000b002bdfe3aca17sm11241983wrq.51.2023.02.07.05.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 05:33:21 -0800 (PST)
Message-ID: <e8e983a7-5dac-507d-414e-0fdc1082644a@linaro.org>
Date: Tue, 7 Feb 2023 14:33:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] thermal: Remove core header inclusion from drivers
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, rafael.j.wysocki@intel.com
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, ye xingchen
 <ye.xingchen@zte.com.cn>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Haowen Bai <baihaowen@meizu.com>, Minghao Chi <chi.minghao@zte.com.cn>,
 "open list:THERMAL DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 "open list:RENESAS R-CAR THERMAL DRIVERS"
 <linux-renesas-soc@vger.kernel.org>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
References: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_053326_927539_A35699BE 
X-CRM114-Status: GOOD (  20.72  )
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

On 06/02/2023 16:34, Daniel Lezcano wrote:
> As the name states "thermal_core.h" is the header file for the core
> components of the thermal framework.
> 
> Too many drivers are including it. Hopefully the recent cleanups
> helped to self encapsulate the code a bit more and prevented the
> drivers to need this header.
> 
> Remove this inclusion in every place where it is possible.
> 
> Some other drivers did a confusion with the core header and the one
> exported in linux/thermal.h. They include the former instead of the
> latter. The changes also fix this.
> 
> The tegra/soctherm driver still remains as it uses an internal
> function which need to be replaced.
> 
> The Intel HFI driver uses the netlink internal framework core and
> should be changed to prevent to deal with the internals.
> 
> No functional changes
> 
> [ Applies to thermal/linux-next or linux-pm/linux-next ]
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>   drivers/thermal/amlogic_thermal.c           | 1 -
>   drivers/thermal/armada_thermal.c            | 2 --
>   drivers/thermal/broadcom/bcm2835_thermal.c  | 1 -
>   drivers/thermal/hisi_thermal.c              | 3 +--
>   drivers/thermal/imx8mm_thermal.c            | 1 -
>   drivers/thermal/imx_sc_thermal.c            | 1 -
>   drivers/thermal/intel/intel_hfi.c           | 3 ++-
>   drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 1 -
>   drivers/thermal/qoriq_thermal.c             | 1 -
>   drivers/thermal/rcar_gen3_thermal.c         | 1 -
>   drivers/thermal/samsung/exynos_tmu.c        | 3 +--
>   drivers/thermal/st/stm_thermal.c            | 1 -
>   drivers/thermal/tegra/tegra30-tsensor.c     | 1 -
>   drivers/thermal/uniphier_thermal.c          | 2 --
>   14 files changed, 4 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
> index d30cb791e63c..9235fda4ec1e 100644
> --- a/drivers/thermal/amlogic_thermal.c
> +++ b/drivers/thermal/amlogic_thermal.c
> @@ -28,7 +28,6 @@
>   #include <linux/regmap.h>
>   #include <linux/thermal.h>
>   
> -#include "thermal_core.h"
>   #include "thermal_hwmon.h"
>   
>   #define TSENSOR_CFG_REG1			0x4

For Amlogic:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

<snip>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
