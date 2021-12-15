Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993A5C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Dec 2021 02:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaADwB0NWq+RADPgAGhHdvcJIzmX56IeNBUdECj8AaQ=; b=U/G0+Akj1YdmP1
	0RrPzqQUzvTmFWOduI0PCWu5wi1S1itiUPzU2pTHywxQcD2ciyzieKYaqnjup+6aDV0LcnvneD8QR
	T8+touIxiBvbmvY6uYk6SGueDIeJvhk8JZOQ/K0RcMzZ5Yx8bFAJxBxa+qfrUHt5n+kie9TbtkpLp
	e9XRVJpbXelZDDUQH4YaR7zIGppqgIqDhkQ+qcchnWiICHTDUz2MqDMPV8ZlDg5vsagbitgbkQsGQ
	rSwVLVP+ait3cXvfK4y85pRQSxFbZa+OwEdWZmBcPX1NDQHkucdchfqgemKm+gai+Tp/BAxOxYWdT
	C/8gPGU6saXIkX5IF5WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxK5q-00GRHp-LH; Wed, 15 Dec 2021 02:32:34 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxK5c-00GRFt-JU; Wed, 15 Dec 2021 02:32:22 +0000
Received: by mail-io1-xd31.google.com with SMTP id x10so27669546ioj.9;
 Tue, 14 Dec 2021 18:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jpvnm8xrS7mJi4uohYfZ6gGBOMTRK7pEN/RZMd2r9BA=;
 b=nYLVk80zmuDjBLea1wTs7WDWZplmleOmVzVVJSXUM2ketavDF8bariAJfY76AqwiMZ
 UcUPw+rj59vKv1BTlf1BQ5YwlStebaztWOMwFmA/Lsw2cxkridHz/PRfxPPaVfYb9Flh
 UTC4JGEteCHa0tkr2dnacaSRITJOiGbGRs8VQyYDoJ6uLJMsSDaaC20YHl6EtCi3YTTo
 uXvdfveGpYkg2vGgjKhvjidjJjSHGy+F4kyFDDrpCm0lnw5jfnk2s1digA/cC3pWL9RC
 F5FB6DN95sCevFr1OEsd86+ilso0T+7YFgXJCJzXPWOJBvobpsuCNWdzjoNl27npSQ67
 g4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jpvnm8xrS7mJi4uohYfZ6gGBOMTRK7pEN/RZMd2r9BA=;
 b=HwhM02FhmNSWOvWBT/Rv3XEaMS3tcO/7Ql2Avf8BeR1S5EKgufe4gLp8nh0U355kCC
 DV1Ziw98QH0Vhz/s4NKkgXiTkndkrkPz7TDOWsNnw9LEkaj8+Ndr6Fbx8l4PEnX/eq00
 RSLT8U5pD491PgASLPkrWXsLRa+licocsgTC9eVluTnfiWdSPMcOEmVsMhhdecgEUQll
 yUofcoDuFVXqKT7B46RIMswbMZn5vhAl/EtyyD4JBgogAIxoQE0q5TD1XLFESSCfhoNG
 M58lOpk4+IH8Tj8bG60zWI23MAQTjQeuXeoequevW6uPAF6Q9uoqtkf8+BjVEbEyZ+we
 STgA==
X-Gm-Message-State: AOAM532LJHlAk5waHZHajW56Phf/ZTMWShS4URCdN/cDq+rJNgNdE6nN
 gzZzphmmZVG4xp/ZJZotswRRhCz5umSizD07XoM=
X-Google-Smtp-Source: ABdhPJxcTwr1jahw3/8a2lwQZ6PkEiDsiXBRxFiGjlJHZALLMtviR6hcQ5nUPnxvW2eZDGCa360+AtEqGXkRZtcwIeg=
X-Received: by 2002:a05:6638:258a:: with SMTP id
 s10mr4655531jat.381.1639535538588; 
 Tue, 14 Dec 2021 18:32:18 -0800 (PST)
MIME-Version: 1.0
References: <20210811050941.398360-1-art@khadas.com>
 <64a6a9e1-64de-4b31-9413-cdfd981862de@baylibre.com>
 <1jlf4ayrv1.fsf@starbuckisacylon.baylibre.com>
 <CAKaHn9JOtmYoJsmZed4hLYAbtdyyMkhaM1iVThs0=2SV6y5ojQ@mail.gmail.com>
 <1jtuhwvqxa.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jtuhwvqxa.fsf@starbuckisacylon.baylibre.com>
From: Art Nikpal <email2tema@gmail.com>
Date: Wed, 15 Dec 2021 10:32:07 +0800
Message-ID: <CAKaHn9LPYVZkXsDb-aAcHfDc1dX6tMd2cYpjrqysL62JCu3EYg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson-sm1: add spdifin spdifout nodes
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>, Artem Lapkin <art@khadas.com>,
 Nick Xie <nick@khadas.com>, Gouwa Wang <gouwa@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_183220_690886_BD417DC7 
X-CRM114-Status: GOOD (  27.88  )
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

