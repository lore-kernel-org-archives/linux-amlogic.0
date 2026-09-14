Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D573EC88E70
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Sep 2026 13:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LGKTWUG7ggTODss3kqR7c6SMO4RILvNG9xzvvvtBvas=; b=1bYfLmoRz7i3M2
	7Zp5cHZhBUR9AVko1HxUxu7Ebp/2UDZCgFJi8YZ+PqwvMuebVEdcBXnVZjy1DuTQbrJI5kLvlWenp
	sO/a09q4/dv/lmbGbn1Avqp23cuLkizpvpDGlN5fA/wu4GBEe+Q0k2sVAwWX+JnbdrjLE6HF1K3/G
	FNn8u6BA2cVceo+LTNMJkAdCNWzbXfMsREIx2VRJATIeCIuXmKPnzaDrSsHMUhPlYOo9sZrDpRQ2c
	G2hcYlbBQlZgXZDUUlXML577cS/QKKhCpfZ53T1yE3dNgnXLNCJj29YCilxH1WlsFI2Qmv+2TJ0Ze
	yJdtylFFhXRn4T07KrFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66WL-00000003iOx-3S9u;
	Mon, 14 Sep 2026 13:14:53 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66WI-00000003iNJ-2P56
	for linux-amlogic@lists.infradead.org;
	Mon, 14 Sep 2026 13:14:53 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so13351355e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 14 Sep 2026 06:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789391688; x=1789996488; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QXqt/TfNNS4iK2D0KIQwOPPSsGXvQRI7uTBOlyeJv7U=;
        b=QtQ+0fJ2MbergTVJoA2/F3UUnU/TNeAzI57rH03Dyzvl5G+hsZjEPVetxM6zFiZYNL
         eq5Mb607G2q2os1mMKdqwn7ZaLaj+67n1imJJwxvsY8zPuJn5CdhDnx5IDN2DhD5Z2CQ
         GUBzZAHF+NThsvS6Dcd2HSMc6udGG8ZL7+vYebgajfnQfuGjAJ4/jdPqMX4KDw2FhclB
         5m6XtKupCnNFQRzOHHHNkKypWFXwRkD61Y2YQMl84k6DBTL4plt2rAu36QVz8kUwcjT0
         6hGi+Q6BLYgiNLjrbashl9Rj5wj4zI2WAnmtBArrrxW8pgzvz+phwiPw8BzMmx5rHi5g
         OJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789391688; x=1789996488;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QXqt/TfNNS4iK2D0KIQwOPPSsGXvQRI7uTBOlyeJv7U=;
        b=HG0GpNQ7mNS61Q/tNGVmSeHzB/IxQgV2QN/m07mDNHqUg8mb6nCdQDJhmr6UVz+5Px
         vtZUc9zabx01xsdBckotcCxiC+6wQVrNDQ0KhQxWgmWheXXt9E58zkAWC+I0O2PtcYX+
         xFi5nGhUZT/Jqcwin5QNV+AqAIjfZy8C/wG3vSpV9zc27mN9vVk6AOq2hSeJ4khjhxfl
         vv/ZgmsdioVlZAOCoZ9wJYirMZy38+fyrFribXO9NS9z8LiNl50wknD5ybRVOqKEYLY7
         lLRPTUla0UlyFCShLYYYVVr4bTU7wyvxLTkBXalG3p5N91vVzpdx8WQT282duCtbcT2n
         6iQg==
X-Forwarded-Encrypted: i=1; AKwUvBzii/79go3sc8ZBP/tZ9nZlnlfAaU7ZVILW0mRdtXS4bYmRKl1vVU3IWFCyfKULNLWoVwhawfINfOS3zhOJ@lists.infradead.org
X-Gm-Message-State: AFuF++nkErQFXdUGDHTa078dLcCRhbb52nYVe6HbnTtnHCFImzHEkEgF
	d/yaJrxkQT/fIo0BgF71g/iNAMyFmZTrwv86pNBLxFuARa7ZZdpSqb4d0iuMSj1cAnQ=
X-Gm-Gg: AYBFou0rZpdDsMNv2CUMI5hjjqPOxRZGsHO103n+QKE+yzRSDtd3+e5sOe8huwu0Z07
	JQLwhl1pJHFgmh3WmEYfMyJ9IebmkFlxe7N2SsGjv00x9qeP9+tNklEeMmYeJ0fyCFqFU/nF97J
	l6+GIskaIfghSYqTkPsYe0TBnk/YsCt1fojc/bj0K2EfJwXfqXUl7tLTXL1Z435bJ14Q3ErTfqm
	nCmLko7ch/9Kdmfq7eaBIOceGuucQol1GZZHxburoTMb+BNq5LQj3UjnOYdGcsjduwscIX/il6T
	Xy0qoFXQqHdbyI44FNL5VPCOaW+47OPlp6q1CqybvGDIwOhwUy8fYt9p3UHHX8B8SfGr1d5JTWj
	tI7FowJ+ELumpUjIUvKg/4WEr119fNYMRg4p+TY7XdI9MqdyiON3dBbF1DStP+7P9nC3YpmKa5+
	HVpz62gFnu9fBimkJf9+KMyRa7xDH5D1SoVGkKmTpJmMlDR80c1mna5MQ878d6hFNKnMeCjW0=
