Return-Path: <SRS0=yTcF=CJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9EE0C433E2
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Aug 2020 18:36:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAB972071B
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Aug 2020 18:36:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mkoqgTaW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="T2KW9+cb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAB972071B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ybqh6NHP3wEfhabYSqOt0n+NojS0bFrMrLGgH12CtUo=; b=mkoqgTaWs0mgbFpxHN4LqFbSm
	nSn1qoAoW9fHmpzfiY4+u6J7zARhyM2BSu7pvHv1Wxb33tBbDck8/KgQWqkthebAMdmEV/v6rjPCp
	XwdVNepxyHmd5HSiyqmr4XRFEduPZsprib8C2feCabYFnwQo+HtKtrocavLKcfF1y1L1e02ejTR+0
	a/TIzBQi0GBSViC/yUTO+jBzrapU6waYU3mLKnSDhVMLvZRDuLWVtRpE2WoH3IBPNg8AjbFGdCuRr
	yrQoWwc0LF3FMDU+U8BCfOT9kCn2Hsr0eelT+Qay7OKX/sH/nC61w+1qcaWKkGSbMXL91d0ZDsjwA
	SdDFjwyZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCoek-0002RX-7O; Mon, 31 Aug 2020 18:35:50 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCoei-0002Pq-1F
 for linux-amlogic@lists.infradead.org; Mon, 31 Aug 2020 18:35:49 +0000
Received: by mail-pl1-x643.google.com with SMTP id l9so1869927plt.8
 for <linux-amlogic@lists.infradead.org>; Mon, 31 Aug 2020 11:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=PaGS2uzZD7Kro0ekXrFmFn9ksemHuyaMEDFaP9+HbTs=;
 b=T2KW9+cbq+bqJgzBohyRO9AXZ3t79XlryYl2YWgCmE3YqwFUr81ry3FUWcjyJVBn2p
 xjUiO7MYKO0Tw2gcFcTizQ+dODXK/SBA/KJoFX14hCv9TfWUpeCFG8aMapGwzAQzQ/jC
 CUxdbq35dkUogDSODZNByRWqf3iSNZL4s+x/7gdWYV4MO23W0Bqllva69SV6xWeoO1bW
 AoeECFKdDvFuMr1sobC9HzMtIWYkGrNGudHSNN/e/cXOkz5RJ9ypvz5zfeEc8uX6cXfH
 xf1+FbWEUCOlvRUfKptkUNx4keIbYJlo65lPoprmtXsrrdyMhf91Dq6Q82Mp3bsvfIsM
 8WaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=PaGS2uzZD7Kro0ekXrFmFn9ksemHuyaMEDFaP9+HbTs=;
 b=qnT4pCwlfbv7hdx3yGNAxE370qYEFPFgQItSOhrnqEt7td1bdtgdqfKPpWsaqeg62O
 dSaJ2+A4bzXW76JY2mwXn7tPRXM3SQkaqRyW5lFdp4mp2ffUF+FJ33QW6PF8kejSf0c7
 oMehCp6sZVN7+vmZPuZT1cCtnFa38+ugFS5/RV/lzflRrqxOiG2Twi933+0nxyZRBkDY
 AUw7sWOknUAJZj2QiGz06wLz1UAcb8ExilCwiSeTYMKuJSwBI0lUUEY10tl7jQd+BBg5
 iZmfsPqdRTz8wJrM7R86DUuXVpjfGjHyXWMajPSHeFq8z9/toF510OG2Rvg+kZhmiGo9
 /21A==
X-Gm-Message-State: AOAM530eMQ6nHqCbhnVnqm6oLa1ZAfTKf1/ChwRVd5OTvi2NTD7a7ATR
 KQIW3G4wKp4bz19udFJNp4JSCA==
X-Google-Smtp-Source: ABdhPJxl7Hyfd0zkkHCY81kxkFxx+yC3S6h+KZ79YUwFh9A3MjdXBXFG/oy7hPyTVIgBJNx4CMvGKw==
X-Received: by 2002:a17:90a:764d:: with SMTP id
 s13mr611974pjl.58.1598898944292; 
 Mon, 31 Aug 2020 11:35:44 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id y1sm8088311pgr.3.2020.08.31.11.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 11:35:43 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-mmc@vger.kernel.org
Subject: Re: [PATCH] mmc: meson-gx: use wrapper to avoid accessing internal
 vars
In-Reply-To: <20200831102324.12566-1-wsa+renesas@sang-engineering.com>
References: <20200831102324.12566-1-wsa+renesas@sang-engineering.com>
Date: Mon, 31 Aug 2020 11:35:43 -0700
Message-ID: <7hv9gy7jeo.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_143548_152601_42CBA842 
X-CRM114-Status: GOOD (  14.91  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Wolfram Sang <wsa+renesas@sang-engineering.com> writes:

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

> ---
>
> Only buildtested. Found while analyzing retune-handling in the core.
>
>  drivers/mmc/host/meson-gx-mmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 08a3b1c05acb..a1db8685e30e 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -521,7 +521,7 @@ static int meson_mmc_resampling_tuning(struct mmc_host *mmc, u32 opcode)
>  	val |= ADJUST_ADJ_EN;
>  	writel(val, host->regs + host->data->adjust);
>  
> -	if (mmc->doing_retune)
> +	if (mmc_doing_retune(mmc))
>  		dly = FIELD_GET(ADJUST_ADJ_DELAY_MASK, val) + 1;
>  	else
>  		dly = 0;
> -- 
> 2.20.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
