Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E551C001DE
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Jul 2023 08:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmmGbH2bdauKlwYzeFy5IJHhSpwVSHMp8ksQKVGwH4I=; b=e080NpzQ3zXkBuC2HOkAMsUtNU
	xPHZwAPotBTTxlVJqRBchZ+h8+YgSGIGi+NoW23jvDMtG6jipR5hEfSfTBOiMorxkTz1ZmBeuE/vT
	80uFSHX+7gRRMTNh4JelsrjbIU8OHgXnVJXjMMKYgpstFJ5wQhBBmQJf2IIA1ks7WDGQAcrwCk5zb
	nH50rgqLV/QTRXtav6XFVn/j4y3ur/FepWairyIhkg2r0QO9dqB/1O0sbPCDdCFLd4EBzxIlnEdDp
	1QSroyX+x8XOczL+Pq/rxwgewdPOvZVISPXrYE+QnmhxsNe0KD29IUuTVNA0JrCATMzPAqa73GyXU
	UgSvwz1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOeq-00EbHE-0t;
	Mon, 31 Jul 2023 08:53:40 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOen-00EbG2-1D
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Jul 2023 08:53:38 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbc77e76abso39196105e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Jul 2023 01:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690793616; x=1691398416;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k4Yh+f6GncnO7wF9Y2cPhaYuIy/Sv6tOpgODNCPb3Ok=;
        b=s4kW1TUzdfGnCNk6aS3NmscVZPyongw/PYbcbe1brXNYm7+RhosdO8udnDygsiCii1
         KKgF7nYJ0iTm2DsT30nC684d+5UhGCCewP4kSsq/XOkKaB3ooMbwes6Hh2M8Pd8Jfsei
         1UIATRNWQz0nnzIU6v67FzCY1epmLYRLTFFDCXWfLOk9G/fG+n54i9nVsM1kDXIfs7ik
         uD5f14OXNc9HxdyCwC4YnJjuD/FlH1mvgaPXor1rBA0fVfy27ue3UMnObTaICXQ8FVIQ
         q57IzV2m8BZU6yg/3mDcCOa/Q91hEUoghnWP9E3/L3qhGIVh1kV61gzH6K/dZuGEqeDZ
         Vp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793616; x=1691398416;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4Yh+f6GncnO7wF9Y2cPhaYuIy/Sv6tOpgODNCPb3Ok=;
        b=brx5lVF4fF0cX5uHkV3P5H1LooF3/KApBtpcQvNIyvxwDZs0/d/t5zPUXuCfGipeEo
         HRJgO66ilPha7RPfGrAgvEjd8TQQUt3GfMIZTPaBKzNKAQDkRcL+wHQI7a5dcXmQEtCX
         VskxQ5GOioTVYniHsp03hKcDDuuSVgznyFM5cwOaPnIaPCP8aHtZoMvI78gUcvT5gsWS
         l22IF3UcdRcHR0aLWPyA5suK+caVioYNBl5aLQWnYiIPOz/iIFkRVjDu8uMlaitXXNGc
         xXWFIxiqNcjlB/4v6706KGwUA0I+8qexd1ZPuXoF4dkDllVlw6ENiR6TeXqwyb601QZW
         ItUg==
X-Gm-Message-State: ABy/qLbt838NaQCq7NicLyki/5KT5rNRWN505PLX5ZoT+5ekQiibkpE2
	0D0OudW9qx2LPX9NIWMB6WTVbg==
X-Google-Smtp-Source: APBJJlFkdi6dFIFk3K8ltMzX+mCMt0AqSuU5XaQhLYuJYJ0ZiNsU1f7D54DBojjArL1sPd5fOxBC5Q==
X-Received: by 2002:a7b:c019:0:b0:3f7:f584:579b with SMTP id c25-20020a7bc019000000b003f7f584579bmr6621217wmb.9.1690793615976;
        Mon, 31 Jul 2023 01:53:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:14b8:9aa7:6bf0:256d? ([2a01:e0a:982:cbb0:14b8:9aa7:6bf0:256d])
        by smtp.gmail.com with ESMTPSA id n6-20020a7bcbc6000000b003fe1e3937aesm3399576wmi.20.2023.07.31.01.53.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 01:53:35 -0700 (PDT)
Message-ID: <8a8ea225-3730-20cf-9ad0-46fbd6e5f5bb@linaro.org>
Date: Mon, 31 Jul 2023 10:53:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] soc: amlogic: Explicitly include correct DT includes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230714175124.4066972-1-robh@kernel.org>
Organization: Linaro Developer Services
In-Reply-To: <20230714175124.4066972-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_015337_422753_001E1424 
X-CRM114-Status: GOOD (  15.12  )
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

On 14/07/2023 19:51, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   drivers/soc/amlogic/meson-canvas.c      | 1 +
>   drivers/soc/amlogic/meson-ee-pwrc.c     | 3 +--
>   drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 3 +--
>   drivers/soc/amlogic/meson-secure-pwrc.c | 2 +-
>   4 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/amlogic/meson-canvas.c b/drivers/soc/amlogic/meson-canvas.c
> index 383b0cfc584e..b6e06c4d2117 100644
> --- a/drivers/soc/amlogic/meson-canvas.c
> +++ b/drivers/soc/amlogic/meson-canvas.c
> @@ -8,6 +8,7 @@
>   #include <linux/kernel.h>
>   #include <linux/mfd/syscon.h>
>   #include <linux/module.h>
> +#include <linux/platform_device.h>
>   #include <linux/regmap.h>
>   #include <linux/soc/amlogic/meson-canvas.h>
>   #include <linux/of_address.h>
> diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
> index f54acffc83f9..cfb796d40d9d 100644
> --- a/drivers/soc/amlogic/meson-ee-pwrc.c
> +++ b/drivers/soc/amlogic/meson-ee-pwrc.c
> @@ -4,13 +4,12 @@
>    * Author: Neil Armstrong <narmstrong@baylibre.com>
>    */
>   
> -#include <linux/of_address.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_domain.h>
>   #include <linux/bitfield.h>
>   #include <linux/regmap.h>
>   #include <linux/mfd/syscon.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>   #include <linux/reset-controller.h>
>   #include <linux/reset.h>
>   #include <linux/clk.h>
> diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> index 5d4f12800d93..33df520eab95 100644
> --- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> +++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> @@ -5,13 +5,12 @@
>    * SPDX-License-Identifier: GPL-2.0+
>    */
>   
> -#include <linux/of_address.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_domain.h>
>   #include <linux/bitfield.h>
>   #include <linux/regmap.h>
>   #include <linux/mfd/syscon.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>   #include <linux/reset.h>
>   #include <linux/clk.h>
>   #include <linux/module.h>
> diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/soc/amlogic/meson-secure-pwrc.c
> index 25b4b71df9b8..b994f03380b0 100644
> --- a/drivers/soc/amlogic/meson-secure-pwrc.c
> +++ b/drivers/soc/amlogic/meson-secure-pwrc.c
> @@ -7,7 +7,7 @@
>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>   
>   #include <linux/io.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_domain.h>
>   #include <dt-bindings/power/meson-a1-power.h>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
