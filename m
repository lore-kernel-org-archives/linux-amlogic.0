Return-Path: <SRS0=wsHT=B4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5734C433E1
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2020 03:03:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9340D206DA
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2020 03:03:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l+roYpiU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYHArkFo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9340D206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YSMAHrPN9GSCV+//h83RssUN3r2lGA3MbUC3cp3XIow=; b=l+roYpiUoXD6zqQopKL9JweYp
	DvHdxU9VFoaFIgr02tbg4hYIuauVCisjj5sfYrgG7TzUUmHDhaoVb+5YEgiVnfqMrrpBZsy5Jn0Ms
	iTWzl3CCHOuq5YXuAZb1wdPGJAJzhoZHvXaM/ob7ynZkHbBB9S+hOeCjK6uE8ufNVQm9YYyG3d0ne
	FfhOICyYTs+v7FG7P8Ey/jB192gl5P1ZY0WwJG15iAHOpPxm8uN/iRCsqcFuQ5I8eWlOpaD06Bu45
	B9IYMgkcE+QYB20ExRji4D6EvmcE3mqYNWdw7VEzpYzteIj3M13+OWzzPkBKXTeOCoGJ2dGLjTVRR
	nUW+/iqFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7ru8-0005w2-Vl; Tue, 18 Aug 2020 03:03:17 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7ru4-0005vL-Jn; Tue, 18 Aug 2020 03:03:13 +0000
Received: by mail-io1-xd44.google.com with SMTP id s1so6656330iot.10;
 Mon, 17 Aug 2020 20:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eKAWzYNYaU6JFfG0ymLmU9yELeTD/hTkpBoT+dVsEtU=;
 b=RYHArkFoy/sHeUDVoHzXXD3Jk6Kic4vQEVoeYDt3H1laHzpN0tD49E/Xj2tcnwyH/i
 W7BhVB4R1/h/02Y4qySmekwJTkK902ZrQGjjsX8Tzuug/oolz+2uynRYF9kV/WmP1MVX
 SbQYvJ0FwZV4NGBfX+zIGo34iJs5jkKDhLX+0oLjfn8H2k4XfSazLH4zwyDH4HjLpabE
 de5s7OWaGgfpP2a2YHRyZFuoz6cG3WcG+WHn/nBUqFqF+0TR4gB/4UJwWSfvP71gSJCt
 0ZD4cVFJ2j+AfyhezV5M8bVIjC1tkdhI4/JBSmOqRebcmwTBgIJ3wYvpZL4w7/eeOpq1
 svAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eKAWzYNYaU6JFfG0ymLmU9yELeTD/hTkpBoT+dVsEtU=;
 b=oz3iH4e/zpi2iHYIWmDXenVqdhaQGPdHFocE3PrgvLtBXRjqCVXZr5VSFjAmd81DvS
 iwg0f9/K7B/ctHCWjuhxW1/bsYKyHaxelhgrYkXM9XWMzP3jwU7gfBFEUi5Lb2HQ6Jzg
 TyjaTfPh9xHIdq9Pkb3+xvMk9mqiWEMeMfQK37Onu7plmb6Cu74GIwUNzQw+iJ/g9tYx
 6zphKMXsa9gx/t6XyiS438iebSKOq3K217UaVdVoX4mLSScX9in93dr7IDZyp8ZFQ4jT
 0qXOdJ9ksFycveLEIZvkQGl2vpj5ZtGpPBOZXmMqs+dnq4FvX/TtF62/VnTOn0uu16kI
 y1tg==
X-Gm-Message-State: AOAM530hn1Snf/Sr23DJwsqG0coxaikKrwtd2rWpHdwxJdGrH/yVYNDW
 TJoWk5NNOGY+MEnMZX2Cv6c7XvHf4LCNwBTdoio=
X-Google-Smtp-Source: ABdhPJwO3NPmdxsDbX920pGQbMgZOsuQDFoUtU5IZdNYu9vR7YhfgcpgJed/o9z/0DY6T5dFcWS4dYqSQanbT+uXjf8=
X-Received: by 2002:a05:6602:811:: with SMTP id
 z17mr14607839iow.110.1597719790018; 
 Mon, 17 Aug 2020 20:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200817102122.434-1-linux.amoon@gmail.com>
 <20200817102122.434-2-linux.amoon@gmail.com>
 <CAFBinCCYgm83Vs+dq6G4+1wv7T=S0mzt=gtLaHDfgBrCeRkk5A@mail.gmail.com>
In-Reply-To: <CAFBinCCYgm83Vs+dq6G4+1wv7T=S0mzt=gtLaHDfgBrCeRkk5A@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 18 Aug 2020 08:33:00 +0530
Message-ID: <CANAwSgTqAEyKFFan=opdF3MLtvkwj5MZ=oEizjeZNEfhL8ZzKA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_230312_720001_96EF3191 
X-CRM114-Status: GOOD (  21.04  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

Thanks for your review comments .

On Tue, 18 Aug 2020 at 01:06, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> thank you for updating this patch!
>
> On Mon, Aug 17, 2020 at 12:21 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
> > changes v2
> > --Fix the missing INT (GPIOA.BIT7) pinctrl.
> should I also expect an interrupt property somewhere below?
>
> > --Fix the missing rtcwakeup.
> > --Drop the clock not required clock property by the PCF8563 driver.
> > ---
> >  .../arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > index 34fffa6d859d..f08ae1b337ad 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > @@ -477,6 +477,19 @@ hdmi_tx_tmds_out: endpoint {
> >         };
> >  };
> >
> > +&i2c3 {
> > +       pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> > +       pinctrl-1 = <&tdm_c_din3_a_pins>;
> > +       pinctrl-names = "default";
> why is there pinctrl-1 without any corresponding "pinctrl-names" entry?
> also I'm surprised to see a TDM (audio) related pin function as part
> of an I2C controller. if this is correct then I'd appreciate a bit
> information (for example as part of the patch description) why that is
>
>
> Martin

Opps, I could not figure the difference between GPIOA_7 and GPIOAO_7 pins
I will try to figure out the correct configuration pin for this node.

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
