Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735C1EE4993
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Aug 2023 15:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xb0zYq9wdH7K+HH6WAXtHE9Pd+E5qnbpKc+lzust4ko=; b=1yGDA2SlxJjm00
	OC3W+4jqacN79LBtmJHv68QG72tgGRhSKBpOOTtUFkcztmZ9Cs3md02zhOXPHuGwJ7vyUXBmm9e3d
	uPwJz8MZLtEqwaYkrtx2gYE0XUPYIqEAn2nWXcWgW8+LYauF3dSlc2KQxaLsr23y5wysigqLWb9wt
	JX6yfP44IBFLbXaKZJcSeBxfhJMsOuIghHvxD3Jv8Bu39gIhIbsUsHe/SwDx3fmI+n8oc43B3yzSn
	/51SqfJiK203jENMEnhZkMx9zewKs7O18GVLfCMzNlay/glq55y7hmpzkZij8oh0eQRNcuqn56Ube
	JUe+FrJc6lJrnDAX2cog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYq5Z-00111f-2L;
	Wed, 23 Aug 2023 15:48:09 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYq5W-001100-1T;
	Wed, 23 Aug 2023 15:48:07 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1cca7cf6e01so1355054fac.0;
        Wed, 23 Aug 2023 08:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692805679; x=1693410479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjhuWg+MLT4cMd8T4gNbdCXrYUTU7KElmXTebLc+GdU=;
        b=jCQTWKOFbxWZu9idhMYlU+MbhUyuFNvcHsNFrdWKkWcECnjWw7A+0J5c0SHl3rcTwy
         OqQhdnoE8kWhGHA6EILVOzBMkFh8YFlnpGY+EV8A7zX6QnI7nTj1mu4JR8DAmlkd1bXt
         3kCPp5O4cZbzQDSX+LrbdpTTNLtaJ8SIhQCZ0H08kXcN5iVo8zvRSpNAhKHbBXoUCfmy
         DB0oLRCdJHgNgR6tw2kPQXimU3SYZs/NeSYnKiUWL8azFqw4fC1EUB8BqpH1QxkWomTd
         7Okw7DCE4gz+pi3fYQlI841VjRojuS7gVehzFbG1MkDg7+oJL6D+D5/xNbYo47C7rqvr
         JoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692805679; x=1693410479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjhuWg+MLT4cMd8T4gNbdCXrYUTU7KElmXTebLc+GdU=;
        b=WfR55Mh0ZERG6u5xVQ0CvhIEEmJLhTQUqnQnUQKL8/dhectLrsGQyNGlE7bOVZ0lEQ
         nlsU32G8zxePNTXn0iBxVDEkXcUZFPF0KQd9k32t5IyQSSBB9Xq+Nf8yqun76Jctck9Y
         5ffyjtYr0ooaq13de4J1D/pmr9Gx2gUie3WvPGRpdz9WSl1g69cmOSeaXxZOb1U4cKuH
         GeR3TiDBKVTUA9GXWq8XD3K1bIaHLxlToIPdNihRn71qerbKN8Ls/3cmUfN9c7zTuRDg
         h27lLSIlNkeDZPU62b4QVmt8Cesp/ScQIHxvIcfp5NzN79dAb0jUMIygzWgEI3dWsfBF
         hCqg==
X-Gm-Message-State: AOJu0YxvS+fTO8AJHKXCtxai4pw21B1ZMojVXBj+HxnR2y26rRjxt94H
	DGVtFYRXqJAsRD+3vkXUVmU=
X-Google-Smtp-Source: AGHT+IH+4jRD2kRQ7+Wgz70dKoi2Q6Eu4UXirwYcEDVnPoeKqJLeVmHEGJ8xKA66kPh2Ogh0a5LgNw==
X-Received: by 2002:a05:6871:54d:b0:1bf:54b9:800 with SMTP id t13-20020a056871054d00b001bf54b90800mr13217366oal.59.1692805678935;
        Wed, 23 Aug 2023 08:47:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id cm1-20020a17090afa0100b0026940eb686bsm11544660pjb.20.2023.08.23.08.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 08:47:58 -0700 (PDT)
Date: Wed, 23 Aug 2023 08:47:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: wim@linux-watchdog.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/4] watchdog: Add a new struct for Amlogic-GXBB driver
Message-ID: <15d24bb9-7539-40bd-a986-36ee0a57e244@roeck-us.net>
References: <20230802033222.4024946-1-huqiang.qin@amlogic.com>
 <20230802033222.4024946-3-huqiang.qin@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802033222.4024946-3-huqiang.qin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_084806_494260_F728FB7B 
X-CRM114-Status: GOOD (  21.22  )
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

On Wed, Aug 02, 2023 at 11:32:20AM +0800, Huqiang Qin wrote:
> Add a new structure wdt_params to describe the watchdog difference
> of different chips.
> 
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
> Reviewed-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> V1 -> V2: Rename rst_shift to rst and use the BIT() macro to build
>           its initial value.
> 
>  drivers/watchdog/meson_gxbb_wdt.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 35d80cb39856..18180d91543e 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -22,7 +22,6 @@
>  
>  #define GXBB_WDT_CTRL_CLKDIV_EN			BIT(25)
>  #define GXBB_WDT_CTRL_CLK_EN			BIT(24)
> -#define GXBB_WDT_CTRL_EE_RESET			BIT(21)
>  #define GXBB_WDT_CTRL_EN			BIT(18)
>  #define GXBB_WDT_CTRL_DIV_MASK			(BIT(18) - 1)
>  
> @@ -45,6 +44,10 @@ struct meson_gxbb_wdt {
>  	struct clk *clk;
>  };
>  
> +struct wdt_params {
> +	u32 rst;
> +};
> +
>  static int meson_gxbb_wdt_start(struct watchdog_device *wdt_dev)
>  {
>  	struct meson_gxbb_wdt *data = watchdog_get_drvdata(wdt_dev);
> @@ -140,8 +143,12 @@ static const struct dev_pm_ops meson_gxbb_wdt_pm_ops = {
>  	SET_SYSTEM_SLEEP_PM_OPS(meson_gxbb_wdt_suspend, meson_gxbb_wdt_resume)
>  };
>  
> +static const struct wdt_params gxbb_params = {
> +	.rst = BIT(21),
> +};
> +
>  static const struct of_device_id meson_gxbb_wdt_dt_ids[] = {
> -	 { .compatible = "amlogic,meson-gxbb-wdt", },
> +	 { .compatible = "amlogic,meson-gxbb-wdt", .data = &gxbb_params, },
>  	 { /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, meson_gxbb_wdt_dt_ids);
> @@ -150,6 +157,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct meson_gxbb_wdt *data;
> +	struct wdt_params *params;
>  	u32 ctrl_reg;
>  
>  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> @@ -164,6 +172,8 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(data->clk))
>  		return PTR_ERR(data->clk);
>  
> +	params = (struct wdt_params *)of_device_get_match_data(dev);
> +
>  	platform_set_drvdata(pdev, data);
>  
>  	data->wdt_dev.parent = dev;
> @@ -191,7 +201,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>  	/* Setup with 1ms timebase */
>  	ctrl_reg |= ((clk_get_rate(data->clk) / 1000) &
>  			GXBB_WDT_CTRL_DIV_MASK) |
> -			GXBB_WDT_CTRL_EE_RESET |
> +			params->rst |
>  			GXBB_WDT_CTRL_CLK_EN |
>  			GXBB_WDT_CTRL_CLKDIV_EN;
>  

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
