Return-Path: <SRS0=lQ9R=V7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6666C31E40
	for <linux-amlogic@archiver.kernel.org>; Sat,  3 Aug 2019 18:25:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAEC0206A2
	for <linux-amlogic@archiver.kernel.org>; Sat,  3 Aug 2019 18:25:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UvHROhWz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Us8rileH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAEC0206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2aO9xJTMLYXAEVGR/rfAncoVuNciu/vuLL8JBP3l0g8=; b=UvHROhWzaQIKAu
	3iCIysOZSAAFHARrcmtcQRYy3qn2XcDI1K5LUAVYeKvhDd1oJzZlTdIosnTkRcztj/63HATOzPFe4
	ifASvHBL2Du//3Di2BXwYDaAJqhs8aM8jNH/QaDQyRLjRfdpCzBGcgdnfIHmyPq2wgdWk4JMb8zT1
	Pnmtv7x5gpYP6XbGKFHUaDMR2O1pGkRt2m165y+CwShQON66y60ObTlDz8Msecn/7RnOcetkBKzoK
	v+Yr6J94XetrDgGiura5PSRbD/WuHmLFJNiSkCUKM9VCexnf9qinMntxFuj2om5umybQjbsRGmwys
	VS2y+kwCZgCxXlCDtsOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htyiO-0003tK-5g; Sat, 03 Aug 2019 18:25:12 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htyiK-0003f3-Dc; Sat, 03 Aug 2019 18:25:10 +0000
Received: by mail-ot1-x341.google.com with SMTP id o101so81440426ota.8;
 Sat, 03 Aug 2019 11:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0k/3wM0F9hkcUv0u81phO5YELB+EYkQGAmqQnT3ZS1k=;
 b=Us8rileHENKvobs3syDjHKWM5OF1Aa2j4WI5uHrhNeVEIKpIwlqcGoP8twTdGWWHwM
 QK97jEf4N2q2Of/FGYubC8EQk7OrF8QvyGLFk2racGYjrhDzWFO/dXOm5jGbIqWmOB19
 akTa01WYT0afd/NZNvn8RJtdfHHARVOjN6LfQXueYutAg8QJJ7SiYWYoeiQ1Nd+qWYAJ
 hpXytOcwgErCj0AkPPclEiO7AqUkZT3ewRBMN7wcnbstjk78dPXnUvkJtLyriL7KXPw5
 UucpQ4ob29f02VE0v2p/9hRmM7jsGykPm23zDZEFfKaWHpJ0i0OMTnf3aLJim7z3PS5C
 c8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0k/3wM0F9hkcUv0u81phO5YELB+EYkQGAmqQnT3ZS1k=;
 b=Q2cVzUln/Lb+QxjAnDBLMgbq4YNg+eW34yXDVB/50qDEAzwKXfqbCxQ+sYtjnDKE0H
 sxFQM4eW1pQWNGBTtJ4YDtbk1LUnRoTohVxEmQEuV9/drDhQ/cyDoFIibULoIKBVSL7t
 SmsBkq7qriXTNrHUxZ/bXGks/nZ+IW8AcJ9JrO11VIC++mD1UkIbNzP0zfaEjuyLB6k1
 Lgl+QH1PAeODslhTIsUUQmF1pWG+W709QiNFUnGJsy0o/3AWStVfIKsMqUvt/pd7xR4s
 RoK4XPy7iLPBxR376jDi3RzRaNUXSgbqGR3+pjKLHXi01fs3/kAf65PaN8tLw9QXZGmM
 3bIQ==
X-Gm-Message-State: APjAAAXJmwxu2/YIPF/0pcRBXqBVG4Ojeg/wE9afYOdQCAnsKxfkXL1Y
 fwaCO9iMbSekyFFUHezQ7gyiKwHHtsn2XfRqlh4=
X-Google-Smtp-Source: APXvYqxNo1Y+A6MJXdJl28CDf2nMoUwhIsGw4mZMR5DIF5eM9XrgOQQG12ZuWebxmTC0QKW3HNs4qMLC6KmZ58QzaZo=
X-Received: by 2002:a9d:226c:: with SMTP id o99mr24398880ota.42.1564856705915; 
 Sat, 03 Aug 2019 11:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190731153529.30159-1-glaroque@baylibre.com>
 <20190731153529.30159-3-glaroque@baylibre.com>
In-Reply-To: <20190731153529.30159-3-glaroque@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 3 Aug 2019 20:24:54 +0200
Message-ID: <CAFBinCDGSJABnS1L1ULueyeXZaV38qrxEA0a12gB-uyRC_TvPQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] thermal: amlogic: Add thermal driver to support
 G12 SoCs
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190803_112508_490173_CCE4A685 
X-CRM114-Status: GOOD (  24.18  )
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, khilman@baylibre.com,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Guillaume,

(I still don't have any experience with the thermal framework, so
below are some general comments)

On Wed, Jul 31, 2019 at 5:36 PM Guillaume La Roque
<glaroque@baylibre.com> wrote:
I would add a patch description here:
"
Amlogic G12A and G12B SoCs integrate two thermal sensors with the same design.
One is located close to the DDR (controller?) and the other one is
located close to the PLLs (between the CPU and GPU).

The calibration data for each of the thermal sensors instance is
stored in a different location within the AO region.

