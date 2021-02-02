Return-Path: <SRS0=hCbX=HE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073BDC433E0
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 16:26:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A15D64F74
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 16:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A15D64F74
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z0FneDPPrfX/BOaAC1b3FItlhQ0Dzl+hKjUWkk2Q/ww=; b=2mvCDAQamBQ39dWAUSDZSmfMF
	7fuST1PIb8HGW4ELStNCHI0OJD826DwepJH2rMhLDfcXDvltNuKUgRWAeO8UaCiNAteYKfb0Oh2AK
	8kwfnzef9dYDgw9N5ZKJ5MBg0iasaMbD6A1ItMiLEQOLh5ILqpCvxwbR3vVpPiIFcPwwErshniKlH
	ZOdeeAbUSfHUbtwjY+tF61j2ifxQ4Utfw3Fg+LVWsoNUBRKwrW8ON5p5TNdsRtiza61X2EscI55tR
	9IGc5sIAEC+WG67CBBAmTpXIGlAsKGDDxZvUkc34xjcOb1n0Gn8Wg5ygXRSWzTGVvemjCV08Tc7ar
	sz8mBr8Xg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6yVp-0004Zv-8z; Tue, 02 Feb 2021 16:26:45 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6yVm-0004Yh-9y
 for linux-amlogic@lists.infradead.org; Tue, 02 Feb 2021 16:26:43 +0000
Received: by mail-pf1-x42e.google.com with SMTP id q131so14650812pfq.10
 for <linux-amlogic@lists.infradead.org>; Tue, 02 Feb 2021 08:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=l4h6Ivu7DxeeLevJc1wQ+Ze6BVBDNOqfFBaVlOOvfD0=;
 b=Prj01pdPh3i/44KjbGbWaacJo35qLM4VarOzw/eGcQFhdfXnRipH1JT6n5AVVzqyBB
 ElkQT02SXpzSxXEy/04+RB50ZxAsJ7bfObZzNTc//m4oD5tL75/ltzjotxdcTRWkt2Kx
 rYR4RwqyrT6K3Hi2lJuJ4rzgoZhlwAbidDy3aOU8x7lhv0m/bd1mlqIDEGbKQ3nnZ7mK
 711c/pTmQ5kjzjDkYniVLcjV4kVMa+Bv4pVgbwq1kZaHpxgvJcy2YM9G+B9WlYBIPTxU
 JmvVCPC2OFaQ8I74JdqNI34TMPp1+GkN9FIFr2PjkpgjFhAmSdFlo28ayqjcOKiOrpkc
 jrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=l4h6Ivu7DxeeLevJc1wQ+Ze6BVBDNOqfFBaVlOOvfD0=;
 b=PxxZRrAs5QQaXWlATlqAGpngNnApQDKKtQTVGlp6dOpWMaR4fxsWgsHor60ofLlEAh
 fc2xf8MMlioIuijVOBimqbDT4nvycw74+Rab0jOVvN3ReQLcCwAUxUveg/+Ys5aJfClw
 u9RaATa9uH80YL9C1RkITFMqLpMdhjD3Kn24X4hGIRdx+pw3GPqdPFObzy7tX6ryxjT8
 5Seo64sLaD0xc62h/5UhtRZt3Fiv55gHbjcimh/wTH7U5/xZbgWjH2P79OCDeMHH507/
 Mv1wBbPbf1IaZVgXt0LeriesRnO29ona6ul9g8fKn0VymYiE+ZP7E2/Y8y8j6rJf3Kf4
 vvBw==
X-Gm-Message-State: AOAM532gBqn2Dq/kr1E03h+wyKrYFcLopoGXdnuWHKHD3MYWbmsjox5+
 1ztgcUInxlQIYGE+NcWaA/yxkA==
X-Google-Smtp-Source: ABdhPJz23hBGlWbblH5zl60/YjQ3RKwRUlZd50alKTD1+nw88ReAaT0M2kwABWE88CwZbsdwgcrgmw==
X-Received: by 2002:a63:fe13:: with SMTP id p19mr22812940pgh.119.1612283196793; 
 Tue, 02 Feb 2021 08:26:36 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id o14sm24015155pgr.44.2021.02.02.08.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 08:26:35 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 10/21] rtc: meson: quiet maybe-unused variable warning
In-Reply-To: <20210202112219.3610853-11-alexandre.belloni@bootlin.com>
References: <20210202112219.3610853-1-alexandre.belloni@bootlin.com>
 <20210202112219.3610853-11-alexandre.belloni@bootlin.com>
Date: Tue, 02 Feb 2021 08:26:35 -0800
Message-ID: <7hsg6eh1vo.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_112642_404635_EF48C057 
X-CRM114-Status: GOOD (  15.20  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Alexandre Belloni <alexandre.belloni@bootlin.com> writes:

> When CONFIG_OF is disabled then the matching table is not referenced.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  drivers/rtc/rtc-meson.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/rtc/rtc-meson.c b/drivers/rtc/rtc-meson.c
> index 8642c06565ea..44bdc8b4a90d 100644
> --- a/drivers/rtc/rtc-meson.c
> +++ b/drivers/rtc/rtc-meson.c
> @@ -380,7 +380,7 @@ static int meson_rtc_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static const struct of_device_id meson_rtc_dt_match[] = {
> +static const __maybe_unused struct of_device_id meson_rtc_dt_match[] = {
>  	{ .compatible = "amlogic,meson6-rtc", },
>  	{ .compatible = "amlogic,meson8-rtc", },
>  	{ .compatible = "amlogic,meson8b-rtc", },
> -- 
> 2.29.2

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
