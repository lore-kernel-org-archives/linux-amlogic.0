Return-Path: <SRS0=0gED=DF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8083FC4741F
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 10:34:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AA6D21775
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 10:34:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PMSp7ena";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AUh5Xapa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AA6D21775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rA0OpLKW9OC8gomkf8i8tYgkOgCmrFN+R/bMpDISFMg=; b=PMSp7enaT9rFWGI4rodML5wAp
	Ye639h+v/+dqtqdNV61O3WN9x+FEBzluJzFb+yk7PSCWNdbsi3EGUj3znlpue62JX5Jkirro6cvHy
	hsoz4j8fuQHoEeGBofP8J7yNsJSShlDUfHRJfLwYmgIASu1I8AMYd2e5fYNc1/YYYSeR3M2tb9gSI
	yntG/UwWB5ay1qae06xeRQhFW+FQNPXzMx6Rl78+srXiGHrIYQklcKYgok303BQ3lzStp2vH0UU2h
	8KEOSwvXOqzFwzWCWCQjkYGyc7J7ZQDfOZBQrYjCC5kAldnSU1V/QukoD8j6fyXVpiVr4Qca85FLD
	bdutJOCkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMqUV-00063K-CD; Mon, 28 Sep 2020 10:34:43 +0000
Received: from mail-vk1-xa43.google.com ([2607:f8b0:4864:20::a43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMqUS-00061x-85
 for linux-amlogic@lists.infradead.org; Mon, 28 Sep 2020 10:34:41 +0000
Received: by mail-vk1-xa43.google.com with SMTP id d2so1423763vkd.13
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Sep 2020 03:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kCHYzzH+i6txI0brWFnBDLXKpVALX+5QwAw/VNoWNk8=;
 b=AUh5XapavrB6EGo5rdwT5udLEu+YwBMaOwZgoWWXd6Pqx9CltFokFdjkgKYye4+9vY
 AHJ3AABLLQ9v0/Cl5LJdUj86j9wXiNHFqyEmAPEFJvfwgEqHGlaZBAhJDsQu7M84sRlN
 37L1CJJF2+S6zbmft1LYfATSRm4kHvsu03IMo9DDjMGDy5mmbJ6gxsQjjOJihqA+Y1/v
 8D1rNjgMo6sDpkUVmoYNI8ZPlVIXroK41m25qwBYamG0EFIqA4ELMU/JgRoexFPe/QCm
 Mfd651S/aWUTU3/yCh3hlGIua7jLKLZIYrQayF2DHPJnMsK3EhIKK29Ll5+WJ9Lba7FJ
 5HnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kCHYzzH+i6txI0brWFnBDLXKpVALX+5QwAw/VNoWNk8=;
 b=joE/jveyIUpeFxYMGOdUT4u+6RjdYdT/kYWpMLlqYct751ds8oQaV9Q5vkXvzYim9M
 639f3bo4YMgcwUfRWV79Z5W6W5+0O8iosr8v5Xt5uAnhLQW93g10+Kh+FYyw1P1cLEc6
 NCXL0mx/4LHqfC8bBXiEvgvrW24I0wvZ/MaqRIQM66SwOGAe4ixLjZAbwUcfaEKhtdRW
 drKvzSGsN3Qgj3AQyCe33IzVxyQ0iDuVCqOtOMjWWl4f3BbEwksCEPCBIFJ4Fmk63WKE
 FGwgOW6pB9ypHiaels2ByV+gUn8msS1CZO4FDAwCEbmUUos+08xq/ebc5DAKQYc3SnQ4
 ZPeQ==
X-Gm-Message-State: AOAM531KiK3vIKvQyjlZN6VoCNv5fKDqy8zxeBRe3PykZqqFjVm+dc+q
 Zk9GazH2sbpOsTrHFdlwDCWyM/NAhbfdaupDgoCSmA==
X-Google-Smtp-Source: ABdhPJzVU+3l6V26RnGTk8PQ5DqzqBEXIyhs++xSEtv4+7R85m9ghPPjrHP2K8KQzSydrbU/jiC25XfDfjoajCcPLto=
X-Received: by 2002:ac5:cced:: with SMTP id k13mr4462650vkn.7.1601289278713;
 Mon, 28 Sep 2020 03:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200925164323.29843-1-rdunlap@infradead.org>
In-Reply-To: <20200925164323.29843-1-rdunlap@infradead.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Sep 2020 12:34:02 +0200
Message-ID: <CAPDyKFrT5S_0bfr0rnUU4V6kPHpfziCbUnGS8m-HK2cAaDJHcQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: host: fix depends for MMC_MESON_GX w/ COMPILE_TEST
To: Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_063440_293378_3434C4C7 
X-CRM114-Status: GOOD (  16.37  )
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
Cc: Kevin Hilman <khilman@baylibre.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 25 Sep 2020 at 18:43, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Fix build errors for meson-gx-mmc.c when CONFIG_COMMON_CLK is not
> set/enabled. This can happen when COMPILE_TEST is set/enabled.
>
> ERROR: modpost: "clk_divider_ops" [drivers/mmc/host/meson-gx-mmc.ko] undefined!
> ERROR: modpost: "devm_clk_register" [drivers/mmc/host/meson-gx-mmc.ko] undefined!
> ERROR: modpost: "clk_mux_ops" [drivers/mmc/host/meson-gx-mmc.ko] undefined!
> ERROR: modpost: "__clk_get_name" [drivers/mmc/host/meson-gx-mmc.ko] undefined!
>
> Fixes: 54d8454436a2 ("mmc: host: Enable compile testing of multiple drivers")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: linux-mmc@vger.kernel.org
> Cc: Krzysztof Kozlowski <krzk@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
>
> --- linux-next-20200925.orig/drivers/mmc/host/Kconfig
> +++ linux-next-20200925/drivers/mmc/host/Kconfig
> @@ -425,6 +425,7 @@ config MMC_SDHCI_IPROC
>  config MMC_MESON_GX
>         tristate "Amlogic S905/GX*/AXG SD/MMC Host Controller support"
>         depends on ARCH_MESON|| COMPILE_TEST
> +       depends on COMMON_CLK
>         help
>           This selects support for the Amlogic SD/MMC Host Controller
>           found on the S905/GX*/AXG family of SoCs.  This controller is

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
