Return-Path: <SRS0=8AZD=GH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB6AC433E9
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 11:43:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA2CA21D79
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 11:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA2CA21D79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LBsI1ihTbf+kdtIfQcQgcAsMa51kTfBktL2pyvjSW1k=; b=lqP6UkwkVFJygmRLLouKX9J9C
	vLsLUW/qTbFpBxJPo8PVgA+edGab4Mz4T7V1D7X/e18IFO3aRafRH7FiDY75wZWACR1L2wrQx5egN
	NO0MGQ3bqGeB7XXSfECN9JQX8zn4wy6rTnQKllwDA01QpfpL8u4S1uqpVBTPSJy/02pfmRbURNooT
	wHGkvs4jZGi52QG5A5/TFyNTG5enAOa2zXgFc4v7C8FmkuBZ2ryD8zFjW5W2fUZ+3UxT+WwLAi7NW
	2QFv11bXHtECG2N94KXbddXDDxumrB/nVz/j79dJdMSvOcaZisnNPvJC/cHPPtpfqlZJjj0KoJALe
	mCBgHwIfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwOGa-0004GS-5G; Mon, 04 Jan 2021 11:43:16 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwOGX-0004FG-PD
 for linux-amlogic@lists.infradead.org; Mon, 04 Jan 2021 11:43:14 +0000
Received: by mail-ed1-x536.google.com with SMTP id g24so26990795edw.9
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Jan 2021 03:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=YJMXYPP+Zpc8fAzHM+tOsE5l9dX3cXSxu+6LXuQVQIY=;
 b=P5ZpcTTEIS6JO3tLdGP1J8WCi7VGcCDBePpY9T78KseCTeXZgQk/rHpdAWH3wCgIJ1
 InUe6Fo0SvE7hskI0Aeyuu3A7yo68PPKJ2EkIix99qXQAxdA5Kni1u5B5jHHBI6KMFxS
 fyIkG5/ctTqUZpjJ7r8HvuDuw441eqBot+kdH7D0dJQXL8jeOV9MmDFU38l0yUTHzloq
 F6vH0wbvSiYcuAYbrq/homLDEAC6D/0fgpv9WKqzlwDxaYPspnXaXbreaQgS8sfYHo/m
 g4Er8PyeQpoZ6t5YZW0VFHsgcUFaI/6r2VpZt1W5vBgA5YQgnd2dmD02s7Sn1Iknpkpq
 LnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=YJMXYPP+Zpc8fAzHM+tOsE5l9dX3cXSxu+6LXuQVQIY=;
 b=ZkxYkFaTFRZo/m4LaiqD75IXiU1XTQoacDTKfbW24XXu/NKFtToRfzqMrq178fhvhF
 M7TzIAfGeJgW/4KPc1BAJASxT/isUTpjzaM68PMlUsp6B0TOd+1sROrbYkn26AR0d3U9
 F04cayEZoMoWe/i9Q/DO6spHk0H+CMQWogZcz7wKLSzvEURDXk8mrrnKGMvzi6gwTfWH
 3Pj3Z+0VCSYx46OJ+K7IJasrJgQzpZlq3dMxeshw/sR4Koeb30NtzCQS1//TqyCDX+gQ
 yMwu2FESyPg5I5g6SLy4qfzFrGdr/Gc7Qo4ALixPEomzbZ6QiCQ4R+gHu+7n6wEZP3Uw
 O3cg==
X-Gm-Message-State: AOAM532K4hO0Cec8Mv77N8Awnx9tufwEjil/Gz33ETs2H3hzNjRrfvlI
 VMZ8ZnYUexICmxIWrjY+JINwKawocsqOAg==
X-Google-Smtp-Source: ABdhPJzJZBo2eMXhVWesKa5PqRsTKXztqcgpvKwHFN+xiQ1Vt6luAU/jDR0cjkwoLG6zGogqOwHIQA==
X-Received: by 2002:a50:cd9c:: with SMTP id p28mr68774887edi.83.1609760592341; 
 Mon, 04 Jan 2021 03:43:12 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id s15sm15294357eja.36.2021.01.04.03.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 03:43:11 -0800 (PST)
References: <20201226121556.975418-1-martin.blumenstingl@googlemail.com>
 <20201226121556.975418-2-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/3] clk: meson: clk-pll: fix initializing the old rate
 (fallback) for a PLL
In-reply-to: <20201226121556.975418-2-martin.blumenstingl@googlemail.com>
Message-ID: <1j35zhx700.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 04 Jan 2021 12:43:11 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_064313_875225_D8274608 
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sat 26 Dec 2020 at 13:15, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> The "rate" parameter in meson_clk_pll_set_rate() contains the new rate.
> Retrieve the old rate with clk_hw_get_rate() so we don't inifinitely try
> to switch from the new rate to the same ratte again.

Small typo above fixed while applying


>
> Fixes: 7a29a869434e8b ("clk: meson: Add support for Meson clock controller")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/clk/meson/clk-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index b17a13e9337c..9404609b5ebf 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -371,7 +371,7 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>  	if (parent_rate == 0 || rate == 0)
>  		return -EINVAL;
>  
> -	old_rate = rate;
> +	old_rate = clk_hw_get_rate(hw);
>  
>  	ret = meson_clk_get_pll_settings(rate, parent_rate, &m, &n, pll);
>  	if (ret)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
