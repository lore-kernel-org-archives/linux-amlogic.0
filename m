Return-Path: <SRS0=4XcC=CC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 739A7C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2020 13:58:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39739207CD
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2020 13:58:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BJKItRPR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0r8fn3r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39739207CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RwE3W1LC9+1lptxYLweSq2HXkmbcRVvQkNpBN3ItJKc=; b=BJKItRPRvjqGNnNLPmfZIJ0v6
	EOtEaGpJMOUKZqfnRB3WMsJrOpu6wYo06LrlBJ2+5X7mLeYozh1oFgCgmkCTJTGP4zpLN+gwZ45Xa
	9XufnRGEcAeJCNbmcg/FOBceXA5OJ4umux452914boho0vkWn8WnkrvV+OZVNA7eAiIjTT4Ucy4ET
	MoDXvTsehlayajw+K0NDKrtuayxWapXnyLM2VfAK42DarF21KRdSGRUe5qYTFjQhayjPAkAXkSWWq
	Q8PC2qtzofHQBCK1qItYj/p4//2ZQAC21gk3UPBzdrGbggHqJFh8dVk1Md6pZgCzt7XWtdbg33K/1
	PVyblX5AQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kACyv-0006tF-P9; Mon, 24 Aug 2020 13:57:53 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kACys-0006sF-BE; Mon, 24 Aug 2020 13:57:51 +0000
Received: by mail-io1-xd41.google.com with SMTP id z17so8708944ioi.6;
 Mon, 24 Aug 2020 06:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dMeguMm96pDyAxCNEWFE6tm74xeCtyVll4TegHbBwcA=;
 b=C0r8fn3rtGIqTXG84StIGa8c91BO2qgo5z2OsnJIDt20bxO6byuQwT0b3H7LNVi4+C
 JYOeUYLo93Uh9C4ggps/W+xiOllb82xPFhAXp+ZDFhEgLNWn1Z2ywvLhlI5WKSM4nWG8
 LKZWhCU7GH2RsuRywILfNLk4V2vrVl0LpAv3pcGjmDd1sHscEiQNR5pSztBq0HRDd39v
 e/11XBOxxXcovZVWfgSd5OtLpqHywfeTktXPV6/JQH24XpppLdTXhogkHUYkEwFa6fN7
 duzHCqU3vJBWxQI2Ezm1rp+Pgv/WH4JnC6fNJcCZVDa2SqeuF+LqEYfPxNGAO1tXEYF5
 vfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dMeguMm96pDyAxCNEWFE6tm74xeCtyVll4TegHbBwcA=;
 b=Jck0uam6ry2kDHMl4ttczI2GEmqFBO/e2V28VActzFDHkSdp5sBOrRlQ17hapIJ2Am
 TwLNWahQtO5coMWSLJZmOjgK7LJ0JwgCnQlU9GH5NFr8mqqqXyvtBEbke1SX8LaGPQw0
 B6pJKb2NA4fBqG7TczsMD9S3J88EMVbalziBBWGue+WIdWG7vMCsEA62eh1ZTZIt4yKi
 tYZMbfHlUBk54+F5XevqSNHJhuXuj4B3JBmTUGfDhTuuXt3SXcTe07aXP5U48gl2fFgK
 PJXpvzfTymCwAc/MhON6SwOFEKDp7xTye+ADbV2GKmR5/1s7R6ENP9kYokL1n7lEcv2Q
 N16Q==
X-Gm-Message-State: AOAM532GiF1au9WOjdVTLfGUPRstbCAKZqIVajVSSRdN9zWGgb4Dsclh
 ugR27GrotH3g1a+ZUVcb16lzO1JEi1nllQA05yI=
X-Google-Smtp-Source: ABdhPJxv7Fzjo4etNqTn4asSi5M9XwBcfHBkl94QtZjSYX2e0e/pRxGvEnYwh72t4jk6oMt1yyR0pJZAEKXCjQqimjw=
X-Received: by 2002:a02:a90f:: with SMTP id n15mr5809057jam.120.1598277468498; 
 Mon, 24 Aug 2020 06:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200820121323.564-1-linux.amoon@gmail.com>
 <20200820121323.564-2-linux.amoon@gmail.com>
 <7hlfi9xgch.fsf@baylibre.com>
 <CANAwSgTZ23jFPAO46vRg1Dx_Bzi=4Bg6KHE0ozLQGky4p_fgKQ@mail.gmail.com>
 <CANAwSgQLnqDnuQvLv4cvaeTPeBW=H_g5F2aaNue_hb4nKLdovg@mail.gmail.com>
 <f7e6ce5f-02b0-065b-ffcf-2826159f926a@baylibre.com>
In-Reply-To: <f7e6ce5f-02b0-065b-ffcf-2826159f926a@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 24 Aug 2020 19:27:37 +0530
Message-ID: <CANAwSgRm3yKgqrW50L0w4bzhrGF1GNe08oMgd4T59uK1D=fb=Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_095750_425850_7F269C56 
X-CRM114-Status: GOOD (  21.02  )
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
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, 24 Aug 2020 at 19:20, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 24/08/2020 15:41, Anand Moon wrote:
> > hi All,
> >
> > On Fri, 21 Aug 2020 at 10:13, Anand Moon <linux.amoon@gmail.com> wrote:
> >>
> >> Hi Kevin,
> >>
> >> Thanks for your review comments.
> >>
> >> On Fri, 21 Aug 2020 at 01:03, Kevin Hilman <khilman@baylibre.com> wrote:
> >>>
> >>> Anand Moon <linux.amoon@gmail.com> writes:
> >>>
> >>>> Enable RTC PCF8563 node on Odroid-N2 SBC, In order to
> >>>> support the RTC wakealarm feature for suspend and resume.
> >>>> Also assign an alias to the pcf8563 to rtc0 and meson-vrtc to rtc1
> >>>> timer device to prevent it being assigned to /dev/rtc0
> >>>> which disto userspace tools assume is a clock device.
> >>>>
> >>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
> >>>> Cc: Kevin Hilman <khilman@baylibre.com>
> >>>> Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
> >>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> >>>> ---
> >>>> Changes V3
> >>>> --Drop the INI GPIOAO.BIT7 pinctrl.
> >>>
> >>> Why did you drop this GPIO?  Isn't this the GPIO that the RTC uses to
> >>> wakeup the system?  If so, this should be included as part of this
> >>> patch.
> >>>
> >>> It probably still works because the bootloader configures this GPIO as
> >>> input, but the kernel should not rely on the booloader for that, so
> >>> please include as part of this patch.
> >>>
> >>
> >> Ok I will figure out the correct pinctrl need for this settings.
> >> looking into the Odroid N2 schematics.
> >>
> >
> > I am trying to map the RTC INT pinctrl, ie RTC INT GPIOAO.BIT7.
>
>
> Simply add:
>
> interrupt-parent = <&gpio_intc>;
> interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
>
> to reflect the interrupt connection.
>
> No need to setup pinctrl here since the GPIO input is always connected to the gpio irq generator whatever pinctrl mode is set.
>
> Neil
>

Thanks for this input.

Best Regards
-Anand Moon

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
