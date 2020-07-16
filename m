Return-Path: <SRS0=svws=A3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA01CC433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2020 09:13:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8207F2063A
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2020 09:13:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P8pViuZW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgTKv8iI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8207F2063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H2LrrNfEpZVSFAHkfO72MRRbMBpx4mEY83bjtYEcgZg=; b=P8pViuZW4P3hUD1K09vXQghKV
	EF/vzglkvpiAEmPIArfnHBz1+9ns+/fYgg+Izcv1pQMpaVrXUg/2gy1IoDJLzj0ZdCFCdwcpB2JoU
	pxKAJiLx6bGYCr2TcUJrMMlGaZyQjJ4ZS/SAKrj2Phgjhn00cArGQxFoeI5UVCCu+mvzch0/p5P3J
	KkCZAxaQWJp549PS40Zg93Iw8zvantaWBEjlnfok7NNxqohFnjkGcG5IcrOf6g8vzdrLXcjYebCw0
	aV9wLqFHK+R7PfV3DONmJziVFreV+nHM4WU3I8XMxVuz0z7fMKC18b7bsg5WooRyV4jHbcn2uY8G5
	fHBLYW3jg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvzwu-0004nS-7u; Thu, 16 Jul 2020 09:13:04 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvzwp-0004mW-OR; Thu, 16 Jul 2020 09:13:00 +0000
Received: by mail-io1-xd42.google.com with SMTP id a12so5228366ion.13;
 Thu, 16 Jul 2020 02:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s74d78nNzzAcB3E4FUhQIXK5reurauqlSlj+2GltzQM=;
 b=YgTKv8iIoVV3jDnayxciYMeKjoOo+eEWeK//VZvJ9AxohvPu/0TW6PB1AEF7d345Yp
 38fXLypUh/xg14+GXauMqEANBtGsjGoJVYQcM6Tyrp8oyTfd10ctS4YeR8NWr7/BH0//
 ZzNAEPhRnbhu6Vje3N9pXfagQlP9F2egvcpoUaQDy7EtmsTJFArBLsSIqYEoO+dj6Zxj
 ekoNX6pYp781pHtZiF4DCbIqIsf0AEyYjP6Ll0qOMazh7rDp3KHd+3Z81ujN7y9T47JH
 UvyoOrr/Q9msl/SF86/vDeTLRZWNzDf6g8OYCIFDS5mqC2SqQv7/oW4KARwmet4KTP8D
 x33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s74d78nNzzAcB3E4FUhQIXK5reurauqlSlj+2GltzQM=;
 b=m0aRko/UcXJc6By8lapK9qwLMuWtmHhK1ZIX0jud7phdvPo5ERyby3dgwtD5sxxcs/
 4vlEoWqR7mJ9T22Lw6h8QshWohoTb+dLtnkhTQ9CHcFjnDVyh3MI9MKKEYHlJ9/n5qCv
 lElDFOuAAjKWtYZOQVV3KSzvp0jAHbVWe8mKC++1lBjmDAbfWYP06O/M0e9NFsQD6clL
 AcVHL84nmA9AdTRavsHC7WeNZyenp732BQh+bCNyTLPsJG9DbFuWtSw9EsP33HNEYKCs
 mlXJyJaGrfaNZxokGNUmnnoOhbjCFwVDfp+KYJl5Luvc5gtcm2g7OWB4238o8IXUz7zw
 VrXw==
X-Gm-Message-State: AOAM531Ap3tcZfIx36ShOlLxHcTY2L8fZpd1k8M7EU9kZGCWIKjOjQm5
 +E57IaQkBNt6CrkaEuYk3rY9VrkXq2YrVsocPtI=
X-Google-Smtp-Source: ABdhPJxVRr0StWt2vwHi7znILhAtGxQ8kecU9yRw9CdKjOzAPGbKtkPQLkR/aT1RulZCUh6cmbaYrwiRZqzvPJIa+MM=
X-Received: by 2002:a6b:b4d1:: with SMTP id d200mr3490972iof.128.1594890777717; 
 Thu, 16 Jul 2020 02:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200715160209.652-1-linux.amoon@gmail.com>
 <20200715160209.652-2-linux.amoon@gmail.com>
 <1j1rlbg9uu.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j1rlbg9uu.fsf@starbuckisacylon.baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 16 Jul 2020 14:42:47 +0530
Message-ID: <CANAwSgQtjh7g1zDdU4q0HBJ-apXHW36pOMcQdLQs84U_KA=84A@mail.gmail.com>
Subject: Re: [PATCHv1 1/3] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_051259_847942_DCA653D0 
X-CRM114-Status: GOOD (  18.48  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

Thanks for your review comments.

On Thu, 16 Jul 2020 at 13:38, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Wed 15 Jul 2020 at 18:02, Anand Moon <linux.amoon@gmail.com> wrote:
>
> > Enable RTC PCF8563 node on Odroid-N2 SBC, In order
> > to support the RTC wakealarm feature for suspend and resume.
> >
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Kevin Hilman <khilman@baylibre.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > $ sudo hwclock -r && date
> > 2020-07-15 13:11:53.862508+00:00
> > Wed Jul 15 13:11:54 UTC 2020
> >
> > $ hwclock --show
> > 2020-07-15 13:17:30.903300+00:00
> >
> > But RTC wake up is not working at my end.
> > Any inputs are welcome.
> >
> > $ time rtcwake -s 30 -m mem
> > rtcwake: /dev/rtc0 not enabled for wakeup events
> >
> > real    0m0.002s
> > user    0m0.002s
> > sys     0m0.000s
> > ---
> >  .../boot/dts/amlogic/meson-g12b-odroid-n2.dts      | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > index 169ea283d4ee..a447cba4dd53 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > @@ -391,6 +391,20 @@ hdmi_tx_tmds_out: endpoint {
> >       };
> >  };
> >
> > +&i2c3 {
> > +     pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> > +     pinctrl-names = "default";
> > +     status = "okay";
> > +
> > +     rtc: rtc@51 {
> > +             reg = <0x51>;
> > +             compatible = "nxp,pcf8563";
> > +             #clock-cells = <0>;
> > +             clock-frequency = <32768>;
> > +             clock-output-names = "rtc_clkout";
> > +     };
>
> This rtc being on a connector, optional and not fitted by default,
> should it really be enabled for all odroid-n2 ?
>
> We tend not do that usually

My thought process was there will be an Internal primary interrupt pin
that handles
RTC wakeup and is connected to the CPU and IO peripherals..

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
