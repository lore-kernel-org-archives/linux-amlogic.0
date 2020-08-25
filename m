Return-Path: <SRS0=/aBW=CD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB668C433DF
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Aug 2020 09:02:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 654E22067C
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Aug 2020 09:02:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2x1gptGB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sRE1cL8e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 654E22067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=scSKpWvOAnZVhIgVtxpXu1ToBsOATrt8mPdvUFY49BM=; b=2x1gptGBlvqWbK6baPyD9MKbH
	VSMzuSXFglGXAHXUfEk4tGcRqLD8UMJ3jNmsk+i8WvUBvUJg1hpWEG6CEmF1OB0G8+DHC2KZyxIyl
	mJUCiGBOjGapS5S4xbo8QQeo37qH6uidwmYxODY/hKm3mVEHaF6UzChAIW7lCukjZRjlYL6O5Cf31
	/E1yje5/t926NfePa9GLSBFKMl8G3RZxq/GPLq/Qwt7NJ7VgYy1jhDoDpZAaaGaigJ0lnuyOag6it
	cA2CB6lDRMtjXhoAC9i9kT4gltB+Ey9Q1dR6FnZyY58v+PpYayGpKp95P00urZ2HXZQ7w4Qid3PU+
	etviPuK4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAUpy-0002c5-8O; Tue, 25 Aug 2020 09:01:50 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAUpq-0002bD-0X; Tue, 25 Aug 2020 09:01:43 +0000
Received: by mail-io1-xd42.google.com with SMTP id z17so11679774ioi.6;
 Tue, 25 Aug 2020 02:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/JxcgaDbULCnptHgVEYW3WE8fpXfhJ/PrwruZOn3iWo=;
 b=sRE1cL8eQlPm5tP6WDbjsfJCehc4TmxikrDSl7AkQFUhAIkbIPPGPyB3WqUHgda5st
 u6bgChyX/ZZEhuLR9Xw5HItqY1KVEY14UeypxYD8gsg41vTwza4F8vMePBtS7HGRpFMm
 PNBsRuIzv6FS1kuj9HPZrzJviCmNGqXwHaA3IlyKBoWMB5sbDOh6FgcLIZyVMAfX57xG
 D2Tktomhd2pT2m5sPXwQeeaDv4AvY0gvElrcp40Un9sQCnHP0H8Iwe4NmBnx5Pzfp4+8
 Xz2mpK8d4QBTjqs5Sz5lQ4ev9L8LKkcRjRWBv6+JnE99irXTgtWF3IGAXkkBwQqqtb7b
 UCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/JxcgaDbULCnptHgVEYW3WE8fpXfhJ/PrwruZOn3iWo=;
 b=dF7hVD1nLwOho1ZZ12pEd5xd2v8hP0gtTqTOQWOoZx4hMa0mwb5c7/zKNbJlMyIoMF
 92qoi10JZboKVYNWH5UEJEpGWB1CCCyAds4U7d++4fkf2CZVD7RdF1Gd+RIiJ/h554OA
 Yd5lOVoyrX9LGKQT97bMcLVERaHQHzNmgfuK539S2K4CChLctqp3Z5YPLN1gOqqXmdbG
 Qc4kmDdpJZGClxMOb5OKb2nHKCErEyKA47IZCPuX2KYn9s+vd/LKAyeZvsof85kzNvyH
 eLdsucFKAxIEF31GL0lNmGkDGnlLk0CHwwBCYlfCqvEFtIOAvG2VLosgJ4tGhYGDcGMp
 m/1g==
X-Gm-Message-State: AOAM533BgJgQ5DHVRAqML44/U3TdDyAVGYq1RkVREaJBcC35k7qqPUKx
 9xJ2Asu1Sc88ksuKXFdJgIiRQAvLoAV2BBCwkQE=
