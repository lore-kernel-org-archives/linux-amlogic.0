Return-Path: <SRS0=2xsp=N4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCCA2C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Sep 2021 11:56:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79A2E60F45
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Sep 2021 11:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79A2E60F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RckX2f0AxAfnVuyDvDifczhatxTcrYhUzhpExMCdZng=; b=jZv/O36rQrVrMk
	QxkG+BNeiVFX5nL+PWTQufwa53gKu1oK+A0PMfnUgFKN2UoC3WO1PKpI2Jdy3GrrWuQQ9DLGi+5OE
	g9K7uSt/gvURmteGpJ1LvEAiqVuLbSR1tYKFxf6KDN23okSZyHE4yKf/oLfts7/kdyP6Er/VjSU32
	hiyVoW1D4RMi2ijaAOTpg5V1QLemtLG+L2oJDyZs1uMxoySNHukka1brCpWk4fXLXy9YGuXFlRWEM
	hRDEQueu5NMfdqdFwnZE4rzAXkExirj2lHRIjnrBWcTQjgGGVQtFMOrXl2y07+5MtlZABZvaoq8HZ
	a9tR6AOA1r4w7DGwWr2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNDEo-000fXT-Dp; Mon, 06 Sep 2021 11:56:34 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNDEa-000fVP-GS; Mon, 06 Sep 2021 11:56:22 +0000
Received: by mail-io1-xd2b.google.com with SMTP id b7so8385259iob.4;
 Mon, 06 Sep 2021 04:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bnTG/NHMxnQfdG3J7CYZRoCa4rWNoUVxORNySN5cPHg=;
 b=kajCZuZ9otgw/PXzZZoJUq1SQzaEvFMcDBYC9kR6zBidnBHGK+1zkqrvkdmxtcsWnV
 Fi7cJVndjRf0HOjumKrYWVB5iDGzhgPoZD+2CM+DF3Uhv71hlTeGja21avehFqIP25bI
 p0Shp7lvRlIKJR9Rpk4pRJYjPUiogeTPDz+hmM/zo3gOH1E8TQ9xIIyKpHof1t1HV3++
 ntoFIvgjFfrpfM2vH9ksRctCJ7sg9PZgYINkB2fxyx5XGeHsPQXGQ4Uh3hrFXyV3Liqx
 5DpnwT9JBl3gXq4MT9F2SFJQA7qt0IUe2RBlH1cHvnJmvCzQaMlTAvE9KqJu27cg9zEe
 00Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bnTG/NHMxnQfdG3J7CYZRoCa4rWNoUVxORNySN5cPHg=;
 b=dMAwGDa50PabY519tNWonTIY82pUDNz3HmlKtnn4M/D/3v62w69fulCI/+eaeA5dwN
 nl/nkEDOcSpO55r9+FIfTHdj869QzBTL8JXvwtxHq0CrrdBpv+nQj6VRxysYyVPUAO9T
 2ZuJ0vjZr0tiFzoYQln8Hq7FnQfTVCl2h2x4JRkEVod/lTD0JlXcRQ7EmYWVfL5mWE39
 eANiBDSH/20UbTbUN6BbzuUhJ+B269Rf62xPlrkfZaa0XNDFqTcsytL12+An5kp5C0Bi
 tu0nEmSUjixDa8fpj8NQRrJvBg8ZLekDhXykZzoQfSEhGRG0xM+oxmUxRRN9sKDgwlfF
 I3Hw==
X-Gm-Message-State: AOAM533deao4S/saBLdBjX+0ffiTkjCAxVx9wT0EKKp0/BGfxWWiXdY7
 VHWeTLFPQ4yVh3vq6K/2jJLTqUwVHSEhbpZmMW8=
X-Google-Smtp-Source: ABdhPJzEvgt/nep1+Eg+yCw7tQlo8vWKbb8j2o1M1iuaI/4ooig2MVYxjBiJAT1qDHjhSiRKN/5/p+xsMJvo3xX6knA=
X-Received: by 2002:a05:6602:2211:: with SMTP id
 n17mr9406209ion.142.1630929378562; 
 Mon, 06 Sep 2021 04:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210811050941.398360-1-art@khadas.com>
 <64a6a9e1-64de-4b31-9413-cdfd981862de@baylibre.com>
 <1jlf4ayrv1.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jlf4ayrv1.fsf@starbuckisacylon.baylibre.com>
