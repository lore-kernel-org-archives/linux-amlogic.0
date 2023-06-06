Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB074C7EE2F
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jun 2023 22:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i17uktJF0bAbrJ0lWRLpJsXs7EJzvGodanf3CzRgjA0=; b=LZeDZ1g29QuqgM
	fdtWG4iT3tDuSYmwfk0EM9fY/mHD9hjLUocIPeULOmasA5tP6FyUHxOF5pGZbLKxolqwGnYeSbYPl
	6eGs8Wt+J+V8E8SPTpS7uPSUSAHKOsVDDlKYkhyoz/7Sgenm3ynPA1ml6XmF6Q6o8g0/CakXA+dBA
	3KlTNLJ5LRPfck1p78ShJvrfaNYyjtujdce9cNan+QBJZlskeH5wfpF8BDBkJFc8Z0QA/Ma5I7jD6
	EDPT3rHN0waSNJSjN4uOdIxxT9uBsT9rwAYk+SqLQaIkyphljLnjDhr5hrwr9JXwLZfqrZ8L52JJ5
	bEYlUJMl50YEo8KnMhqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6fXX-003Vw4-1Y;
	Tue, 06 Jun 2023 22:52:35 +0000
Received: from fgw20-7.mail.saunalahti.fi ([62.142.5.81])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6fXU-003VtS-0g
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Jun 2023 22:52:33 +0000
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id cebfce1e-04bc-11ee-b3cf-005056bd6ce9;
	Wed, 07 Jun 2023 01:52:27 +0300 (EEST)
From: andy.shevchenko@gmail.com
Date: Wed, 7 Jun 2023 01:52:26 +0300
To: George Stark <gnstark@sberdevices.ru>
Cc: jic23@kernel.org, lars@metafoo.de, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	andriy.shevchenko@linux.intel.com, nuno.sa@analog.com,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	kernel@sberdevices.ru
Subject: Re: [PATCH v3] meson saradc: fix clock divider mask length
Message-ID: <ZH-4qsNcLGiQFiSE@surfacebook>
References: <20230606165357.42417-1-gnstark@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606165357.42417-1-gnstark@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_155232_407270_DAA44A65 
X-CRM114-Status: GOOD (  13.93  )
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

Tue, Jun 06, 2023 at 07:53:57PM +0300, George Stark kirjoitti:
> According to datasheets of supported meson SOCs length of ADC_CLK_DIV

the datasheets

> field is 6 bits long. Although all supported SOCs have the register

6-bit

> with that field documented later SOCs use external clock rather than
> ADC internal clock so this patch affects only meson8 family (S8* SOCs)

s/SOC/SoC/g, and mind the grammar period at the end.

I believe Jonathan can fix when applying this, no need to resend unless
he asks for it.

FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Fixes: 3adbf3427330 ("iio: adc: add a driver for the SAR ADC found in Amlogic Meson SoCs")
> Signed-off-by: George Stark <GNStark@sberdevices.ru>
> ---
> Changelog:
> 
> v1 -> v2:
>     * Update commit message
> v2 -> v3:
>     * Update commit message
> ---
>  drivers/iio/adc/meson_saradc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index 85b6826cc10c..b93ff42b8c19 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -72,7 +72,7 @@
>  	#define MESON_SAR_ADC_REG3_PANEL_DETECT_COUNT_MASK	GENMASK(20, 18)
>  	#define MESON_SAR_ADC_REG3_PANEL_DETECT_FILTER_TB_MASK	GENMASK(17, 16)
>  	#define MESON_SAR_ADC_REG3_ADC_CLK_DIV_SHIFT		10
> -	#define MESON_SAR_ADC_REG3_ADC_CLK_DIV_WIDTH		5
> +	#define MESON_SAR_ADC_REG3_ADC_CLK_DIV_WIDTH		6
>  	#define MESON_SAR_ADC_REG3_BLOCK_DLY_SEL_MASK		GENMASK(9, 8)
>  	#define MESON_SAR_ADC_REG3_BLOCK_DLY_MASK		GENMASK(7, 0)
>  
> -- 
> 2.38.4
> 

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
