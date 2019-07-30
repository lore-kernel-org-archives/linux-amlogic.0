Return-Path: <SRS0=HPE/=V3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 494A5C433FF
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jul 2019 09:05:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B57C20644
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jul 2019 09:05:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AhTkDx/L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QQuz+tr3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B57C20644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dYTTANFfwy/vgEAEFI4/ZFMuEYEcBZjjGnAW/FXD+00=; b=AhTkDx/LZvUe0J
	pXc7UldV/eSgm1JjulFoPedhzm9WE2W5HVUct2Knca3JposUR8hnaaEax1qku1/DijApkGdJqqHQg
	yITJlnDnlEdoWdeO+eZeip99OvySkkLarfZF/QRLgDr3sQFBYUU+funhaZERdXF6AMr2Juv7YEkQa
	69k5v1MYFSNmulwGHjvsWbYFdVGu7yzRTYExc2kftkWika52P9lWzuiWRt7+2pOs+oaKPq1wsN+dS
	CZlPCEtjZ1zQN7doOf2IgFcJx+TjZOs2thmMpAXBTmDG1PfYdo24EovUnk3PnfrPe3T9oC8V9hAig
	OOAXbVgl7swMQfqTkrTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsO4C-0008QC-9I; Tue, 30 Jul 2019 09:05:08 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsO3Z-0007mD-HG
 for linux-amlogic@lists.infradead.org; Tue, 30 Jul 2019 09:04:33 +0000
Received: by mail-wm1-x341.google.com with SMTP id h19so44821436wme.0
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Jul 2019 02:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=5G29QbB83YiXlS3ExY1vb4rgH3ehmgGSy8rpPGRoRUI=;
 b=QQuz+tr3jxms4vmjzbDBu2LjnsfmujJedbSA3a+s2hDtimOuwp1FYRMgvPHHrNRFxC
 Vgxd8P9SS1vtxjd0zFVpzwfuM6LzriTnz4D16vpN0wEWN74amtRgwOGYdBHYPOMsf+iV
 klK71KI6dcGzjeovnUOQDduTkv41veYXGyMKcOyTQAKE1S1rSh64H4H0TjI7IizbFQ2V
 x6wTcjr15VKhOlQ/QVkZEtnMzA1Y7y3alPQ3PVnehVyosmStD6JJzZCK6iRklahNgalj
 j86IdYVk624rJKW2HK8+uVczMzSmBEIm7v1voPRqmK4AMm2IFWOhxDB7QvhwYTw3Qf4s
 zOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=5G29QbB83YiXlS3ExY1vb4rgH3ehmgGSy8rpPGRoRUI=;
 b=q/fD4xUngf7kOnd58Ne8GOiejqX3U1iFfY1Uv5TqOrT882UfDxihJDHkf731g1RFNh
 vXML3iN9VvE2iwhcGu8pztRmIteqlwpckeV6/NLvtbcVxSGsyOJKBCrXrwRQrhHV+WTG
 B/5be8nFW1YLeFoVlTa6k58bIPLEPRtxhQCGkvWd4JqyLXLCkncp39UeseYH0ua46JQ1
 bAP/sb+pqH2zWL94QVl+4uH2Lh2AzcMrjSnz3dKDAvvGlosWpMaE2QYF5qZPZuJV9gjO
 H2s2BvKwHFHnON3Nr0MuaADK7PJ0i+Gu88KLEuOCmKSzemdT11SFgZb3veyhA4jGlMnl
 mUEQ==
X-Gm-Message-State: APjAAAW2lz41Aj1wzqFbwJt0BaIHEN3v3GnXrbJhMcAXaCgRnFtYP07d
 6Oc//ITlgRHkInr2a2JP8fgcG5urSxo=
X-Google-Smtp-Source: APXvYqzQ/1TapVb4uI4LpAERm0Xdmc4Cox/XEe9lQXPCwZOksx+WTviajzEB7qo6NwQjWNA+UMlaBg==
X-Received: by 2002:a1c:be11:: with SMTP id
 o17mr103534133wmf.115.1564477466755; 
 Tue, 30 Jul 2019 02:04:26 -0700 (PDT)
Received: from localhost ([2a01:e34:eeb6:4690:ecfa:1144:aa53:4a82])
 by smtp.gmail.com with ESMTPSA id y16sm64493567wrw.33.2019.07.30.02.04.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 02:04:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>, srinivas.kandagatla@linaro.org,
 khilman@baylibre.com, narmstrong@baylibre.com, robh+dt@kernel.org,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] nvmem: meson-efuse: Move data to a container struct
