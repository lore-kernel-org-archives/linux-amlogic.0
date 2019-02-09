Return-Path: <SRS0=GL6B=QQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2CABC282CC
	for <linux-amlogic@archiver.kernel.org>; Sat,  9 Feb 2019 00:24:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2086217D8
	for <linux-amlogic@archiver.kernel.org>; Sat,  9 Feb 2019 00:24:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SrEFegyv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="W2ZWk+Ru"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2086217D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/5sqxxvPDKjZ9DWubpsWK3u2ZhSIXexav0sdz++bMbU=; b=SrEFegyv4YLfZR
	GFQW9WUN2pjln66Z+cG5Z4f4Xf49UhzkDY5s6feSrpCz9WE0bUBq/zbfrkBFWjjmolfmrytBeKNh9
	A3oXqjti9w/vLXQZuF7ItlxwkVm8f49Ngjd0Utlh5Lq7p5uORDWAmaZSEMmKOORTHhAThCrqrE1Xc
	BoDzLjcwoVRFVooIOJb7VJoOe8sq6xr7F2XAkBgzfZ7fiyPnZxBsKgmwBioJa5KIm4vk734/tpRtW
	Xt4Wm0q2fCzzCoNjNkddklTg2JrxPRcb9L/5+sLv/NRioFtTxMzqc4Iwy8JuJkNGRn6mXrzwyAnKv
	B5MUlDSoeDwpTRKzov/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsGRO-0004N6-VR; Sat, 09 Feb 2019 00:24:18 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsGRL-0004M7-AY; Sat, 09 Feb 2019 00:24:17 +0000
Received: by mail-ot1-x342.google.com with SMTP id w25so8811618otm.13;
 Fri, 08 Feb 2019 16:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VXRUY7ybCBbZhdhaceE/5bf76J7vkdyjiSyqUD4tjJ0=;
 b=W2ZWk+Ruz1Y2gbGtcnlKu1QU8wyjw33hruBtxHR0d3vzqYDybIfaKtoi6NvVsAh/2i
 ZWzozPgeUBgsRiEfypWNkgrmeJZ0KPbrq2488Ll6f/HTQ0P7RMwPSdJ5TnuazK9Cq48b
 OMSUO3Fm3V4gdX9d81zpH8imYpSNAv2Dj6FHeHeLGvM12L5HKD3WhprWld4YmDfNj/l4
 EKKnuytIhPacviaufMvECW7mYiqkT0P0m4ZuyI8ytWFtmmAmWDki3t8KqzkU5/3uwzDH
 X7BHC3XPjaV5EEoBNQ14rjU/o+32ei52wX1t/x/vcAFsH+zUjVz72NLQhGDSXmguAfuO
 te2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VXRUY7ybCBbZhdhaceE/5bf76J7vkdyjiSyqUD4tjJ0=;
 b=dSR27vgAJj629z6Mem3Gw0TgI+XqDd1Bxs78y9ZySzZ3JOurQ5xEnEHgaQX2TlHlqq
 sy5PeHDL6HB01fxnYafwRshMNp//rNDvzjhYOFhPS8qBZ3eBcrYA2pevhY+sAEwH6g+r
 9l82v1pzO4LZmgGfIT8Aggm9he4EDgVp19oUCVq731um5pzrZGasDbd+p/DcqwL2hO1M
 EyzC1Fp+ls7trxuINqvsTfbQqy4PvJVfE4CDs/2RGC1T5eFsgO/swXqMget0tEx5JTwD
 J9MC0QrnpB1OpF4yIIjhYmepQfL55xaDar5Hc8pSiTTjefWsoosa6FZwF9GP6G5Qe7dM
 7arg==
X-Gm-Message-State: AHQUAuZHi70cQUDyKwPwHRulJk13NhfKc+cGkguYUZ9n93cYtSr7DaM3
 T+GKtFkY5yyVITkd2CUl+G+XCyytfCNYg6mHFyo=
X-Google-Smtp-Source: AHgI3IYcbWPRLTikDj12GzHm+1A5fNYMQKFWw19TmuAfv8iELLNvooOBFzKZzeXRdXDOOecEZnO10EINdSBosb2LxRk=
X-Received: by 2002:a9d:6314:: with SMTP id q20mr4468640otk.348.1549671854006; 
 Fri, 08 Feb 2019 16:24:14 -0800 (PST)
MIME-Version: 1.0
References: <20190119205121.9621-1-martin.blumenstingl@googlemail.com>
 <095d0dca-f8d5-df7c-dbd0-7c2c50fcab82@baylibre.com>
In-Reply-To: <095d0dca-f8d5-df7c-dbd0-7c2c50fcab82@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 9 Feb 2019 01:24:03 +0100
Message-ID: <CAFBinCCrYrxnb6Dk-0kGwbk0ttwe+je+wKZqxe6GUASnNdAckQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] clk: meson8b: fix typo "ABP" -> "APB"
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_162415_395986_CC6791BD 
X-CRM114-Status: GOOD (  16.32  )
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, sboyd@kernel.org,
 mturquette@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, Jan 21, 2019 at 11:40 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 19/01/2019 21:51, Martin Blumenstingl wrote:
> > It turns out that I'm not good at spelling "APB". Unfortunately an ABP
> > (instead of APB) typo snug into two clocks in v5.0.
> >
> > Currently there are no users of that clock yet, so fix it now
> > before it's too late (meaning before it's used by <something>).
> >
> > I decided to go the "normal" route where we can have separate
> > branches for the dt-bindings and the drivers in the clk-meson
> > repo. This means:
> > - new (typo-free) clock #define
> > - change the clock controller to use the new #define
> > - (next development cycle) drop the old #define
> >
> >
> > Changes since v1 at [0]:
> > - split into a dt-bindings and clock controller driver patch
> >
> >
> > [0] https://patchwork.kernel.org/cover/10742001/
> >
> >
> > Martin Blumenstingl (2):
> >   dt-bindings: clock: meson8b: add APB clock definition
> >   clk: meson: meson8b: fix the naming of the APB clocks
> >
> >  drivers/clk/meson/meson8b.c              | 26 ++++++++++++------------
> >  drivers/clk/meson/meson8b.h              |  2 +-
> >  include/dt-bindings/clock/meson8b-clkc.h |  1 +
> >  3 files changed, 15 insertions(+), 14 deletions(-)
> >
>
> Once rob acks it, I'll apply both to next/drivers since it's not used (yet ?)
> and not a critical fix.
I have just noticed that I forgot to CC Rob and devicetree@vger.kernel.org.
do you want me to re-send this series?

as you already noticed this is not critical, so taking this through
next/drivers is fine for me.


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
