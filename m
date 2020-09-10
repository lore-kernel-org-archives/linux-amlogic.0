Return-Path: <SRS0=nKCN=CT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D8EC43461
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2020 22:01:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07D5B20BED
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2020 22:01:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qId0PvIz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ecMjRku/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07D5B20BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BFa1rZ0/SHFM7jNI01c+zjmEaTmv/+Ilqgqom5OOito=; b=qId0PvIzOybAxKAWHVncF9RMr
	Nd0mki9YQQx7DfZsQfXKS7wnrSHGdUDL99j0ipVG3e0ZAiEOK320GCJMzgz0qrOrm7CMJaPPNvzd7
	qnWkNmSw+wafqbKaowCF1hy7GaRnEucW42aKz8oey0U7y426EDZB3n+PTZk4q5+hwiWga4kGCn+KK
	nYI2KYZYkaTtkqw76tgmk0ijOih25JSyPXVoiJBDlrq2Qc0LJCPxOEvZs01XldPe7mo1wYxJfNbWv
	eeYFw8hkgT+2IhLhCU70R675N/AQF9Xd5RAX/R/ndk12SneXM4LzSv6r69ORnqHyM21UfXLEnvU6M
	fFvdAVNFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGUcx-0003nQ-FL; Thu, 10 Sep 2020 22:01:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGUcu-0003mp-NU; Thu, 10 Sep 2020 22:01:09 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AFDB020719;
 Thu, 10 Sep 2020 22:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599775267;
 bh=eLv0acndV7FadmxKGqnqISythFg+9YR3Bfr/HW6YiiY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ecMjRku/krPzWiOFKeM/DQiIU/uQ64xNQFsumr+L1SD6PxLM2asC10ifsuy7QbIL/
 ZgZg8SUnfi1/cMFmqbl0ZF0c0LFetJGhDYIgB/BEHkkpgxJYDxWWDEFfOUF0Cu4P+F
 PEUcT+wOc/pwHQCrNOqMsZIKKPAg4Tk/N+lNjuL8=
MIME-Version: 1.0
In-Reply-To: <20200902150348.14465-4-krzk@kernel.org>
References: <20200902150348.14465-1-krzk@kernel.org>
 <20200902150348.14465-4-krzk@kernel.org>
Subject: Re: [PATCH 04/10] clk: gpio: Simplify with dev_err_probe()
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, David Lechner <david@lechnology.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Sekhar Nori <nsekhar@ti.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 10 Sep 2020 15:01:06 -0700
Message-ID: <159977526650.2295844.8933765686946237404@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_180108_848082_F6200350 
X-CRM114-Status: GOOD (  17.28  )
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Krzysztof Kozlowski (2020-09-02 08:03:42)
> diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
> index 38755a241ab7..a3cc53edcb11 100644
> --- a/drivers/clk/clk-gpio.c
> +++ b/drivers/clk/clk-gpio.c
> @@ -211,17 +210,10 @@ static int gpio_clk_driver_probe(struct platform_device *pdev)
>  
>         gpio_name = is_mux ? "select" : "enable";
>         gpiod = devm_gpiod_get(dev, gpio_name, GPIOD_OUT_LOW);
> -       if (IS_ERR(gpiod)) {
> -               ret = PTR_ERR(gpiod);
> -               if (ret == -EPROBE_DEFER)
> -                       pr_debug("%pOFn: %s: GPIOs not yet available, retry later\n",
> -                                       node, __func__);
> -               else
> -                       pr_err("%pOFn: %s: Can't get '%s' named GPIO property\n",
> -                                       node, __func__,
> -                                       gpio_name);
> -               return ret;
> -       }
> +       if (IS_ERR(gpiod))
> +               return dev_err_probe(dev, PTR_ERR(gpiod),

This is cool! I wonder if we could make it even more simplified with

	ret = dev_err_probe_ptr(dev, ptr, ...)
	if (ret)
		return ret;

then we don't have to do the PTR_ERR() or IS_ERR() dance in all the
drivers. It could already be changed here to look at the return value of
dev_err_probe() so please do that at the least.

It would also even be more super duper cool if we had a way to save some
sort of cookie when the provider can't find it and is returning the
-EPROBE_DEFER value. Maybe the provider could use
device_set_deferred_probe_reason() on error and then if dev_err_probe()
is called without any string it can print what is in the device's
deferred probe reason? Or append to it whatever string is passed from
the device driver? Sometimes the provider has more info like the DT
property is malformed or the provider isn't probed yet which would
probably help understand the deferred problem more.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
