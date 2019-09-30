Return-Path: <SRS0=PIQu=XZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4030DC4360C
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2019 08:23:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 056332086A
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2019 08:23:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ubhYRAgD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zSbOu0cu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 056332086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKvrGvjhbOqgDM86vaNzzl0kZR8nzRIPrgc8mj63ifE=; b=ubhYRAgDf+uJr1
	QSHW1hAMyizPGjEZyK0ETRPcrXwTe2AUW67W9xOvF7geA9Qxm50rKo+gw8C+ZroRlgHkXwgoz7ANq
	pgb2vUpry3UUvzv+WE+/OT8CxKkIGSsiYt2lhBg4RqYzpZk/iepByNCC/3DS3JKRC9u56IJwBDPde
	Fpsyg3JvBBiuUw27CrkOe+swB9sYSxyEkEf0hK3O/424qBmgLtkTiyKSrLOMjCH3Y3mxypPnDwXz/
	KKfJDO6IWgSRV89raIigUX9SBrymW6GacBL07QrmJP09aaSI9DYmbVgk4WMHRsjZ2++k20MRcNlXu
	x5+PGg+8KLgu4I2l/yXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iEqxz-0002CV-9Z; Mon, 30 Sep 2019 08:23:35 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iEqvN-0007y3-2g
 for linux-amlogic@lists.infradead.org; Mon, 30 Sep 2019 08:20:55 +0000
Received: by mail-wr1-x443.google.com with SMTP id q17so10107874wrx.10
 for <linux-amlogic@lists.infradead.org>; Mon, 30 Sep 2019 01:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=wdxTBl8cU2cVPs/w2lTCBljy6drx0Eb06vJ1V1ISALk=;
 b=zSbOu0cuMgrqVrg2TA4dvy9qeU8bB0uoAmv3vIKTNdn+XwhbpAxcIzwvyGflTNpBye
 1XDJuEBrrfXTpWlxuW6MYyykKnEvU0m9T/DdksJeboCkQez5syGJuVPY92VlRvHjoi82
 kQrrktwvokdHYGosQlVI8hls+XZJ77Qyu3pwKERvtbKDNsy2JFqbtrxNfXImECcG8NOl
 Y91Y6zo7Ioi0nEArnKkM8kD9/GXnFywgNLL1gP1eJBaro3zVepkXp48AP4UPvqobp8ad
 0yIdKozJF5q8u0s67iufCB3Ighso054aD3fxCit8kmt166i/bc+qEuLEsRN+lxXTb6Qo
 6izg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=wdxTBl8cU2cVPs/w2lTCBljy6drx0Eb06vJ1V1ISALk=;
 b=SR01p5zo1lVTm32KOdXMPHea2mIaofMkFxiMxhGpqhUN/xbimbn1DR9jnQmWtT9DZk
 eGM55xozu2pDW9umexXVTMQPsBJvch6+5iL3tWHeKMmDr2FbS4ARu3NLIRMFTyouY9l7
 bC6ik4Hx/KYVOtnLdUTVQCrVHI8AxtHYyhVERwTJkRLEtwP4+c6NIht9gb2ZG18thyU1
 zs6ZV2UhdGlqooiiclHyITzeaH9KIZRhGI4naSp2fc+hcEMioiKw4h1C93yWEvLBD3F0
 d3QnZ6m9bIrHfhkqropzt7Lsdrp0vNF3IQjeFPmHA8SWYo6YP9nuPXe2Mz9RMZ7D9sNR
 Op+A==
X-Gm-Message-State: APjAAAXhi+rh0bQY6lKnjb2Qs0Bg2m5Sr7FsI01L7jXURCeEmc8KUGVk
 aPh1BRmHWKSaBSDd5M5OghLqKQ==
X-Google-Smtp-Source: APXvYqzVxfFKRFJiabLeJLa1njRxX1vJlWUqYSjjGipZgbi6615EZhxUuvoaf5D2oqW4nbz9sHxnoQ==
X-Received: by 2002:adf:e292:: with SMTP id v18mr13309640wri.232.1569831651429; 
 Mon, 30 Sep 2019 01:20:51 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id w125sm39270770wmg.32.2019.09.30.01.20.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Sep 2019 01:20:50 -0700 (PDT)
Subject: Re: [PATCH] drm/meson: enable runtime PM
To: Kevin Hilman <khilman@kernel.org>, dri-devel@lists.freedesktop.org
References: <20190925193154.20732-1-khilman@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <c0db12a0-66c3-7636-a7bd-b071d0820426@baylibre.com>
Date: Mon, 30 Sep 2019 10:20:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190925193154.20732-1-khilman@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190930_012053_141140_EF2ED664 
X-CRM114-Status: GOOD (  17.14  )
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
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Kevin,

On 25/09/2019 21:31, Kevin Hilman wrote:
> From: Kevin Hilman <khilman@baylibre.com>
> 
> On some SoCs, the VPU is in a power-domain and needs runtime PM
> enabled and used in order to keep the power domain on.
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  drivers/gpu/drm/meson/meson_drv.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 2310c96fff46..256b6a0e9c6b 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -14,6 +14,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/component.h>
>  #include <linux/of_graph.h>
> +#include <linux/pm_runtime.h>
>  
>  #include <drm/drmP.h>
>  #include <drm/drm_atomic.h>
> @@ -274,6 +275,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  
>  	/* Hardware Initialization */
>  
> +	pm_runtime_get_sync(dev);
>  	meson_vpu_init(priv);
>  	meson_venc_init(priv);
>  	meson_vpp_init(priv);
> @@ -416,6 +418,7 @@ static int meson_drv_probe(struct platform_device *pdev)
>  	struct device_node *ep, *remote;
>  	int count = 0;
>  
> +	pm_runtime_enable(&pdev->dev);
>  	for_each_endpoint_of_node(np, ep) {
>  		remote = of_graph_get_remote_port_parent(ep);
>  		if (!remote || !of_device_is_available(remote)) {
> @@ -440,6 +443,7 @@ static int meson_drv_probe(struct platform_device *pdev)
>  	}
>  
>  	/* If no output endpoints were available, simply bail out */
> +	pm_runtime_disable(&pdev->dev);
>  	return 0;
>  };
>  
> 

I'll rather implement true runtime PM instead,

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
