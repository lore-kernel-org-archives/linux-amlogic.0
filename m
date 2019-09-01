Return-Path: <SRS0=MCOz=W4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CF3C3A5A4
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Sep 2019 21:54:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6655A21897
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Sep 2019 21:54:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jI5vzo41";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="H+EogopS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6655A21897
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lUZEiyYLRt1UWkUKxOzQGKPEpHffi3CGU8TLAqmiyfw=; b=jI5vzo411NO6Hx
	kKFr3im4bWUQTCfgNVPuJFX6yuD+LiOhMIYRAnKTM6mOOiQUydWvVY9+o/IVxG4zXug83iinDjgtp
	N94FgniWTWdW5Jx8UfhmM6Ohqi7AL8vEh0nMA/yo6VCIjrRKLYq5c6kcD0lKMT+8t6GiCCRY91P0O
	NbVESdxbfxNrqbxYosocNvPS49un4qX74MzwAt2egHy3lkTA3mmSdGuawkmpaTRcSGugOPE6im+pL
	JGFg1psrh6JDg1SWUxdCRFL7DXa+/6BtmySx2H7QqpgmZe3L86+ZCNlLTvMFqvDn29ypq7o1NcMpx
	ipmNnBS9+iAUx1ln+J9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4XnS-0001fu-EU; Sun, 01 Sep 2019 21:54:06 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4XnF-0001W9-8a; Sun, 01 Sep 2019 21:53:54 +0000
Received: by mail-ot1-x344.google.com with SMTP id 21so4464076otj.11;
 Sun, 01 Sep 2019 14:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xEhJt/EuEX52SqVPgMOZhCHD3vE6EwjavZnuWjJauI8=;
 b=H+EogopSS6+QVKxTUznOCWYUqIImQHvhH0GL9wHPsyQ6eOMFL8bDOv5lhma6JKWPlG
 nDtYXlzi8QhyegV9QBIRM/oMLLAO4cGBoyto0KytwdqZTLccD5YJrO+aaDcNt+D5ehGr
 zpsmFdaBL4aQ+UDghAsrzQ4Z/YQjQ2mYbKSV81hT4ucrHCASnt1FnIsWEhMeemIDVgOn
 IATEZdOzxNPXhstaXLYKg7jYtJ3+OMuWnV+F+szT1qCnEQZGiJD6ME7/XxPy37sLSXO5
 4TvNGf17IV9WvPSHXkPO8DiHIuUnEtcTpac10CBMOFWdl6XqJH0Y3jPIN8GxtxFWipnX
 BvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xEhJt/EuEX52SqVPgMOZhCHD3vE6EwjavZnuWjJauI8=;
 b=s49YjdxYuIeyBe66JQ01WXHOxf/qHmDoQPeB9VLUp1B2+wI3AKa6mr9jYVMZQ3BZjn
 UXcONMQjSFkCV9jnts2yMV7RuhRMD6MuQYoR6nEbmVDmGIs+LnL7wXhVTFHlvj98l0q/
 hegmcZUSTHLyp4N/mo2xXBQhsKHBqgwV+X5qsjeyxzRclnx0d9RPGaxJT61ytLuTGRXx
 3z78GW1sLWWOcuHdUGEBJJ5cajtbNd3AgOWTNLCKvCVCOeeYzwPIXKpLEsbmo5CP0dSs
 2UU+44OqkvRQ1GIAfGcga56e6EcyMCJ5ofynk/1ReOk8pva0w2vN3WmLxXNoAPz5kscd
 JZhw==
X-Gm-Message-State: APjAAAXInQfMmqgD8sturbIM6unMDL20BqBdE8NkUOz5BTcyFCxASf0/
 qLJatkGKirNmGAOimLmxaFxvxfIgBnju2GtJruo=
X-Google-Smtp-Source: APXvYqz41KOD9u8sFziIzz6VBDnTuq9iWWzjB30yrB4xnLoj6n3Q0Qn4Mrcrjr0+WD/lgauNBmWiK6648rEIyDKKEe8=
X-Received: by 2002:a05:6830:1e5a:: with SMTP id
 e26mr20076301otj.96.1567374832185; 
 Sun, 01 Sep 2019 14:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190828202723.1145-1-linux.amoon@gmail.com>
 <20190828202723.1145-2-linux.amoon@gmail.com>
 <CAFBinCBWq0LcdA1-a5W06zKp0RzGs5_=Mph6StGKXJ7npCgbfg@mail.gmail.com>
 <CANAwSgS+HGYXr290=EvdhKxh3TiBOqfbcuuF4cMAiBVX1ez9+Q@mail.gmail.com>
In-Reply-To: <CANAwSgS+HGYXr290=EvdhKxh3TiBOqfbcuuF4cMAiBVX1ez9+Q@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 1 Sep 2019 23:53:41 +0200
Message-ID: <CAFBinCCLPa64_h0JE4Z_pMuUuhb=HKUXPti2pkUFAuEPO2fE6Q@mail.gmail.com>
Subject: Re: [PATCHv1 1/3] arm64: dts: meson: odroid-c2: Add missing regulator
 linked to P5V0 regulator
To: Anand Moon <linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190901_145353_383806_8DFEBA09 
X-CRM114-Status: GOOD (  12.91  )
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
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Anand,

On Sun, Sep 1, 2019 at 3:58 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Martin,
>
> Thanks for your review comments.
>
> Their have been some revision changes in S905 Odroid Schematics.
> [0] https://dn.odroid.com/S905/Schematic/
>
> Well I have make my changes based on old odroid-c2_rev0.2_20151218.pdf

[...]
> >
> > according to the schematics there's both:
> > - VDDIO_AO3V3
> > - VCC3V3 (which is turned on by VDDIO_AO3V3, see [0])
> >
>
> From the schematics it seams same.
>
> VDDIO_AO3V3---DMG340LSQN4 (Q4)---VCC3V3
yes, they are the same signal. the only difference is that VCC3V3 is
turned on later in the power-up sequence

> But this name change was done to link TFLASH_VDD_EN to TFLASH_VDD for eMMC
>
> VDDIO_AO3V3-----TFLASH_VDD using  TFLASH_VDD_EN gpio pin.
>
> Well I have tested this changes on eMMC module.
I cannot see any of the TFLASH_* regulators being linked to eMMC (they
are only linked to the SD card slot, I also checked
odroid-c2_rev0.2_20151218.pdf and odroid-c2_rev0.2_20171114.pdf).
which page of the odroid-c2_rev0.2_20151218.pdf schematics shows how
TFLASH_VDD is linked to eMMC?

please note that I don't have an Odroid-C2 board myself (so I cannot
test any of this).


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