On Mon, Oct 4, 2021 at 9:51 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Mon 06 Sep 2021 at 19:56, Art Nikpal <email2tema@gmail.com> wrote:
>
> >> It would be nice to indicate how it was tested ?
> >
> > https://github.com/khadas/khadas-linux-kernel/blob/master/patches/linux-5.14-rc5.sound/0001-arm64-dts-meson-khadas-vim3-remake-simple-sound-for-.patch
> >
> > i have test it
> >
> > i2s  and spdif output from gpio headers - works well
>
> You have tested spdifout_a then.
>
> Nothing says spdifin (which was only tested on the axg series so far) or
> spdifout_b would actually work if enabled at a later point.
>
> I would prefer if things could at least be tested once before being
> added DT.
>
> >
> > On Mon, Sep 6, 2021 at 5:29 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> >>
> >>
> >> On Thu 02 Sep 2021 at 15:31, Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> > Hi,
> >> >
> >> > On 11/08/2021 07:09, Artem Lapkin wrote:
> >> >> Add spdifin spdifout spdifout_b nodes for Amlogic SM1 SoCs.
> >> >>
> >> >> Signed-off-by: Artem Lapkin <art@khadas.com>
> >> >> ---
> >> >>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 40 ++++++++++++++++++++++
> >> >>  1 file changed, 40 insertions(+)
> >> >>
> >> >> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> >> >> index 3d8b1f4f2..1efdbb61e 100644
> >> >> --- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> >> >> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> >> >> @@ -356,6 +356,33 @@ tdmin_lb: audio-controller@3c0 {
> >> >>                      status = "disabled";
> >> >>              };
> >> >>
> >> >> +            spdifin: audio-controller@400 {
> >> >> +                    compatible = "amlogic,g12a-spdifin",
> >> >> +                    "amlogic,axg-spdifin";
> >> >> +                    reg = <0x0 0x400 0x0 0x30>;
> >> >> +                    #sound-dai-cells = <0>;
> >> >> +                    sound-name-prefix = "SPDIFIN";
> >> >> +                    interrupts = <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
> >> >> +                    clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
> >> >> +                    <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
> >> >> +                    clock-names = "pclk", "refclk";
> >> >> +                    resets = <&clkc_audio AUD_RESET_SPDIFIN>;
> >> >> +                    status = "disabled";
> >> >> +            };
> >> >> +
> >> >> +            spdifout: audio-controller@480 {
> >> >> +                    compatible = "amlogic,g12a-spdifout",
> >> >> +                    "amlogic,axg-spdifout";
> >> >> +                    reg = <0x0 0x480 0x0 0x50>;
> >> >> +                    #sound-dai-cells = <0>;
> >> >> +                    sound-name-prefix = "SPDIFOUT";
> >> >> +                    clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
> >> >> +                    <&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
> >> >> +                    clock-names = "pclk", "mclk";
> >> >> +                    resets = <&clkc_audio AUD_RESET_SPDIFOUT>;
> >> >> +                    status = "disabled";
> >> >> +            };
> >> >> +
> >> >>              tdmout_a: audio-controller@500 {
> >> >>                      compatible = "amlogic,sm1-tdmout";
> >> >>                      reg = <0x0 0x500 0x0 0x40>;
> >> >> @@ -401,6 +428,19 @@ tdmout_c: audio-controller@580 {
> >> >>                      status = "disabled";
> >> >>              };
> >> >>
> >> >> +            spdifout_b: audio-controller@680 {
> >> >> +                    compatible = "amlogic,g12a-spdifout",
> >> >> +                    "amlogic,axg-spdifout";
> >> >> +                    reg = <0x0 0x680 0x0 0x50>;
> >> >> +                    #sound-dai-cells = <0>;
> >> >> +                    sound-name-prefix = "SPDIFOUT_B";
> >> >> +                    clocks = <&clkc_audio AUD_CLKID_SPDIFOUT_B>,
> >> >> +                    <&clkc_audio AUD_CLKID_SPDIFOUT_B_CLK>;
> >> >> +                    clock-names = "pclk", "mclk";
> >> >> +                    resets = <&clkc_audio AUD_RESET_SPDIFOUT_B>;
> >> >> +                    status = "disabled";
> >> >> +            };
> >> >> +
> >> >>              toacodec: audio-controller@740 {
> >> >>                      compatible = "amlogic,sm1-toacodec",
> >> >>                                   "amlogic,g12a-toacodec";
> >> >>
> >> >
> >> > Jerome could you quickly review this ?
> >> >
> >>
> >> Just this, without the related card change is not usefull as it won't be
> >> part of the card.

Current sound card dt configuration not configured for it, but we can
apply dt overlays anytime.

IMHO: current sound configuration is not ideal and for some tasks
better to use custom configuration.
but anyway i think meson-sm1.dtsi must be completed by missed spdif in/out nodes

> >>
> >> It would be nice to indicate how it was tested ?

> >>
> >> AFAIK:
> >> - spdifout b can only be routed to hdmi and dw-hdmi driver does not
> >>   support that yet

Ok! But why not accept it at this moment - next time will be easy to
improve dw-hdmi driver
+like options i can submit new patch without spdifout_b node

> >> - the VIM3 does not have connectors for the spdif (in or out). If it

we have test SPDIF in and SPDIF OUT both works fine on VIM3L meson-sm1

> >>   requires some extension card, it should be noted somewhere, at least

SPDIF in and SPDIF OUT both pins available via GPIO header ( SPDIF_OUT
PIN 13 and SPDIF_IN PIN 35 - same PWM_F )

> >>
> >>
> >> > Thanks,
> >> > Neil
> >>
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
