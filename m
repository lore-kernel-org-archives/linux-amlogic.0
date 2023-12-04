Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EA2C46CA0
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Dec 2023 10:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b9Hbxb4e/SVcxaH6bf6SlbbqK14/wbNbyS0iIUETMkY=; b=eBXbIapoA+u7t8
	Ilg1KbvT0Tp1KDlcQM+MVJKmH0oa6ZLhSQwXNKVBJjOqjc/vKgbFtEH51kIADShJxMLvj9v100XCM
	X24l4uyzoeRjt/vK0sLD/Ai2Ebu4fdme/f/Djn8+ufr+2HmnT/42QDigNg7QyiAmVt+bSwrSkocFg
	cC3bVyigOlujKhVLs6mYnI2BGK+dVb3qvXhru+GqJm33zmejL8x2fb5GsdACOSYddbyQipOQ4LQOZ
	izYuq8DpmOAnB7JhVJ0AiZtb55dImjZB++gfqAeRZjtcy0K86pOssoK0z0z+jt/zTFPv5vqnagnHh
	3BDIgj+moyKhjBkNVRgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA6e6-003boM-16;
	Mon, 04 Dec 2023 10:57:50 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA6e1-003bmz-10;
	Mon, 04 Dec 2023 10:57:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8289CB80D9F;
	Mon,  4 Dec 2023 10:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F22C433C8;
	Mon,  4 Dec 2023 10:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701687459;
	bh=I8qqFwU/CNFBFB1RbaJ0Hz5lP25JM/DystuP6KB/gqw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ESX7vJifVGf9HThVts8MfAnPbTBy7uX0FPUy4zk3R9O4JSLCtEhVnr77mwNbTaa90
	 B29/HPII4ljy0fbh9Tm/30J7v6lQBV9eZx2+5TNGZfRf+2kuC51tqxg471FFh7Rl1k
	 as2/BNdKxjtFtE5VWZvz/AxPlm/uZY+F4xMg0C8j6nS8USfZ+ZHLqnkR0g5zkXuJRy
	 MqOXTSKDjQBQ8E294Dmfd/R1Nr/etEKVcx/2t6mqYD7Jfc/YSi0xxre3ggKCBsvEmc
	 EpGBGG9LkoH8RfrsRWWQlVls4Kr2IlAJAFQ3YOVtFzU5FWPxuw/kH+cXsTQ+700YZk
	 IbirFw/vFBO7g==
Date: Mon, 4 Dec 2023 10:57:30 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: George Stark <gnstark@salutedevices.com>
Cc: <lars@metafoo.de>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
 <jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
 <andriy.shevchenko@linux.intel.com>, <nuno.sa@analog.com>,
 <u.kleine-koenig@pengutronix.de>, <linux-iio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-amlogic@lists.infradead.org>, <kernel@salutedevices.com>
Subject: Re: [PATCH v3 1/1] iio: adc: meson: add separate config for axg SoC
 family
Message-ID: <20231204105730.49623b12@jic23-huawei>
In-Reply-To: <20231127235558.71995-1-gnstark@salutedevices.com>
References: <20231127235558.71995-1-gnstark@salutedevices.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_025745_508472_E1DCCCDA 
X-CRM114-Status: GOOD (  15.85  )
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

On Tue, 28 Nov 2023 02:55:58 +0300
George Stark <gnstark@salutedevices.com> wrote:

> According to Amlogic custom kernels ADC of axg SoC family has
> vref_select and requires this setting to work nominally and thus
> needs a separate config.
> 
> Fixes: 90c6241860bf ("iio: adc: meson: init voltage control bits")
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Applied to the fixes-togreg branch of iio.git and marked for stable.

Thanks,

jonathan

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
