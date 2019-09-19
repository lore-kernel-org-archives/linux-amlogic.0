Return-Path: <SRS0=mQoY=XO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8481C4CEC4
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Sep 2019 13:02:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD21321907
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Sep 2019 13:02:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gRjjiv8W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hn5Featf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD21321907
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GyNtHPQxvfDvcg+GaZxTwSfeGijZttvajNKBUcIRIZA=; b=gRjjiv8WjfKWKC
	I9zPRIW8q6jcqN/A8y1MDJlIwsuPrI86jRA/OAruFRunNLCgwXcsDRit/WeVxmI/kG2lzL2U5713M
	YYyh5++F9yqWhyI6zhTG9qFUFCRoxr+bUCefOeiFOkPoRCmIDLMCHe/qdeivmNVesDweqYzBi6YGJ
	eaxs4sKGCJaGZlaAxjBbRf1U0Vih4if8QUcX7de4gJkvtaQI14uhKFO548WZ0Q5CfYL7gHK8Vk0Hs
	6TZC5+ci7vb39WnUdNovZU/PLWAVDHJvE/VWytttHBn18ymINDBlBIXkr9UoikCgUeTBDWZe9zQL9
	W5fvnZ3bOeiOAJhTWXYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAw4T-0004Fs-QW; Thu, 19 Sep 2019 13:02:06 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAw3w-00040V-RC
 for linux-amlogic@lists.infradead.org; Thu, 19 Sep 2019 13:01:34 +0000
Received: by mail-wr1-x442.google.com with SMTP id i1so3013259wro.4
 for <linux-amlogic@lists.infradead.org>; Thu, 19 Sep 2019 06:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=T/oUm0WVxShCr4Uz7hk8J9IALquJO7fiM1qSUhv05Fw=;
 b=hn5FeatfnL4cSmnI9pQY3P9osYNKz/jSMr9nvitnLWGqkM6yvb/KGWYyxLf0EWZMEI
 KgwmvOwSr91t9Mdl7+1BaWEye0QJfGIrTU3vNMygFbaStWk0TycOssQlLpCEvM/clXy+
 3c3DwwJsbMG7A8Q9+NOW0CeeOeSpBuu+QCb79uhRFq52xorUxM7W5ZX6CRCE0mcZhwO7
 ervFdUK+7qMMaDaMDg9nDlOQ4Qdivk2ccaWWMpBlMbmTOcQmIvHKqKAi5f2OioQOt96K
 6MzEc5hr0Hxo8IPf6+sVZSw0qiqkjUIhdcrxZWM2/ugwrQApKhoIZA2uC/hFihcP+ihK
 Wwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=T/oUm0WVxShCr4Uz7hk8J9IALquJO7fiM1qSUhv05Fw=;
 b=nuY0uP5gYlGi4yjdS8bcYDBL4s6bMxU5Aq66rg5rAL4agSADyT6y5+D8s37WQDL84l
 lPbtW3sjUd91/Vzd+qanuvsuEP2o+RG8u3grFWAw2Md23wSsp8/2XusDNFdhe2twwvyT
 fXrZMrUwcEQnsqL10UUQ23czGvm4wW61Gf9BgHDScD34fbZ5ImHoYIFfL5cePSifZW0A
 wWi7ieET/ov1tOcGl6q1+XE7PUuekGsAuOruys9zMzFT/Y8MLPnpwoHFUyLLHvnzgMb9
 /iJk+akH5Vnhr53N3TunJoi9MgvBsM0ZEKuLaBx4YsHwkLZcklrvO1JMgS/kfdhTxpce
 gBvg==
X-Gm-Message-State: APjAAAVg6w1woe1uW5RPjOx3TNab77XA+HLxQTHS1QTI0Y4VUmKg0T8Y
 Zz8j6bMyLmRWvV7kRtlvyRaJ9g==
X-Google-Smtp-Source: APXvYqxKBAJr87TccDhptPDgvDzaS8VrHoiGhYT2TmlGfQgTSWUsboVo13NiIL/acFFfMXMWH02NEg==
X-Received: by 2002:adf:e485:: with SMTP id i5mr1971966wrm.175.1568898090150; 
 Thu, 19 Sep 2019 06:01:30 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a18sm20259922wrh.25.2019.09.19.06.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 06:01:29 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 3/3] clk: meson: clk-pll: always enable a critical PLL
 when setting the rate
In-Reply-To: <20190919093809.21364-1-narmstrong@baylibre.com>
References: <20190919093627.21245-1-narmstrong@baylibre.com>
 <20190919093809.21364-1-narmstrong@baylibre.com>
Date: Thu, 19 Sep 2019 15:01:28 +0200
Message-ID: <1j1rwce8yf.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_060133_090019_675F5AD2 
X-CRM114-Status: GOOD (  22.16  )
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
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu 19 Sep 2019 at 11:38, Neil Armstrong <narmstrong@baylibre.com> wrote:

> Make sure we always enable a PLL on a set_rate() when the PLL is
> flagged as critical.
>
> This fixes the case when the Amlogic G12A SYS_PLL gets disabled by the
> PSCI firmware when resuming from suspend-to-memory, in the case
> where the CPU was not clocked by the SYS_PLL, but by the fixed PLL
> fixed divisors.
> In this particular case, when changing the PLL rate, CCF doesn't handle
> the fact the PLL could have been disabled in the meantime and set_rate()
> only changes the rate and never enables it again.
>
> Fixes: d6e81845b7d9 ("clk: meson: clk-pll: check if the clock is already enabled')
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/meson/clk-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index ddb1e5634739..8c5adccb7959 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -379,7 +379,7 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>  	}
>  
>  	/* If the pll is stopped, bail out now */
> -	if (!enabled)
> +	if (!(hw->init->flags & CLK_IS_CRITICAL) && !enabled)

This is surely a work around to the issue at hand but:

* Enabling the clock, critical or not, should not be done but the
set_rate() callback. This is not the purpose of this callback.

* Enabling the clock in such way does not walk the tree. So, if there is
ever another PSCI Fw which disable we would get into the same issue
again. IOW, This is not specific to the PLL driver so it should not have
to deal with this.

Since this clock can change out of CCF maybe it should be marked with
CLK_GET_RATE_NOCACHE ?

When CCF hits a clock with CLK_GET_RATE_NOCACHE while walking the tree,
in addition to to calling get_rate(), CCF could also call is_enabled()
if the clock has CLK_IS_CRITICAL and possibly .enable() ?

Stephen, what do you think ?

>  		return 0;
>  
>  	if (meson_clk_pll_enable(hw)) {
> -- 
> 2.22.0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
