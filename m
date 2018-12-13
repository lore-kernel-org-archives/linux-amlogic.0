Return-Path: <SRS0=UlVA=OW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC99BC67872
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 15:01:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CEB520870
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 15:01:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FjrPmKBI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aQw9vzpP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CEB520870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=snMILl9H4VT6MXKYzmAf3DeZfBDryEAUeeFds/kUKXo=; b=FjrPmKBIgG1LyR
	7pxv1X3dqGHN2BS2W9WgB4ZsORI7uzo1XysYQlwBGey9aZBXza/dtjnRzqC9gNub6ZqjMzm7aZjKp
	Z6xCXSjA2umFF/HWj8vTqf5ovTdtOLIRmm9R7dkwJfPWSvbBkwJxgLu2QyEEU7YOfrCK817mdbk7E
	FEF8mD9zO4V1awG1o8YGko1CVxmUx+3ep8qcCMKoB2KWkYmLqwD0UOlvVmfKd/JyWtGhxHRViW/DS
	AJaAOpg9WNOYR5snKpo4iRioTI9QXt/T1+PrBLqjZEZYXr2Mn+kHTEoLSYeOnAngPdlc33zDmrCKm
	wQqYd2JlsgLdu+JAyv8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXSUg-00034j-Un; Thu, 13 Dec 2018 15:01:42 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXSUd-00033P-UC
 for linux-amlogic@lists.infradead.org; Thu, 13 Dec 2018 15:01:42 +0000
Received: by mail-wr1-x443.google.com with SMTP id r10so2324207wrs.10
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Dec 2018 07:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=/PZtY1BAaPYGn4nVjkVNsNXFA2717ni1N2TrRR6uxSI=;
 b=aQw9vzpPKHncAPWTtn/FUxh2frrOk97e8mobq2hev3Ue0xJcdn4D3w8Abm3mnjNc0e
 Ds2fnlwF3WVHoGJhavz4AC4Tu3FvMz0MN1v+/ErHfYfQ+XFcAsxnokrmKcEPHDTpGb+0
 AE7Tc0MohOij24PyoSql71lpr94jmVWDJrMc6EOBzME+HbrCrdHCFFDtbYnIEF0KPHRv
 8G7sbZwfvlaG7rE8ZHzPiAlS9X1LmLWPYKMxhkgW1HQWlrhInYqyfdc5rvFrwBH9yteZ
 wUI4i7xTdZ2BpNIiLDpje3GYnxRHhJ2pB5uNzVLQIm6/pYY9b++IrW+tEFKcgzWrQciQ
 BHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=/PZtY1BAaPYGn4nVjkVNsNXFA2717ni1N2TrRR6uxSI=;
 b=M0GdXk08DIa/3LUxDfaxsuflw2CcTzS+GsxkCo0WyqJlhpcsPFLZtpe9w5f2zt98Vb
 koyYx/DS6vf2s/IoVZ0KtLJEWoNLbYST32L0dOMPHBEIYjQ0Js51nOu6nFuJ6WR/XtbT
 GnsXnyMJJZ68WR2RHOwiqTRujO5oiWvseotDC0ivF6eYXFNXzQWL4FfbW+qxvvagAdLq
 QwqP+GPdSMoDuzQaMV/HIpPocozmbR7UfRqSx+0/LzeXITsfY/sRvR8iT/wFTN/hl2l7
 OQp4fB847LV9TTaudO2UVv4Sj4jFcZAut56loF8KW8+uRh5ogq6K5/LfLiLBf1MCf3ns
 LCvA==
X-Gm-Message-State: AA+aEWZesMyA49knpQ9c3kAvDu0GgCWqw4JTR18gYGjxEweAxbENTG0s
 J2pIxnt0ioyp+WCpFTduvxuwJQ==
X-Google-Smtp-Source: AFSGD/V6UJfFyufvVzl/V5NsiHcynRFXZSpfIkseMAGivZFCCpYqF5ICqAcV+4xSfzQGGkW6IwjKuw==
X-Received: by 2002:adf:f449:: with SMTP id f9mr21931092wrp.40.1544713287867; 
 Thu, 13 Dec 2018 07:01:27 -0800 (PST)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 w12sm2015061wrr.23.2018.12.13.07.01.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Dec 2018 07:01:27 -0800 (PST)
Message-ID: <d2ecc15badf2b273ce9a62ecbbb0962051a46bc1.camel@baylibre.com>
Subject: Re: [PATCH v2 3/3] spi: meson-axg: add a linear clock divider support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Sunny Luo <sunny.luo@amlogic.com>, Neil Armstrong
 <narmstrong@baylibre.com>,  Mark Brown <broonie@kernel.org>