X-Received: by 2002:a05:600c:46ce:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49e7a6870d9mr47453825e9.13.1789391687993;
        Mon, 14 Sep 2026 06:14:47 -0700 (PDT)
Received: from [192.168.3.100] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm28719703f8f.23.2026.09.14.06.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 06:14:47 -0700 (PDT)
Message-ID: <964d6626-202c-4d0a-aef2-86a383f405ab@baylibre.com>
Date: Mon, 14 Sep 2026 15:14:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] ASoC: meson: add audin main module and I2S formatter
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
 <20260912-audin-v1-2-7fbefe928711@baylibre.com>
 <20260913-inventive-millipede-of-certainty-dd58ce@quoll>
Content-Language: en-US
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <20260913-inventive-millipede-of-certainty-dd58ce@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_061450_636236_C5A854FA 
X-CRM114-Status: GOOD (  23.83  )
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

Thanks for your review and feedbacks.


On 9/13/26 11:41 AM, Krzysztof Kozlowski wrote:
> On Sat, Sep 12, 2026 at 12:14:32AM +0200, Valerio Setti wrote:
>> +static int meson_gx_audin_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct resource *res;
>> +	void __iomem *mmio;
>> +	struct regmap *regmap;
>> +	struct clk *clk;
>> +	int ret;
>> +
>> +	ret = device_reset(dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to reset device\n");
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	if (!res)
>> +		return dev_err_probe(dev, -EINVAL, "Failed to get memory resource\n");
>> +
>> +	/*
>> +	 * Do not use devm_platform_ioremap_resource() here: it would claim the
>> +	 * whole AUDIN window exclusively and the FIFO children would then fail
>> +	 * to request their own sub-ranges.
>> +	 */
> 
> And this should point you that child is not a separate device.
> 
> Please open your datasheet and read what is the address space of this
> device. You claim here ENTIRE address space. If you insist that entire
> address space is not owned by this device, then you misrepresented
> hardware in the DT anyway.

As I mentioned in the cover letter I designed it this way so that I 
could easily re-use the same driver code for all 3 FIFOs just offsetting 
the base address. I knew it was a bit hackish a solution, but IMO that 
was worth it since it was simplifying a bit driver's code. Perhaps it 
was more software-oriented rather than hardware related.
The other possible approach is to fully copy what AIU is doing and 
allocate each FIFO as a DAI. I'll follow that design then, but if you 
have any better idea please let me know.

>> +	mmio = devm_ioremap(dev, res->start, resource_size(res));
>> +	if (!mmio)
>> +		return dev_err_probe(dev, -ENOMEM, "Failed to remap memory\n");
>> +
>> +	regmap = devm_regmap_init_mmio(dev, mmio, &audin_regmap_cfg);
>> +	if (IS_ERR(regmap))
>> +		return dev_err_probe(dev, PTR_ERR(regmap), "Failed to init regmap\n");
>> +
>> +	clk = devm_clk_get_enabled(dev, NULL);
>> +	if (IS_ERR(clk))
>> +		return dev_err_probe(dev, PTR_ERR(clk), "Failed to get clock\n");
>> +
>> +	ret = gx_formatter_create(dev, &audin_dapm_widgets[0], &audin_formatter_i2s_drv, regmap);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to allocate formatter\n");
>> +
>> +	ret = devm_snd_soc_register_component(dev, &audin_component, NULL, 0);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to register component\n");
>> +
>> +	ret = devm_of_platform_populate(dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to probe child nodes\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static void meson_gx_audin_remove(struct platform_device *pdev)
>> +{
>> +	gx_formatter_free(&audin_dapm_widgets[0]);
>> +}
>> +
>> +static const struct of_device_id meson_gx_audin_of_match[] = {
>> +	{ .compatible = "amlogic,meson-gxbb-audin" },
>> +	{ .compatible = "amlogic,meson-gxl-audin" },
> 
> Why do you have two entries here and no fallbacks? This makes no sense,
> really. I have no more doubts that your "gx" is a real SoC/

OK. Genuine question about naming here: would "amlogic,gx-audin" be 
fine? Because in "meson-gx.dtsi" I see many surrounding nodes have 
"amlogic,meson-gx-" prefix, but that doesn't seem to follow design rules 
from "writing-bindings.rst".


-- 
Valerio


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
