Return-Path: <SRS0=4IOV=6L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79719C54FD0
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Apr 2020 16:34:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F634206BF
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Apr 2020 16:34:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GL3HHtsF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="fEHgLHot"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F634206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c+pKc8H+9DGJL2fbeE/E45YPfYYkpkpkSN1Zj6p3fYQ=; b=GL3HHtsFrNOasL
	QwsnALOP9o0OkIt5GOjqoSopnMkAIvjOtiVZGNxEoWbrSYBznRJ4AcgR/kKciyPGwomr0W0LJ5Rgm
	xmdeX5y0tugKYnHlPo6OPqdbZmG5Knx6FUgCt93ZPogc83geJwEG4SkJTg04DO7wJRSkZIAxotCKb
	2Ucoo2MUfyWdFAuDehkE9KYu4Yk5kN7nNM1yKUvSu9x/1/3QNCXyXVvhdLPgenQh43tnR4VrBhlu+
	XvT8g8oU7yYBtH6Fba4OythSIFsb5cHGQTjrTvvOw7ctMg/C56actDCtOyd5yHHvrxihJa5IwIC+A
	Z4t5G9lc5MVwSjQa55Vw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT6hl-00027x-CS; Mon, 27 Apr 2020 16:34:01 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT6hi-000278-9Z; Mon, 27 Apr 2020 16:33:59 +0000
Received: by mail-ej1-x642.google.com with SMTP id s9so14669523eju.1;
 Mon, 27 Apr 2020 09:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cf6K3gKCGK+tevU6SOIQu2ZyhbrY799GzvMTpffec20=;
 b=fEHgLHotmQ2/QZ9izNQI6Vaz8wS10CiCmWkvWWqUdsrKNl3IllAOIGjxPmPHDbKZmn
 oRJ77Jcoq+oxmN+XLL6SJm0VlYl3X0Xl2ilO8OS3cK1T4w7BDCrYFwTmGr2HE1x96bZf
 bIKAbQVM6yyXK8MHg4AUaJE3af9PkXwIl/27vAh64P3TZDA/SkshLtrD3ea1beLLX8EY
 jCGatrJEfR8rnqop+kn5Ua6Jx4IAeIUwp9jsBSCDsSwa7r/FACxpEZRydrLYzbiZ7lAn
 VxWYFeNWvvkQcsthLYaHlA+p+TKz0GViDKM/qP2boJDJITlanRqF5FgeT7wKGxOPC2kZ
 EPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cf6K3gKCGK+tevU6SOIQu2ZyhbrY799GzvMTpffec20=;
 b=kcyu7Lj6pTsUKi03RbRKHYP+HJlxGnfEAQzuAr/SwzqkbwuUNWuDwwtYCDdkLCwSH8
 /vW/+tto1udPctMibAWSV8otsNkJXCMeOti9GahoIrGbKuEpZNSEvEWMesUjISpwb1Hy
 AQY3/NShqxH0bS3sMItpZCt9aOxPA3yckp2h9WPvkxBDPbJY+SfQ1v7qOWeg/Bwv4zF1
 1Yq9YmZo0wP+glhQ8poJQGhSsfevMjLw0mWmJNszbBwbcl5iTdwuWebzmwKgfo7DOVWS
 UN1tKrDO+ql7hvj4sGJvB1vAdAPKr7XBFTSQQ3tSOYYAIo2KzFvFGAYQ/C/4sXwOESpC
 Jt/g==
X-Gm-Message-State: AGi0PuZcV1x/dB3Wz4glQ8TKoOHKWMs+wDbZ+1k2Nuv5QV4lyqg3l3uM
 c1jV70ETLyp88gvIVtVyHmuYntQJDTRLUfgvs7qwJjGztvM=
X-Google-Smtp-Source: APiQypIxi9PVa6BSrsdK7HKl/F5E9nNV2Zxh8LSFeUs6LEBcQQ6x7m+p/fR1cdSqN4+y8qa2TCS1gaPOrQrL2MFzQ2M=
X-Received: by 2002:a17:906:1199:: with SMTP id
 n25mr21359264eja.30.1588005236702; 
 Mon, 27 Apr 2020 09:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200328003249.1248978-1-martin.blumenstingl@googlemail.com>
 <20200328003249.1248978-3-martin.blumenstingl@googlemail.com>
 <1jd07t2ucy.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jd07t2ucy.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 Apr 2020 18:33:45 +0200
