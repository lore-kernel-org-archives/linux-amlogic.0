Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8506EC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Mar 2022 12:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aXSNLchFMDyOsI0xqt2M/5BNP0nni/KgDEypPtBLjPs=; b=FBrK9GruzzSyj6
	WAiUdQ4Y3vemh5us0FxnI8F33C+qbVW162MiVkhFIEwC9zftH0pNcB5tW/4rSrG8Zo30+du+XOHt9
	dQRlr9gb6/uatyx50icMMyGR2U4uKuffez6ipb0v+UAq1RPzpN3HkJTqszyY8ERToBUANag88LECh
	EfRWqu+zOcIEzDarSeTxGqSk47GBlalsMFHpvRdVs30TJTAHRvx6DHYxmMO8W69a+HHRNkIBMikD+
	a0A04rbFvVt23a3lHNlYwjRNHe99XcclIgKasETwL9udYezYVwAltygAlf/IguIO2DriSpNNaSzzg
	hhs943opCnKjlUc7Ue/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZAyW-00CCPQ-F0; Tue, 29 Mar 2022 12:29:28 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZAyT-00CCOC-Fk
 for linux-amlogic@lists.infradead.org; Tue, 29 Mar 2022 12:29:27 +0000
Received: by mail-wr1-x430.google.com with SMTP id u16so24575762wru.4
 for <linux-amlogic@lists.infradead.org>; Tue, 29 Mar 2022 05:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JWAxhkpD2i8UZ8j248lkUJk4oN/7cNs/WUDnK2ILLuA=;
 b=GXvbOt7cHYG+zEcO53/N0pAGW4E6Xl+/x6z8j5FHdbaoRxQOml+aT8B7lfjtZDLDui
 A/AoLBLJRQq07raSX00sgQ2CsnEcSVC84nB88L8RHknLhGnBmoSHcYDjTY3WRgStgsgG
 7J3Q5gETTjx0A6/QY1WSynU7lnhuDecPZcXuP5MXNu0h847ctq1I0oqN1+tua6wWIw71
 0trbdunuN57IRr4bDy7d6h5MqwDacimQr8DiODsFuAN1AtPJet0vWJbzHqCb7k7SdcmJ
 DvUvwp03o2m/oD1pGx+YU65rt+A7TpHp0yiKvac1jsO9r9b9mb5Xf1tf4VZFMfVlrDd6
 df2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JWAxhkpD2i8UZ8j248lkUJk4oN/7cNs/WUDnK2ILLuA=;
 b=bRntW7ypKbms6w3xArH24ukBCQSBNKYeQeRBY/PfgA//h7+3EBzxyA2aC6ADO9VsWR
 w/nPb+Gl61pJq8nYgEVLNthtaejDi1Lmi/RgoqsXoJnP3rOPN4Fe5WCFfRe1glqZVehl
 HNw2qtT7ADLd55cc9VcNq7ikNJrfa7sN4cbFs/amvvP0fdz7cYzubii6cpUtitoGg5yp
 /8DTdby3krESFkYcN5iBck37VuN8H2ZQ0yxRVL8jg2fb1A0T28MVLtMYv7oWXBptB0MN
 IAMo9P4uBrUNmWq2uIQBrUWEvQ3DuMuUbtdiHauSqutJntlIm61PADm5Uqv90QtKJIBT
 FzAA==
X-Gm-Message-State: AOAM531zFVEAEn1l1gie1atF0M+XrqDVKrUyfwtpCRwK//Hp8VH4IrfG
 YD9wuU0K1fwU9hllic+FdmFJXQ==
X-Google-Smtp-Source: ABdhPJxkcUlDSsFDn76pfiNwEFTu8HNkSQvKzGIgeEr33H8pn3eGua5djb1jxK+d7MFlXjOAHbcZlw==
X-Received: by 2002:a05:6000:508:b0:1e4:a027:d147 with SMTP id
 a8-20020a056000050800b001e4a027d147mr30848053wrf.315.1648556962971; 
 Tue, 29 Mar 2022 05:29:22 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:a663:978b:3ffb:7dc3?
 ([2001:861:44c0:66c0:a663:978b:3ffb:7dc3])
 by smtp.gmail.com with ESMTPSA id
 k40-20020a05600c1ca800b0038c6c8b7fa8sm2195017wms.25.2022.03.29.05.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 05:29:22 -0700 (PDT)
Message-ID: <3697fe0f-7b6b-764f-8cdb-d925c0944fb0@baylibre.com>
Date: Tue, 29 Mar 2022 14:29:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 4/5] pinctrl: meson: Replace custom code by
 gpiochip_count() call
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
 <20220325200338.54270-4-andriy.shevchenko@linux.intel.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220325200338.54270-4-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_052925_538178_EA54E8E9 
X-CRM114-Status: GOOD (  17.35  )
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

On 25/03/2022 21:03, Andy Shevchenko wrote:
> Since we have generic function to count GPIO controller nodes
> under given device, there is no need to open code it. Replace
> custom code by gpiochip_count() call.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/pinctrl/meson/pinctrl-meson.c | 28 ++++++++++++---------------
>   1 file changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 49851444a6e3..7db70d4e214a 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -49,6 +49,7 @@
>   #include <linux/pinctrl/pinctrl.h>
>   #include <linux/pinctrl/pinmux.h>
>   #include <linux/platform_device.h>
> +#include <linux/property.h>
>   #include <linux/regmap.h>
>   #include <linux/seq_file.h>
>   
> @@ -662,27 +663,22 @@ static struct regmap *meson_map_resource(struct meson_pinctrl *pc,
>   	return devm_regmap_init_mmio(pc->dev, base, &meson_regmap_config);
>   }
>   
> -static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
> -				  struct device_node *node)
> +static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc)
>   {
> -	struct device_node *np, *gpio_np = NULL;
> +	struct device_node *gpio_np;
> +	unsigned int chips;
>   
> -	for_each_child_of_node(node, np) {
> -		if (!of_find_property(np, "gpio-controller", NULL))
> -			continue;
> -		if (gpio_np) {
> -			dev_err(pc->dev, "multiple gpio nodes\n");
> -			of_node_put(np);
> -			return -EINVAL;
> -		}
> -		gpio_np = np;
> -	}
> -
> -	if (!gpio_np) {
> +	chips = gpiochip_count(pc->dev);
> +	if (!chips) {
>   		dev_err(pc->dev, "no gpio node found\n");
>   		return -EINVAL;
>   	}
> +	if (chips > 1) {
> +		dev_err(pc->dev, "multiple gpio nodes\n");
> +		return -EINVAL;
> +	}
>   
> +	gpio_np = to_of_node(device_get_named_child_node(pc->dev, "gpio-controller"));
>   	pc->of_node = gpio_np;
>   
>   	pc->reg_mux = meson_map_resource(pc, gpio_np, "mux");
> @@ -751,7 +747,7 @@ int meson_pinctrl_probe(struct platform_device *pdev)
>   	pc->dev = dev;
>   	pc->data = (struct meson_pinctrl_data *) of_device_get_match_data(dev);
>   
> -	ret = meson_pinctrl_parse_dt(pc, dev->of_node);
> +	ret = meson_pinctrl_parse_dt(pc);
>   	if (ret)
>   		return ret;
>   

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
