Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D354C4363A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 15:03:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C148721D7F
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 15:03:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="URgxCDXq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SYXXy70S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C148721D7F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lNrP/THBew8yI0VWTbAnj81skedhPpJdSTuTCPELwSM=; b=URgxCDXqkmNNoF6pjWKFbE3JN
	IePbmJwEVdTM9BSYggIXkBTWEIPNCL+AGbHzBYpHeQ78iV/8gFkpdMKRb+hniai3aLvhOQzj8oLBY
	KORfK69tglYwykixTOnlt8bAIkL0Ke2BzV+zi5nQTLzRO0dXn+4+Hdj+K5V4osokzJ1c4AUsoXSI6
	EkF3uJ0QiJG+E7DbIm/ejPHZxJcicKtRY1WaNzqc+Ox1qnOr3mELQT2344PqklGd/f//5Gq5X9rYw
	Av8TS6fnFUOc/T4Z5G0hbMUD40yeL2TcwYnW1fsILlxIx24Oh4hzz3IGsXONmxIqcBv1xi4wZPjn1
	JIgYeCtfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUtAb-0002kg-GF; Tue, 20 Oct 2020 15:03:25 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUtAV-0002iZ-TL
 for linux-amlogic@lists.infradead.org; Tue, 20 Oct 2020 15:03:21 +0000
Received: by mail-pl1-x643.google.com with SMTP id p11so1165711pld.5
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Oct 2020 08:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=DQj1vw5Q5iR2S7fc6h8mk0PeFNHHD7EB9QXujK3XyAc=;
 b=SYXXy70SGU+w+Up3SIREVdDig4z3khzULIce0mBbhmnDDMBwGIY8e57/XVbn+4zyRu
 kGiac/dMzNw60LTFL16pTuu2/+iN/FczvCKNOP8CJyKJYw6b94zu6g8WLjr4MQvUcEVu
 0Io3AugrfnfijxcP+4n4wBYePyUM13QYYFyC1IVaN3i65sUK+w6dFSg8KJxyu/SVKGJ/
 uerRL29ngMdh9HudoUd/uOL44dQDstfrcLEqvm02WXmfIjZV5onSDhvb0QPV2Z3jcyln
 2LS1MRlUdW+RG8oe+icX40OIpiB8AlpeFyDxpppTf+xdWE6iOgCNoKFaM4mzLsBXLCIq
 wn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=DQj1vw5Q5iR2S7fc6h8mk0PeFNHHD7EB9QXujK3XyAc=;
 b=qD/X0VJZ404cL+6SEjIgOFq+J3xK6niXG+9u4ID+WbKahBcsefO4nGmIB2YTYdkCaF
 ipNRWF7X9hOVuRGD43lwl5GMeowsCpw7I2zHt8akJRSPzmxZyNheJRDZDZYieiP/09j1
 1ZhFidBXiDqpr3SRIwG/daUCgQf8Eb9SyOvA1iMYdhVGnIiFX6E8qjAl51UKFwkBrb25
 FyslqIb4SNuWr5LsoBijHAUXFz1Zvlhaax5chs5Y9ck6rEi3gvIZy21P+JKDatSPnXvm
 O2JSNlQWQaczPE+ZkiMAuAWhUy6lBc+XjzpJLWatv8MfYlZNsgYUp5HM1Apqcwoor5ln
 zm6g==
X-Gm-Message-State: AOAM532lNJo0chZWHDjja6GhOxZgOSCEzrEEsOju0r2nFk0v8jFoJoyr
 3JJIbwgDBlyCv/Il3zDKmWsIig==
X-Google-Smtp-Source: ABdhPJw47uzkbIxu8PDHL9D6AYEnUNBuYPrgkQ4Elau8tT01n2rh08OpwhViQ8uNYXwxXSAbjj1flg==
X-Received: by 2002:a17:902:8a97:b029:d4:d3f4:d209 with SMTP id
 p23-20020a1709028a97b02900d4d3f4d209mr3361281plo.35.1603206197714; 
 Tue, 20 Oct 2020 08:03:17 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id v3sm2275686pfu.165.2020.10.20.08.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 08:03:17 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH] arm64: meson: ship only the necessary clock controllers
In-Reply-To: <20201020075034.172825-1-jbrunet@baylibre.com>
References: <20201020075034.172825-1-jbrunet@baylibre.com>
Date: Tue, 20 Oct 2020 08:03:16 -0700
Message-ID: <7hblgxkki3.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_110320_010516_B314CC3B 
X-CRM114-Status: GOOD (  15.38  )
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
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> There now the menu entries for the amlogic clock controllers.
> Do not select these when ARM64 is enabled so it possible to ship only the
> required.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  arch/arm64/Kconfig.platforms | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index cd58f8495c45..b22d1bdd6eb6 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -154,9 +154,6 @@ config ARCH_MESON
>  	bool "Amlogic Platforms"
>  	select PINCTRL
>  	select PINCTRL_MESON
> -	select COMMON_CLK_GXBB
> -	select COMMON_CLK_AXG
> -	select COMMON_CLK_G12A

This patch alone will break boot when using the default, upstream
defconfig because these options will all now be disabled and we'll have
no clock providers.

I think you also need a default value (e.g. `default y`) in
drivers/clk/meson/Kconfig for each of these entries to keep the same
defaults.   But these defaults could be overridden by SoC-specific
defconfigs leading to more flexibilty.

So, assuming you queue up a drivers/clk patch to go in when this
lands...

Acked-by: Kevin Hilman <khilman@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
