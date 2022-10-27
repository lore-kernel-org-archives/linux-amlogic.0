Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5CDECAAA1
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Oct 2022 19:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=090mWjdQzl15k4pi/qyWvDQrFnnigmyReG3rrTWpGtA=; b=hI6dXPH0p0tUrk
	oXAmFxs3o3hcqqeZneGAianFRe24/UuP5yTnsZRClRGchVHIB2uKz8vktgNz9MPkXC/Z8BwuzkT2u
	d/CUqMM0abdFbL0xyDAEUsyF6g1qq3FHqMzJ8IMJKPhbJ8y6iAumreq7mfzXASM096ccJf+0msv95
	hB+fIVYi6oJkUAgkDNdK5HLcAN2s4sSHpYROFhP7pqdWuWM5EOG4/0H6nFu8CfUrhN2a0TUsy0Yee
	9B9BL8OdLg1f61KMZdLTut599nTq5TKAzuqJ3P+8oKcoZUHtijM7vsGEvilz/2dzwthgMCLfoQgnS
	nj0JwRm89IciLV+SoURg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo8Ot-00EdnD-Ko; Thu, 27 Oct 2022 19:18:47 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo8Op-00Edkw-Un
	for linux-amlogic@lists.infradead.org; Thu, 27 Oct 2022 19:18:45 +0000
Received: by mail-ej1-x62f.google.com with SMTP id ud5so7514519ejc.4
        for <linux-amlogic@lists.infradead.org>; Thu, 27 Oct 2022 12:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KoFq6D957s20eRRq5tfkUreWJTtgbOHobIdPnV62his=;
        b=L4fsf7c8XtxkClfta/LR45IhpnSkY8HIyxKvVplHeJ7xKdRuu1lr9ziYGCQva2ZeJ8
         6CGw9oVQkTM4Phe8tnIL6T+AlXrnYamzRRAaF5OFtJyk5JAhVY+obvn/j5xBHycxkgZK
         BEvZMMAKcgHonkSXsyJ31BKxSUe6R226EssMGRSn93RgB1QSSohJcOR07ftlt6QTnXBh
         GyMYVZO4OD6uItfo1CGYpD8qKWvRBT/cn22jyM8VoceKY9oOsVbAkKv4DWKGbGrsMafB
         btjUWYQv0EfUNqIemIgG3odOaZwBfBIrRJiRL9nzmIA+0LcyIyrMqs5ukZtmknJMpeCE
         hZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KoFq6D957s20eRRq5tfkUreWJTtgbOHobIdPnV62his=;
        b=Wr0SrXkRKedypN2RxMJhU6sZKKqK678QcveoHnV2jPr4R2UG+CSKMKdBvQhs0n+KJp
         4auinTd/xY03WhHCnWAXLvsLK904tAC4GpBX8xVz5CB4kK/Qf377D7tncRHR/M/BQm3w
         QzJ/ajVKHrT/kaK3ZJmXfDCbhC4feQI3xKqAVLCGHydcPZYkXMjttS6r+HNHrSDmFWD+
         ktPNT0zsuDnqwHoXVo5B2fYjv2JB1TNzOLKo64q46t8M34QIqIBGTDFoOCg6lc4IJYxF
         4gJUjHradUGEczXMPppTKIFHiUozgJ/CEau+KuwwnbRd+rfEYwDsdO+8f5EHB4RWvMvy
         742w==
X-Gm-Message-State: ACrzQf3QKPPNSI/fb/9uqGH54G0wBK6NKb/g9CSL5kL150f24C42ciM7
	Xd2Rk3sxPHiXIqqJYdkdGx0LJSqf/nx2VPXBD1A=
X-Google-Smtp-Source: AMsMyM6R6kYww9H/C/neaQxdOMyxAe8LizjfUMQxcGGK/NHxxXsmj1W2H8gQkR3zQiOuMrzxdqGgYoUHTAht1x4WiZ0=
X-Received: by 2002:a17:906:8a6c:b0:7a8:2f09:d88d with SMTP id
 hy12-20020a1709068a6c00b007a82f09d88dmr20076999ejc.49.1666898319625; Thu, 27
 Oct 2022 12:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221022084737.1028-1-linux.amoon@gmail.com> <CAFBinCBu_-0m9JeAr5kd-v7Z5LTi7w0WmmUYybW_kL4KJXXpOQ@mail.gmail.com>
 <CANAwSgRzdD0FWg+z6hTFs7KvpsD64bChX-k0dPXJfACXZH2zbQ@mail.gmail.com>
 <CAFBinCCNJiL-ZKRYesQAwys6bBMpYHJbUDK-Zi_VhGDVSvF7uQ@mail.gmail.com>
 <CANAwSgTLTCA9=WvWXcR-40baauN3kAk2qx9k4FQOPCa1+_O0Yw@mail.gmail.com>
 <5d2ffeca-b41c-20b4-454b-703c39bbb29e@linaro.org> <CANAwSgR1CN=Gho6NGMoM1bH92KyeGqoAphmT6NqtnL=+3Zg_jQ@mail.gmail.com>
 <18ae0876-2d37-cde9-183f-894dfcdf4be9@linaro.org> <259950fa-5b26-77f0-7c49-84ca06cd6a6f@gmail.com>
