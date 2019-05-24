Return-Path: <SRS0=5BKV=TY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F536C072B5
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 May 2019 17:50:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 611EF20879
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 May 2019 17:50:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AHVXDcIM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="kgfxpZcc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 611EF20879
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mkt9Ue2TSot3ZElhz8S2pHMYZp8mCdnAitZ96MhevNw=; b=AHVXDcIMzukq49
	FynGnSBdnoNJkoZUWQ+qW9NZ1+CJvrS9edOutp5pe6EP9hXYAKxlMpl4APcpwxqj9dQjOEChEfp66
	EcO4HWmVRAT4ThJw9twZ4h65kupTee3crZxhVVMc7007PcOXAgStcIEoCTmHEDpvqOv09R9blRH4V
	7nbmdtZcn5OwQwCss+osH3EMpewHiZEQvfFbeNDNK7V070q/WgtyBy5DuGYURf/0WULgngqkvLkur
	en2lxfchnItr7XCbrCWczQ9fBewHCH6kbMX4P5irhIk8PbUdbjyBcOCJZqDOFYooM3GB4+kuJvzQV
	ClM6aTLlNik0NDbGtHlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUEKh-0002Y3-FJ; Fri, 24 May 2019 17:50:19 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUEKd-0002XD-9A
 for linux-amlogic@lists.infradead.org; Fri, 24 May 2019 17:50:18 +0000
Received: by mail-ot1-x341.google.com with SMTP id s19so9455538otq.5
 for <linux-amlogic@lists.infradead.org>; Fri, 24 May 2019 10:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UZnc7DcjNL05PZUl35qBgTMmg9YgsiJ/H98z8gpQ+WU=;
 b=kgfxpZccazO/20c27YqZ/hF+AHYaWjTIKj+4hlpYOmSpYGdq5DSO03BZdAfXSk87zd
 Xxrb5F0o1lmubo/ft/4hp97LJqex8aPiv8lqDux6558iohZD4moHYTlkQq+kXdfvcD5Q
 sT2rTkW1eqxEm+dFXn+mfXoU5IVCbKeyvvWzujoJc2lvoTJRauZI9JPTjH4Kw0xNV79v
 Jcrjj0gLjoOscv2meGBmgwpSR35Dp7jATobUo0Kj1w1WI6DorXaO18b9yQTOnmBU0AEr
 SzgkVFIXR6fax727+rlfnuTMuUTl02Ht6jvKum9cxTpt0SJb/vBLXie+hZluXmAlJB89
 CPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UZnc7DcjNL05PZUl35qBgTMmg9YgsiJ/H98z8gpQ+WU=;
 b=jaRsi07WypyfSs9aEigmcRRgMuI40Bn7+yb35oZy7zUE5LWb0vlPof4u23Uu889Dhi
 mUPDSXgoIyFQXPCUXi2H7scAipxrZUi0sUKtYN2zi/4CZFCfQDGZ07+2naUJ/BMtCNZv
 EtgC0w8htDNT2rA3Ti6ME41zfMnKLJznH17jJMft4kMZhdkeFrhn7tbjUDNauLZBYS4K
 dsjVuLPnFKnYncgSIlox2JzS303eTwGobERH+tXSzWLavXPfhTilkYje+UG6RLkfLkDE
 zAZ+FRVhX1txJgsxnLrnUakauw71QT40l4fasdc/id/yhlGUeQI6dCtde+3wPRhRJE4x
 tL3w==
X-Gm-Message-State: APjAAAUGaLErsQYlAIA2UBkNeV9+QKK1aUyIBuLnBm1WXcX/ad2Gk/t+
 oO12naRDSr4LLyKSbAqEakP56ULyZuUeXeBtJcw=
X-Google-Smtp-Source: APXvYqy1KkZNIxwuQhPqiSRp1aCJoK85ECorsxpw0StRGFYqPUIJ2pkj+G09V+/85cJ6Wtcv6GjLQ4Bz2FginEM62Ok=
X-Received: by 2002:a9d:744d:: with SMTP id p13mr41645269otk.96.1558720212750; 
 Fri, 24 May 2019 10:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190524130817.18920-1-jbrunet@baylibre.com>
In-Reply-To: <20190524130817.18920-1-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 24 May 2019 19:50:01 +0200
Message-ID: <CAFBinCCKA-15sFwyXpoxmqw5b4=6j1t-fdrHM7CoAojqN+ZGzQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: add dwmac-3.70a to ethmac compatible
 list
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190524_105015_342284_29AA4FF2 
X-CRM114-Status: GOOD (  11.32  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Fri, May 24, 2019 at 3:08 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> After discussing with Amlogic, the Synopsys GMAC version used by
> the gx and axg family is the 3.70a. Set this is in DT
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>
>  Hi,
>
>  The same should be true for the meson8 families but I did not test
>  it which is why only the patch only address the 64bits SoC families
on one of my Meson8m2 boards:
User ID: 0x11, Synopsys ID: 0x37
-> that matches GXBB/GXL/GXM

Odroid-C1 on Kernel CI reports:
User ID: 0x10, Synopsys ID: 0x37
-> however, the public S805 datasheet mentions that it's a
"10/100/1000 MAC 3.70a" (page 120)

I don't know about Meson6 or Meson8 (as I don't have boards with these SoCs)

I'll put this on my to do list (adding the "snps,dwmac-3.70a"
compatible on Meson8b and Meson8m2)


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
