Return-Path: <SRS0=Pllw=CH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A67AC433E2
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Aug 2020 16:32:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56BC420707
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Aug 2020 16:32:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uXNTuNqZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXsZx1v3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56BC420707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7mpt1KuTf47cpKJqwRU/B/1kLeZu9Zg/GwqBGvYfbvs=; b=uXNTuNqZtoY/2hDqLxDG04x2D
	Oz5Xt78a7RT2VzupeP8zBW4wim/B2PY0MIb47J8cedpsGcUgWlCLs6MiCILiTo4HGuLEmuY5p5NME
	3xi4a/6WuEqjt6xO1a2oiTRRtcilLeJE50l8hZqxG/cE0eF6cVsRicooJuBgKvC0sNwVYZqttRKnm
	HRFIapR2DLPlUNOtxfCqkG7Yk1uiRkGwaIXys2cKUZepffbsMiLruGvGIwuhU+AV3Un+0Gj/XN0Vv
	Tmmm2tjHT9RT8hsadP4SelW2x0TVONsWYkYhUMXZ8e2EySXsIMKjF0YFgTzMSc9pf+f8TMzUdRkcs
	vthU2+8zg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kC3ld-0007B0-AZ; Sat, 29 Aug 2020 16:31:49 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kC3lZ-0007AN-1B; Sat, 29 Aug 2020 16:31:46 +0000
Received: by mail-il1-x144.google.com with SMTP id o16so3246109ilq.0;
 Sat, 29 Aug 2020 09:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AOIgbXYhFqh+LPpGm+XLLRjfV0Rb6uHXwqnkzMA+His=;
 b=LXsZx1v3CRuC0wctQVJMADqLdVHkquZq19f84W0LUL5qiFx7WYDIZ93glwv0hDZNra
 hP+DLXCylDj5PZO9+zFzsqcB7/vh5kUnqcLgNKJCTjf+OReG0RhBp0dD4GTau/YikwIk
 aTkvbcKzUmgKRvbSHqa5z+ccU4WMDgbk9C5TWTOc000Z5koZfYRYv2VCi1pYpSNAluhh
 h2Tf44VFmW0dL3m+qZ/5iFRH+pm/dyErPOHg/QbOKVrPe6CC1RwUPLNXbMW/aBv6y70f
 +bUTrI0KqmljI5bx0iuzyVnxOLkDLbdySZ6rF3Pv4gAAhvdJ05IITiMQQHMWj9pTiuB9
 NNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AOIgbXYhFqh+LPpGm+XLLRjfV0Rb6uHXwqnkzMA+His=;
 b=Yk9xcbp4HrJFNo3a9k0Nt9Cmtw2nb5M/5/gAO9bO2hFjmRAheZehoqi6MzcuK1b8Zx
 qfAhf0C8E08WKI5mjTMW8lFlGbS1t/LhTmmT9VN7zxuBOmqToobeG8Qb+mDROcUGHZ12
 eZYggronA2lUcdpMcglsFCYp1snnox0BShD1vPRZKsEWbW79xuevoJ/0uhAdt6jGCq4C
 D/v05ujGNh+Ka8gl9RhML2Bs8x6pVQ2vPX3lqlVUIVcoZN8vvR6zXlwX3APknkcR3BhR
 aBeoA8goYj4qSXlDpXehaYxlYZ/TtadLJpFbi2HZtIz745GfddUoWxcTVznvv3/1hZFt
 xWkg==
X-Gm-Message-State: AOAM5338PlBSlPhrLQOzT55B2gjytNj77If1s+S7hToz6vffp2L30ClX
 zsz9kBZatFpBRccTwVBpRmaX7yObD0fri8jPwvbevcUXKu/D7A==
X-Google-Smtp-Source: ABdhPJw9j6ezLGJLeEbcjU8uodUQSarNQodUMHNLN1l+Np/0GoLfqLqg8PEaWIDoL7vF0hLRv+k4/XtMtu+k9isQIjQ=
X-Received: by 2002:a92:498a:: with SMTP id k10mr3017896ilg.246.1598718701594; 
 Sat, 29 Aug 2020 09:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200820121323.564-1-linux.amoon@gmail.com>
 <20200820121323.564-2-linux.amoon@gmail.com>
 <7hlfi9xgch.fsf@baylibre.com>
 <CANAwSgTZ23jFPAO46vRg1Dx_Bzi=4Bg6KHE0ozLQGky4p_fgKQ@mail.gmail.com>
 <CANAwSgQLnqDnuQvLv4cvaeTPeBW=H_g5F2aaNue_hb4nKLdovg@mail.gmail.com>
 <f7e6ce5f-02b0-065b-ffcf-2826159f926a@baylibre.com>
 <1j7dto3ylq.fsf@starbuckisacylon.baylibre.com>
 <CANAwSgQ1Miu73hfdK+cgL3howpekn2xj_5qwGasQZwtQpSGj5Q@mail.gmail.com>
 <1j4koq4x38.fsf@starbuckisacylon.baylibre.com>
 <CANAwSgTWnHXRFRUrbdCph+eBxL2PNXe6Q4aTXxEU32i7dGS=dw@mail.gmail.com>
In-Reply-To: <CANAwSgTWnHXRFRUrbdCph+eBxL2PNXe6Q4aTXxEU32i7dGS=dw@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 29 Aug 2020 22:01:29 +0530
Message-ID: <CANAwSgQV7_4VdGRMgJDMjPFvOS3Nabkqbf2ucE5vqo6zrhxPDw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200829_123145_099778_493C2584 
X-CRM114-Status: GOOD (  37.71  )
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
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi All,

