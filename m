Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270CDC4167B
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Nov 2023 17:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sp5yZWMcC4lP5hrDOfcBmzTH9QH9A6fHectALjH/Xt4=; b=h/H7Ja43fxZUvQ
	bU8gYjSGdED1H3IMffiliYJZlWCtPvXlC1Hh28vhY2M5zI//M5Cd/B87S28DLBmIkN7jqrgklZTkU
	pVXpJKgEYbZt/jewD0SFaFRnuiWrX7DTvfo5bqqkoQar6Kehc54+ynV4TYlCWb5vm/oL0hu6QESqN
	eR2x9feOvJUr++TR4Rik/gHK2dtnT+xJmXtRssFe3bpiVYBClIl7ZF1lfHnzH6eoverDEI6wXp6kz
	qFK0UMhzVNvulaVFuXCyprHAtW9e0TuO8wDTDRVmjlyqePBgfuVyztJ/BxbgmAWuYZaDCDyXW2sIz
	Cirboom6SuNjhRz+oIEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6wPC-009Y0d-1n;
	Sat, 25 Nov 2023 17:25:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6wPA-009Xzr-0b;
	Sat, 25 Nov 2023 17:25:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A7D22B83409;
	Sat, 25 Nov 2023 17:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45585C433C7;
	Sat, 25 Nov 2023 17:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700933118;
	bh=htnaOPBl/Kab+ZpjJXrbvc1PC3mpuEB/13T1KfZ4C9w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mAvZNSld3bzLwX67volEbq3Gr9Ucpnw8Hqw7WKvu2R5Iv10FyWlo9EMF6LdlLHNis
	 rYQ3JzskqJlvUybUSiaXjbhMj1YjnHtgOj+f+SF6II3oj21wHzF0PvlOxgdn13wViV
	 4B6RBmv1B3WwA8DV3IVHloyRNw7H+vVnzxc+Sb9VWvFF3sCEyR4xvjkLzCfjPATdPT
	 GdfydhRR7RxCBYlG+A+v7Qok4QwF1BKCvSk8oaSNgiez/pVj6fz1DIsTJBH5zMYfi7
	 CkCCbxOyyCxxseJGe6q6n1h+cnA8JO+T+WfhvP+I4RZRBLoWTU0xar62ULpMd7Ou19
	 CPYdHUKxs+sZg==
Date: Sat, 25 Nov 2023 17:25:08 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: George Stark <gnstark@salutedevices.com>
Cc: <lars@metafoo.de>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
 <jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
 <andriy.shevchenko@linux.intel.com>, <nuno.sa@analog.com>,
 <u.kleine-koenig@pengutronix.de>, <linux-iio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-amlogic@lists.infradead.org>, <kernel@salutedevices.com>
Subject: Re: [PATCH v2 1/1] iio: adc: meson: add separate config for axg SoC
 family
Message-ID: <20231125172508.2a2242bf@jic23-huawei>
In-Reply-To: <20231122074741.154228-1-gnstark@salutedevices.com>
References: <20231122074741.154228-1-gnstark@salutedevices.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_092520_363097_FFCD257E 
X-CRM114-Status: GOOD (  16.59  )
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

On Wed, 22 Nov 2023 10:47:41 +0300
George Stark <gnstark@salutedevices.com> wrote:

> According to Amlogic custom kernels ADC of axg SoC family has
> vref_select and requires this setting to work nominally and thus
> needs a separate config.
> 
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Is this a fix?  If so, please provide a fixes tag.
Or is it aligning with the vendor kernels and we don't know if
it's strictly necessary or not?

> ---
>  drivers/iio/adc/meson_saradc.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index db280da9edbf..34555a85f131 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -1242,6 +1242,20 @@ static const struct meson_sar_adc_param meson_sar_adc_gxl_param = {
>  	.cmv_select = 1,
>  };
>  
> +static const struct meson_sar_adc_param meson_sar_adc_axg_param = {
> +	.has_bl30_integration = true,
> +	.clock_rate = 1200000,
> +	.bandgap_reg = MESON_SAR_ADC_REG11,
> +	.regmap_config = &meson_sar_adc_regmap_config_gxbb,
> +	.resolution = 12,
> +	.disable_ring_counter = 1,
> +	.has_reg11 = true,
> +	.vref_volatge = 1,
> +	.has_vref_select = true,
> +	.vref_select = VREF_VDDA,
> +	.cmv_select = 1,
> +};
> +
>  static const struct meson_sar_adc_param meson_sar_adc_g12a_param = {
>  	.has_bl30_integration = false,
>  	.clock_rate = 1200000,
> @@ -1286,7 +1300,7 @@ static const struct meson_sar_adc_data meson_sar_adc_gxm_data = {
>  };
>  
>  static const struct meson_sar_adc_data meson_sar_adc_axg_data = {
> -	.param = &meson_sar_adc_gxl_param,
> +	.param = &meson_sar_adc_axg_param,
>  	.name = "meson-axg-saradc",
>  };
>  


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