In-Reply-To: <20190729183941.18164-2-ccaione@baylibre.com>
References: <20190729183941.18164-1-ccaione@baylibre.com>
 <20190729183941.18164-2-ccaione@baylibre.com>
Date: Tue, 30 Jul 2019 11:04:24 +0200
Message-ID: <1jy30f28rr.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_020429_670565_C2484820 
X-CRM114-Status: GOOD (  15.28  )
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
Cc: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon 29 Jul 2019 at 19:39, Carlo Caione <ccaione@baylibre.com> wrote:

> No functional changes, just a cleanup commit to tidy up a bit. Move the
> nvmem_* and clk structures in a container struct.
>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  drivers/nvmem/meson-efuse.c | 47 ++++++++++++++++++++-----------------
>  1 file changed, 26 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
> index 39bd76306033..9924b98db772 100644
> --- a/drivers/nvmem/meson-efuse.c
> +++ b/drivers/nvmem/meson-efuse.c
> @@ -14,6 +14,12 @@
>  
>  #include <linux/firmware/meson/meson_sm.h>
>  
> +struct meson_efuse {
> +	struct nvmem_device *nvmem;
> +	struct nvmem_config config;
> +	struct clk *clk;

since this driver uses devm_add_action_or_reset, I don't think you need
to keep the clk pointer around, unless you plan to do something with it
later on ?

It is kind of the same the other structure members, do we need to keep
them around ? We could just let devm deal with it ?

If you have a plan, could you share it ?

> +};
> +
>  static int meson_efuse_read(void *context, unsigned int offset,
>  			    void *val, size_t bytes)
>  {
> @@ -37,21 +43,23 @@ MODULE_DEVICE_TABLE(of, meson_efuse_match);
>  static int meson_efuse_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct nvmem_device *nvmem;
> -	struct nvmem_config *econfig;
> -	struct clk *clk;
> +	struct meson_efuse *efuse;
>  	unsigned int size;
>  	int ret;
>  
> -	clk = devm_clk_get(dev, NULL);
> -	if (IS_ERR(clk)) {
> -		ret = PTR_ERR(clk);
> +	efuse = devm_kzalloc(&pdev->dev, sizeof(*efuse), GFP_KERNEL);
> +	if (!efuse)
> +		return -ENOMEM;
> +
> +	efuse->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(efuse->clk)) {
> +		ret = PTR_ERR(efuse->clk);
>  		if (ret != -EPROBE_DEFER)
>  			dev_err(dev, "failed to get efuse gate");
>  		return ret;
>  	}
>  
> -	ret = clk_prepare_enable(clk);
> +	ret = clk_prepare_enable(efuse->clk);
>  	if (ret) {
>  		dev_err(dev, "failed to enable gate");
>  		return ret;
> @@ -59,7 +67,7 @@ static int meson_efuse_probe(struct platform_device *pdev)
>  
>  	ret = devm_add_action_or_reset(dev,
>  				       (void(*)(void *))clk_disable_unprepare,
> -				       clk);
> +				       efuse->clk);
>  	if (ret) {
>  		dev_err(dev, "failed to add disable callback");
>  		return ret;
> @@ -70,21 +78,18 @@ static int meson_efuse_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	econfig = devm_kzalloc(dev, sizeof(*econfig), GFP_KERNEL);
> -	if (!econfig)
> -		return -ENOMEM;
> -
> -	econfig->dev = dev;
> -	econfig->name = dev_name(dev);
> -	econfig->stride = 1;
> -	econfig->word_size = 1;
> -	econfig->reg_read = meson_efuse_read;
> -	econfig->reg_write = meson_efuse_write;
> -	econfig->size = size;
> +	efuse->config.dev = dev;
> +	efuse->config.name = dev_name(dev);
> +	efuse->config.stride = 1;
> +	efuse->config.word_size = 1;
> +	efuse->config.reg_read = meson_efuse_read;
> +	efuse->config.reg_write = meson_efuse_write;
> +	efuse->config.size = size;
> +	efuse->config.priv = efuse;
>  
> -	nvmem = devm_nvmem_register(&pdev->dev, econfig);
> +	efuse->nvmem = devm_nvmem_register(&pdev->dev, &efuse->config);
>  
> -	return PTR_ERR_OR_ZERO(nvmem);
> +	return PTR_ERR_OR_ZERO(efuse->nvmem);
>  }
>  
>  static struct platform_driver meson_efuse_driver = {
> -- 
> 2.20.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