From: Art Nikpal <email2tema@gmail.com>
Date: Mon, 6 Sep 2021 19:56:06 +0800
Message-ID: <CAKaHn9JOtmYoJsmZed4hLYAbtdyyMkhaM1iVThs0=2SV6y5ojQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson-sm1: add spdifin spdifout nodes
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>, Artem Lapkin <art@khadas.com>,
 Nick Xie <nick@khadas.com>, Gouwa Wang <gouwa@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_045620_600463_ED943078 
X-CRM114-Status: GOOD (  23.93  )
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

> It would be nice to indicate how it was tested ?

https://github.com/khadas/khadas-linux-kernel/blob/master/patches/linux-5.14-rc5.sound/0001-arm64-dts-meson-khadas-vim3-remake-simple-sound-for-.patch

i have test it

i2s  and spdif output from gpio headers - works well

On Mon, Sep 6, 2021 at 5:29 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Thu 02 Sep 2021 at 15:31, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> > Hi,
> >
> > On 11/08/2021 07:09, Artem Lapkin wrote:
> >> Add spdifin spdifout spdifout_b nodes for Amlogic SM1 SoCs.
> >>
> >> Signed-off-by: Artem Lapkin <art@khadas.com>
> >> ---
> >>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 40 ++++++++++++++++++++++
> >>  1 file changed, 40 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> >> index 3d8b1f4f2..1efdbb61e 100644
> >> --- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> >> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> >> @@ -356,6 +356,33 @@ tdmin_lb: audio-controller@3c0 {
> >>                      status = "disabled";
> >>              };
> >>
> >> +            spdifin: audio-controller@400 {
> >> +                    compatible = "amlogic,g12a-spdifin",
> >> +                    "amlogic,axg-spdifin";
> >> +                    reg = <0x0 0x400 0x0 0x30>;
> >> +                    #sound-dai-cells = <0>;
> >> +                    sound-name-prefix = "SPDIFIN";
> >> +                    interrupts = <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
> >> +                    clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
> >> +                    <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
> >> +                    clock-names = "pclk", "refclk";
> >> +                    resets = <&clkc_audio AUD_RESET_SPDIFIN>;
> >> +                    status = "disabled";
> >> +            };
> >> +
> >> +            spdifout: audio-controller@480 {
> >> +                    compatible = "amlogic,g12a-spdifout",
> >> +                    "amlogic,axg-spdifout";
> >> +                    reg = <0x0 0x480 0x0 0x50>;
> >> +                    #sound-dai-cells = <0>;
> >> +                    sound-name-prefix = "SPDIFOUT";
> >> +                    clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
> >> +                    <&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
> >> +                    clock-names = "pclk", "mclk";
> >> +                    resets = <&clkc_audio AUD_RESET_SPDIFOUT>;
> >> +                    status = "disabled";
> >> +            };
> >> +
> >>              tdmout_a: audio-controller@500 {
> >>                      compatible = "amlogic,sm1-tdmout";
> >>                      reg = <0x0 0x500 0x0 0x40>;
> >> @@ -401,6 +428,19 @@ tdmout_c: audio-controller@580 {
> >>                      status = "disabled";
> >>              };
> >>
> >> +            spdifout_b: audio-controller@680 {
> >> +                    compatible = "amlogic,g12a-spdifout",
> >> +                    "amlogic,axg-spdifout";
> >> +                    reg = <0x0 0x680 0x0 0x50>;
> >> +                    #sound-dai-cells = <0>;
> >> +                    sound-name-prefix = "SPDIFOUT_B";
> >> +                    clocks = <&clkc_audio AUD_CLKID_SPDIFOUT_B>,
> >> +                    <&clkc_audio AUD_CLKID_SPDIFOUT_B_CLK>;
> >> +                    clock-names = "pclk", "mclk";
> >> +                    resets = <&clkc_audio AUD_RESET_SPDIFOUT_B>;
> >> +                    status = "disabled";
> >> +            };
> >> +
> >>              toacodec: audio-controller@740 {
> >>                      compatible = "amlogic,sm1-toacodec",
> >>                                   "amlogic,g12a-toacodec";
> >>
> >
> > Jerome could you quickly review this ?
> >
>
> Just this, without the related card change is not usefull as it won't be
> part of the card.
>
> It would be nice to indicate how it was tested ?
>
> AFAIK:
> - spdifout b can only be routed to hdmi and dw-hdmi driver does not
>   support that yet
> - the VIM3 does not have connectors for the spdif (in or out). If it
>   requires some extension card, it should be noted somewhere, at least
>
>
> > Thanks,
> > Neil
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
