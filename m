Return-Path: <SRS0=0688=YB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DATE_IN_FUTURE_03_06,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43044C47404
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2019 01:45:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1527420867
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2019 01:45:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p/F3m/hk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVM9BcVL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1527420867
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TSAeu+UgDqZUvX1cVj4jeH9a4XQnxlASrtTUdeb8Yq0=; b=p/F3m/hkiI0JAB
	P89FIaZXWGdODNjv4n3FBsQFGpvgfIQ0GoKBRCrt4ZcKQTwHHnYhwFgUU6wU7D9DATzZ5tZoRDtv1
	6i/ulJ0G4KNQcE3D5wkbez6OmTO9mkFYIhucwFnV4LDGAMcDbptHGGAyPAfGa8FkJrOO+AcwDv2x/
	6RlqIEVQQvVcaaNE0iqofwTy7RfPz0LfE8e9L986uNPnfjx+BH0EDDmSnuzAiUPgpCsMCveJp+asu
	Ctn+0vN7Y+WoQ7qhRtSHU0i8DNYCy8lmHM0cJ/1VCYV/jUEWDFd5vxkAmJVNlDZgwbQ3lMSiM7duo
	JmNwJWO1fCYBe7f+ByOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHeYY-00063D-5j; Tue, 08 Oct 2019 01:44:54 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHeYH-0005sX-5h; Tue, 08 Oct 2019 01:44:41 +0000
Received: by mail-io1-xd43.google.com with SMTP id c25so33026848iot.12;
 Mon, 07 Oct 2019 18:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fw209Whs539FleYIAnU1s0PqSxWW0KiTK1H4R+hwlPI=;
 b=OVM9BcVLoy6BaRIpxY8+rAgvJ00VTOBWAiySLb/FwcAzbDZIwDGGgb/C/oZ7axKGns
 mIk7bwGQo78Ahi0c0ZEyjVw2ZvYCuNod3xX2tppd7mTUr7GEUqfJvaLVfBIj+3O1/Z4X
 iQqBoxjeQlZiHtcbpZbqYpkG7VdOJxx3lPTQ/m8/BaA/Pw6E14XOXVPunznX76FNaTd5
 EixN7GlsZxlvh6v0Z9rsJ6+A1rvHUowLrR8u7QB4QVRISIJNcUqTz0m1MAEzn60FFs0G
 F1jUK+zocZQwlIkQ5HUFJ5CaVRupKdrjW98xH/W49nKbhQZA4NNEC8yuz7XOv250B1m+
 92gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fw209Whs539FleYIAnU1s0PqSxWW0KiTK1H4R+hwlPI=;
 b=JnMPrOxv0G1j1XGcm2Z2Pf7SAds2s+N+PW36iPC5cqHP6kj0QWXMiSnwTaoq+9z5/G
 267zPxCsOFUGufRENymTXyllN/NJxLLFGaQ8HsN6wfsYpFoY3nj8SS44GHK7vL+Gbwy1
 WuFZ4OsVRmqb6eJKhGR1auGWRHFRwOStAITjor85UtPHrDUK9g7Ng7CVMV3naljusWM7
 sBoaOYu+xgWfOT1Eu4I3W073V11WzNWOIl8hX9M6/EYCXnGuisMNbPyJqlrw4z0+gADK
 +o0aIm0yMFRNz3IH1fsPITaZv5oHlbWtMc/fYqD7vWYhZJgsRgXXGaj2k/Opj2TZX6Us
 zUlg==
X-Gm-Message-State: APjAAAWrY1UFLY1q8vnDIDRGr2mew4Lp6fy01uzjAuM0y/1Ge+ip1amO
 tra1slL2FLsNUl912daeblAhphr2NGagBeJ9lW0=
X-Google-Smtp-Source: APXvYqxt6/0xninW5CnKNuJYQqbikrgLXATP2QD131RmcPQ9Z/5vmjUUYkrZ6xXfXBxL3RpKBYFfL7OfUy6i9llje9k=
X-Received: by 2002:a5e:8c15:: with SMTP id n21mr11990598ioj.246.1570499076276; 
 Mon, 07 Oct 2019 18:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <20191007131649.1768-1-linux.amoon@gmail.com>
 <20191007131649.1768-6-linux.amoon@gmail.com>
 <CAFBinCAoJLZj9Kh+SfF4Q+0OCzac2+huon_BU=Q3yE7Fu38U3w@mail.gmail.com>
In-Reply-To: <CAFBinCAoJLZj9Kh+SfF4Q+0OCzac2+huon_BU=Q3yE7Fu38U3w@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 8 Oct 2019 12:49:46 +0530
Message-ID: <CANAwSgQScXdKewfBtu-o_sjRb-pk+CvJrv4RunGJOzz=DWjBnQ@mail.gmail.com>
Subject: Re: [RFCv1 5/5] arm64/ARM: configs: Change CONFIG_PWM_MESON from m to
 y
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191007_184437_213642_F26EB046 
X-CRM114-Status: GOOD (  13.94  )
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
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-amlogic@lists.infradead.org,
 Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin.

On Tue, 8 Oct 2019 at 01:40, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Mon, Oct 7, 2019 at 3:17 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index c9a867ac32d4..72f6a7dca0d6 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -774,7 +774,7 @@ CONFIG_MPL3115=m
> >  CONFIG_PWM=y
> >  CONFIG_PWM_BCM2835=m
> >  CONFIG_PWM_CROS_EC=m
> > -CONFIG_PWM_MESON=m
> > +CONFIG_PWM_MESON=y
> some time ago I submitted a similar patch for the 32-bit SoCs
> it turned that that pwm-meson can be built as module because the
> kernel will run without CPU DVFS as long as the clock and regulator
> drivers are returning -EPROBE_DEFER (-517)
>
> did you check whether there's some other problem like some unused
> clock which is being disabled at that moment?
> I've been hunting weird problems in the past where it turned out that
> changing kernel config bits changed the boot timing - that masked the
> original problem

OK.

>
>
> Martin

Sorry for linking this two separate issue PWM failed and microSD detect failed.
Thanks for the input, I will check if you patch help, I will try to
investigate more why it fails at my end.

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