Message-ID: <CAFBinCCRE9ceErVVQJ=prDp5+srpcSM6oqNkgwznYq8awNpQ3Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] clk: meson: add a driver for the Meson8/8b/8m2
 SDHC clock controller
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_093358_357556_1077CFC1 
X-CRM114-Status: GOOD (  21.29  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ulf.hansson@linaro.org,
 jianxin.pan@amlogic.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, yinxin_1989@aliyun.com, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 lnykww@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

thank you for looking into this!

On Mon, Apr 27, 2020 at 10:41 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
[...]
> > +#include "clk-regmap.h"
> > +#include "clk-pll.h"
>
> If you need the pll clocks, it should probably appear in the Kconfig
> deps as well
this driver does not need "clk-pll.h"
good catch - thank you

> > +
> > +#define MESON_SDHC_CLKC                      0x10
> > +
> > +static const struct clk_regmap meson_mx_sdhc_src_sel = {
> > +     .data = &(struct clk_regmap_mux_data){
> > +             .offset = MESON_SDHC_CLKC,
> > +             .mask = 0x3,
> > +             .shift = 16,
> > +     },
> > +     .hw.init = &(struct clk_init_data){
> > +             .name = "sdhc_src_sel",
> > +             .ops = &clk_regmap_mux_ops,
> > +             .parent_data = (const struct clk_parent_data[]) {
> > +                     { .fw_name = "clkin0", .index = -1, },
> > +                     { .fw_name = "clkin1", .index = -1, },
> > +                     { .fw_name = "clkin2", .index = -1, },
> > +                     { .fw_name = "clkin3", .index = -1, },
>
> When fw_name is specified, setting the index is not necessary
noted, will fix this

[...]
> > +     .hw.init = &(struct clk_init_data){
> > +             .name = "sdhc_div",
> > +             .ops = &clk_regmap_divider_ops,
> > +             .parent_data = (const struct clk_parent_data[]) {
> > +                     { .name = "sdhc_src_sel", .index = -1, },
>
> Any reason for using the lagacy names and not the clk_hw pointers ?
> Same comment for the rest of the clocks
indeed, there is a reason and it took me a while to figure out
__clk_register will set hw->init = NULL;
This means: if we unregister the driver and register it again all
hw->init will be lost (as it's now NULL)
This is why I am effectively cloning (devm_kzalloc + memcpy) these
clocks which only serve as a template
Due to this I can't easily use a reference to another clk_hw

We don't have this problem in any of our other clock controller
drivers because these cannot be unloaded

[...]
> > +     .hw.init = &(struct clk_init_data){
> > +             .name = "sdhc_mod_clk_on",
> > +             .ops = &clk_regmap_gate_ops,
> > +             .parent_data = (const struct clk_parent_data[]) {
> > +                     { .name = "sdhc_div", .index = -1, },
> > +             },
> > +             .num_parents = 1,
> > +             .flags = CLK_SET_RATE_GATE,
>
> Why can't the clock change rate unless gated ? Maybe you prefer to
> change the rate in the mmc while clock is gated, but this is the
> handling of the clock by the mmc driver, not a constraint of the actual
> clock HW, isn't it ?
>
> Also, this is a gate so I suppose the rate propagates through it ?
> Can you explain why CLK_SET_RATE_PARENT is not set  ?
[...]
> Ok so apparently you only want to set the rate through the RX clock.
> You are free to call set_rate() only on this clock in the mmc driver.
> However, I don't think this should reflect as clock constraints.
I think these two belong together
looking back at this I believe that you are right:
- CLK_SET_RATE_GATE should be dropped because that's not a constraint
of the clock but of the clock consumer (MMC driver)
- CLK_SET_RATE_PARENT should be added to all clocks because rate
propagation will work for all clocks

> > +     },
> > +};
> > +
> > +static const struct clk_regmap meson_mx_sdhc_sd_clk_en = {
> > +     .data = &(struct clk_regmap_gate_data){
> > +             .offset = MESON_SDHC_CLKC,
> > +             .bit_idx = 12,
> > +     },
> > +     .hw.init = &(struct clk_init_data){
> > +             .name = "sdhc_sd_clk_on",
> > +             .ops = &clk_regmap_gate_ops,
> > +             .parent_data = (const struct clk_parent_data[]) {
> > +                     { .name = "sdhc_div", .index = -1, },
> > +             },
> > +             .num_parents = 1,
> > +             .flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>
> ... now I lost with these flags. I'm sure there is an idea related to
> the mmc driver. Clockwise, I don't get it.
indeed, just like above I'll fix these


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
