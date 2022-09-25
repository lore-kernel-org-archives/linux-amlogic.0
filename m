Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E10EC54EE9
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Sep 2022 15:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oOmXkz2sbhUuqEeJ1na2XycgjBRU46Wms/oUmEtU9SE=; b=UQb339KH8zqbbJ
	1WOQtLSlggyRz4kQx+X9i7XJF0gpN5YU0Mda6sv67n4mBI+nnFH5pmDzPFxZTVfdaS3ieEJgRL/2p
	CZTH5OIqRqMlK4o8jcHZuhJVVriI90cCBf3Zjhx0vGwh7nW35eBS8M+wz5iH4Vs34Arp36QTIJCZp
	U3IM/l1e9UVIDofTstotKl6yTNIu0rJNHHlrLUqUHB3+01PguOIwqLvoiK3MNhhQXE0Etp5kXaL6v
	GSSqm0q43ULg6601RPaCqZGzG6GTpB4tZAUKUVwF0lxDWe/FqrA3QF5J4HEff/MgUoiYF5Oqzb5yO
	ZvQ6ZiIELUCAkdm/cUOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocTkJ-00EYz9-Ti; Sun, 25 Sep 2022 15:40:44 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocTk8-00EYsD-2j; Sun, 25 Sep 2022 15:40:33 +0000
Received: by mail-pg1-x536.google.com with SMTP id c7so4506529pgt.11;
        Sun, 25 Sep 2022 08:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=ALf43tEt4uTY7t2ZG6Ao8BT7RErUJLGMqwWyM5uhgEc=;
        b=hqwPnnM/ypNQfn1GAU6crVglBMh7NBmkOrRMeMKH0gXTqXMYa5DFjsjfRf5m+R6r/e
         wjaP/7EpmEPJ61efUZ3KgwrZ6eKWxBBBmY8VPN9ctSySBRvtXpXd/WZeOHXChaTCjiDl
         YS7ydQy/7kvk/NLQMuYRdiq9e0B/BL9l9JiyH4WAweuar2ZX1zY03K2ToY6sQWjMXL3Z
         h7svrokrX4Rqm1Gf7QBy9+9GiOb9Lh5YqnJTQm3bcrXzQ6YeqiG3vxa9o4/ahkIolpzQ
         xx4yjcBIoitEZaLR/2f3M8tOWDy86puakGnE7rOmCVA8xXiOJZNyoIcbEzMN4bK4+GFo
         DrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ALf43tEt4uTY7t2ZG6Ao8BT7RErUJLGMqwWyM5uhgEc=;
        b=L08wvSbCpKpjJRx01ke32wQp24Cmg/SJpgagwLOeX0vAdPRC7Z2g4NEt4PJh9thwIr
         ijXFUBJ0+SmLE5VDUV8xv5XqXCjE7tZi+kLname2e9ID9zyNO2B7Z5Gm3HXry1Ml7gJz
         o8WADO8rpV+ojU5XGu7V47kxDT331NGR3MX7ghHDwLNoKFt63wOecAK/Bkmpyn3luUEU
         +wItIdh/gHcIvrFaWf3gcmTIcmyY42UXOOTjaYOgw7ABG8vR3ZPjfxM5P1oQKg3JN17R
         TrjhSX2P7aUvR6FHl6Xbwi5uHdYHdbtj4Lh8jLXSqSuFpqOmLo6CmHokR1HEUerOMYci
         eyww==
X-Gm-Message-State: ACrzQf1FEFp+MvBDK8arpVeAEJDG2HjZ9+QRe4iJXRe5DEny28mUW3wY
	uwgCxChU5AbHavBbw6aWfw8=
X-Google-Smtp-Source: AMsMyM5qEgpsSBH0Cd3X5H1tJXymH6cgWhNuk88G9vgitj4eLEaGuYvD3kPzFZfzfeaTUToVZNfo8w==
X-Received: by 2002:a63:191d:0:b0:434:4bb3:e016 with SMTP id z29-20020a63191d000000b004344bb3e016mr16522946pgl.133.1664120424520;
        Sun, 25 Sep 2022 08:40:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o67-20020a625a46000000b00554722eda37sm7790166pfb.0.2022.09.25.08.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 08:40:23 -0700 (PDT)
Date: Sun, 25 Sep 2022 08:40:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Philippe Boos <pboos@baylibre.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] watchdog: meson: keep running if already active
Message-ID: <20220925154022.GA1758351@roeck-us.net>
References: <20220801092150.4449-1-pboos@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220801092150.4449-1-pboos@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_084032_146758_761D9175 
X-CRM114-Status: GOOD (  23.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Aug 01, 2022 at 11:21:50AM +0200, Philippe Boos wrote:
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
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/meson_gxbb_wdt.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 5a9ca10fbcfa..8be8fd9e5637 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -146,6 +146,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct meson_gxbb_wdt *data;
>  	int ret;
> +	u32 ctrl_reg;
>  
>  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
> @@ -177,13 +178,26 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>  	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
>  	watchdog_set_drvdata(&data->wdt_dev, data);
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
>  	/* Setup with 1ms timebase */
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
>  	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
>  
>  	watchdog_stop_on_reboot(&data->wdt_dev);

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
