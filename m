Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63720C7619A
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 10:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8AVyMa/+3fq1rDTDfHc3ROeJDLsbVv257auZqRKbGM=; b=LBMFe0IgTnfFTQ
	dQ1u6SYPkt5OIRT8PiAJHd1X8apD4JWr5eJqI80BgUPv03QRcS9oymyJn+EqT1ZRR/aeTEtehpB46
	LKVb6HT2NClwxd5iEvzV9YntYEpZ86hji2WLG1gtvHqVynlKxPN0tN7Ygcwex5dJb3I/sBRvhIpU3
	Ykq0m+XvuPwixow+s2vKmZjO+TAxQXA5fcrraSV+ZCA1mbCNM7hzrWiqG4g/fBbmdvqq/RD6eVail
	MYCHVSE2LAtUMASXjsBZCNtqcTlR/SXNU/Cf3wMGSLj6hvfbiiHjkzmOgiX2fGTC/pktIJUB3sHIl
	KX91WE7dgyA97TxNopyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgjwn-00AcM8-0V;
	Mon, 27 Mar 2023 10:19:29 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgjwi-00AcKD-1v
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Mar 2023 10:19:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id n19so4741967wms.0
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Mar 2023 03:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679912361;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=Q193+qQbGmL9z6G4FxC+zWcxN9diay8DaaL43/+W/u8=;
        b=XcTpQMkfVUrA+Pi1esztDk96t1qs73ePIdcTmUSlkhjfToIrSRJNQYHHYGLWY0TqzM
         nVFuyk05pZlv5lPbwO9zK0WzgVFl7KjKn4DGov6+qMOoWvnmNGbbQsaObhU/FwaRm5pB
         JUQhAiGECwtW5fg6sswxeiXoanseG4chLs0e1pI6JdCNTTY0jeEeEWSFKg1SREcwH5JD
         22kxoYKdL91ApJtxNcGrw6yzZ2ZOLpbzr6tztM0RVaQhs62iApGGVTRJIusyoo+MDwo1
         gTKHmJye7be5sgiYM+zcPPM9QLdWeXHxJeVJmFMZqJlVRPHV9ENSiwraTZxfLrqsPAA8
         bx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679912361;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q193+qQbGmL9z6G4FxC+zWcxN9diay8DaaL43/+W/u8=;
        b=2U/e/+VJx3QcPzB6tPHFfSRFaJS73ESYLW3wh/q+pMeCJCcm4HHs9FXN4xRlYCeNNk
         RGMuTHhy+MgM4xH2kVe3w57GAPzOU18WlPzwf1XsvqUCwzjYngXCytcfvEVKtZP9CZrb
         78XElUNRsozYM+YAGE48Wz4LpVfumWdDubIPcimpqYHZ6pDWD/3I0JqX45nPAgcW797M
         pjWvjjpaZrmY1/AQgQHuviwkPcSrBxXFMKpyjyfjX/qC+vLPQQ3S5JnWHlmD6RetRJ0p
         G7/SLnJTP/RX/kwDUa7EwRj48C05W0mRSQjddThTimrPaLJ0YZq5V1prmTi5xtaWx1qI
         0W0A==
X-Gm-Message-State: AO0yUKVzoJpBTuPueuGLN4MozcBwUW2D1u7pX+qLSuG2BeYg3jK1KBgt
	w++UJiXauaxZF4zTbEOh4hIeFA==
X-Google-Smtp-Source: AK7set8FsG4tKWlAe1g+Z9lv7YuWI5lmdwWsaz4HZxhpVMHIcDwHlEbjUtUIaWotZWfhaYxhl3r5eQ==
X-Received: by 2002:a1c:4b02:0:b0:3ee:4481:5415 with SMTP id y2-20020a1c4b02000000b003ee44815415mr9184360wma.26.1679912361658;
        Mon, 27 Mar 2023 03:19:21 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id p5-20020a5d4e05000000b002d75909c76esm17848785wrt.73.2023.03.27.03.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 03:19:21 -0700 (PDT)
References: <20230321193014.26349-1-ddrokosov@sberdevices.ru>
 <20230321193014.26349-6-ddrokosov@sberdevices.ru>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, neil.armstrong@linaro.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v11 5/5] clk: meson: a1: add Amlogic A1 Peripherals
 clock controller driver
