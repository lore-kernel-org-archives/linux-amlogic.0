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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D200C433E1
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2020 07:19:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC5B62067D
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2020 07:19:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qM9Z+9d0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFZLCLyh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC5B62067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3JOa+0mj1U0yRioSr2StmupdTfgLImwJPjViMR3TU8U=; b=qM9Z+9d05wZ350q1pjPQqB2Wm
	DY6r8fxpavyodAmKQz6KBVptpKt1dgUCdeJGVTA5ob41C9DlCHW2FZWQaQwbYeceMhibIwduusPs5
	S28Ech0IMZ9jM2ZwXt8m9O3yvT1r18tjRaBCTJXONkYQeoy+5Bw9FYeNnSrgYXp4cdcVqpAHc3HDE
	y29VJCTi06OBxrIaK/2XKUkwaHhjHx7QF3r7Dl3fPw3VLDQSwvQsik7PdO2B/blE7pnkosGs6+btl
	2pqOBBLRPxXJi5K0gOA/svHBeX801cYI8gUTQ5e+qH0Uhb6bkQmxxvMSY04fzMvGtkzmPQrInE1P6
	kRa3mWYUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvyB8-000694-3D; Thu, 16 Jul 2020 07:19:38 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvyB4-00068E-5F; Thu, 16 Jul 2020 07:19:36 +0000
Received: by mail-il1-x143.google.com with SMTP id q3so4188163ilt.8;
 Thu, 16 Jul 2020 00:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cPaT6yZEAJv5zgMr+GGSz/mVbWAnh4CvCC7E3BFSNuo=;
 b=kFZLCLyh9bKYLfSTlRxO8mJLZZ58nkjBlTwxdrnh39p/xgaSL9wcj0VvzPOKr0LBgx
 btzVmMrpX81ZxyqoYDGXtiDb4nxpVGSSSmRo5JN/7voTi0wS1XFlPoA8LccnY6ylDkRk
 UdPVNbtQYAYjN+W2FvdC7RfG3G87fqmhY7Gk7OQfT0+NL1Wuvr+fflbaY8HgPyHetIAL
 CsVGrrBoLZI1gs+vBlLOgGzr/2LQaI9LtcfARWvI7zNgPwvkS8GsrJy1O/pk91ykntO1
 xgYvvaD4kyhhrbMpanMNDt9Itz5/EQ//1POtC2mY9W/s9BfyIyW65e0pNGaNrGe5joN7
 RgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cPaT6yZEAJv5zgMr+GGSz/mVbWAnh4CvCC7E3BFSNuo=;
 b=Ua25YHAEfYfmJA43VC2hZmkTqiALpZBJawyy7pBARS9Oe/SwDIC8z4J3mM2zV6anTn
 TekS5rQLnTR2emvM9LTAOtPEbQCmG3/GldYGCV1/MyKsucll0Tfl1YJun6Ov4biao+Bl
 QKI3i+SBBsUwFVBNTWysMUJVj/uepmEGIwb+1vI175g6AtJtcMKphzX20Mj8z2dVdwM1
 49FctoHfXdKiLheZrRk81gwT0vi7fGXdn063EJPWAiaycipDyqMw+JOl4KxgYkhx5uZ/
 8BTSG/P6yrYWxuxD6OGHqAqfpspuhYjFR78Tp6xagAxhYSuAuEpx7E2fBBzKj1Fk+Ssh
 p59w==
X-Gm-Message-State: AOAM531QAKJM6ZIMVIHjEGsPGuPU01OG9/dNZh+l/OPH4Uf3GlkFWyAA
 IOp5l4KshKGQ/Za8WIqIy5JRUdAQHD2Sg5IVqBE=
X-Google-Smtp-Source: ABdhPJzmif/eCN5WZYiPDkZWSKHSviO6v4kNHP9sNOOTth0eb4+QpR2hcyzrdXQgwRVNiaiFr9IimTHeR7Nf697yfZQ=
X-Received: by 2002:a92:98c2:: with SMTP id a63mr3233353ill.246.1594883971232; 
 Thu, 16 Jul 2020 00:19:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200715160209.652-1-linux.amoon@gmail.com>
 <20200715160209.652-3-linux.amoon@gmail.com>
 <630df1a7-8809-1af2-e424-8190a503a9d6@baylibre.com>
In-Reply-To: <630df1a7-8809-1af2-e424-8190a503a9d6@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 16 Jul 2020 12:49:20 +0530
Message-ID: <CANAwSgTkFd0P0zJ48AVRWB4roQHsLainzypokYOD+L4v6gbGxw@mail.gmail.com>
Subject: Re: [PATCHv1 2/3] arm64: dts: meson-g12b-odroid-n2: Disable virtual
 wake RTC
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_031934_214412_03E619B0 
X-CRM114-Status: GOOD (  15.52  )
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
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

Thanks for your review comments.

On Thu, 16 Jul 2020 at 12:35, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 15/07/2020 18:02, Anand Moon wrote:
> > Disable virtual wake RTC node on Odroid N2.
> >
> > [    7.171149] meson-vrtc ff8000a8.rtc: registered as rtc0
> > [    7.182875] meson-vrtc ff8000a8.rtc: setting system clock to 1970-01-01T00:00:07 UTC (7)
> >
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Kevin Hilman <khilman@baylibre.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > ---
> >  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > index a447cba4dd53..c8c1262a7bfc 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > @@ -517,3 +517,7 @@ &usb2_phy1 {
> >       /* Enable the hub which is connected to this port */
> >       phy-supply = <&hub_5v>;
> >  };
> > +
> > +&vrtc {
> > +     status = "disabled";
> > +};
> >
>
> Please don't, the vrtc is here to wake up the device.
>
> Neil

Ok, I thought that there would be conflicts with the RTC module,
that's why I disable this node. I will drop this patch.

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
