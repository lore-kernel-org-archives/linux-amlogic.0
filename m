Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E860C88E40
	for <linux-amlogic@archiver.kernel.org>; Sun, 13 Sep 2026 09:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m1hzNzFAkFMt05/kdgEiGgEJ7VskTGGUYlbromiLUds=; b=gzNcZXto6rHmj/
	r4DM+8vQNG12S3eddnBn2bqFovklSycaKQKiw5PvmLnfzooJIowNAxQHtNQCWzFHtTxBlFjkIUb6g
	fQbTHXGBkezdWABLxeMvYlbPzZsK30jQmaInTXYPEmUY91Vo+BkZ4Q29JTmERMAsJC5yCDLARVpCg
	gsC9amM8Rq2B9cagNZOPP+p++3IMHBSHb+XUN/JDPgWvLr+NRpxdIshinGwKwi4GL94ZhyVstPlzy
	7OHLe18NnLjWoDuhdblKn6CnwM2Z6ZMvetekpp+ltkU6+tCPUhEacmAnxxHBCce0N/wBn09ZkGeLT
	YbE0uAG9OixaNsNKb9Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5gi4-00000001Yhc-34qQ;
	Sun, 13 Sep 2026 09:41:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5gi2-00000001YhM-2WvP;
	Sun, 13 Sep 2026 09:41:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ED64060AAB;
	Sun, 13 Sep 2026 09:41:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFBCB1F000FF;
	Sun, 13 Sep 2026 09:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789292473;
	bh=E/4ulU+au5vGq8JBMRy5RWGBS77P7SyvqTxZG8EhgOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kWu4++GLH3bLacfFgfps6MFpI2hTQmZT2OsEttxbo75PxOk7WIDnNI3X3Wh5VUhvl
	 fjJpr87FDrdu1xiBH6y9FLyvdA3REXvY17Wcz+W/gWCCDKMtMUCJT3PtVtkLAMBVeR
	 q/8DcD7ot08oU8CsATr7oxGwS2YLEoAppTB7dIaLFKtJxq5z++3wv7rRENsMuXKJg8
	 tO5imeqVc8vJFmdVfGdQzf37Up0/dKhX7gZmWrM72Nt+0SK+U2n+UC/TcyZoNirz0U
	 H7SN1t6pBBbXuSuxM2ntLciztGJG5DECMxWsa3K+Bz5hRY88fUF8SzGH/ci+O9qlsj
	 EA4pKjjOfWuRg==
Date: Sun, 13 Sep 2026 11:41:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] ASoC: meson: add audin main module and I2S formatter
Message-ID: <20260913-inventive-millipede-of-certainty-dd58ce@quoll>
References: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
 <20260912-audin-v1-2-7fbefe928711@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260912-audin-v1-2-7fbefe928711@baylibre.com>
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

On Sat, Sep 12, 2026 at 12:14:32AM +0200, Valerio Setti wrote:
> +static int meson_gx_audin_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	void __iomem *mmio;
> +	struct regmap *regmap;
> +	struct clk *clk;
> +	int ret;
> +
> +	ret = device_reset(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to reset device\n");
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return dev_err_probe(dev, -EINVAL, "Failed to get memory resource\n");
> +
> +	/*
> +	 * Do not use devm_platform_ioremap_resource() here: it would claim the
> +	 * whole AUDIN window exclusively and the FIFO children would then fail
> +	 * to request their own sub-ranges.
> +	 */

And this should point you that child is not a separate device.

Please open your datasheet and read what is the address space of this
device. You claim here ENTIRE address space. If you insist that entire
address space is not owned by this device, then you misrepresented
hardware in the DT anyway.

> +	mmio = devm_ioremap(dev, res->start, resource_size(res));
> +	if (!mmio)
> +		return dev_err_probe(dev, -ENOMEM, "Failed to remap memory\n");
> +
> +	regmap = devm_regmap_init_mmio(dev, mmio, &audin_regmap_cfg);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "Failed to init regmap\n");
> +
> +	clk = devm_clk_get_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "Failed to get clock\n");
> +
> +	ret = gx_formatter_create(dev, &audin_dapm_widgets[0], &audin_formatter_i2s_drv, regmap);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to allocate formatter\n");
> +
> +	ret = devm_snd_soc_register_component(dev, &audin_component, NULL, 0);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register component\n");
> +
> +	ret = devm_of_platform_populate(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to probe child nodes\n");
> +
> +	return 0;
> +}
> +
> +static void meson_gx_audin_remove(struct platform_device *pdev)
> +{
> +	gx_formatter_free(&audin_dapm_widgets[0]);
> +}
> +
> +static const struct of_device_id meson_gx_audin_of_match[] = {
> +	{ .compatible = "amlogic,meson-gxbb-audin" },
> +	{ .compatible = "amlogic,meson-gxl-audin" },

Why do you have two entries here and no fallbacks? This makes no sense,
really. I have no more doubts that your "gx" is a real SoC/

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
