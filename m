Return-Path: <SRS0=4XcC=CC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64920C433E1
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2020 13:42:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35012204FD
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2020 13:42:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m7rxXh9m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ok4MKUfm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35012204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RE8407GzQqjlAG5hbT+y08K5qx3Bz+FQ20G/209b9Gg=; b=m7rxXh9mFOkDG3N6Tt9PuWkSz
	s8hxefuhiJxkVyfV5i9I4OavgCD6EJ/sehWMHBLHZ+jjTUIKtZogq8y5WZTaV98h6ZMu7PSdpQNF8
	V4b9zIW3LCWV/16n4TOI9+zpkr5l9znxukv7Kzyl+iwQYAdpSK9cO/kkPpOikyEIZ7wVT0snEfS8V
	5ldhLOk72TQ/Fz8TYgc9lZgeC2vy6RgAaVEG8dhMDaq6uWccZoCWl+YYZGFDpnUDQyUmBgHFw+u+E
	SFbogtHU1GNrPNN8TSC6DxzVUI9WLhzRnsVCFMckBdTrc7bMeABoYPU2UuXDcxg4Ijsw7Lt/P40vR
	vEwDj8CVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kACjn-0004Qi-MC; Mon, 24 Aug 2020 13:42:15 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kACjf-0004NS-UQ; Mon, 24 Aug 2020 13:42:09 +0000
Received: by mail-il1-x143.google.com with SMTP id f12so7248546ils.6;
 Mon, 24 Aug 2020 06:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rd33nPgNOMekiT/6KHR+eXtOiA25euKyz0AHeNDMQG0=;
 b=ok4MKUfmmgU1Zlvif0VPW0enBSZla+x1W0X09IaHfx5AdapmgKkAMSs7nPEinj4JSW
 I/qgdrUehdjcN2lLiKyIdxNVqGJwlSpG30n8ssqYnK4MtvHiVI9mAh5H+TllqvKVxDbT
 Lowk1gr7EeqgI4HIon8bmVF4b6FaW0kab3r6wvDbY9urxrzEcdr6A0a2cR8dyK1h/+rk
 zfwhfqdk2ikL7RgbN2pKiJ3Vq/C6iCwGZCd1l/v/B3cfehfLl/a5O1i9VdTHzXOTPcCi
 ywLfhLeHqB8cgzSZ/F21KcrLQUT3KS1e6IT9Xy+2/YvZluAyGpAZFAsTSL8rIHQmH7Gs
 MVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rd33nPgNOMekiT/6KHR+eXtOiA25euKyz0AHeNDMQG0=;
 b=Fgm3nSKEoOzxPSMCBRS+kC0tlrNoxUhJOHbHdyYtFgdn2J6GAwtKQW22vVEVIq8Dp6
 SEx+KsQoMtdbqzYgYwEPa9qIh7seAtZXTj5BVqOVPvse0mDaUvV4dfesv/2v9SOffAxH
 bt570YZu80bNHuYZliXEQgLiKlFM7ZhJpwQvXQzbyDxeSt5GfL9yaOExRWCsvjIcDew9
 IOW/lxUVnOj3SmMexUIcvaIyJdXf26/ayqU32FyiWmnHRE9vYjjjwum6YFn4TW/fzRe7
 K1/9gp0zhO88Wdom5HWJtepHONaOPkSPzaHDpIZRa9q1BgSui/UpLicSZc9r6Xks5G7b
 Nwlw==
X-Gm-Message-State: AOAM531VnngJEmCQe4ehmkJqCPJ/y5WCKlWJntugM0P1UkS0fI3jsB0G
 iTo1eMyARBX+ys+qPvnkDm+lo67QHGwAyqh87N8UoHNfO2M=
X-Google-Smtp-Source: ABdhPJzp+QdqVtQXOIj0u5zSgHku4BKue60oem5BL8xR3PZ8eYMNJfIrz8N/DYp1H6wCX4Fd4/JIAHwgh+TUwps1adc=
X-Received: by 2002:a92:bb8d:: with SMTP id x13mr4901180ilk.243.1598276524235; 
 Mon, 24 Aug 2020 06:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200820121323.564-1-linux.amoon@gmail.com>
 <20200820121323.564-2-linux.amoon@gmail.com>
 <7hlfi9xgch.fsf@baylibre.com>
 <CANAwSgTZ23jFPAO46vRg1Dx_Bzi=4Bg6KHE0ozLQGky4p_fgKQ@mail.gmail.com>
In-Reply-To: <CANAwSgTZ23jFPAO46vRg1Dx_Bzi=4Bg6KHE0ozLQGky4p_fgKQ@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 24 Aug 2020 19:11:52 +0530
Message-ID: <CANAwSgQLnqDnuQvLv4cvaeTPeBW=H_g5F2aaNue_hb4nKLdovg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_094208_125861_1433AD6A 
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
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

hi All,

On Fri, 21 Aug 2020 at 10:13, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Kevin,
>
> Thanks for your review comments.
>
> On Fri, 21 Aug 2020 at 01:03, Kevin Hilman <khilman@baylibre.com> wrote:
> >
> > Anand Moon <linux.amoon@gmail.com> writes:
> >
> > > Enable RTC PCF8563 node on Odroid-N2 SBC, In order to
> > > support the RTC wakealarm feature for suspend and resume.
> > > Also assign an alias to the pcf8563 to rtc0 and meson-vrtc to rtc1
> > > timer device to prevent it being assigned to /dev/rtc0
> > > which disto userspace tools assume is a clock device.
> > >
> > > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > > Cc: Kevin Hilman <khilman@baylibre.com>
> > > Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
> > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > ---
> > > Changes V3
> > > --Drop the INI GPIOAO.BIT7 pinctrl.
> >
> > Why did you drop this GPIO?  Isn't this the GPIO that the RTC uses to
> > wakeup the system?  If so, this should be included as part of this
> > patch.
> >
> > It probably still works because the bootloader configures this GPIO as
> > input, but the kernel should not rely on the booloader for that, so
> > please include as part of this patch.
> >
>
> Ok I will figure out the correct pinctrl need for this settings.
> looking into the Odroid N2 schematics.
>

I am trying to map the RTC INT pinctrl, ie RTC INT GPIOAO.BIT7.

So from the schematics it is seen below.
RTC INT  GPIOAO_7 (AV46)   GPIOAO_7 (JTAG_A_TMS // TSIN_A_DIN0 //
TDMB_FS // TDMB_SLV_FS)

But the S922X datasheet this pin *AV46* shows to following settings,
AN16    DVSS    AV46      GPIOAO_7    BD19    BOOT_11

From the schematics it BOOT_11 is linked to
              BOOT_11 (NAND_CE0)      BD19

So can I conclude that BOOT_11 (nand_ce0_pins) pin linked to the RTC INT setting
Please can somebody help me with correct pinctrl settings.

Best Regards
-Anand Moon

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
