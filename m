Return-Path: <SRS0=tAAW=MW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90182C4338F
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 18:48:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5611060F12
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 18:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5611060F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p2duZuyehH0uBcbqPT9PkfEq415iwP5iVkoedKE6dDE=; b=0saF+mkRbNgNyz
	TN7fiVuL3GJ4s5f3Liblb+DjLismZq0OaF3M8NQchfAI77AjLnXC7B+zgfUXPUr6iqKVB+F/hJwiO
	d1baZzAM0qA0IGInv+GxhFwk72r1ZoyAY1XIxQ3fPBbTnw2J687SFfzPHv4YDOCXgPE5wM5UpEEgk
	seyAaKK9sqXEQUb+EadYn0B3aZsS3xEUrF76ogcRQBCfvr+5VwfEPYQ+6RJp48G97CF3aCP/5Qtxw
	WRBzoy9uXEIlmJO3WSXwg0fghMzDspWdpxmDiQ+m886SJAn8jbYBBbRMX4ULYQiC9OHCdjt5l+gVM
	QKtaNbIa0d98KgQVsT/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9XYy-009yh0-8L; Fri, 30 Jul 2021 18:48:52 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9XYk-009yfL-AH; Fri, 30 Jul 2021 18:48:39 +0000
Received: by mail-ej1-x633.google.com with SMTP id oz16so18469504ejc.7;
 Fri, 30 Jul 2021 11:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uqEJ2tVk3zcOiShzikPvptoGMxHSTS5A52RutoFqS7U=;
 b=VNTu8gtySpaaA9sS+BurTr8F6HP1kt3TtaG4MO5SiuRWtmvH7Sakptp3Na+wiVsa/s
 2Y4mylYfnuM0mgcDzsgHIhomZVBtEHzHlkEeSaLecHZbynPSffYazJ8t0eP/i9csiEii
 6JL9U9aRmmywVGZ+XCUSFeMacWg/AVZaUvGaYkUlJbZyrqOu1KeesnWEl++Kv+O86JLA
 rPKlUEALxQp0A8anLlu/17bvg7zST/3nzp2t5YecKTzuyvXkoD7Wdv6XcNz2gL4SMQ7b
 o6MkSsXFpIE1XNLLI4CvNGbcJWKdiKgsMrbFf5eW5kDMsmD7ZJajr+a7NJDISKaaxgO1
 NLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uqEJ2tVk3zcOiShzikPvptoGMxHSTS5A52RutoFqS7U=;
 b=I7gZkkAsDQz9w1+UTQQloI1xQx53pJMrlo7fCndX8QNIMqrqkFNGuHMvy8kkCIcNMf
 RXFsggFYDleX32aQU54gMCxaAR8xiZRlXW1SYG8MQh3Py//LX+x5QJ4n0ushs6xMM6su
 7vyTCoKGyaebs61g8Wmy0W+7EG5iFqNd4ROxMtQSr+9nP81ynzPQCAu+14xaSEgV74GO
 8LkSqsCgpT7Kam0ti1xU6NL1G9ZMPjnp9Xyvc5Zvj8HrIE185YdxYuD2WWV8ksCfP/TE
 wsIF+UQAmFWXHqyz/67MkX/dmRNbNgmZHPwDMELKa5LpvEdvgFXfVZGT+pm6+R9a29+h
 I+1Q==
X-Gm-Message-State: AOAM530g1KUit+lgJUW1Cgw+7EEolx/zqUTosHFSrSHOQqtRtFzqKqu7
 F655fKkWEPV8PlMZ71P2rfbX9LZaA/cu5alN4jU=
X-Google-Smtp-Source: ABdhPJxgQtN17xHqQ9vhmBTo79gnekMn6vV9DVxYUb4Z8lYNCc/M1ZY0V2WSXXxuXrzrj3X0lwDN3T2Pea8nFfVmiLw=
X-Received: by 2002:a17:907:7848:: with SMTP id
 lb8mr3992214ejc.494.1627670914923; 
 Fri, 30 Jul 2021 11:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210729201100.3994-1-linux.amoon@gmail.com>
 <20210729201100.3994-3-linux.amoon@gmail.com>
 <a360877260a877819ad8eef7f63c370e0c16c640.camel@pengutronix.de>
In-Reply-To: <a360877260a877819ad8eef7f63c370e0c16c640.camel@pengutronix.de>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 31 Jul 2021 00:18:23 +0530
Message-ID: <CANAwSgSHFfzq4BYZN4wRUWcfc8+G5X9MvTUJu86MGBGFfQPSYA@mail.gmail.com>
Subject: Re: [PATCHv1 2/3] ARM: dts: meson: Use new reset id for reset
 controller
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: netdev@vger.kernel.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, 
 devicetree <devicetree@vger.kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_114838_403342_7564644E 
X-CRM114-Status: GOOD (  20.64  )
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

Hi Philipp,

Thanks for your review comments.

On Fri, 30 Jul 2021 at 15:16, Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> On Fri, 2021-07-30 at 01:40 +0530, Anand Moon wrote:
> > Used new reset id for reset controller as it conflict
> > with the core reset id.
> >
> > Fixes: b96446541d83 ("ARM: dts: meson8b: extend ethernet controller description")
> >
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  arch/arm/boot/dts/meson8b.dtsi  | 2 +-
> >  arch/arm/boot/dts/meson8m2.dtsi | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> > index c02b03cbcdf4..cb3a579d09ef 100644
> > --- a/arch/arm/boot/dts/meson8b.dtsi
> > +++ b/arch/arm/boot/dts/meson8b.dtsi
> > @@ -511,7 +511,7 @@ &ethmac {
> >       tx-fifo-depth = <2048>;
> >
> >       resets = <&reset RESET_ETHERNET>;
> > -     reset-names = "stmmaceth";
> > +     reset-names = "ethreset";
>
> This looks like an incompatible change. Is the "stmmaceth" reset not
> used? It is documented as "MAC reset signal" in [1]. So a PHY reset
> should be separate from this.
>
> [1] Documentation/devicetree/bindings/net/snps,dwmac.yaml
>
From the above device tree binding is been used below.
  reset-names:
    const: stmmaceth

While testing new reset driver changes I was getting conflict with
reset id, see the below links
hence I opted for a new reset-names = "ethreset".

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/stmicro/stmmac/stmmac.h?h=v5.14-rc3#n12
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c?h=v5.14-rc3#n598

> regards
> Philipp

Thanks

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
