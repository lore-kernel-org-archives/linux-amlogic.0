Return-Path: <SRS0=Tn3k=OJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3987C04EB8
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Nov 2018 22:46:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 715EF20673
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Nov 2018 22:46:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k7/I8mR4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ilIyqPOT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 715EF20673
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4yylb3EeAjbfMw/CUrlpq+D8gZ91Infkdt1+XC6ezwQ=; b=k7/I8mR4GGaKLr
	l+PDNDjCyVNBq/jwjSMzbHo38HjyQ/9pJVN6L4LzahDawR+gIMp9aDYCwl07aA45uM9N7F2va1aul
	eCey5U4b+TNCGy5q/bKVPGOPhPN9HUjlPxoFJ3DcOos8QIXNCMXp2NVDBlqmkqWSpS9NjV6bai1y+
	R3uFNGJEvNdF9ZBD/GFwVxgSVAtmEYnq8YHiy5ZNaobiROFiFNBOQSOtB+jIp63/8u0kJ9yVmt8s+
	QJVn5TuTrVd7ootawAI6iWHP2aWNFDCBBM2nVtrAJAcxhwhhNXT5Xt53Ri7+0VX9ioCJUxJ24s2y8
	hZ5foHPAJq8eTzD+5Mzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSrY9-0000ib-Fr; Fri, 30 Nov 2018 22:46:17 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSrY7-0000hf-BJ
 for linux-amlogic@lists.infradead.org; Fri, 30 Nov 2018 22:46:16 +0000
Received: by mail-ot1-x341.google.com with SMTP id a11so6569485otr.10
 for <linux-amlogic@lists.infradead.org>; Fri, 30 Nov 2018 14:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d66nfdb6nRHfyIxjtkymN7FcacI50xatMuiTDWYRxCg=;
 b=ilIyqPOTKdnfxrRQmABlndAaM9ftZrcf2ozNPjLsTvLKoEb7UkZQa7NexMMHjRqHx7
 E7JGExVR1xmcu3tMCye/+8Hu9f0cXOBK57xHGYgwM53bklYVMUtRw4aX2MyVOuuj6dok
 MooYQRpz3SSJoMA/FYHn7vI2NIlIh60yHJ7EfSrc/XJBrGXFxRX7S+j60z9TH6QQPSIF
 970aqVJVWKrwM4C6VArwvxbBoID5qf6LLvUxhtbvaBz29ZPrhCpw0CXCKf3i0EFYPzjn
 dSm5ZTqmum6uUJOxtGmV0jYlOh0h2I7Ho6KN3eQsoR3ropsIe2N6w61hmokaZbP4R1kV
 Pw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d66nfdb6nRHfyIxjtkymN7FcacI50xatMuiTDWYRxCg=;
 b=gY5AtEC9u1BHbV/17l3Nh/AfxlrSz2XAU9u8diEj9Lb0PhexWJmy93pNlq/7H9Q1Ps
 6dUAmEF0qxv5seIlskFd1NJpc4FMQ1BT5DRCTiQkf4IBBpLwOICBxxuF8Uou8pu1Lmp9
 RJJ0+hCOfp2XGUhwlKe26+VOXiyl/QH1fFL24qDhR19fznKWwxGYeGAxdNcYXARCHXcv
 7X8/QLhPt6osG6j5W/e++xZSXqslU/a8/i2AlxcrMFhBdwon9tRdFR6eYGlrL+t/0qQH
 a7kNzR67R+XNYRp6aNR864bCcBxQzB7f2VaVIYJ5PjhRtAKo0ZIxMweHwb0FV5MB7JCN
 s+Tg==
X-Gm-Message-State: AA+aEWZpVuMraCu5QBsbg4hL939OPLScfwidLjGTR4odEhLwdS6ziDdL
 eeixrblcS3RbGoEkrNPde0cAJmKYomf36sfn0dLvZkST
