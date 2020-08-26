Return-Path: <SRS0=oQoi=CE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BFDC433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2020 06:59:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2B652076C
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2020 06:59:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uVQhYxVT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="udlUbH21"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2B652076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PIy5dovPzs6LLuvmGVAs1lXfr7r9alZgRjigXrA4MOg=; b=uVQhYxVTDxlM7/jvJWDMNkuux
	Ht3JxkH6BRlff45XSecZ4X8WQLEdpiIaLR9pHqulc9W91Yk9mS0cJX/ucsBOAiXl8L7mdE7ppBiyF
	uVF2tWUhgq1mjbJC4K6coUaWGt7nzeaX72wiZbcaRG5KguEZyySAAdelq481L9O5iaO1/QY8rT6hE
	XkqPzXeUe54frrgXWgqaWIzdk+W1JneWKpNMEPlKf5eEVXIoVU+vqi62e4jDj3lQ0L3lXr+eos20c
	huCvuxEBQjQrKzkJfx6+hvAGQxRdM1di/PO8XUdbVTK9x0wyuF9cYwRU7mYqUduHEooYb3jEuXosf
	wjmD6lI0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kApP1-0003db-QV; Wed, 26 Aug 2020 06:59:23 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kApOy-0003cV-21; Wed, 26 Aug 2020 06:59:20 +0000
Received: by mail-io1-xd44.google.com with SMTP id g13so1028143ioo.9;
 Tue, 25 Aug 2020 23:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5W54dbi9xuzQewRPXXisG46NqBrr4vTY04zUmdJ/TW8=;
 b=udlUbH21qtM29U72EX2h0lnsaXCwTn+3FwhOYs7DNyn30Vx1Hnb3P7+iJnPF5uIjRN
 qU+oZQK3kPvTkMM7RnXo8dVdv8tznzRDLpET1c9X++laZw9PX9GwMgPfmhShdeNS1kxi
 GkIQy8yxsu9GkkMC+2FiixGszy4gwrNgsV3vC9LpSSDJQY4GOLUHkv/nV4dzWcMW48HI
 eGcGbr1jF4GKxQHTY5L0Cmyk2GDu3dTlZXrw3/s79WmJCYFtq1NxTMFltt/U2by4P2JQ
 XTQQ9OuTF3GunpvJeiPzdnNhHrkqVPxaouwST+hpn1BDYWVcsUkhBQx0IpNHhCmKrTxy
 5FSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5W54dbi9xuzQewRPXXisG46NqBrr4vTY04zUmdJ/TW8=;
 b=C0Uzes07Jf2dQGHreP2pGTgpQji3uI/mC7pfLy9dElJ4jgkHJM122zs1HSRGqtmLNA
 zlCZd446FiAi93CxeO2cfSx9EOkC5AcUOFMGfBLWwWAktEUIYfn/AMwmwPXbRUsCTF0o
 QTq1OxbEpIXoSl3lHkbGTTcZJ4lBhqnxH+DFI7tMFpATB2y+YiKi9fIW/PmUWkvgoUNk
 0p2p7zMlGbjM+Y9bn2q+5JvsVIGTfZW/RY4DZibkT3invF6AVhGmeQiEjzv1cv70ugBE
 yZVKgYLuhxErdku93oVfse83oqFWIr+s4juMrsiDWcvMK7u4Ao6pP1ZBaUGlZIoYRZq6
 9p6Q==
X-Gm-Message-State: AOAM533E1xRmhVoI458AnkzBuU4j/YieHbuvRZa13sQbH9hItMcZ5TaK
 5hJhneutcNoBK9j5g28YxGHiVSHflkHHaWeEhfQ=
X-Google-Smtp-Source: ABdhPJwLl3E/brPRmlOHAidAvPuLhWdu3BOsLBo3HAWnMr79ZmjXo8vEaO4jGTW/UTRy2yWL/4VLi6XYpay6FvAXwKI=
X-Received: by 2002:a02:838e:: with SMTP id z14mr14301738jag.84.1598425156916; 
 Tue, 25 Aug 2020 23:59:16 -0700 (PDT)
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
In-Reply-To: <1j4koq4x38.fsf@starbuckisacylon.baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 26 Aug 2020 12:29:04 +0530
Message-ID: <CANAwSgTWnHXRFRUrbdCph+eBxL2PNXe6Q4aTXxEU32i7dGS=dw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_025920_129852_A5977A1F 
X-CRM114-Status: GOOD (  32.62  )
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

hi Jerome

