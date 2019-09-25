Return-Path: <SRS0=JnL7=XU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D75C432C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2019 21:25:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61D482054F
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2019 21:25:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o4n209Hx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fDG7GLpW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61D482054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4qz8CGAVjqnHpIXMQ3spfyZ4AuUQWKxU4lrkVO7VOFs=; b=o4n209HxjvAnqJ
	nIYIjV4aeD6urTs91qUeI4aIKNroZoK59dn3jPP1N8cphGNryzJH94hoshwrZuO2upMRcDG2ePzq7
	TYf6FLb+J17XOWkafBvU0rfkUF968FKcIN8i834hhkp6uQmA/CHdM9teGM66MGOL+XMxHhGBnvyRg
	5PLtNR5WUXqz7MqeYIUCWzJ5hf1/kMVPtf2m6HBMEhrvH1lKLFx9hqkMeH8uLBIjSRCAl+MUVsmdE
	40YMJfu5o7sDi9fUeLePQRdrCnwRDcMDDrKvVdV3vouSq6Oqk9W1SD7FPzSQCFjcGjLzFgr6CtN9t
	ba9mBEV3WO5OLddCOuOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDEnE-0005UQ-UA; Wed, 25 Sep 2019 21:25:48 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDEnC-0005Tn-3g
 for linux-amlogic@lists.infradead.org; Wed, 25 Sep 2019 21:25:47 +0000
Received: by mail-pg1-x541.google.com with SMTP id x10so23382pgi.5
 for <linux-amlogic@lists.infradead.org>; Wed, 25 Sep 2019 14:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=1Y1J1Kw/LXYSdUV06b1dy3Hdb52qSoFy0DppBDWha44=;
 b=fDG7GLpWOijl3/znkPByFyhC2Hzp+IvPmDBuEn9x9EfiC8H7q1Mt/fO3YAofHgjPni
 io2vWxqDMyaMj0cJs2bjquKDfDbWJfym4YrTr7UUokWpPqe01xFaXadxSTIRfp9LHBjA
 68atluJ2Q1iKYX3MuXlDh79prBM9tS4F2dHDnm5M7ff+Q6mV+uawWu5WRb85e/yJwerU
 FN+X/Acm1R02RsIVxHPG/5UOnQ3coOZyhOl2cJYKPqUqe2/nlRQ1ffvjKfv6LPUsgE1q
 fEyS1vl+EAQT3pjO4wZBxIEgqOXH4bvMqaM8hvpC3iMSSUQLMek7TioHNItI24HpGDw7
 p1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=1Y1J1Kw/LXYSdUV06b1dy3Hdb52qSoFy0DppBDWha44=;
 b=my+IQYyv79Eoq+v/jnpb89tRPLSxYAxGDeltLbsnP1qd+kvTLWwtCM5rExc6oceI5h
 n4vAQhy6JBhnkFsw8X6mj9lkw8UQLbAQ4DGfUZBOaSePw0PYF7gFga+dwsQsYlL/A7R5
 KXihXP8JgWP1k1q4oH8X8d5Ifkz4fAMzQzBdKv/w0wpygivPuLMNXx1aPCryhFQskiyn
 w23yWcLYtZigfqHkZs3ULem1/uu2MVAEjShTY8tnh+Zk4ROZ2F101gIawfW/lJhTYIwO
 7MgFftEhg7vHXKKHJ/QWhGEkiBfOheJrYdpCWBFsW0i6d0P0JbdBEoSErXjntOmC4hyz
 2tdA==
X-Gm-Message-State: APjAAAU6gJmPNdqtKO5TmowPL8pZM0njB+P0zHDKipKhSrAmqUdcUePo
 htWOvKNw05HwnIIrGRV9vrPFGVrxgwZU7w==
X-Google-Smtp-Source: APXvYqwgUR4Z8HtrG9mlqqRXWQIUNeORyF7p+25oUPoAEWkRMulS2hiRlTY2wV+lUnYfhKuGjxHm6Q==
X-Received: by 2002:a17:90b:d91:: with SMTP id
 bg17mr8643532pjb.79.1569446744835; 
 Wed, 25 Sep 2019 14:25:44 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id 5sm488979pgk.75.2019.09.25.14.25.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 25 Sep 2019 14:25:44 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/2] soc: amlogic: ee-pwrc: ensure driver state maches HW
 state
In-Reply-To: <20190925191233.22253-3-khilman@baylibre.com>
References: <20190925191233.22253-1-khilman@baylibre.com>
 <20190925191233.22253-3-khilman@baylibre.com>
Date: Wed, 25 Sep 2019 14:25:43 -0700
Message-ID: <7hftkkukyw.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190925_142546_156244_BCD88A21 
X-CRM114-Status: GOOD (  16.93  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Kevin Hilman <khilman@baylibre.com> writes:

> During init, ensure that the driver on/off state as well as clock
> state matches the hardware state by calling drivers on/off functions
> based on whether the HW state is on/off.
>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  drivers/soc/amlogic/meson-ee-pwrc.c | 30 +++++++++--------------------
>  1 file changed, 9 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
> index dcce8e694a07..2cb5341aedfa 100644
> --- a/drivers/soc/amlogic/meson-ee-pwrc.c
> +++ b/drivers/soc/amlogic/meson-ee-pwrc.c
> @@ -323,6 +323,8 @@ static int meson_ee_pwrc_init_domain(struct platform_device *pdev,
>  				     struct meson_ee_pwrc *pwrc,
>  				     struct meson_ee_pwrc_domain *dom)
>  {
> +	bool is_off;
> +
>  	dom->pwrc = pwrc;
>  	dom->num_rstc = dom->desc.reset_names_count;
>  	dom->num_clks = dom->desc.clk_names_count;
> @@ -356,27 +358,13 @@ static int meson_ee_pwrc_init_domain(struct platform_device *pdev,
>  	dom->base.power_on = meson_ee_pwrc_on;
>  	dom->base.power_off = meson_ee_pwrc_off;
>  
> -	/*
> -         * TOFIX: This is a special case for the VPU power domain, which can
> -	 * be enabled previously by the bootloader. In this case the VPU
> -         * pipeline may be functional but no driver maybe never attach
> -         * to this power domain, and if the domain is disabled it could
> -         * cause system errors. This is why the pm_domain_always_on_gov
> -         * is used here.
> -         * For the same reason, the clocks should be enabled in case
> -         * we need to power the domain off, otherwise the internal clocks
> -         * prepare/enable counters won't be in sync.
> -         */
> -	if (dom->num_clks && dom->desc.is_off && !dom->desc.is_off(dom)) {
> -		int ret = clk_bulk_prepare_enable(dom->num_clks, dom->clks);
> -		if (ret)
> -			return ret;
> -
> -		pm_genpd_init(&dom->base, &pm_domain_always_on_gov, false);
> -	} else
> -		pm_genpd_init(&dom->base, NULL,
> -			      (dom->desc.is_off ?
> -			       dom->desc.is_off(dom) : true));
> +	/* Ensure that driver state matches HW state */
> +	is_off = dom->desc.is_off ? dom->desc.is_off(dom) : true;
> +	if (is_off)
> +		meson_ee_pwrc_off(&dom->base);

Neil pointed out off-list that this isn't quite right.

This _off() call can potentially try to disable clocks that have never
been enabled (by the clock fwk) resulting in noisy warnings.

I'll send a v2 which always calls _on() and then optionall calls _off().
That will ensure that the drivers notion of the clock state also matches
the HW state.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
