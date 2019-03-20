Return-Path: <SRS0=2I4g=RX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E53DC43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2019 08:16:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC6492184D
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2019 08:16:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="op1oEEO/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lJly9eRx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC6492184D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQ/fZZIJN5LNflTSFXWV9bItHutp3Qv+3dKSYglezak=; b=op1oEEO/WK2fVa
	lyohCu/dFDGkeyJmPkaf+g4a+mUAvP5ZXQHO81v0+NQdJ7PJkYVPeh/TkBjbEbkrsywMLD1L6O7Pk
	4u41TJ9PPiUPWw8qE32jCDhQZMoeqbkCkWcmNW0IyRQ99hYDlH5EJt8agy4RwnbF8UZgtYxg9gdih
	ff2WqGLX3NqU6NYTPxctyz23FRXxy3T6qbp/ZTEojmFBqNlvNnx9CrjdAb4jrhv9cRfGREvkUx/b8
	tb46GRGHqWIbV3LaJodSCFFzFN3VuKH9kiB/XU5HXc1/JB5ACMwkOJX853LrR/Sqa2N8ttStcqjwE
	vIlp9+d2xou0vL8EX2bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6WOY-0007lP-Ol; Wed, 20 Mar 2019 08:16:18 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6WOV-0007j3-Fr
 for linux-amlogic@lists.infradead.org; Wed, 20 Mar 2019 08:16:16 +0000
Received: by mail-wr1-x442.google.com with SMTP id w2so1606568wrt.11
 for <linux-amlogic@lists.infradead.org>; Wed, 20 Mar 2019 01:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=yNdUROwgb1UYzl/KkTOa+AKBmBCkfr9Bfon1aZlEAik=;
 b=lJly9eRxWhWY9dZHHO+KUyTg7oi3B7pCE7qNroiyjs9Ws8XU4MUg3kh69fAgVZn+tZ
 r7DOAuOKU2ThgnJ00P1cnaepwN9PFctNcKCGZChQdTjhCeoZAIl1i5JI5q2waWJunE1O
 LL5Xw0RtGpG6mkMC90W6D84gh1k+3AxCk0DMM2cl+oerbBmAuJP/m18Tx6VGDjRPp2oi
 ePiD8XJ53kOf9tP0dRhkO5QrI0LzPXCu5iYIDepLVty/VrzkL2QQ+/rq3Or27F0vBgqp
 J3cVbtXVTA6SmHaNQdudPXHYHfRJJbhXp0mH2rN1dyAPubvd1uWqm3kpx1dvggtDyv/+
 lx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=yNdUROwgb1UYzl/KkTOa+AKBmBCkfr9Bfon1aZlEAik=;
 b=pyQTjGHUgC8Ujs9AbFhKjqwZ+RdVE4h1b0ol/8/ELAFCdTD8oLV37Dud0sqMtfOA4Q
 TCvkgVEhIAvef622emjUDl6iawhexiu2eSLO/ycwjXZQDDNGrde3YAcarzkfnffgwYg5
 pxMmJaOUsYBQ07DtSkX2o+Abk/6+mwM6M/SjOTvspCodD1gm6xkI7JZhWgLhCScWPVSj
 ZJvBlYWjtinLKRUWSp9RM/W+69FPnkH+w/EiTeXfmodQndI5vCuFLT7GhQfJp6JfRELH
 VE4UsmHbLp4Vakqx/RbtOSi+lk2y2Rv1A5Uq6AucbDoORnUypIAKw2zARKNSAScIIEC7
 boGw==
X-Gm-Message-State: APjAAAWhZrI3BXfR1KFaIWU3qwySqTirc0EBIBOOmAnQDvcjvf+2xXaX
 QS2MDdyzaSqri7hKTUqWAEcoOA==
X-Google-Smtp-Source: APXvYqx9LP3GrwmreflLF5lkQntBLdtbs4i24XKhwKxaUB3pz26sqh6ego3mVtBZj/cpXwRRfqdg2A==
X-Received: by 2002:a5d:63c4:: with SMTP id c4mr10139782wrw.307.1553069773673; 
 Wed, 20 Mar 2019 01:16:13 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 r63sm1722195wmr.32.2019.03.20.01.16.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Mar 2019 01:16:13 -0700 (PDT)
Subject: Re: [PATCH 3/4] clk: meson: meson8b: add support for the GP_PLL clock
 on Meson8m2
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 jbrunet@baylibre.com, linux-amlogic@lists.infradead.org
References: <20190319215121.29340-1-martin.blumenstingl@googlemail.com>
 <20190319215121.29340-4-martin.blumenstingl@googlemail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <5f706640-1f39-0ebf-98d7-042300455083@baylibre.com>
