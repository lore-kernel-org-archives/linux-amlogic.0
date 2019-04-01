Return-Path: <SRS0=bepq=SD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A240CC43381
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 08:40:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 707122086C
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 08:40:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YPotNOkH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LaoAhTRY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 707122086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AS1b+sd3Phbu8855UuXaflIsyeuvgsCZ24yqDgmQpMs=; b=YPotNOkHS7zSsh
	yLW1Hj+1Zi+B1Uy4sc8vneygqVoRhfrvr+Dv7eMc2W8gLiANanxtl1Q1bVyKWFVbjWL0d6JQ0Bew5
	2JfR9ldJM1dIrxQRm6t5eIaZfUO0a4mxOR/5aHUksffhq6UwRUB+LC9+HQf/Pxa95xYjVFo92RUo2
	+fstVacac7dwjlQxANOjnnkUc6TctMhff0kXTsufrKGj455wENhLf6Nl0MVK1DZa4VEGM+oIKIASY
	vS+z38fPukJa9FQA52osMK2LC+9hWZ6iEtFJdy3UfnRXTA9o2G76STy42OdBG9BHuNiSEbA3HaBtS
	yDDhc1PcKsILhR+/zRbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAsUH-00031H-MC; Mon, 01 Apr 2019 08:40:13 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAsU8-0001uQ-CU
 for linux-amlogic@lists.infradead.org; Mon, 01 Apr 2019 08:40:05 +0000
Received: by mail-wm1-x341.google.com with SMTP id n25so10279847wmk.4
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Apr 2019 01:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=E5VcndyE9TqCRQgdnGN/jHSlqq6013r5vJaAecmzCaQ=;
 b=LaoAhTRY0+Q+/WLlhlqs/ll95uq0+bqksOo6E53NpJuG4ccs+IIRSPdfUKvY9PuObL
 ZmyCNirU6CxsEEHnjpdWmDUblI9vh/ftuqAM8Wtnwg0fVTtYEtxHZEMALinLIl/lXNEZ
 D1iYQzI115OPugTFqAcpE3o3R9b2htW7K7X02hfZR/B4ubDdNuOV/Qy1yCZUSNlLinBa
 5K61KHI1Yk/nL+dVJ+XTDCZoqRUkgd+ZYzTtc4I6oLQw8DuP1PEx56QX4MgpNeN1NM8M
 Rilf80FMtFhzjX9WzHdmu2oR/KgYCzyyxtkKgKzcx6guoVeKXr3OfwPnaav66D2vpA7Y
 /LVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=E5VcndyE9TqCRQgdnGN/jHSlqq6013r5vJaAecmzCaQ=;
 b=iMo1opnyMvr4oIT1q6QI33AUX4X49HS2dhjY2obhde/8LsCc2VEINhvkbLN+3QsyCX
 Kco2iQpsKrzUkV0VhjAz7dvEVseFk6TWs9SoL4DVv9cCfCp+WxSCVBlM1kxgADZ+4fYh
 rbVdvijB5LwiBWLnRfohwdTdvecTvpvrkp3kAyCdgvZM1dR9CRDKn0BvwD4S8/DKjtww
 CVC2y/P1BvwnyTdzKfwf3ReaWLKYLyjR6NtKaOZ0PEPPWBl9+jeChZQ3yqyr4q2k+RIT
 UgTjJ5vSyRQJLpjsFxTXk2dJTjlZte3GLbqXNsaWmDym/MNd4y1+lsIJMpSs70GyqfFb
 WVQQ==
X-Gm-Message-State: APjAAAX7WA0Hj3hHVCI4ehG+X9blstz8UED9F+PLLuO6/lzNG3Qh6qqJ
 i3MiiLz2u0oXK2/K7z+qof44iw==
X-Google-Smtp-Source: APXvYqwXMm5weYt9BwiMMxK1CpvX/8i3Dk8bjb/9vsnipICJBUVUf1MfKQDuLxXViKuB/UxFug+xyA==
X-Received: by 2002:a1c:1a46:: with SMTP id a67mr10993963wma.21.1554108002857; 
 Mon, 01 Apr 2019 01:40:02 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 h2sm21446689wro.11.2019.04.01.01.40.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Apr 2019 01:40:02 -0700 (PDT)
Subject: Re: [PATCH v2 0/4] clk: meson8b: add the VPU clock tree
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 jbrunet@baylibre.com, linux-amlogic@lists.infradead.org
References: <20190324151104.18397-1-martin.blumenstingl@googlemail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <cff5425f-d6f0-8ed4-2c11-c9bb57e22307@baylibre.com>
Date: Mon, 1 Apr 2019 10:40:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190324151104.18397-1-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_014004_439899_802F2628 
X-CRM114-Status: GOOD (  17.76  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 24/03/2019 16:11, Martin Blumenstingl wrote:
> This adds the VPU clock tree for Meson8, Meson8b and Meson8m2.
> The VPU clock tree is slightly different on all three SoCs. The details
> are explained in patch #4.
> 
> Meson8m2 requires the previously unsupported "gp_pll" PLL. This PLL only
> exists on Meson8m2 - Meson8 and Meson8b don't have it.
> A separate clk_hw_onecell_data is introduced for Meson8m2 (using the
> compatible string which is already available) to account for this SoC
> specific clock setup.
> 
> dependencies:
> This series is meant to be applied on top of my other patch from [0]:
>   dt-bindings: clock: meson8b: drop the "ABP" clock definition
> 
> changes since v1 at [1]:
> - fixed typo in the subject of patch #2 (spotted by Neil)
> - collected Reviewed-by tags from Neil (thank you!)
> 
> 
> [0] https://patchwork.kernel.org/patch/10860387/
> [1] https://patchwork.kernel.org/cover/10860401/
> 
> 
> Martin Blumenstingl (4):
>   dt-bindings: clock: meson8b: export the VPU clock
>   clk: meson: meson8b: use a separate clock table for Meson8m2
>   clk: meson: meson8b: add support for the GP_PLL clock on Meson8m2
>   clk: meson: meson8b: add the VPU clock trees
> 
>  drivers/clk/meson/meson8b.c              | 422 ++++++++++++++++++++++-
>  drivers/clk/meson/meson8b.h              |  12 +-
>  include/dt-bindings/clock/meson8b-clkc.h |   1 +
>  3 files changed, 433 insertions(+), 2 deletions(-)
> 

Applied [1] to next/headers the [2,3,4] to next/drivers for Linux 5.2-rc1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