Implement reading the temperature from each thermal sensor.

The IP block has more functionality, which may be added to this driver
in the future:
- reading up to 16 stored temperature samples
- chip reset when the temperature exceeds a configurable threshold
- up to four interrupts when the temperature has risen above a
configurable threshold
- up to four interrupts when the temperature has fallen below a
configurable threshold
"

> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  drivers/thermal/Kconfig           |  11 +
>  drivers/thermal/Makefile          |   1 +
>  drivers/thermal/amlogic_thermal.c | 332 ++++++++++++++++++++++++++++++
>  3 files changed, 344 insertions(+)
>  create mode 100644 drivers/thermal/amlogic_thermal.c
>
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index 9966364a6deb..0f31bb4bc372 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -348,6 +348,17 @@ config MTK_THERMAL
>           Enable this option if you want to have support for thermal management
>           controller present in Mediatek SoCs
>
> +config AMLOGIC_THERMAL
we typically use "MESON" in the Kconfig symbols:
$ grep -c AMLOGIC .config
1
$ grep -c MESON .config
33

I also wonder if we should add G12 or G12A so we don't conflict with
upcoming thermal sensors with a different design (assuming that this
will be a thing).
for example we already have three different USB2 PHY drivers

[...]
> +/*
> + * Calculate a temperature value from a temperature code.
> + * The unit of the temperature is degree Celsius.
is it really degree Celsius or millicelsius?

> + */
> +static int code_to_temp(struct amlogic_thermal *pdata, int temp_code)
PREFIX_thermal_code_to_millicelsius?

[...]
> +static int amlogic_thermal_enable(struct amlogic_thermal *data)
> +{
> +       clk_prepare_enable(data->clk);
no clock error handling?

> +       regmap_update_bits(data->regmap, TSENSOR_CFG_REG1,
> +                          TSENSOR_CFG_REG1_ENABLE, TSENSOR_CFG_REG1_ENABLE);
> +
> +       return 0;
> +}
> +
> +static int amlogic_thermal_disable(struct amlogic_thermal *data)
> +{
> +       regmap_update_bits(data->regmap, TSENSOR_CFG_REG1,
> +                          TSENSOR_CFG_REG1_ENABLE, 0);
> +       clk_disable(data->clk);
either clk_disable_unprepare here or use only clk_enable in
amlogic_thermal_enable and move prepare/unprepare somewhere else

> +
> +       return 0;
> +}
> +
> +static int amlogic_thermal_get_temp(void *data, int *temp)
> +{
> +       unsigned int tvalue;
> +       struct amlogic_thermal *pdata = data;
> +
> +       if (!data)
> +               return -EINVAL;
> +
> +       regmap_read(pdata->regmap, TSENSOR_STAT0, &tvalue);
> +       *temp = code_to_temp(pdata,
> +                            tvalue & TSENSOR_READ_TEMP_MASK);
maybe simply move the implementation from code_to_temp here?

[...]
> +static const struct amlogic_thermal_data amlogic_thermal_g12_cpu_param = {
> +       .u_efuse_off = 0x128,
> +       .soc = &amlogic_thermal_g12,
based on the variable name I expected this to be an enum of some sort.
I would have expected it to be called calibration_parameters or
similar to match the explanation in the driver description
(no need to change it if you prefer it like this, I just want to make
you aware of this)

> +       .regmap_config = &amlogic_thermal_regmap_config_g12,
if regmap_config is always the same you may also pass it directly to
devm_regmap_init_mmio

> +};
> +
> +static const struct amlogic_thermal_data amlogic_thermal_g12_ddr_param = {
> +       .u_efuse_off = 0xF0,
I believe we use lower-case hex everywhere else

[...]
> +static const struct of_device_id of_amlogic_thermal_match[] = {
> +       {
> +               .compatible = "amlogic,g12-ddr-thermal",
> +               .data = &amlogic_thermal_g12_ddr_param,
> +       },
> +       {
> +               .compatible = "amlogic,g12-cpu-thermal",
> +               .data = &amlogic_thermal_g12_cpu_param,
> +       },
> +       { /* end */ }
other drivers use "sentinel", but personally I have no preference here

[...]
> +       pdata->tzd = devm_thermal_zone_of_sensor_register
> +                               (&pdev->dev,
> +                                0,
> +                                pdata,
> +                                &amlogic_thermal_ops);
I believe the opening brace has to go onto the same line as the function name

[...]
> +       ret = amlogic_thermal_enable(pdata);
> +       if (ret)
> +               clk_unprepare(pdata->clk);
clk_disable_unprepare, else you'll leave the clock prepared

> +#ifdef CONFIG_PM_SLEEP
> +static int amlogic_thermal_suspend(struct device *dev)
> +{
> +       struct amlogic_thermal *data = dev_get_drvdata(dev);
> +
> +       return amlogic_thermal_disable(data);
> +}
> +
> +static int amlogic_thermal_resume(struct device *dev)
> +{
> +       struct amlogic_thermal *data = dev_get_drvdata(dev);
> +
> +       return amlogic_thermal_enable(data);
> +}
> +#endif
instead of using an #ifdef here annotate the suspend/resume functions
with __maybe_unused, see [0]


Martin


[0] https://lore.kernel.org/patchwork/patch/732981/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