Date: Wed, 20 Mar 2019 09:16:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190319215121.29340-4-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_011615_535984_884C3379 
X-CRM114-Status: GOOD (  19.24  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 19/03/2019 22:51, Martin Blumenstingl wrote:
> Meson8m2 has a GP_PLL clock (similar to GP0_PLL on GXBB/GXL/GXM) which
> is used as input for the VPU clocks.
> The only supported frequency (based on Amlogic's vendor kernel sources)
> is 364MHz which is achieved using the following parameters:
> - input: XTAL (24MHz)
> - M = 182
> - N = 3
> - OD = 2 ^ 2
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/clk/meson/meson8b.c | 62 +++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/meson8b.h |  5 ++-
>  2 files changed, 66 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index c9e6ec67d649..0d08f1ef7af8 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -1703,6 +1703,64 @@ static struct clk_regmap meson8b_mali = {
>  	},
>  };
>  
> +static const struct pll_params_table meson8m2_gp_pll_params_table[] = {
> +	PLL_PARAMS(182, 3),
> +	{ /* sentinel */ },
> +};
> +
> +static struct clk_regmap meson8m2_gp_pll_dco = {
> +	.data = &(struct meson_clk_pll_data){
> +		.en = {
> +			.reg_off = HHI_GP_PLL_CNTL,
> +			.shift   = 30,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = HHI_GP_PLL_CNTL,
> +			.shift   = 0,
> +			.width   = 9,
> +		},
> +		.n = {
> +			.reg_off = HHI_GP_PLL_CNTL,
> +			.shift   = 9,
> +			.width   = 5,
> +		},
> +		.l = {
> +			.reg_off = HHI_GP_PLL_CNTL,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = HHI_GP_PLL_CNTL,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +		.table = meson8m2_gp_pll_params_table,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "gp_pll_dco",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_names = (const char *[]){ "xtal" },
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap meson8m2_gp_pll = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = HHI_GP_PLL_CNTL,
> +		.shift = 16,
> +		.width = 2,
> +		.flags = CLK_DIVIDER_POWER_OF_TWO,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "gp_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_names = (const char *[]){ "gp_pll_dco" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
>  /* Everything Else (EE) domain gates */
>  
>  static MESON_GATE(meson8b_ddr, HHI_GCLK_MPEG0, 0);
> @@ -2338,6 +2396,8 @@ static struct clk_hw_onecell_data meson8m2_hw_onecell_data = {
>  		[CLKID_MALI_1_DIV]	    = &meson8b_mali_1_div.hw,
>  		[CLKID_MALI_1]		    = &meson8b_mali_1.hw,
>  		[CLKID_MALI]		    = &meson8b_mali.hw,
> +		[CLKID_GP_PLL_DCO]	    = &meson8m2_gp_pll_dco.hw,
> +		[CLKID_GP_PLL]		    = &meson8m2_gp_pll.hw,
>  		[CLK_NR_CLKS]		    = NULL,
>  	},
>  	.num = CLK_NR_CLKS,
> @@ -2500,6 +2560,8 @@ static struct clk_regmap *const meson8b_clk_regmaps[] = {
>  	&meson8b_mali_1_div,
>  	&meson8b_mali_1,
>  	&meson8b_mali,
> +	&meson8m2_gp_pll_dco,
> +	&meson8m2_gp_pll,
>  };
>  
>  static const struct meson8b_clk_reset_line {
> diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
> index b8c58faeae52..a45f7102c558 100644
> --- a/drivers/clk/meson/meson8b.h
> +++ b/drivers/clk/meson/meson8b.h
> @@ -19,6 +19,7 @@
>   *
>   * [0] http://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf
>   */
> +#define HHI_GP_PLL_CNTL			0x40  /* 0x10 offset in data sheet */
>  #define HHI_VIID_CLK_DIV		0x128 /* 0x4a offset in data sheet */
>  #define HHI_VIID_CLK_CNTL		0x12c /* 0x4b offset in data sheet */
>  #define HHI_GCLK_MPEG0			0x140 /* 0x50 offset in data sheet */
> @@ -146,8 +147,10 @@
>  #define CLKID_MALI_1_SEL	178
>  #define CLKID_MALI_1_DIV	179
>  #define CLKID_MALI_1		180
> +#define CLKID_GP_PLL_DCO	181
> +#define CLKID_GP_PLL		182
>  
> -#define CLK_NR_CLKS		181
> +#define CLK_NR_CLKS		183
>  
>  /*
>   * include the CLKID and RESETID that have
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