Date: Thu, 13 Dec 2018 16:01:24 +0100
In-Reply-To: <d9ec856c-d93f-4e4a-c5d4-7b2182f93cf7@amlogic.com>
References: <1544690354-16409-1-git-send-email-sunny.luo@amlogic.com>
 <1544690354-16409-4-git-send-email-sunny.luo@amlogic.com>
 <3cc699dc-4021-b993-2b47-b00b40f380f8@baylibre.com>
 <e6d5220e45a54d5251bec0f8fd3c147307f8b071.camel@baylibre.com>
 <d9ec856c-d93f-4e4a-c5d4-7b2182f93cf7@amlogic.com>
User-Agent: Evolution 3.30.2 (3.30.2-2.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_070139_971936_67F32477 
X-CRM114-Status: GOOD (  27.01  )
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
Cc: Jianxin Pan <jianxin.pan@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Yixun Lan <yixun.lan@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 Xingyu Chen <xingyu.chen@amlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 2018-12-13 at 22:37 +0800, Sunny Luo wrote:
> Hi Jerome,
> 
> On 2018/12/13 17:28, Jerome Brunet wrote:
> > On Thu, 2018-12-13 at 09:55 +0100, Neil Armstrong wrote:
> > > > diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
> > > >   config SPI_MESON_SPICC
> > > >   	tristate "Amlogic Meson SPICC controller"
> > > > -	depends on ARCH_MESON || COMPILE_TEST
> > > > +	depends on OF && COMMON_CLK && (ARCH_MESON || COMPILE_TEST)
> > 
> > The purpose of this patch is clock, right ? Why does it add a dependency
> > on OF
> > ?
> > I did it by the way. Maybe it's better to add it in patch 1.
> > > > +static int meson_spicc_clk_init(struct meson_spicc_device *spicc)
> > > > +{
> > > > +	struct device *dev = &spicc->pdev->dev;
> > > > +	struct clk_fixed_factor *div0;
> > > > +	struct clk_divider *div1;
> > 
> > Could you come up with something better than div0 and div1 ? it is
> > confusing,
> > especially with the comment above about div3 and 4 ... fixed_factor, div
> > maybe
> > ?
> > Good, It is really confusing, I will change next patch.
> > > > +	div1 = &meson_spicc_div1;
> > > > +	div1->reg = spicc->base + (u64)div1->reg;
> > 
> > So you have static data which you override here. This works only if there
> > is a
> > single instance ... and does not really improve readability in your case.
> > 
> > IMO, you'd be better off without the static data above.
> 
> This is a terrible bug for more than one instances. I must overwrite it.

You must set them properly, yes ... having these static data is not necessary

> 
> 
> > > > +	if (!spicc->data->has_enhance_clk_div) {
> > 
> > Do all SoC with 'has_oen' have 'has_enhance_clk_div' too ?
> > DO you really need two flags ?
> 
> Yes, all Soc with 'has_oen' must have 'has_enhance_clk_div' too.
> It is distinct to use two flags here, what do you think of it?

I wonder if you should be using of_device_is_compatible() instead of adding
these flags.

> 
> > > > +	mux = &meson_spicc_sel;
> > > > +	snprintf(name, sizeof(name), "%s#_sel", dev_name(dev));
> > > > +	init.name = name;
> > > > +	init.ops = &clk_mux_ops;
> > > > +	init.parent_names = mux_parent_names;
> > > > +	init.num_parents = 2;
> > > > +	init.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT;
> > 
> > Why CLK_SET_RATE_NO_REPARENT ? CCF should pick the parent that give the
> > best
> > results, best to let it do its task ...
> > 
> There are two div in AXG, one is the coarse old-div and the other is 
> enhance-div. From SoCs designer's opinion, the ehance-div aims to take 
> place of the old-div.

... and all likelyhood, CCF will pick it BUT, unless the old path is broken,
please let the framework do its job. 

If the old path was broken you should not have described it ... but we have
been using it so far, so we know it works fine.

it's a very simple fix: drop CLK_SET_RATE_NO_REPARENT and your call
clk_set_parent()

> 
> 

Last but not least, I did not see it in my initial review, but:

I see you call clk_set_rate(spicc->clk, ...) but I don't see any call to
clk_prepare_enable() and clk_disable_unprepare().

It works because the input clock and your local tree does not gate, but it is
wrong. A driver should not assume that they clock is enabled by default.





_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