X-Google-Smtp-Source: AFSGD/UdfImz4EVK5/UOGGV6c0vRKkbQB0GTn8Aesr7MYurCQCpM5B2d5+9eWgT4VKG6aLhWjDQmYdwkGrFskAcbl5w=
X-Received: by 2002:a9d:6a8e:: with SMTP id l14mr4500301otq.348.1543617962894; 
 Fri, 30 Nov 2018 14:46:02 -0800 (PST)
MIME-Version: 1.0
References: <20181028120859.5735-1-martin.blumenstingl@googlemail.com>
 <20181028120859.5735-4-martin.blumenstingl@googlemail.com>
 <6720a94f-ee87-937c-e360-87c2e37d29aa@baylibre.com>
 <7hr2f25t4b.fsf@baylibre.com> <7h4lby5nky.fsf@baylibre.com>
In-Reply-To: <7h4lby5nky.fsf@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 30 Nov 2018 23:45:51 +0100
Message-ID: <CAFBinCCH2AOV0nJBzEdE9=rfb7d=L-Uni2gZkfdLAbLg+GkiPw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: meson: switch the clock controller to
 the HHI register area
To: khilman@baylibre.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181130_144615_413197_6F401819 
X-CRM114-Status: GOOD (  19.11  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, sboyd@kernel.org,
 mturquette@baylibre.com, robh+dt@kernel.org, carlo@caione.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Kevin,

On Fri, Nov 30, 2018 at 9:15 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Kevin Hilman <khilman@baylibre.com> writes:
>
> > Neil Armstrong <narmstrong@baylibre.com> writes:
> >
> >> On 28/10/2018 13:08, Martin Blumenstingl wrote:
> >>> The clock controller on Meson8/Meson8m2 and Meson8b is part of a
> >>> register region called "HHI". This register area contains more
> >>> functionality than just a clock controller:
> >>> - the clock controller
> >>> - some reset controller bits
> >>> - temperature sensor calibration data (on Meson8b and Meson8m2 only)
> >>> - HDMI controller
> >>>
> >>> Allow access to this HHI register area as "system controller". Also
> >>> migrate the Meson8 and Meson8b clock controllers to this new node.
> >>>
> >>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> >>> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> >>> ---
> >>>  arch/arm/boot/dts/meson.dtsi   |  7 +++++++
> >>>  arch/arm/boot/dts/meson8.dtsi  | 15 ++++++++-------
> >>>  arch/arm/boot/dts/meson8b.dtsi | 15 ++++++++-------
> >>>  3 files changed, 23 insertions(+), 14 deletions(-)
> >>>
> >>> diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
> >>> index 0d9faf1a51ea..ad903d1a2cb6 100644
> >>> --- a/arch/arm/boot/dts/meson.dtsi
> >>> +++ b/arch/arm/boot/dts/meson.dtsi
> >>
> >> [...]
> >>
> >>>
> >>> +&hhi {
> >>> +   clkc: clock-controller {
> >>> +           compatible = "amlogic,meson8-clkc";
> >>> +           #clock-cells = <1>;
> >>> +           #reset-cells = <1>;
> >>> +   };
> >>> +};
> >>> +
> >>>  &hwrng {
> >>>     compatible = "amlogic,meson8b-rng", "amlogic,meson-rng";
> >>>     clocks = <&clkc CLKID_RNG0>;
> >>>
> >>
> >> Kevin,
> >>
> >> I didn't apply this one, but it can wait another cycle I think.
> >
> > OK, I'll take that one through my dt branch.
> >
> > I don't see any obvious dependency on the clock patches,
>
> ... and a quick boot test shows I was wrong, and should've (re)read
> Martin's cover letter a couple more times. :)
yes, there's a hard dependency on the clock patches

> I think it's best to leave this one until the next cycle when all the
> deps are merged.
I have this on my "resend this for the next development cycle" list


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