In-Reply-To: <259950fa-5b26-77f0-7c49-84ca06cd6a6f@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 28 Oct 2022 00:48:23 +0530
Message-ID: <CANAwSgST-mxeBzZ5ksrC0r8J6ctXZHyUAZEoQyf66xfiXnyNWQ@mail.gmail.com>
Subject: Re: [PATCHv3] arm64: dts: meson: Enable active coling using gpio-fan
 on Odroid N2/N2+
To: Neil Armstrong <narmstrong.kernel@gmail.com>
Cc: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_121844_065142_41721C4D 
X-CRM114-Status: GOOD (  23.61  )
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

Hi Neil,

On Thu, 27 Oct 2022 at 19:02, Neil Armstrong
<narmstrong.kernel@gmail.com> wrote:
>
> On 27/10/2022 14:49, neil.armstrong@linaro.org wrote:
> > Hi,
> >
> > On 26/10/2022 18:02, Anand Moon wrote:
> >> Hi Neil,
> >
> > <snip>
> >
> >>
> >> When I try to use pwm_AO_cd,,
> >> Either one of the PWM binds will fail to get the following error.
> >>
> >>   &pwm_AO_cd {
> >> -       pinctrl-0 = <&pwm_ao_d_e_pins>;
> >> +       pinctrl-0 = <&pwm_ao_d_e_pins>, <&pwm_ao_d_10_pins>;
> >>          pinctrl-names = "default";
> >>          clocks = <&xtal>;
> >>          clock-names = "clkin1";
> >>
> >> [    3.941700] pwm-regulator regulator-vddcpu-b: error -EBUSY: Failed to get PWM
> >> [    3.943198] pwm-regulator: probe of regulator-vddcpu-b failed with error -16
> >>
> >> [    3.956356] pwm-fan pwm-fan: error -EBUSY: Could not get PWM
> >> [    3.956396] pwm-fan: probe of pwm-fan failed with error -16
> >
> > Yeah because PWM "D" is already used by the "pwm_AO_ab" controller, so you can't use it for the FAN.
>
> I was meaning regulator-vddcpu-b.
>
> >
> >>
> >> Below are my changes with  pwm_AO_ab
> >> ---------------------------------------------------------------------------------------------
> >> alarm@odroid-n2:~/linux-amlogic-5.y-devel$ git diff
> >> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> >> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> >> b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> >> index fd3fa82e4c33..d038ba1e2453 100644
> >> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> >> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> >> @@ -39,6 +39,14 @@ emmc_pwrseq: emmc-pwrseq {
> >>                  reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
> >>          };
> >>
> >> +       fan: pwm-fan {
> >> +               compatible = "pwm-fan";
> >> +               pwms = <&pwm_AO_ab 1 1250 0>;
> >
> > Here you use the "B" PWM signal, not the D.

Thanks for your review comments, ok now I get better understand of PWM
mux configuration
so now I switch to use &pwm_cd, But still, the issue of the fan keeps
spinning on start. persist.

$ sudo cat /sys/kernel/debug/pwm
platform/ffd1b000.pwm, 2 PWM devices
 pwm-0   (regulator-vddcpu-a  ): requested enabled period: 1250 ns
duty: 963 ns polarity: normal
 pwm-1   ((null)              ): period: 0 ns duty: 0 ns polarity: normal

platform/ffd1a000.pwm, 2 PWM devices
 pwm-0   ((null)              ): period: 0 ns duty: 0 ns polarity: normal
 pwm-1   (pwm-fan             ): requested period: 1250 ns duty: 0 ns
polarity: normal

platform/ff802000.pwm, 2 PWM devices
 pwm-0   ((null)              ): period: 0 ns duty: 0 ns polarity: normal
 pwm-1   (regulator-vddcpu-b  ): requested enabled period: 1250 ns
duty: 88 ns polarity: normal

> >
> >> +               fan-supply = <&vcc_5v>;
> >> +               #cooling-cells = <2>;
> >> +               cooling-levels = <0 100 170 230>;
> >> +       };
> >> +
> >>          leds {
> >
> > <snip>
> >
> >>
> >> +&pwm_AO_ab {
> >> +       pinctrl-0 = <&pwm_ao_d_10_pins>;
> >
> > The "pwm_AO_ab" controller only controls the PWM "A" & "B signals, not the "D" !
> >
> > This basically enables the PWM "D" pin function to GPIOAO_10, it doesn't assign it to the "pwm_AO_ab" controller.
> >
> > So by enabling this pinctrl, it will duplicate the pwm_ao_d_e_pins signal to pwm_ao_d_10_pins, this is why the FAN spins non-stop.
> >
ok.
> >> +       pinctrl-names = "default";
> >> +       clocks = <&xtal>;
> >> +       clock-names = "clkin1";
> >> +       status = "okay";
> >> +};
> >> +
> >>   &pwm_AO_cd {
> >>          pinctrl-0 = <&pwm_ao_d_e_pins>;
> >>          pinctrl-names = "default";
> >> -------------------------------------------------------------------------------------------
Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
