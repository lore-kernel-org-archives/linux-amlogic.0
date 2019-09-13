Return-Path: <SRS0=L2Ze=XI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A3FC49ED7
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Sep 2019 07:48:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE3E7214AE
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Sep 2019 07:48:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EBlwudRx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WJkm19FF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE3E7214AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NxpTbXENHUoaAncJ7S3+/X3xJAE6hDNJrJJ7iQjvwIE=; b=EBlwudRxASHjx8
	R60ThQqjAb5dvhwgXuwLIdm5pd35pFqbaGJnAqY7q5YjEyepGu3ddHY8A7kSUxLT/8L0ZEcgVSFsO
	0nCgius+LLAF9cOSBcYMQI26IOsPMVAGaGDHgia2s5rmhBzndRqncknUg0R9L7+oXeQMbkUZxi4dD
	vU4rUX6W8vPGOqxZiUTy7tO2EpwKZCZLJrf9j38aW8fxQIUlv9R/ndPQQ+REnWHp11qoVRbZSdVsr
	sQM+EVbkw0dONvI3gwKoNjTlJsROB1EIUmrhDyxwfklKO0fH2Qbkjh9tgcCBZa0v31xq66kcHFG8u
	1OLxWKnZMZM8v4gTQXog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i8gJA-0007fE-Pf; Fri, 13 Sep 2019 07:47:56 +0000
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8gJ7-0007dz-Hx
 for linux-amlogic@lists.infradead.org; Fri, 13 Sep 2019 07:47:55 +0000
Received: by mail-ua1-x944.google.com with SMTP id h23so8884827uao.10
 for <linux-amlogic@lists.infradead.org>; Fri, 13 Sep 2019 00:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BY3Xdm/EuEh+5xQuU5r1eTj+ek/4Ndp2HWrdgEDsjzc=;
 b=WJkm19FFgfc2GD6vL1mFJQN6LlvObf/GmbYBDNtuIIzm2tqbA9cMbf4vr4LQorJO/Q
 EZiMU05SVRjKv3jYbT3b9WhN25IIYPTSxoS56bRuaTpAtWiEVtIc8Spxw+BM5TKvPPeU
 XppVfL9AmQttSDSycCqcd77+sVw9EdQ15SSXzrczsbZ5qZzO7AFNaZQEvPf1JBPFT8e4
 GTU3DlXxwGRmMsGsbLyQcyiYxxNaSE2cXKAKyuMoOF2GBTfsW1RiO+xBKkVKEQJUFvfk
 RwLopqoFtujhyyjh23scuKoskkK/GRlHujIsHBn4bsklMNzeE2Pg1ac6lzQLkVZXLVXG
 SoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BY3Xdm/EuEh+5xQuU5r1eTj+ek/4Ndp2HWrdgEDsjzc=;
 b=C0JFMrPXsTDnistmftMAjp+t+8X7RmrXi3IfVu35L9BDmO3lX8PqXvBNCFERrO+eDH
 eGMEFttNMDRMF6YgWwlchkcfvblGNCUt1u2AmqXlJxGAQPiMzToXuFr3kyKAfty4UIz0
 sM8jDeHMHYaqNMJcfBZWPY0tdJBVgmR8+txXuuBs4gU06FgHCJ5Bym3oVGCIjvpX38eA
 dCO4sC+l1ojb67WV9pXDZltddIqt8hmxtbIHHePOUf96iY109DhHlsbJGiQXzA0Kh0UP
 zHKmRGltpXn4d0GIb2hJX8qQdT/rhvNKIBQq06x8PEsMGwRWTzNqXEjsIi81g7aWhw+c
 H3gA==
X-Gm-Message-State: APjAAAX/AEqUbYvf2Rw1kqlRK5hSgbMm/YbwjcBrWKQSqQERNtXc7L5T
 D6yqxwT1+N0f+w0nbzVAX4FBbtpVZj0KKxPMvh12lw==
X-Google-Smtp-Source: APXvYqw+RuXy2zCguY4C1QAkE27a8kK5UVarVaOFgDQP/kO/+YACn54gFQCdTxOviAuCW1sKD8pQvibhMSHWBtF6fqA=
X-Received: by 2002:ab0:2855:: with SMTP id c21mr23850232uaq.67.1568360870892; 
 Fri, 13 Sep 2019 00:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190821222421.30242-1-glaroque@baylibre.com>
 <20190821222421.30242-5-glaroque@baylibre.com>
 <7hsgpu5c7j.fsf@baylibre.com>