On Wed, 26 Aug 2020 at 12:29, Anand Moon <linux.amoon@gmail.com> wrote:
>
> hi Jerome
>
> On Tue, 25 Aug 2020 at 20:00, Jerome Brunet <jbrunet@baylibre.com> wrote:
> >
> >
> > On Tue 25 Aug 2020 at 11:01, Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > > Hi Jerome
> > >
> > > On Mon, 24 Aug 2020 at 20:00, Jerome Brunet <jbrunet@baylibre.com> wrote:
> > >>
> > >>
> > >> On Mon 24 Aug 2020 at 15:50, Neil Armstrong <narmstrong@baylibre.com> wrote:
> > >>
> > >> > On 24/08/2020 15:41, Anand Moon wrote:
> > >> >> hi All,
> > >> >>
> > >> >> On Fri, 21 Aug 2020 at 10:13, Anand Moon <linux.amoon@gmail.com> wrote:
> > >> >>>
> > >> >>> Hi Kevin,
> > >> >>>
> > >> >>> Thanks for your review comments.
> > >> >>>
> > >> >>> On Fri, 21 Aug 2020 at 01:03, Kevin Hilman <khilman@baylibre.com> wrote:
> > >> >>>>
> > >> >>>> Anand Moon <linux.amoon@gmail.com> writes:
> > >> >>>>
> > >> >>>>> Enable RTC PCF8563 node on Odroid-N2 SBC, In order to
> > >> >>>>> support the RTC wakealarm feature for suspend and resume.
> > >> >>>>> Also assign an alias to the pcf8563 to rtc0 and meson-vrtc to rtc1
> > >> >>>>> timer device to prevent it being assigned to /dev/rtc0
> > >> >>>>> which disto userspace tools assume is a clock device.
> > >> >>>>>
> > >> >>>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
> > >> >>>>> Cc: Kevin Hilman <khilman@baylibre.com>
> > >> >>>>> Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
> > >> >>>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > >> >>>>> ---
> > >> >>>>> Changes V3
> > >> >>>>> --Drop the INI GPIOAO.BIT7 pinctrl.
> > >> >>>>
> > >> >>>> Why did you drop this GPIO?  Isn't this the GPIO that the RTC uses to
> > >> >>>> wakeup the system?  If so, this should be included as part of this
> > >> >>>> patch.
> > >> >>>>
> > >> >>>> It probably still works because the bootloader configures this GPIO as
> > >> >>>> input, but the kernel should not rely on the booloader for that, so
> > >> >>>> please include as part of this patch.
> > >> >>>>
> > >> >>>
> > >> >>> Ok I will figure out the correct pinctrl need for this settings.
> > >> >>> looking into the Odroid N2 schematics.
> > >> >>>
> > >> >>
> > >> >> I am trying to map the RTC INT pinctrl, ie RTC INT GPIOAO.BIT7.
> > >> >
> > >> >
> > >> > Simply add:
> > >> >
> > >> > interrupt-parent = <&gpio_intc>;
> > >> > interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
> > >> >
> > >> > to reflect the interrupt connection.
> > >
> > > I have tried this setting, but it is not working.
> > >
> > > [alarm@archl-on2e ~]$ dmesg| grep rtc
> > > [    5.378002] meson-vrtc ff8000a8.rtc: registered as rtc1
> > > [    5.942307] rtc-pcf8563 0-0051: pcf8563_write_block_data: err=-110
> > > addr=0e, data=03
> > > [    5.942316] rtc-pcf8563 0-0051: pcf8563_probe: write error
> > > [    5.945983] rtc-pcf8563: probe of 0-0051 failed with error -5
> > >
> >
> > -110 is timeout ... either you i2c bus is broken and you device is not
> > at 0x51. In both case, it has nothing to do with the interrupt configuration
> >
> I have check the I2C bus on the device for rtc and it return correctly.
>
> $ sudo i2cdetect -l
> i2c-1   i2c             DesignWare HDMI                         I2C adapter
> i2c-0   i2c             Meson I2C adapter                       I2C adapter
> $
> $ sudo i2cdetect -y -r 0
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:          -- -- -- -- -- -- -- -- -- -- -- -- --
> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 50: -- UU -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 70: -- -- -- -- -- -- -- --
>
> > >
> > >> >
> > >> > No need to setup pinctrl here since the GPIO input is always connected
> > >> > to the gpio irq generator whatever pinctrl mode is set.
> > >>
> > >> It is actually better to setup pinctrl. Yes the irq controller can work
> > >> whatever the pin setup but if an output function is active it can mess with
> > >> what the irq controller gets.
> > >>
> > >> Think about applying/removing bias if necessary too.
> > >>
> > >
> > > Ok, I am trying to add a new pinctrl configuration for
> > > TSIN_A_DIN0 //  TDMB_FS // TDMB_SLV_FS
> > > But it's still not working at my end.
> >
> > Either you are quite confused when it comes to pinctrl or I am.
>
> Basically I dont want to keep repeating silly mistakes.
>
> > TSIN and TDM have nothing to do with an i2c RTC.
>
> Yes I understand this clearly, that's why I have dropped the
> RTC INT gpio pinctrl settings.Without this setting RTC driver
> works fine and their is no issue rtcwakeup during suspend
> and resume in my testing.
>

Just want to clear my confusion on RTC INT gpio setting is not needed.
I did not find any other example to support this changes.
So I have enable the debug logs on rtc-pcf8563.c with this current
patch at my end.

[0] https://pastebin.com/F2UA665H

-Best Regards
Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
