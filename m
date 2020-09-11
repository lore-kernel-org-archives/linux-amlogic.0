Return-Path: <SRS0=cGvQ=CU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA36EC43461
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2020 15:29:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B70220770
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2020 15:29:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YHzH22Km"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B70220770
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6LQl4jT2Zy09jXr5THTKQBIEpZoqw9nB2SpXq9gFEPM=; b=YHzH22KmJrPw7MmvXZctQ7xpY
	wvu5XCnu3Otzzj3azFT0dF9s0zJTMUmVXhMUgC1zzIKv8b3/ql9HH3/12GBsdP86PrBr5ZrOgKP1x
	9707UC/OjiWkoktG+SBGQ6XTaJFEfct+Zxq9zKyu7/UKw72bqCqIMPlDqGgPdtOm7P9+ueQ91NmxG
	gQ3/TDGGZ45j12/SIFofzCDY6mow1Gby4FGeQHHayZ1kan7ntvNP0XMDMAvNa7TH0aXLMqC1wAi3S
	FCCVnaUJMdQBRSFGobZOWk/XNiTUiPKLQRmSSCBewRxrpv3brf0/IccbCpvn6SOyOYP7n4Nvcm8cl
	4f8iNV7gA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGkzn-0004Yy-8n; Fri, 11 Sep 2020 15:29:51 +0000
Received: from mail-ej1-f66.google.com ([209.85.218.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGkzk-0004Xe-FI; Fri, 11 Sep 2020 15:29:49 +0000
Received: by mail-ej1-f66.google.com with SMTP id i22so14347444eja.5;
 Fri, 11 Sep 2020 08:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1L7ouaVwl53aJ/C0pjue7rijbsZk1fSarRvqjzRo/2A=;
 b=Z+UrTA6KEcqbXYgR03qIeABec50n9WGd7DRl9/yR4KjF+MQ5xLp+qPwy+AXjjg4G9l
 dmMc75la5zosUjWU3IAuJeUoBdTI2wWpiozXAd5GWfDcnhox11MxbWqj7shAorv/+vXk
 g5qgHAVN06AUx7hWQOYFt52/BmXY2RNmib4jQB20HMLa7GKBWEL75Fv8GGV8ymqXqE3I
 s0E2gGwj0nzcMEgciWqtX6ffQExkto9hxkpj4WsLMO+8c8nPooMe9H0IQ1aQKV2uaTNS
 6Axp22Qdc4zXyTJUW0jJnsXsAJEIdI0xOvBXHpUsjDjDapclcDlQgTOHXQ8bEgu7OELj
 db/A==
X-Gm-Message-State: AOAM531gXn2xDqIqUumRu9yDHCMBxOTi6ZTtTXad7sQQRLDUSU/Od7sR
 3531zU++LWt/9oLk6Cseo5o=
X-Google-Smtp-Source: ABdhPJxn7jTDwZi5ZOlrQEeLynoOjxot2Skr5RMkSQ65PrDAYi4hyy9lmSIKeLY2io8IfaK7BKOeXg==
X-Received: by 2002:a17:906:386:: with SMTP id
 b6mr2565409eja.538.1599838187269; 
 Fri, 11 Sep 2020 08:29:47 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
 by smtp.googlemail.com with ESMTPSA id bf25sm1890178edb.95.2020.09.11.08.29.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 11 Sep 2020 08:29:46 -0700 (PDT)
Date: Fri, 11 Sep 2020 17:29:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 04/10] clk: gpio: Simplify with dev_err_probe()
Message-ID: <20200911152943.GA17780@kozik-lap>
References: <20200902150348.14465-1-krzk@kernel.org>
 <20200902150348.14465-4-krzk@kernel.org>
 <159977526650.2295844.8933765686946237404@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159977526650.2295844.8933765686946237404@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_112948_551242_1AB1E52F 
X-CRM114-Status: GOOD (  24.13  )
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
Cc: linux-arm-msm@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, David Lechner <david@lechnology.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Sekhar Nori <nsekhar@ti.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Maxime Ripard <mripard@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Sep 10, 2020 at 03:01:06PM -0700, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2020-09-02 08:03:42)
> > diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
> > index 38755a241ab7..a3cc53edcb11 100644
> > --- a/drivers/clk/clk-gpio.c
> > +++ b/drivers/clk/clk-gpio.c
> > @@ -211,17 +210,10 @@ static int gpio_clk_driver_probe(struct platform_device *pdev)
> >  
> >         gpio_name = is_mux ? "select" : "enable";
> >         gpiod = devm_gpiod_get(dev, gpio_name, GPIOD_OUT_LOW);
> > -       if (IS_ERR(gpiod)) {
> > -               ret = PTR_ERR(gpiod);
> > -               if (ret == -EPROBE_DEFER)
> > -                       pr_debug("%pOFn: %s: GPIOs not yet available, retry later\n",
> > -                                       node, __func__);
> > -               else
> > -                       pr_err("%pOFn: %s: Can't get '%s' named GPIO property\n",
> > -                                       node, __func__,
> > -                                       gpio_name);
> > -               return ret;
> > -       }
> > +       if (IS_ERR(gpiod))
> > +               return dev_err_probe(dev, PTR_ERR(gpiod),
> 
> This is cool! I wonder if we could make it even more simplified with
> 
> 	ret = dev_err_probe_ptr(dev, ptr, ...)
> 	if (ret)
> 		return ret;
> 
> then we don't have to do the PTR_ERR() or IS_ERR() dance in all the
> drivers. It could already be changed here to look at the return value of
> dev_err_probe() so please do that at the least.

I think this could be achieved with Rob's work here:
git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dev_err-removal

It would make this patchset obsolete. Up to you then if you plan to wait
for Rob's work.


> It would also even be more super duper cool if we had a way to save some
> sort of cookie when the provider can't find it and is returning the
> -EPROBE_DEFER value. Maybe the provider could use
> device_set_deferred_probe_reason() on error and then if dev_err_probe()
> is called without any string it can print what is in the device's
> deferred probe reason? Or append to it whatever string is passed from
> the device driver? Sometimes the provider has more info like the DT
> property is malformed or the provider isn't probed yet which would
> probably help understand the deferred problem more.

Yes, good point. If all (or most) messages are moved to the providers,
it would be easier to print also the defer reasons.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
