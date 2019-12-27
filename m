Return-Path: <SRS0=RZf2=2R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B527AC2D0DA
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Dec 2019 17:04:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7923C21582
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Dec 2019 17:04:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lo4F+5xO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="GKlBMroY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7923C21582
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MNViIOOaYDaYpFyxWOrc32Fetn9hl1iws9tE6zsVXPQ=; b=Lo4F+5xOXnS+m6
	X3SzBDaBrHzzyCxLUHAAEAZaOvI/RuLShUGqYajxIb2dp6j7lSDSCEUtS1+9OFlcLqMXbodgasji/
	cuuwW2PuyvhMxhklL4NsRN1wypCQGRtfyr2b8VPlZO9RAjRN4gp7Qz2NpNZgxd73WRdjzRUA3FnuE
	6yYDZH4we7w48iq55dZnyE6h+aQYswqmNKJMSfOZjZFzT21n/5VKjgWLsD1zzrbCLqyzp9W2IBC0l
	UoL1X8IdIv0itcBjG6uOFfuHOkrZODV5obtK3TjRmqCzj0vXKrNw8mSOQEdmEG2LcT5YGpVd3VsDq
	Vync8bomy68cgZTY7cEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikt2e-0002qS-S2; Fri, 27 Dec 2019 17:04:48 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikt2c-0002pw-9O; Fri, 27 Dec 2019 17:04:47 +0000
Received: by mail-ed1-x544.google.com with SMTP id j17so25789328edp.3;
 Fri, 27 Dec 2019 09:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BoVbc5pFxgDga02d7WpROu4QcXo0Jnx36QL7mAbHE+o=;
 b=GKlBMroYHKZ+NeE9hZTwNpzDD2un2MsXbWFiIqXLUAlw4zHJf04GITHmWpvNDseB8q
 Bqz59shO329cyZVFllXLlGDUGpRZYX76XIM7ABBWAWEPOeZL32U3z/idBD0dKFyhDWiQ
 oIcbi38+6nV4daU80bI/u+HYvi2+fCTk3D0hIiCeD6wauLvlZxum7/KLwq9Xx2tMR9Ld
 0oUIE7SNzoo8g+yibPu98/Ks5OOEhrRUQ1t4uBWXMiOq45e+PkJJnFlZXbOn/CPOeISi
 c8sDROdDLLtOZtVqSAzwODofVPqJfrD9YGnYQ01cLL5KTF4tjMFXDEsJQPiDqxUsgBT6
 LJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BoVbc5pFxgDga02d7WpROu4QcXo0Jnx36QL7mAbHE+o=;
 b=EopZ8TD3LxYg+499/Q49ypa4fHixcKWFO3X4fcDMNz8ZbSLAn4pAvCU6aihWlwFyIu
 D3pKnPiDbP4P1ufq0ykEngFFX1TCvsRNWUuTNMDqX7lLvbPyQNYN6DyueBr3WTb/jHeu
 kwqjqTJA3yhnnHh3k+hYDeoJqlVBUNyIXfNqAjIHYJlviqLSF2vSbN/1uUIG8OEEOYdR
 B2eTJpV+6t+wmX3/co8E37n+WxwuAWi1jIgBilbd7ov9bx+k71RHQ1WFEhL62cIJHV31
 7aOSvvanmgPQk7J+bA8MB0ydI2WtMvgyfwLB6EvchRz3qSIwIlPXDDTa5GqMCZ6tCFD+
 QKLQ==
X-Gm-Message-State: APjAAAWB1iHe90HDss+jFSxE0CSVd5HUF9f5Z4L5fo0e7qkhgPGo3CaX
 K34JFIkU0PrSfzpkki07ojzXOR74xaqhzGWBedM=
X-Google-Smtp-Source: APXvYqxb40zU5q6fp02+uSgYoDnGWDNjt9ky8oUSBuCmkdvIsTYbQe34JEzsFayd1/qdz0Dqt0rB7GiW2uX4tkdpQik=
X-Received: by 2002:a17:906:cc8b:: with SMTP id
 oq11mr56006300ejb.193.1577466284880; 
 Fri, 27 Dec 2019 09:04:44 -0800 (PST)
MIME-Version: 1.0
References: <20191227094606.143637-1-jian.hu@amlogic.com>
 <20191227094606.143637-4-jian.hu@amlogic.com>
In-Reply-To: <20191227094606.143637-4-jian.hu@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 27 Dec 2019 18:04:33 +0100
Message-ID: <CAFBinCB2XF1unfEGbApuoXR3ZBRMwgc4EuqSjgKWKm_2G16S5g@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] clk: meson: a1: add support for Amlogic A1 PLL
 clock driver
To: Jian Hu <jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191227_090446_353114_30B4929A 
X-CRM114-Status: GOOD (  13.78  )
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
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Qiufang Dai <qiufang.dai@amlogic.com>, Chandle Zou <chandle.zou@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jian,

On Fri, Dec 27, 2019 at 10:46 AM Jian Hu <jian.hu@amlogic.com> wrote:
[...]
> +               .parent_data = &(const struct clk_parent_data){
> +                       .fw_name = "xtal_fixpll",
> +               },
in the Meson8b and G12A (I assume it's the same on GXBB, I didn't
check it) we have a space between " clk_parent_data)" and "{"
this applies to at least one more occurrence below

[...]
> +               /*
> +                * This clock is used by APB bus which setted in Romcode
nit-pick: I'm not sure about the grammar here: setted -> "is set"?
and to make sure I understand this correctly: do you mean the "boot
ROM" with "Romcode"?

[...]
> +static int meson_a1_pll_probe(struct platform_device *pdev)
> +{
> +       const struct meson_eeclkc_data *data;
what do you need this "data" variable for?

> +       struct device *dev = &pdev->dev;
> +       struct resource *res;
> +       void __iomem *base;
> +       struct regmap *map;
> +       int ret, i;
> +
> +       data = of_device_get_match_data(dev);
> +       if (!data)
> +               return -EINVAL;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +
> +       base = devm_ioremap_resource(dev, res);
> +       if (IS_ERR(base))
> +               return PTR_ERR(base);
> +
> +       map = devm_regmap_init_mmio(dev, base, &clkc_regmap_config);
> +       if (IS_ERR(map))
> +              return PTR_ERR(map);
> +
> +       /* Populate regmap for the regmap backed clocks */
> +       for (i = 0; i < data->regmap_clk_num; i++)
> +               data->regmap_clks[i]->map = map;
why can't we use a1_pll_regmaps directly here?

> +
> +       for (i = 0; i < data->hw_onecell_data->num; i++) {
> +               /* array might be sparse */
> +               if (!data->hw_onecell_data->hws[i])
> +                       continue;
> +
> +               ret = devm_clk_hw_register(dev, data->hw_onecell_data->hws[i]);
and why can't we use a1_pll_hw_onecell_data directly here?

[...]
> +static const struct meson_eeclkc_data a1_pll_data = {
> +               .regmap_clks = a1_pll_regmaps,
> +               .regmap_clk_num = ARRAY_SIZE(a1_pll_regmaps),
> +               .hw_onecell_data = &a1_pll_hw_onecell_data,
> +};
if _probe would access these directly then you can drop meson_eeclkc_data
that is a good thing in my opinion because I was confused by the
"eeclk" since the patch description says that there's no EE or AO
domain on the A1 SoCs


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
