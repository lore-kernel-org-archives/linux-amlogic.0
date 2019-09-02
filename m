Return-Path: <SRS0=Oax9=W5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4560C3A5A4
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Sep 2019 01:19:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 867782184D
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Sep 2019 01:19:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L93Fuzoy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJFndeRm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 867782184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2KSZdMt74qwdYRHYQgPsl22z7CIZEAJdS7mLyHQ1CTo=; b=L93Fuzoyx9hmT6
	ofltq+J1zq9kTrav1MNnjHbQLN9XnEUOS917FGpchDnozy42ACcjojfHTUJ3/RfndsgPsGB29NPRx
	PeJggxbPLiJXCm+bMtNGplkpOpXnE8f3iOgS3bcHmtD9DZhr31KPOgsowjv+ogNyPJYlbBqV4HBMi
	ohq/Q4wlWReNSyFZ5RoK/UQtBA+qao6A8IM3BCRuRSq48Njr7KW80OEJliE+7wklMyh8daso6KnM4
	ooZdcg9v7r0VuVUxl0z6aZZFBtz/E191jVEN0dO7QKWrhfoAdXIJAOIzTAjgTtd+ywIIF7DOLiDHy
	KqRO6GgEzfeIZQBT5/tQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4azX-0003Hw-SI; Mon, 02 Sep 2019 01:18:47 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4az7-0003Ag-OL; Mon, 02 Sep 2019 01:18:23 +0000
Received: by mail-io1-xd34.google.com with SMTP id b10so26075210ioj.2;
 Sun, 01 Sep 2019 18:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sO42KCp2F1BVVy0mnKBt9Vus/HrCCbUOcWtHspdbidA=;
 b=XJFndeRmSX0J60cBWb5Pl6nwkDYWWu+6m5+hqN3MqlI19bLGRXu21vV2tmTCvzqrkd
 R8jVR/Y+Fz3QNKZkLNCWj8ANMMnkflemBXKMeFTXVYa0yB4q/C05+6dvR/6fC1e00kuF
 AWmg+sRNLNU+GgIpOq51TQr9nSYzbt3NtSXvL8YHi7t0Z3MRL9I8yt1FsT6/jfX/Q/Zs
 rf1EA1kNbi0KJI5QB8lt/RjarO2ZjyxmIS42U1/wBdpB/W+ZhBBR8JhyFgqEtlvy6BTZ
 FcLjl0UWZ/X5ZkKTOV54z5H0h03/KYgZSbJSMJxj1jMRi8BA2w6Xrj0/DsBpduCEY1ml
 1Tbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sO42KCp2F1BVVy0mnKBt9Vus/HrCCbUOcWtHspdbidA=;
 b=AHEdqSX80N6glka9Am3gQdSnmXoHVazcUaq0xUR/xaDrh7Zj/RA7zrf0bZi+lqOeGA
 8eEm0696NH+EZRg65X9d78kFUQwvixTL15EMZSAbNd1z9E60nOnQYPzPeD0eYho3E2SO
 Ej5ocWZjoLQ8r5LsTOlHREPtE25RtATrdeGg0AY/gv1vg3ximbx0yJ7FQJAWUMLRPUBu
 C2HyXy2UyBlsLwAffXUH9HCf6ESOiwavwap1pFX5jruKh73ad5yUmv7W7oNl1ZYLv2FS
 IyuBfCVQLvmmli4OyLlkzgePe6jAxTKFApLjkhWbPIOtJlalGNUGjxOoNPOeVGAR9qhz
 yMEg==
X-Gm-Message-State: APjAAAUhA/aRjgzn+hNN4Z/dnB+Q0aKfP/81irco7DlRe7r5LkYsozWm
 xu+N9w/wddlrP8piVTdhuxBKt91iVW6RCuvbOsE=
X-Google-Smtp-Source: APXvYqxMV47N5X/vUxjVExPfpQ++jyOIgMFhA/LhDqItTA2hAXcTqHdda6Q2bPmGBITO9UxVtyqih4ySAUoEPw0fggM=
X-Received: by 2002:a5d:9bd4:: with SMTP id d20mr2538618ion.243.1567387098254; 
 Sun, 01 Sep 2019 18:18:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190828202723.1145-1-linux.amoon@gmail.com>
 <20190828202723.1145-2-linux.amoon@gmail.com>
 <CAFBinCBWq0LcdA1-a5W06zKp0RzGs5_=Mph6StGKXJ7npCgbfg@mail.gmail.com>
 <CANAwSgS+HGYXr290=EvdhKxh3TiBOqfbcuuF4cMAiBVX1ez9+Q@mail.gmail.com>
 <CAFBinCCLPa64_h0JE4Z_pMuUuhb=HKUXPti2pkUFAuEPO2fE6Q@mail.gmail.com>
In-Reply-To: <CAFBinCCLPa64_h0JE4Z_pMuUuhb=HKUXPti2pkUFAuEPO2fE6Q@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 2 Sep 2019 06:48:06 +0530
Message-ID: <CANAwSgRVkJXNckcNELKhj4R_Lex62WJn3K4ct1wkuocMjfWAAg@mail.gmail.com>
Subject: Re: [PATCHv1 1/3] arm64: dts: meson: odroid-c2: Add missing regulator
 linked to P5V0 regulator
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190901_181821_820091_0B667CC9 
X-CRM114-Status: GOOD (  16.27  )
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

Hi Martin,

On Mon, 2 Sep 2019 at 03:23, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Sun, Sep 1, 2019 at 3:58 PM Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > Hi Martin,
> >
> > Thanks for your review comments.
> >
> > Their have been some revision changes in S905 Odroid Schematics.
> > [0] https://dn.odroid.com/S905/Schematic/
> >
> > Well I have make my changes based on old odroid-c2_rev0.2_20151218.pdf
>
> [...]
> > >
> > > according to the schematics there's both:
> > > - VDDIO_AO3V3
> > > - VCC3V3 (which is turned on by VDDIO_AO3V3, see [0])
> > >
> >
> > From the schematics it seams same.
> >
> > VDDIO_AO3V3---DMG340LSQN4 (Q4)---VCC3V3
> yes, they are the same signal. the only difference is that VCC3V3 is
> turned on later in the power-up sequence
>
> > But this name change was done to link TFLASH_VDD_EN to TFLASH_VDD for eMMC
> >
> > VDDIO_AO3V3-----TFLASH_VDD using  TFLASH_VDD_EN gpio pin.
> >
> > Well I have tested this changes on eMMC module.
> I cannot see any of the TFLASH_* regulators being linked to eMMC (they
> are only linked to the SD card slot, I also checked
> odroid-c2_rev0.2_20151218.pdf and odroid-c2_rev0.2_20171114.pdf).
> which page of the odroid-c2_rev0.2_20151218.pdf schematics shows how
> TFLASH_VDD is linked to eMMC?
>
> please note that I don't have an Odroid-C2 board myself (so I cannot
> test any of this).
>
>
> Martin

Thanks I will double check again and re-post then with correction again.

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