On Tue, 25 Aug 2020 at 20:00, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Tue 25 Aug 2020 at 11:01, Anand Moon <linux.amoon@gmail.com> wrote:
>
> > Hi Jerome
> >
> > On Mon, 24 Aug 2020 at 20:00, Jerome Brunet <jbrunet@baylibre.com> wrote:
> >>
> >>
> >> On Mon 24 Aug 2020 at 15:50, Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> > On 24/08/2020 15:41, Anand Moon wrote:
> >> >> hi All,
> >> >>
> >> >> On Fri, 21 Aug 2020 at 10:13, Anand Moon <linux.amoon@gmail.com> wrote:
> >> >>>
> >> >>> Hi Kevin,
> >> >>>
> >> >>> Thanks for your review comments.
> >> >>>
> >> >>> On Fri, 21 Aug 2020 at 01:03, Kevin Hilman <khilman@baylibre.com> wrote:
> >> >>>>
> >> >>>> Anand Moon <linux.amoon@gmail.com> writes:
> >> >>>>
> >> >>>>> Enable RTC PCF8563 node on Odroid-N2 SBC, In order to
> >> >>>>> support the RTC wakealarm feature for suspend and resume.
> >> >>>>> Also assign an alias to the pcf8563 to rtc0 and meson-vrtc to rtc1
> >> >>>>> timer device to prevent it being assigned to /dev/rtc0
> >> >>>>> which disto userspace tools assume is a clock device.
> >> >>>>>
> >> >>>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
> >> >>>>> Cc: Kevin Hilman <khilman@baylibre.com>
> >> >>>>> Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
> >> >>>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> >> >>>>> ---
> >> >>>>> Changes V3
> >> >>>>> --Drop the INI GPIOAO.BIT7 pinctrl.
> >> >>>>
> >> >>>> Why did you drop this GPIO?  Isn't this the GPIO that the RTC uses to
> >> >>>> wakeup the system?  If so, this should be included as part of this
> >> >>>> patch.
> >> >>>>
> >> >>>> It probably still works because the bootloader configures this GPIO as
> >> >>>> input, but the kernel should not rely on the booloader for that, so
> >> >>>> please include as part of this patch.
> >> >>>>
> >> >>>
> >> >>> Ok I will figure out the correct pinctrl need for this settings.
> >> >>> looking into the Odroid N2 schematics.
> >> >>>
> >> >>
> >> >> I am trying to map the RTC INT pinctrl, ie RTC INT GPIOAO.BIT7.
> >> >
> >> >
> >> > Simply add:
> >> >
> >> > interrupt-parent = <&gpio_intc>;
> >> > interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
> >> >
> >> > to reflect the interrupt connection.
> >
> > I have tried this setting, but it is not working.
> >
> > [alarm@archl-on2e ~]$ dmesg| grep rtc
> > [    5.378002] meson-vrtc ff8000a8.rtc: registered as rtc1
> > [    5.942307] rtc-pcf8563 0-0051: pcf8563_write_block_data: err=-110
> > addr=0e, data=03
> > [    5.942316] rtc-pcf8563 0-0051: pcf8563_probe: write error
> > [    5.945983] rtc-pcf8563: probe of 0-0051 failed with error -5
> >
>
> -110 is timeout ... either you i2c bus is broken and you device is not
> at 0x51. In both case, it has nothing to do with the interrupt configuration
>
I have check the I2C bus on the device for rtc and it return correctly.

$ sudo i2cdetect -l
i2c-1   i2c             DesignWare HDMI                         I2C adapter
i2c-0   i2c             Meson I2C adapter                       I2C adapter
$
$ sudo i2cdetect -y -r 0
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- UU -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --

> >
> >> >
> >> > No need to setup pinctrl here since the GPIO input is always connected
> >> > to the gpio irq generator whatever pinctrl mode is set.
> >>
> >> It is actually better to setup pinctrl. Yes the irq controller can work
> >> whatever the pin setup but if an output function is active it can mess with
> >> what the irq controller gets.
> >>
> >> Think about applying/removing bias if necessary too.
> >>
> >
> > Ok, I am trying to add a new pinctrl configuration for
> > TSIN_A_DIN0 //  TDMB_FS // TDMB_SLV_FS
> > But it's still not working at my end.
>
> Either you are quite confused when it comes to pinctrl or I am.

Basically I dont want to keep repeating silly mistakes.

> TSIN and TDM have nothing to do with an i2c RTC.

Yes I understand this clearly, that's why I have dropped the
RTC INT gpio pinctrl settings.Without this setting RTC driver
works fine and their is no issue rtcwakeup during suspend
and resume in my testing.

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
