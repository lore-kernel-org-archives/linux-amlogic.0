Return-Path: <SRS0=hFP1=FI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FCCC4361A
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Dec 2020 15:20:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FE2D22B3F
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Dec 2020 15:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FE2D22B3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WvrYNzGfXJd/Ou287eONbxvpfV/nSh0DHfXTlNr6vas=; b=h2Gosw+n6BPJpjO6rfp+V3/M1
	N19bU7A7Ytb42yP5ogiV53zi4/EGExdiEqD7Hr2OEXvhnrtaFJgVoX555HTbLcTdGoJSnyanMtvlk
	wOn/d1GFFeCSy887C5tv3TCZyo3A6Y4T82oCcWeoXWg+D4LNsFET/Y/6YEdOG2zGZ0MSf6bAAN3SS
	gteOVYz6llmbeLdfxee81XxF0bCyaQFO4x1ZVLsstpuZ2Vg/bWWPnllLU1znmV3VnXsIYxg6C1Wp8
	C6PrrgR/jLi7LHwQ7FWKe5zayHuXDa//B8LAPgSNXGclNEyEI3Ut9C4k1kKkbW61YIdxNmUcSdlUA
	VOBsO59qA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klCsT-0005u2-DJ; Fri, 04 Dec 2020 15:20:09 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klCsO-0005t2-Jv
 for linux-amlogic@lists.infradead.org; Fri, 04 Dec 2020 15:20:05 +0000
Received: by mail-wr1-x441.google.com with SMTP id x6so1741170wro.11
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Dec 2020 07:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=Ut70wCtSDVM0bqYgXmAgggZNWzyipgwqsdsGJjhBqoQ=;
 b=j4C2JWHolEMbY0cQbERLHnxvJk+PT3gMBltNmTpp3rYpDIej3Bb6bDE4eSmsNb0zb7
 cgUKN/Hnxcr9mgckn2z4BsjsVL8KpQWYJnxiekJACFwon2uwu+LdO9FfY76kxy1MUYiG
 hUx+1cPmHCF9Cuf1TkbJsz11keCVoYMRNRUqFaGwnkjh8rUs9VvTzvYJQnn8BkHYB2JV
 zDH38s8cPZfhvgOQvBJ1B5qwpejKesaIfXbHqSImXRoyCXwRXZSXGyg6uWP6LK1qkg5g
 dURcOaHyPnXRrpZpW/AKMgE1c1BuIVI/3plmDWR+a5g/WTcoXA5RCNk1/yX2zNHqLCR1
 WwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=Ut70wCtSDVM0bqYgXmAgggZNWzyipgwqsdsGJjhBqoQ=;
 b=Nz+l7HFly/a9ipH9rW5vXJXSO50TNtGz2rg1t9f6njlc7CBJua1dliMPwbPd3qhWux
 X+2KGMGqfnY1OUUbCZGKUe3DAVjRN529/e5AuVsRKaNGR0O4QumWrJGB8iaiXwI4+A0R
 KSvfi7zTcrdNWQxOywB0igPCgT8fAJN/QZj10B5rZkq2yj6AT8BYldziofvOyqQO6uoK
 QUFZ9EKgMnqXb3NdjZ/7aEoq+0/uSi9u7LICssAOBMpQ0mwfvxOOwCk8EgbNeYl4g0Al
 P8castpfxUKONle7li2DQ1JeXlXtzZxex4PL4d+z7jnPKlICQj72BF/NJeNy1Ony1erb
 6UWA==
X-Gm-Message-State: AOAM531FUZQEeH4ZpGffBYiv3C5FVv/Hz023Vd2Ko8smOthc/52cU+su
 a9B9jAgdzabw0xTADd01yCNqyA==
X-Google-Smtp-Source: ABdhPJw0nUCfvQkmwhontRyFojOjTf3y9u3sd2tlbcu+vv1/3tZWslLF+HrOfUfmrNuKtCH1C0AZKA==
X-Received: by 2002:adf:d84e:: with SMTP id k14mr5516583wrl.34.1607095203236; 
 Fri, 04 Dec 2020 07:20:03 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id n123sm3685801wmn.7.2020.12.04.07.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 07:20:02 -0800 (PST)
References: <20201203222706.992440-1-arnd@kernel.org>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Arnd Bergmann <arnd@kernel.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Jian
 Hu <jian.hu@amlogic.com>
Subject: Re: [PATCH] clk: meson: g12a: select COMMON_CLK_MESON_VID_PLL_DIV
In-reply-to: <20201203222706.992440-1-arnd@kernel.org>
Message-ID: <1ja6utppi6.fsf@starbuckisacylon.baylibre.com>
Date: Fri, 04 Dec 2020 16:20:01 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_102004_694963_9C5C2870 
X-CRM114-Status: GOOD (  15.35  )
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Thu 03 Dec 2020 at 23:26, Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Without this, a g12a-only config produces a link error:
>
> aarch64-linux-ld: drivers/clk/meson/g12a.o:(.data+0xcb68): undefined reference to `meson_vid_pll_div_ro_ops'
>
> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Hi Arnd,

Thanks for sending this fix.

Same change has already been applied:
https://patchwork.kernel.org/project/linux-clk/patch/20201118190930.34352-1-khilman@baylibre.com/

It was part of my last PR to Stephen

Jerome

> ---
>  drivers/clk/meson/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 034da203e8e0..9a8a548d839d 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -110,6 +110,7 @@ config COMMON_CLK_G12A
>  	select COMMON_CLK_MESON_AO_CLKC
>  	select COMMON_CLK_MESON_EE_CLKC
>  	select COMMON_CLK_MESON_CPU_DYNDIV
> +	select COMMON_CLK_MESON_VID_PLL_DIV
>  	select MFD_SYSCON
>  	help
>  	  Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
