Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCAFECAAA1
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Sep 2022 09:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Khd9AiDZwbJ8LosTXdMslbY79av6zPLX7/PqceJfleY=; b=CJslwoiC83GvUM
	+1oiHyXrBrexkCHCE8EhCWRAyYDJkyh2xUALRn47iDSrNclz5S3vJHbvMHv/N6tKDNWHov14JjWIy
	/wfgIF65pf1iNfntjc2kjQIpBjhFUaHyxa2E3CbJJgSeSggPqIv0hIgXvyxPq2w0VtB6hls1XtZxH
	v4+qqOoFDtt/02jK/vvRX31Q7tNhZfaNXSvTF9y4o99M/BlBYFi1JSCiu0BvC52xIGO6fPq9p2Xoy
	x9DG3hNlyVBz/xDV6URG33DOhG1dhAPzlS2oAtqdpJ0U6/5+OLwHxFcq1oslVd016nqGthybTcleG
	H5P1ySxG+qlqRa3zNDyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUYX-00BdnJ-DU; Tue, 06 Sep 2022 09:07:41 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUY8-00BdQt-FW
	for linux-amlogic@lists.infradead.org; Tue, 06 Sep 2022 09:07:21 +0000
Received: by mail-wr1-x432.google.com with SMTP id az27so14417422wrb.6
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Sep 2022 02:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=mPKulpM1VmePhCn9NGeORJeSVx0ds/dPcNDxI2woRLQ=;
        b=OnHReX1D+oWmtqnZ/eFIfyCAVGEYKicV1nUmVMnE1mq0ZW5TQo+VrwL3LMDXAnzThh
         PgsTdHm9zm/bb7llMOIcm0mtien4mSyFLB5tYIzK6YkwWNWKz7yEGvSfRHugyPOMfBXV
         Rwt8GR7JXHfGD3sqSn1ZU/Jn8vmyWiZEuJdxBodcD2mq1gkeGnw3bq7R90r7KJvGbj08
         G2frli139Xk75iDvNHb6a6pm+sC6JCwwFXCyWKaVwkIgtHVobIBV3C/z6b2TQNWvyEtm
         8KxxsliBUqVXyyuGmSxUjgtz7uKO2Uhgy3fQKEvUPxq8Gi00lSsB9rwqR4TvDGO3caCt
         8/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=mPKulpM1VmePhCn9NGeORJeSVx0ds/dPcNDxI2woRLQ=;
        b=qNfX4phUbog0ozU3qrAKw8QThQJ9oZZHAMSLNjnUFw6Q9vYk+9VDqGcNk4B89NiJfd
         HbZYgOHPPivxYAU57Vp8nUD5LMULSdjRZSJ0x41v2BMBol5n513izTJm9n0yz/cY88XE
         dXP02KMc5Z926bQskzVDQwXvvWB/bz3f83wRRAoz9VBijY8Q2fUpJiy8EuxC4Pv2pvYq
         zGTg5pd9v00TKafsN21h6OxxAp3KsyYPfsVF1yO6Se4oxwzILd875NU2qKv7aYsvIW11
         1h8u7rS32eYdbPrSQYKv8QxNVBC/PlAiZ6GWmoPfUK0QFXsikdzp4PBnMgqh8bZNFuBy
         5RZg==
X-Gm-Message-State: ACgBeo33f2v+MeZJE1nDdqCso2pXFN0g5wYi/a9HKIi3JEE38QE7DkCE
	sMDAZE+hPERJSL3o7MSQo+pTTw==
X-Google-Smtp-Source: AA6agR5YFhKwTFveLQ1zRnD0V87OI95Pez8WScCVXHUXaL7rQSxXDThAljQ2vlZ/LsGOpe9j9yPxfA==
X-Received: by 2002:a05:6000:1f83:b0:228:6278:796b with SMTP id bw3-20020a0560001f8300b002286278796bmr7167060wrb.520.1662455228586;
        Tue, 06 Sep 2022 02:07:08 -0700 (PDT)
Received: from [10.1.3.188] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id k27-20020a05600c1c9b00b003a845fa1edfsm33016456wms.3.2022.09.06.02.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 02:07:08 -0700 (PDT)
Message-ID: <b0d45e18-c92d-d187-2eac-851d975fbb7e@baylibre.com>
Date: Tue, 6 Sep 2022 11:07:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 1/1] pinctrl: meson: Switch to use fwnode instead of
 of_node
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220905180034.73132-1-andriy.shevchenko@linux.intel.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220905180034.73132-1-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_020716_549962_CF71A515 
X-CRM114-Status: GOOD (  17.21  )
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

On 05/09/2022 20:00, Andy Shevchenko wrote:
> GPIO library now accepts fwnode as a firmware node, so
> switch the driver to use it.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/pinctrl/meson/pinctrl-meson.c | 7 +++----
>   drivers/pinctrl/meson/pinctrl-meson.h | 4 +++-
>   2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index cc2cd73ff8f9..530f3f934e19 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -608,6 +608,7 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
>   
>   	pc->chip.label = pc->data->name;
>   	pc->chip.parent = pc->dev;
> +	pc->chip.fwnode = pc->fwnode;
>   	pc->chip.request = gpiochip_generic_request;
>   	pc->chip.free = gpiochip_generic_free;
>   	pc->chip.set_config = gpiochip_generic_config;
> @@ -619,8 +620,6 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
>   	pc->chip.base = -1;
>   	pc->chip.ngpio = pc->data->num_pins;
>   	pc->chip.can_sleep = false;
> -	pc->chip.of_node = pc->of_node;
> -	pc->chip.of_gpio_n_cells = 2;
>   
>   	ret = gpiochip_add_data(&pc->chip, pc);
>   	if (ret) {
> @@ -678,8 +677,8 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc)
>   		return -EINVAL;
>   	}
>   
> -	gpio_np = to_of_node(gpiochip_node_get_first(pc->dev));
> -	pc->of_node = gpio_np;
> +	pc->fwnode = gpiochip_node_get_first(pc->dev);
> +	gpio_np = to_of_node(pc->fwnode);
>   
>   	pc->reg_mux = meson_map_resource(pc, gpio_np, "mux");
>   	if (IS_ERR_OR_NULL(pc->reg_mux)) {
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
> index b197827027bd..34fc4e8612e4 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.h
> +++ b/drivers/pinctrl/meson/pinctrl-meson.h
> @@ -12,6 +12,8 @@
>   #include <linux/types.h>
>   #include <linux/module.h>
>   
> +struct fwnode_handle;
> +
>   struct meson_pinctrl;
>   
>   /**
> @@ -131,7 +133,7 @@ struct meson_pinctrl {
>   	struct regmap *reg_gpio;
>   	struct regmap *reg_ds;
>   	struct gpio_chip chip;
> -	struct device_node *of_node;
> +	struct fwnode_handle *fwnode;
>   };
>   
>   #define FUNCTION(fn)							\

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