Date: Mon, 27 Mar 2023 11:58:30 +0200
In-reply-to: <20230321193014.26349-6-ddrokosov@sberdevices.ru>
Message-ID: <1jtty6o5so.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_031924_636326_4AE80E05 
X-CRM114-Status: GOOD (  23.34  )
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


On Tue 21 Mar 2023 at 22:30, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:

> Introduce Peripherals clock controller for Amlogic A1 SoC family.
>
> A1 SoC has four clock controllers on the board: PLL, Peripherals, CPU,
> and Audio.
> This patchset adds support for Amlogic A1 Peripherals clock driver and
> allows to generate clocks for all A1 SoC peripheral IPs.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  drivers/clk/meson/Kconfig  |   10 +
>  drivers/clk/meson/Makefile |    1 +
>  drivers/clk/meson/a1.c     | 2344 ++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/a1.h     |   49 +
>  4 files changed, 2404 insertions(+)
>  create mode 100644 drivers/clk/meson/a1.c
>  create mode 100644 drivers/clk/meson/a1.h
>

[...]

> +static struct clk_regmap dspa_b_sel = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = DSPA_CLK_CTRL0,
> +		.mask = 0x7,
> +		.shift = 26,
> +		.table = mux_table_dsp_ab,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "dspa_b_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_data = dsp_ab_parent_data,
> +		.num_parents = ARRAY_SIZE(dsp_ab_parent_data),
> +		/*
> +		 * DSPA_B clk can be inherited from more accurate RTC clock,
> +		 * so in some situations we may want to freeze its parent.
> +		 * Therefore force dsp parent setup on device tree side
> +		 */

This gets copy-pasted A LOT.
Please comment this once and for all ... then reference the comment if
you need to.

> +		.flags = CLK_SET_RATE_NO_REPARENT,
> +	},
> +};

[...]

> +static struct clk_regmap cecb_32k_sel = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = CECB_CLK_CTRL1,
> +		.mask = 0x1,
> +		.shift = 31,
> +		.flags = CLK_MUX_ROUND_CLOSEST,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "cecb_32k_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&cecb_32k_sel_pre.hw,
> +			&rtc.hw,
> +		},
> +		.num_parents = 2,
> +		/*
> +		 * CECB_32K clk can be inherited from more accurate RTC clock,
> +		 * so in some situations we may want to freeze its parent.
> +		 * Therefore force cecb_32k parent setup on device tree side
> +		 */

How do you plan on doing that ?

You've made the parent "private" and it is not even available to be
referenced in DT.

This whole concept of public and private to seems broken to me.
I would much prefer you keep the existing model, with one big table and
possibly some IDs not exposed in the bindings.

This gives an hint about the clocks we think consummers should use while
allowing us to change things if we got it wrong, and keep the IDs stable
for DT. This has been working so far. I don't see the benefit of
changing that right now.

> +		.flags = CLK_SET_RATE_NO_REPARENT,
> +	},
> +};
> +

[...]

> +
> +static int meson_a1_periphs_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	void __iomem *base;
> +	struct regmap *map;
> +	int i, err;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return dev_err_probe(dev, PTR_ERR(base),
> +				     "can't ioremap resource\n");
> +
> +	map = devm_regmap_init_mmio(dev, base, &a1_periphs_regmap_cfg);
> +	if (IS_ERR(map))
> +		return dev_err_probe(dev, PTR_ERR(map),
> +				     "can't init regmap mmio region\n");
> +
> +	/* Populate regmap for the regmap backed clocks */
> +	for (i = 0; i < ARRAY_SIZE(a1_periphs_regmaps); i++)
> +		a1_periphs_regmaps[i]->map = map;
> +
> +	/* DT clocks registration */
> +	err = meson_a1_periphs_clks_register(dev, &a1_periphs_public_clks);
> +	if (err)
> +		return dev_err_probe(dev, err,
> +				     "public clks registration failed\n");
> +
> +	/* Internal clocks registration */
> +	err = meson_a1_periphs_clks_register(dev, &a1_periphs_private_clks);
> +	if (err)
> +		return dev_err_probe(dev, err,
> +				     "private clks registration failed\n");

I defenitely don't like this public/private concept.
Please remove it

> +
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +					   &a1_periphs_public_clks);
> +}
> +

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
