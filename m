Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C784C00140
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Aug 2022 12:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RwqqPjc4PgZ8Wv6xD+huA5htC4wdRXfuyYZPOg16DCw=; b=nNkoWpNmI3QMVn
	IoG9rowA2DQRGDYQcODCFOX8RqWX18H50zwJQhni4izoOT0SePSxm8zpzpMM6BC+DNNmWi2CLJf4S
	lvGMVAIGVhzB5UFWwYxBPU0celhGVSJS52WaqOb6BLHk5c6bZTkBZUMEFlvhZAgU6ivi8CuzEFBCx
	3CS21OdzJtHHGUeJeoYcJPocFqOXBTQLnYf7ndHXJiFe5H1oNsMi3scW4u/+NdfwvihIfjduAO2DT
	Uvygy0V6V/Pegvs1pTGH3V2NL2eh8ERBA3Cj4DRkAvLVenITgcZhlbddUtEdO5effqwIHfDBSymzQ
	9zvYzC/SZ4e0w/aYv2QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL1YX-00DUhJ-3D; Mon, 08 Aug 2022 12:08:25 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL1PT-00DQZN-Be; Mon, 08 Aug 2022 11:59:05 +0000
Received: by mail-pl1-x62d.google.com with SMTP id x10so8336853plb.3;
        Mon, 08 Aug 2022 04:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc;
        bh=45zF6wFzN206raoW09X+vEo3k3IpyXxBW6ekbRawA1Y=;
        b=Xzbv9UFANA1nX9nbeNbq7CReZK+z0sy8IJcwuMrQ12aNYVwKrpfaHhAgJ+9Gn6eXys
         HctwQJPPSkJiA5uiIl/v3MdijO0d5fmHVaxfUMm3qNjtMlp6NEtNM7HbRPiLBYRVDW9M
         LT4TBbf2f+oQmyxGc1cr2AczZZ442WDTpbkfxi4lWBIAS4Z95CQMYOsIIayDf7BOdNzV
         AlLL/v7PTWDYhmnJ1Pj8G/aCNXF8yvATcdfYw/fZTFnzq3H8UC/3/RYgF3UihytBMG08
         jkDCWfZ049XtYEMMoyd4xfJ5jCBtKgo2jpArhNSc4Lm85842D4p5jJ4NPZQf6QZqZOLY
         FRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc;
        bh=45zF6wFzN206raoW09X+vEo3k3IpyXxBW6ekbRawA1Y=;
        b=fwgZPUeOlWjUeWfpyqVaIk2qWzQ8vFEBSqtC4IJVJ2wUUplkz0pbMPxbf5DPPS4JIM
         OYylJyUmeEuXpnG6Bh3Bwm0sI2NAh4/5qEExW4prBX6a4c7/HQIUW2v+YkuTROIKOq6S
         g3vFWT3Xw+WP9Sg5U4TgLBfm0i/Spf/EgANjyNPnsAGxtRCD6rHfB5FdLxKPMu/bYfQi
         KZuxhJsdufltibfcjdFkMa2lDcHm+OLsi0OWm6r2LUUgx+MdlN9O8r8QRRXKQK/1eVb5
         engDcyKbBW72RYxaxczXm/f6MvnmHnbb+ht9YVouuKR6GqR1n5Vf0aJ+gX5Wne50CVUY
         lS4g==
X-Gm-Message-State: ACgBeo1ocBfyKchbLxOEzwp54t1U05RqvrsrlyCaga10Bh0sgxRPRkms
	UPNAYb+ReIq56ryUllBK/u4=
X-Google-Smtp-Source: AA6agR4TOhoorhEezH7+HGtDNevbEABb5dRbZHifApvFkLvUdS9VD2eZClFF7q6j2TufSSkYjEWcsg==
X-Received: by 2002:a17:902:9005:b0:16c:f62c:4376 with SMTP id a5-20020a170902900500b0016cf62c4376mr18404036plp.87.1659959939385;
        Mon, 08 Aug 2022 04:58:59 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902ce8400b0016cd74dae66sm8748344plg.28.2022.08.08.04.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 04:58:58 -0700 (PDT)
Message-ID: <7ab495dd-4b3e-46e8-6db0-1dd20860043f@roeck-us.net>
Date: Mon, 8 Aug 2022 04:58:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] watchdog: meson: keep running if already active
Content-Language: en-US
To: Philippe Boos <pboos@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
References: <20220801092150.4449-1-pboos@baylibre.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220801092150.4449-1-pboos@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_045903_474011_69D0FE4C 
X-CRM114-Status: GOOD (  22.90  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 8/1/22 02:21, Philippe Boos wrote:
> If the watchdog is already running (e.g.: started by bootloader) then
> the kernel driver should keep the watchdog active but the amlogic driver
> turns it off.
> 
> Let the driver fix the clock rate if already active because we do not
> know the previous timebase value. To avoid unintentional resetting we
> temporarily set it to its maximum value.
> 
> Then keep the enable bit if is was previously active.
> 
> Signed-off-by: Philippe Boos <pboos@baylibre.com>

What changed since v1 ?

Guenter

> ---
>   drivers/watchdog/meson_gxbb_wdt.c | 24 +++++++++++++++++++-----
>   1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 5a9ca10fbcfa..8be8fd9e5637 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -146,6 +146,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct meson_gxbb_wdt *data;
>   	int ret;
> +	u32 ctrl_reg;
>   
>   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>   	if (!data)
> @@ -177,13 +178,26 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>   	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
>   	watchdog_set_drvdata(&data->wdt_dev, data);
>   
> +	ctrl_reg = readl(data->reg_base + GXBB_WDT_CTRL_REG) &
> +				GXBB_WDT_CTRL_EN;
> +
> +	if (ctrl_reg) {
> +		/* Watchdog is running - keep it running but extend timeout
> +		 * to the maximum while setting the timebase
> +		 */
> +		set_bit(WDOG_HW_RUNNING, &data->wdt_dev.status);
> +		meson_gxbb_wdt_set_timeout(&data->wdt_dev,
> +				GXBB_WDT_TCNT_SETUP_MASK / 1000);
> +	}
> +
>   	/* Setup with 1ms timebase */
> -	writel(((clk_get_rate(data->clk) / 1000) & GXBB_WDT_CTRL_DIV_MASK) |
> -		GXBB_WDT_CTRL_EE_RESET |
> -		GXBB_WDT_CTRL_CLK_EN |
> -		GXBB_WDT_CTRL_CLKDIV_EN,
> -		data->reg_base + GXBB_WDT_CTRL_REG);
> +	ctrl_reg |= ((clk_get_rate(data->clk) / 1000) &
> +			GXBB_WDT_CTRL_DIV_MASK) |
> +			GXBB_WDT_CTRL_EE_RESET |
> +			GXBB_WDT_CTRL_CLK_EN |
> +			GXBB_WDT_CTRL_CLKDIV_EN;
>   
> +	writel(ctrl_reg, data->reg_base + GXBB_WDT_CTRL_REG);
>   	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
>   
>   	watchdog_stop_on_reboot(&data->wdt_dev);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
