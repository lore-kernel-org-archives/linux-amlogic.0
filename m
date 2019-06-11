Return-Path: <SRS0=5QiQ=UK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6064CC4321A
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 12:34:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32A5E2089E
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 12:34:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DXk+d66F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SzihAGca"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32A5E2089E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VT59T1mW1OqFXDhCieSvQLEq6L7t+W8henoyi2UKjUE=; b=DXk+d66FkYX/Sx
	jfHzizWHPFCxtDjQ4Bo3MI22IlSZsi/N3B4GtVSHV0y6ityFYxQRcA2w0jX015CfrmGEHyYWP31o4
	mruzIMfBZ6Aq+k/QJP5g/khM6sa6FRP2LCgFUu4Hs4l1XZnx9E/XDfSZ+sLbDnMHIbtjL2xPp/u7x
	tZ8tj56X3GLEMWbLuXXIXgyDH0tcNx3oCMTa14IphJH7jy1C4mSXZDY53A5ruFDZu6l/I0tvkZXJO
	POULe/B1+Tu3aawAhWTrDWSWxi18iuRJOlMjzd1Ka/2IuIj9YRkGnFG9bzdpCI6mbJWX5SG8hF+WI
	lUawhqjG30e0uWBAdeew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hafyJ-0000B3-JJ; Tue, 11 Jun 2019 12:33:51 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hafyH-0000AQ-FG
 for linux-amlogic@lists.infradead.org; Tue, 11 Jun 2019 12:33:51 +0000
Received: by mail-wr1-x442.google.com with SMTP id n9so12878827wru.0
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Jun 2019 05:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=DvikrMBwh9tftYU3dRCC1yJiv8IUHz4wGcpoKbApB0A=;
 b=SzihAGcave6PcRHaptIfqetvYX2s/CIsqZx4gGmhOkRcqD3r6E3yVhD0MwYTg6JyxN
 Ff9Azg842+7V7Eai50NIu+lriYWLYTPBlftbbRJpwrcbLCnH6DuubjPVVN9+/oqGvFkU
 tZLcQIrjhccq4nF28oJUdBI2ouNCpCurYD2a5W1zgycAmBFSSRUpqE6Tm2kU4tEeiNEV
 yyUIG1maTEhQMr/mzjilwiUjfDFhA6M2BgRovVDP01hpqVu5JseG3dhjYbct+zZV0ZmC
 x/9m97bjmTANsKa1n5D/iKp5YKRlyHUkejHCFHLyyAdu0Uhqx5LIgPiIM8AlBBDtDOC7
 QIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=DvikrMBwh9tftYU3dRCC1yJiv8IUHz4wGcpoKbApB0A=;
 b=nOI6n4moFied6bp9ng4XrxRHdu0arR9eiNANvEvcArftqopebsum4z5i+7O1LFYvpT
 oE8VTqstUngYnQFeDBFqg+xAMud630l35MIMvgooetAqYQK0bKqKNPjJBnug9uGpIXNT
 OP4xfkAqmleqEP018yxDKo7yPPhzavI/UOwJNDa3q7ujaVCvrYrEA72azhBgpUCcP/Am
 P4l4FrlYS5cUx/aGMH7qNnWsrl1aWH1L0doziPAzm/DgFvz5BUJoZ/mG5RFb0herxegL
 Ir7LZCU2d8qS40j4oPFTTPd0S+/MQV/AgKxwj43nvfiHuTDpy0aofNWUjmQpUr14P9B2
 uR/Q==
X-Gm-Message-State: APjAAAXtEYp/ss3Z9Ii1hh3Jx4aOktjUMwxq2YozpKdHmcBoL5tTmmmO
 +3n59HpqNZY/vrq8JhGJ6bp4nQ==
X-Google-Smtp-Source: APXvYqxKyUgIOeO42Kn0nHkZYiOxQ1QsohML52m1DvilPZ1AePnj8NznUOj0MKLMxd2jVLtQMThCnA==
X-Received: by 2002:adf:eb4e:: with SMTP id u14mr2772546wrn.168.1560256428217; 
 Tue, 11 Jun 2019 05:33:48 -0700 (PDT)
Received: from boomer.baylibre.com
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y17sm29500399wrg.18.2019.06.11.05.33.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 05:33:47 -0700 (PDT)
Message-ID: <6ff3ed67f7bd0903bacb8d975816e780a3907dc1.camel@baylibre.com>
Subject: Re: [PATCH 0/4] 32-bit Meson: audio clock support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 narmstrong@baylibre.com, linux-amlogic@lists.infradead.org
Date: Tue, 11 Jun 2019 14:33:46 +0200
In-Reply-To: <20190520200319.9265-1-martin.blumenstingl@googlemail.com>
References: <20190520200319.9265-1-martin.blumenstingl@googlemail.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_053349_509805_98FAAED9 
X-CRM114-Status: GOOD (  12.29  )
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
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 2019-05-20 at 22:03 +0200, Martin Blumenstingl wrote:
> The audio clocks on the 32-bit Meson8, Meson8b and Meson8m2 are
> (probably) identical to the ones on GXBB, GXL and GXM.
> 
> The first piece of evidence is that Amlogic's vendor kernel is using
> the same basic driver (just slightly modified) for the 32-bit SoCs [0]
> and 64-bit SoCs [1].
> 
> Then there's buildroot-openlinux-A113-201901 which ships
> kernel/aml-4.9/drivers/amlogic/clk/m8b/clk_misc.c. It contains the same
> registers and bits (just slightly different naming) than the mainline
> GXBB/GXL/GXM clock driver.
> 
> There is no working mainline ALSA driver for this yet so I am not 100%
> sure that everything is correct. However, due to the evidence listed
> above I'm sure that the basics are correct so this is a good starting
> point.
> 
> 
> [0] https://github.com/endlessm/linux-meson/tree/d6e13c220931110fe676ede6da69fc61a7cb04b6/sound/soc/aml/m8
> [1] https://github.com/khadas/linux/tree/1bd6972cd0093725c0b1dc87f6546648bbb22452/sound/soc/aml/m8
> 
> 
> Martin Blumenstingl (4):
>   dt-bindings: clock: meson8b: add the audio clocks
>   clk: meson: meson8b: add the cts_amclk clocks
>   clk: meson: meson8b: add the cts_mclk_i958 clocks
>   clk: meson: meson8b: add the cts_i958 clock
> 
>  drivers/clk/meson/meson8b.c              | 154 +++++++++++++++++++++++
>  drivers/clk/meson/meson8b.h              |   8 +-
>  include/dt-bindings/clock/meson8b-clkc.h |   3 +
>  3 files changed, 164 insertions(+), 1 deletion(-)
> 

Applied
Thx


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