In-Reply-To: <7hsgpu5c7j.fsf@baylibre.com>
From: Amit Kucheria <amit.kucheria@linaro.org>
Date: Fri, 13 Sep 2019 13:17:39 +0530
Message-ID: <CAHLCerPtDH2VLGBgETJkqkLQZ=8T5C=8VY-=SLKAAEpx5nZf5A@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] arm64: dts: meson: sei510: Add minimal thermal zone
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190913_004753_631485_675621E7 
X-CRM114-Status: GOOD (  18.11  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Eduardo Valentin <edubezval@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>, linux-amlogic@lists.infradead.org,
 Zhang Rui <rui.zhang@intel.com>, lakml <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Aug 22, 2019 at 4:59 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Guillaume La Roque <glaroque@baylibre.com> writes:
>
> > Add minimal thermal zone for two temperature sensor
> > One is located close to the DDR and the other one is
> > located close to the PLLs (between the CPU and GPU)
> >
> > Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> > Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > ---
> >  .../boot/dts/amlogic/meson-g12a-sei510.dts    | 70 +++++++++++++++++++
> >  1 file changed, 70 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> > index c9fa23a56562..35d2ebbd6d4e 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> > @@ -10,6 +10,7 @@
> >  #include <dt-bindings/input/input.h>
> >  #include <dt-bindings/gpio/meson-g12a-gpio.h>
> >  #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
> > +#include <dt-bindings/thermal/thermal.h>
> >
> >  / {
> >       compatible = "seirobotics,sei510", "amlogic,g12a";
> > @@ -33,6 +34,67 @@
> >               ethernet0 = &ethmac;
> >       };
> >
> > +     thermal-zones {
> > +             cpu-thermal {
> > +                     polling-delay = <1000>;
> > +                     polling-delay-passive = <100>;
> > +                     thermal-sensors = <&cpu_temp>;
> > +
> > +                     trips {
> > +                             cpu_hot: cpu-hot {
> > +                                     temperature = <85000>; /* millicelsius */
> > +                                     hysteresis = <2000>; /* millicelsius */
> > +                                     type = "hot";
> > +                             };

No passive trip point? That is where the cooling-maps are really useful.

> > +
> > +                             cpu_critical: cpu-critical {
> > +                                     temperature = <110000>; /* millicelsius */
> > +                                     hysteresis = <2000>; /* millicelsius */
> > +                                     type = "critical";
> > +                             };
> > +                     };
> > +

I think, what you really want is to change your hot trip point above
to passive. And if you need another trip before that (to send
notification to userspace, for example), just add another hot trip
point at a lower temperature.

> > +                     cooling-maps {
> > +                             map0 {
> > +                                     trip = <&cpu_hot>;
> > +                                     cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +                                                      <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +                                                      <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +                                                      <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> > +                             };
> > +
> > +                             map1 {
> > +                                     trip = <&cpu_critical>;
> > +                                     cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +                                                      <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +                                                      <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +                                                      <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> > +                             };

The cooling-map associated with a critical trip point is of no use in
my experience because the device is already on its way to shutting
down then.

> > +                     };
> > +             };
> > +
> > +             ddr-thermal {
> > +                     polling-delay = <1000>;
> > +                     polling-delay-passive = <100>;
> > +                     thermal-sensors = <&ddr_temp>;
> > +
> > +                     trips {
> > +                             ddr_critical: ddr-critical {
> > +                                     temperature = <110000>; /* millicelsius */
> > +                                     hysteresis = <2000>; /* millicelsius */
> > +                                     type = "critical";
> > +                             };
> > +                     };
> > +
> > +                     cooling-maps {
> > +                             map {
> > +                                     trip = <&ddr_critical>;
> > +                                     cooling-device = <&mali THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;

Same here. The cooling-map makes more sense against a passive trip type.

> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> >       mono_dac: audio-codec-0 {
> >               compatible = "maxim,max98357a";
> >               #sound-dai-cells = <0>;
> > @@ -321,6 +383,7 @@
> >       operating-points-v2 = <&cpu_opp_table>;
> >       clocks = <&clkc CLKID_CPU_CLK>;
> >       clock-latency = <50000>;
> > +     #cooling-cells = <2>;
> >  };
> >
> >  &cpu1 {
> > @@ -328,6 +391,7 @@
> >       operating-points-v2 = <&cpu_opp_table>;
> >       clocks = <&clkc CLKID_CPU_CLK>;
> >       clock-latency = <50000>;
> > +     #cooling-cells = <2>;
> >  };
> >
> >  &cpu2 {
> > @@ -335,6 +399,7 @@
> >       operating-points-v2 = <&cpu_opp_table>;
> >       clocks = <&clkc CLKID_CPU_CLK>;
> >       clock-latency = <50000>;
> > +     #cooling-cells = <2>;
> >  };
> >
> >  &cpu3 {
> > @@ -342,6 +407,7 @@
> >       operating-points-v2 = <&cpu_opp_table>;
> >       clocks = <&clkc CLKID_CPU_CLK>;
> >       clock-latency = <50000>;
> > +     #cooling-cells = <2>;
> >  };
> >
> >  &cvbs_vdac_port {
> > @@ -368,6 +434,10 @@
> >       status = "okay";
> >  };
> >
> > +&mali {
> > +     #cooling-cells = <2>;
> > +};
> > +
>
> Is there a reason these #cooling-cells properties belong in the SoC
> .dtsi and not the board .dts.  Seems like you'll have to repeat this in
> every board .dts which doesn't seem necessary.
>
> Same comment for patch 5/6

Agreed. Even the thermal zones belong in the SoC .dtsi. You can always
override the trip-points in a board .dts if required if you have a
board designed in a different form-factor or with active cooling.

/Amit

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
