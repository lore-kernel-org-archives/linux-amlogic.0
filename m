Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09628EB64DC
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 12:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LxmxcgqhP8CDi3uZRA6VqApRD1WfjGokt42+J6hn1Pk=; b=K8zaDG47zrhJaX
	gQeeYfKCkfu/guNXdX/1cwdPVFuQjS6TxInHu5JgTGrehamyptRNPFlhegzDthNcliA+5OTS84sbZ
	I9dYfVyoUT75J9vcVc7NuWeumxa1bw3fubwbQpMwJhEx8dVboUrintKkT6AFZx0hhRwugm5QmTaF2
	JKFpu2/sSk4opwnnYFnA9I9Z5JUxoZCX5lkk4cAFRga1dIWG21gRIXO2NXvGddOjJErOFMaYaFCDW
	eiob76eiZPKHIussGxvD2CAjjmfsW6PLm5CVZrNUf+GbekqMpKgceyndI8jQNKGjU1RFHSDgnzoGh
	vIHtz5gYsSw//sI4B25g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHO7X-001caF-1f;
	Thu, 06 Jul 2023 12:30:03 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHO7U-001cYm-2N;
	Thu, 06 Jul 2023 12:30:01 +0000
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="353426707"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="353426707"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 05:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="669736063"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="669736063"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 06 Jul 2023 05:29:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1qHO7M-000WDf-2I;
	Thu, 06 Jul 2023 15:29:52 +0300
Date: Thu, 6 Jul 2023 15:29:52 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	brgl@bgdev.pl, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: Add driver support for Amlogic C3 SoCs
Message-ID: <ZKazwMpmsNzBuWA7@smile.fi.intel.com>
References: <20230706114522.2490655-1-huqiang.qin@amlogic.com>
 <20230706114522.2490655-3-huqiang.qin@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230706114522.2490655-3-huqiang.qin@amlogic.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_053000_808740_4108F130 
X-CRM114-Status: GOOD (  17.06  )
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

On Thu, Jul 06, 2023 at 07:45:22PM +0800, Huqiang Qin wrote:
> Add new pinctrl driver for Amlogic C3 SoCs which share the

a new

> same register layout as the previous Amloigc S4

Missing period at the end.

...

> +config PINCTRL_AMLOGIC_C3
> +	tristate "Amlogic C3 SoC pinctrl driver"
> +	depends on ARM64
> +	select PINCTRL_MESON_AXG_PMX
> +	default y

This default seems a bad cargo cult. Why ARM64 kernel should have all them be
opt-out, instead of opt-in? Shouldn't this be a distro problem?

...

> +	MESON_PIN(GPIO_TEST_N)

Is it real one?

> +};

...

> +	/* Bank A func6 */
> +	GROUP(spi_a_mosi_a,		6),
> +	GROUP(gen_clk_a4,		6),
> +	GROUP(clk12_24_a,		6)

Leave trailing comma here as it's not a terminator.

...

> +static const char * const i2c2_groups[] = {
> +	"i2c2_sda", "i2c2_scl"

Ditto.

> +};
> +
> +static const char * const i2c3_groups[] = {
> +	"i2c3_sda_c", "i2c3_scl_c",
> +	"i2c3_sda_x", "i2c3_scl_x",
> +	"i2c3_sda_d", "i2c3_scl_d"

Ditto.

> +};

...

> +#ifdef CONFIG_OF

Drop this ugly ifdeffery.

> +static const struct of_device_id c3_pinctrl_dt_match[] = {
> +	{
> +		.compatible = "amlogic,c3-periphs-pinctrl",
> +		.data = &c3_periphs_pinctrl_data,
> +	},
> +	{ },

No comma for the terminator.

> +};
> +MODULE_DEVICE_TABLE(of, c3_pinctrl_dt_match);
> +#endif /* CONFIG_OF */
> +
> +static struct platform_driver c3_pinctrl_driver = {
> +	.probe  = meson_pinctrl_probe,
> +	.driver = {
> +		.name = "amlogic-c3-pinctrl",

> +		.of_match_table = of_match_ptr(c3_pinctrl_dt_match),

Drop the rather problematic of_match_ptr().

> +	},
> +};

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
