Return-Path: <SRS0=2I4g=RX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0F5C43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2019 20:39:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90344218AE
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2019 20:39:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hTBT3V9k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="jgf6sgY5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90344218AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RR5wJbKs4pOgpnUJyE2Eo8Fq4Vz7PLNoXSZ9X+KtN0s=; b=hTBT3V9kT8+Qwv
	Awil3HLpZ2yW4Qir/Lo30TQRG+x3AAmZKNJhwwIWZBIVepo1Xodu9wOpzlvvBxB9lQaReRflo5mGB
	Bgs797AqdsOoxWJzcCUfNooo2QfB3qQaZUfQxGmimnwt26RLv/i/0C8qPCmJwWheS0o/HGPKmowsB
	gwVQLlEzTg4WM+/VFR8h4PMINlb1II3Fzlffoj3KHuywo8FvQj+Z/p3bBmEjOrQzKdMRBHK9PQlo9
	xIRvHMrMuFLZxIwREbb5dLncZsZeG3gVfHTB1+8bPrnGxOaQgUaQIrojp/ZkVewkTQukGJBBmHe69
	ni84UUWLSOAux37iWGPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6hz6-0002ux-79; Wed, 20 Mar 2019 20:38:48 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6hz3-0002uL-VD; Wed, 20 Mar 2019 20:38:46 +0000
Received: by mail-ot1-x341.google.com with SMTP id e5so2439117otk.12;
 Wed, 20 Mar 2019 13:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lS28IOdb+N4OpJMYZwvSYBGAUmBgN2n51QXH6hhVFhw=;
 b=jgf6sgY5sBRNZVxPBkWf1m/XKBgEaqmQ48DjGNpRGX+vdmFXwJBj9akSYV+EplRRxe
 ysPz1XDDmPxcoN9CAcXJeRkbx1Q0Mwmh+Lkajs6TU1Qdd6aLQ9Dyz4QSh+SWgc36n+VV
 h/gQdgL1JNEW36icXHx/EdCTfxdJDajq9Ar/TfcTvfvrGrzRyOZAmxxU7CBROlvO3JoW
 HgZonX0ipUfG+mWtZuR7YVQtaSSs5bBs5BC1TUZfVOMKoURrL1iY6X8Qaf1FEEZXugm6
 1baueBQppbmVdPxWosUm41g1mq/m1Q9r9hpBtkfogGK70zAiIsWkaWm++yo4jKNUtpSq
 V9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lS28IOdb+N4OpJMYZwvSYBGAUmBgN2n51QXH6hhVFhw=;
 b=URyCyaV8p3uyPqRNbof+FPQcxS6ggUbNckV1cZZyKao9krCz6RH6nHZQDfU0a7MBmb
 1BYoOQ4sWrTX08IQSJ+6NUMkTt3w3lBEG5ijumKGQXKXpOkEqpRzf2Xh4BTMc+jrLN+M
 Lg1brUNi2+GpDYBpXc3OW7Zkn+zqLmby8ysz1/d524L2LxX7RK3r6MZx18lvVJDMgDkh
 b9fPvtQcEhkU65CmLPuHo/b0aRwkODwl7PJqW93AICbHVpOcjdbfuPjgMi2KQkiIQSbZ
 YfiUiCJMD5eyht/OYEAkrKJM/o7389HqTzhxCXhmH/4WVpWEhZ4tyw05nptibsv4SElB
 QRLQ==
X-Gm-Message-State: APjAAAUwa9/hdrcLAbyVvDSxd66r+yB3CnlT8wHCZSSjmPVL9K3UCbGa
 Im5kyrCax/Ba0n3der/oIK79fl1Ld9100o1vxAI=
X-Google-Smtp-Source: APXvYqwFxNQQS7bEDrTe9ECfwBUC0mZ+RR/Anzw/RLbwocF5qZ/7UmpTy8kZB+aaUb8YldwOu1GPgoMAnhbMr3JoOjM=
X-Received: by 2002:a9d:6306:: with SMTP id q6mr17150otk.86.1553114324569;
 Wed, 20 Mar 2019 13:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190319215121.29340-1-martin.blumenstingl@googlemail.com>
 <20190319215121.29340-3-martin.blumenstingl@googlemail.com>
 <1d52f584-1a5d-8b0d-ecd0-8c041f2b9c18@baylibre.com>
In-Reply-To: <1d52f584-1a5d-8b0d-ecd0-8c041f2b9c18@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 20 Mar 2019 21:38:33 +0100
Message-ID: <CAFBinCC61EgCS2djT2NZdYnGsHM1VS3_zOzaxSDyHGdguLCFyg@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: meson: meson8b: use a sparate clock table for
 Meson8m2
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_133846_031729_C173AF64 
X-CRM114-Status: GOOD (  12.17  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Wed, Mar 20, 2019 at 9:15 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> There is a typo in the subject "s/sparate/separate/" !
good catch - I'll wait until the weekend and send a fixed version then!

> On 19/03/2019 22:51, Martin Blumenstingl wrote:
> > Meson8, Meson8b and Meson8m2 implement a similar clock controller.
> > However, there are a few differences between the three actual IP blocks.
> >
> > One example where Meson8m2 differs from Meson8b is the VPU clock setup:
> > - the VPU input mux can choose between "fclk_div4", "fclk_div3",
> >   "fclk_div5" and "fclk_div7" on Meson8b
> > - however, on Meson8m2 it can choose between "fclk_div4", "fclk_div3",
> >   "fclk_div5" and "gp_pll" (GP_PLL only exists on Meson8m2, it's the
> >   predecessor of the GP0_PLL clock on GXBB/GXL/GXM))
>
> By curiosity, what is the default (maximum) setup ? On GX & G12A, fclk_div3 is the default/max setup.
u-boot on my Meson8m2 board uses GP_PLL as input (364MHz)
u-boot on my Meson8b (Odroid-C1) uses fclk_div7 as input (approx. 364MHz)
if you want I can look up the divider (I don't remember it from the
top of my head)

[...]
> Apart the typo in the subject,
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
thank you!


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
