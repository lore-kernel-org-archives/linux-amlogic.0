Return-Path: <SRS0=YI5+=XS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F129C3A5A6
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 09:29:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10F9A20673
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 09:29:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IcpjE9MB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="i37B/Zfl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10F9A20673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q/RgMTmaR5B4icLxsDQzB3mbbQUCMtNhkjogS79AIu8=; b=IcpjE9MB4CrY8g
	IB8CvAzBJcXTAtKo4mO/xa25TfN2Jy/qbnMVOKiUgSZk/w8po/NZIw+tLztrLgFwniP2N8ObqmLTM
	RiqwIVlx9Kl0kbKrshfCo03TM6I94xFO4eQcIvrBRuVulbzJ4w4A0ZFRt8GzmcezhgTjGwWE8uq/d
	kawvtDXHc06XXv0PVSYvXrs4uXqe0ADiT7FU2HaAyQxwVEuVVQsjxawui4vP5TB9fDn4TgiQDUt44
	FdaSfLRPedv0HIvJbk666bPDQ6Xni+73p5R6qjdSBSoNLRZUSga8rN5jHzI8KiiK+jfcdJbxX6C4G
	bjhL16Aa7+oQ7F/6QEqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCKeZ-0007N1-J8; Mon, 23 Sep 2019 09:29:07 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCKeW-0007ME-Us
 for linux-amlogic@lists.infradead.org; Mon, 23 Sep 2019 09:29:06 +0000
Received: by mail-wm1-x341.google.com with SMTP id a6so9007567wma.5
 for <linux-amlogic@lists.infradead.org>; Mon, 23 Sep 2019 02:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=GEpINich1yHe3dgZoPsu7jVZJFRHWW9gHMhxo+QabyU=;
 b=i37B/ZflJfkoKuajMXjNBpIfwnDxpv2aCG8IlKdAD2ERPODOixf2OFXEjZMczk7Rbg
 uQLUHo8E1xjO/JL9H0/3eszTjCSzplCQRPgPQnJFhFCFiLcxFh48ai1/KWwFfNWe0vZB
 2nrg6RtcVBh9xq04+xtpyxGbxKhLWFyJ4PXvghuAvXqJK4fpELjI22nwS8Br6ZJFSEqI
 0Ob7+mzq5cLJcSN5kyfDi7lNDh8b0gVoLhy9eaKKdUmbIvj+hR6PfTnwpEU9Y7Jf++bk
 5cVo/4ER7i0Dsz5syGQl5IQvxwpNc1yKuo5BPmbMtu+q2DyJIZpwObIkNpcSG+Gsvx+B
 0qRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=GEpINich1yHe3dgZoPsu7jVZJFRHWW9gHMhxo+QabyU=;
 b=JWv3Og9Ean8DGAOp8qK1VRV+lS1QhKTKuwcNYfRo48Dq4TH0B71U1cDVHU/NASP7Ku
 GwDVxDTOJYuOdwnrTWiIKanx3q01GhMLiTI82Vs9sp6t2VC4JyfxfHt3eVhP8vr7+Fic
 0H/rrIy0FxwZmFr3/T1yYpFnjzWAqUPoqFSb/JR2YJ930/lcG34CCA0IYWmwZRs9VbfJ
 tcFyOYehTo69YKpF3txDw9Q6AXnwb6qpLBPtuPrft57i0YbZPb4adgaptQNhRI1fY5pc
 p6kMwAhOnsm0rQwLu+Xte9LQbXyhRtpUxiYLIUxKiPwTupl0m7BoTrDL/uu5PGzPo23I
 rxag==
X-Gm-Message-State: APjAAAXCaBe6+ne8bcAcBpoHX4I7zFF99K1gY6A2NvR0mgwK+JO6lVy1
 nL4PEtGGJocJyCOnfo4ZcufP9/oeVa305Q==
X-Google-Smtp-Source: APXvYqzJCTFPvn4OkSp1B7p5RsJXP7ouCiApbSz9+KpAzUBc/BCRGheeUmLPmjYjv5eRZC9qVVnXRA==
X-Received: by 2002:a1c:4384:: with SMTP id
 q126mr14214521wma.153.1569230943323; 
 Mon, 23 Sep 2019 02:29:03 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id b194sm18418427wmg.46.2019.09.23.02.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 02:29:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 narmstrong@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 khilman@baylibre.com
Subject: Re: [PATCH 0/5] provide the XTAL clock via OF on Meson8/8b/8m2
In-Reply-To: <20190921151223.768842-1-martin.blumenstingl@googlemail.com>
References: <20190921151223.768842-1-martin.blumenstingl@googlemail.com>
Date: Mon, 23 Sep 2019 11:29:01 +0200
Message-ID: <1jzhivs6n6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190923_022904_998185_CCEA7E8B 
X-CRM114-Status: GOOD (  18.19  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat 21 Sep 2019 at 17:12, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> So far the HHI clock controller has been providing the XTAL clock on
> Amlogic Meson8/Meson8b/Meson8m2 SoCs.
> This is not correct because the XTAL is actually a crystal on the
> boards and the SoC has a dedicated input for it.
>
> This updates the dt-bindings of the HHI clock controller and defines
> a fixed-clock in meson.dtsi (along with switching everything over to
> use this clock).
> The clock driver needs three updates to use this:
> - patch #2 uses clk_hw_set_parent in the CPU clock notifier. This drops
>   the explicit reference to CLKID_XTAL while at the same time making
>   the code much easier (thanks to Neil for providing this new method
>   as part of the G12A CPU clock bringup!)
> - patch #3 ensures that the clock driver doesn't rely on it's internal
>   XTAL clock while not losing support for older .dtbs that don't have
>   the XTAL clock input yet
> - with patch #4 the clock controller's own XTAL clock is not registered
>   anymore when a clock input is provided via OF
>
> This series is a functional no-op. It's main goal is to better represent
> how the actual hardware looks like.

I'm a bit unsure about this series.

On one hand, I totally agree with you ... having the xtal in DT is the
right way to do it ... when done from the start

On the other hand, things have been this way for years, they are working
and going for xtal in DT does not solve any pending issue. Doing this
means adding complexity in the driver to support both methods. It is
also quite a significant change in DT :/

I'll defer this one to Kevin

>
>
> Martin Blumenstingl (5):
>   dt-bindings: clock: meson8b: add the clock inputs
>   clk: meson: meson8b: use clk_hw_set_parent in the CPU clock notifier
>   clk: meson: meson8b: change references to the XTAL clock to use the
>     name
>   clk: meson: meson8b: don't register the XTAL clock when provided via
>     OF
>   ARM: dts: meson: provide the XTAL clock using a fixed-clock
>
>  .../bindings/clock/amlogic,meson8b-clkc.txt   |   5 +
>  arch/arm/boot/dts/meson.dtsi                  |   7 ++
>  arch/arm/boot/dts/meson6.dtsi                 |   7 --
>  arch/arm/boot/dts/meson8.dtsi                 |  15 +--
>  arch/arm/boot/dts/meson8b-ec100.dts           |   2 +-
>  arch/arm/boot/dts/meson8b-mxq.dts             |   2 +-
>  arch/arm/boot/dts/meson8b-odroidc1.dts        |   2 +-
>  arch/arm/boot/dts/meson8b.dtsi                |  15 +--
>  drivers/clk/meson/meson8b.c                   | 106 +++++++++---------
>  9 files changed, 87 insertions(+), 74 deletions(-)
>
> -- 
> 2.23.0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
