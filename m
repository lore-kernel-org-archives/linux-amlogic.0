Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5840C61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Feb 2023 11:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4mVRt2ftydr1/l4cb8wkuTav7ju0Sb34jrr/wkigNI4=; b=WGLxzD/bk99SNj
	1rTajU8yOP1ppWJWuinSnMZGZDFlo7jRrgx2a6gVAWDB/T7bMR/sbCl5WZCYE57deGX87FJZhJtfh
	P06iGbGvr/IbENcAi0AaqPk8ymcoglLDrhghX+ON04vWwW0xRTmVJCNVg+O82L3zKM24nsL/74X+P
	ECo6cPpaZTjhATPRX/SJxZWmcBK3b2NhHDPW6ZSQR/D7Wv3Q+U46SDhJFWY5jkgRlQRFqmvwMbKMI
	OfKPFWKE0rVsNBgaiGRkuMr4L8Oed61AwybUMejenzbf1o5LkCTBUbuDCRJ28Y2C6eHZwgpe2F6Kw
	rqN8WuvcODz/Qd6XL33g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pScE2-009tTS-Jz; Thu, 16 Feb 2023 11:14:54 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pScDz-009tQs-0R
	for linux-amlogic@lists.infradead.org; Thu, 16 Feb 2023 11:14:52 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 24so1030439pgt.7
        for <linux-amlogic@lists.infradead.org>; Thu, 16 Feb 2023 03:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Avjd1bSEYKBQwiRvP4rk5Jz5oyYwjLMshH18syYNq5w=;
        b=q1uY/Gu9ekbGw6hR893QCGaPMNAg9e6rZrsqIVmLBZPMPvMv1e7cvQZnW7ll67JAv9
         qrekBncHqxl/kpnyJY3U1H6RK0ju6WQi+/nbWjntgoHbij22DP6/9r42E5eLJj1tCh9v
         HE/L16XXH2eunjWebl76ACP0flcFcAJRlzHaxtgbyUle7Nc896L3sZ5YrIGNj3sB3kMb
         WLEjWF270rOLYzJAEihSGF4l4kxHZ4pFtkJ3+4Q0+TVWbhJGwO+qfYrbCFHkE57/XzPU
         CgJoLKFrEyAaiXKUcsuSiBR9AMDkmHWNHjN2W6XMwautll89kBNvNG04Yyxab0mYTIPn
         Qy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Avjd1bSEYKBQwiRvP4rk5Jz5oyYwjLMshH18syYNq5w=;
        b=hy9fcHks5ty62Iqm8lxXcrFxKOx+2Lwv//O2Eu8wbQramyLietzaCVzF5V+XBSb987
         clfRrRdM8CiI1xvAK/sdB5RvF3oLxi9aSA6d1j8YZObrxeymVazTHm+uIF0w3hC7MwW5
         leRJaA3MzBd8MfEGbGhKvAQCjsR5Fu/rS1KZ4hKIuzo2egxrcG0O5PFG20mgwXPyRyhc
         Whuex7mi2I/KRTlMBmtfVfJGJ1iJ0rRoefTNsvL1irCcmQmoYBRjBR/B0E9Q1qCZKmGI
         jNVqnMxDkt8DP0s2sv16x4iAP1t5MuUGF9jM8g0wlF91BPUTvVHUrV48n2OAU8fr5wp3
         Nnmw==
X-Gm-Message-State: AO0yUKV9CD85yZigcWTEQyrISpojky9nvQSgEUn4SKpQBD8Mo1q2UYIQ
	ZnhOp9pJXqaci8xuI39b8GppxHCAJS+CnNOKrG/iVw==
X-Google-Smtp-Source: AK7set9jfIQb4YfFa1aI3LxnksHzAibjPxuDbZDPL2EwpTo+AnXmUsqWbePsGPMjqBdeGZEbrI+E1selRjGfj2UlJzE=
X-Received: by 2002:a05:6a02:28c:b0:4f1:cd3a:3e83 with SMTP id
 bk12-20020a056a02028c00b004f1cd3a3e83mr233413pgb.3.1676546089229; Thu, 16 Feb
 2023 03:14:49 -0800 (PST)
MIME-Version: 1.0
References: <15df9ef0-9b73-ca5a-d3cf-0585cd135bc5@gmail.com>
 <CAPDyKFroB-TULOeia4OyXBW6rWMs7e3_Fp4Uw878Q8Gt=TDfag@mail.gmail.com> <48b4a87a-c5e9-c3ec-2492-bb2afb495398@linaro.org>
In-Reply-To: <48b4a87a-c5e9-c3ec-2492-bb2afb495398@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 16 Feb 2023 12:14:13 +0100
Message-ID: <CAPDyKFoWyPHV2_EgxLrDu8EPVsS1gtTfdd4=QnsEuMr9wvGeJw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] mmc: support setting card detect interrupt from
 drivers and use it in meson-gx
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_031451_098686_D7105908 
X-CRM114-Status: GOOD (  15.64  )
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

On Thu, 16 Feb 2023 at 10:18, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 15/02/2023 13:48, Ulf Hansson wrote:
> > On Tue, 14 Feb 2023 at 22:39, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> >>
> >> On certain platforms like Amlogic Meson gpiod_to_irq() isn't supported
> >> due to the design of gpio / interrupt controller. Therefore provide an
> >> option for drivers to pass the card detect interrupt number
> >> (retrieved e.g. from device tree) to mmc core.
> >>
> >> v2:
> >> - use another mechanism for passing and storing the cd interrupt
> >> - add patch 2
> >>
> >> Heiner Kallweit (3):
> >>   mmc: core: support setting card detect interrupt from drivers
> >>   dt-bindings: mmc: meson-gx: support specifying cd interrupt
> >>   mmc: meson-gx: support platform interrupt as card detect interrupt
> >>
> >>  .../bindings/mmc/amlogic,meson-gx-mmc.yaml      |  2 +-
> >>  drivers/mmc/core/slot-gpio.c                    | 17 ++++++++++++++++-
> >>  drivers/mmc/host/meson-gx-mmc.c                 |  5 ++++-
> >>  include/linux/mmc/slot-gpio.h                   |  1 +
> >>  4 files changed, 22 insertions(+), 3 deletions(-)
> >>
> >
> > Applied for next, thanks!
>
> A bit too fast. Binding is incorrect - suggests ABI break and makes
> interrupts not described enough.

Sorry! Thanks for pointing this out. Heiner is fixing this with an
incremental patch on top, please help to review.

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