X-Google-Smtp-Source: ABdhPJy/Lz3gTkcMcA7Fnu2cejGn4aBju3+/h6ns8W73b0vBxJEtaO56YrqX4053pfUaNVRsvej2hr6CGTxPKxRpz3w=
X-Received: by 2002:a6b:e419:: with SMTP id u25mr8281919iog.159.1598346100178; 
 Tue, 25 Aug 2020 02:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200820121323.564-1-linux.amoon@gmail.com>
 <20200820121323.564-2-linux.amoon@gmail.com>
 <7hlfi9xgch.fsf@baylibre.com>
 <CANAwSgTZ23jFPAO46vRg1Dx_Bzi=4Bg6KHE0ozLQGky4p_fgKQ@mail.gmail.com>
 <CANAwSgQLnqDnuQvLv4cvaeTPeBW=H_g5F2aaNue_hb4nKLdovg@mail.gmail.com>
 <f7e6ce5f-02b0-065b-ffcf-2826159f926a@baylibre.com>
 <1j7dto3ylq.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j7dto3ylq.fsf@starbuckisacylon.baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 25 Aug 2020 14:31:29 +0530
Message-ID: <CANAwSgQ1Miu73hfdK+cgL3howpekn2xj_5qwGasQZwtQpSGj5Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_050142_110095_4EC014C0 
X-CRM114-Status: GOOD (  23.62  )
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

Hi Jerome

On Mon, 24 Aug 2020 at 20:00, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Mon 24 Aug 2020 at 15:50, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> > On 24/08/2020 15:41, Anand Moon wrote:
> >> hi All,
> >>
> >> On Fri, 21 Aug 2020 at 10:13, Anand Moon <linux.amoon@gmail.com> wrote:
> >>>
> >>> Hi Kevin,
> >>>
> >>> Thanks for your review comments.
> >>>
> >>> On Fri, 21 Aug 2020 at 01:03, Kevin Hilman <khilman@baylibre.com> wrote:
> >>>>
> >>>> Anand Moon <linux.amoon@gmail.com> writes:
> >>>>
> >>>>> Enable RTC PCF8563 node on Odroid-N2 SBC, In order to
> >>>>> support the RTC wakealarm feature for suspend and resume.
> >>>>> Also assign an alias to the pcf8563 to rtc0 and meson-vrtc to rtc1
> >>>>> timer device to prevent it being assigned to /dev/rtc0
> >>>>> which disto userspace tools assume is a clock device.
> >>>>>
> >>>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
> >>>>> Cc: Kevin Hilman <khilman@baylibre.com>
> >>>>> Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
> >>>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> >>>>> ---
> >>>>> Changes V3
> >>>>> --Drop the INI GPIOAO.BIT7 pinctrl.
> >>>>
> >>>> Why did you drop this GPIO?  Isn't this the GPIO that the RTC uses to
> >>>> wakeup the system?  If so, this should be included as part of this
> >>>> patch.
> >>>>
> >>>> It probably still works because the bootloader configures this GPIO as
> >>>> input, but the kernel should not rely on the booloader for that, so
> >>>> please include as part of this patch.
> >>>>
> >>>
> >>> Ok I will figure out the correct pinctrl need for this settings.
> >>> looking into the Odroid N2 schematics.
> >>>
> >>
> >> I am trying to map the RTC INT pinctrl, ie RTC INT GPIOAO.BIT7.
> >
> >
> > Simply add:
> >
> > interrupt-parent = <&gpio_intc>;
> > interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
> >
> > to reflect the interrupt connection.

I have tried this setting, but it is not working.

[alarm@archl-on2e ~]$ dmesg| grep rtc
[    5.378002] meson-vrtc ff8000a8.rtc: registered as rtc1
[    5.942307] rtc-pcf8563 0-0051: pcf8563_write_block_data: err=-110
addr=0e, data=03
[    5.942316] rtc-pcf8563 0-0051: pcf8563_probe: write error
[    5.945983] rtc-pcf8563: probe of 0-0051 failed with error -5


> >
> > No need to setup pinctrl here since the GPIO input is always connected
> > to the gpio irq generator whatever pinctrl mode is set.
>
> It is actually better to setup pinctrl. Yes the irq controller can work
> whatever the pin setup but if an output function is active it can mess with
> what the irq controller gets.
>
> Think about applying/removing bias if necessary too.
>

Ok, I am trying to add a new pinctrl configuration for
TSIN_A_DIN0 //  TDMB_FS // TDMB_SLV_FS
But it's still not working at my end.

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
