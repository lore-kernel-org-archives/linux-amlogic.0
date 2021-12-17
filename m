Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD386C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Dec 2021 09:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iIZjB9F7o2rbScQAZSVCMdOmlI/09cYzDciVYODbTPM=; b=OaoASFVs2OLwzq
	1/gwZeJ7E1gimWWSxYAaX2qd61ccCU5mKvQFxCJEKSvaKcYYNHDjkG1nTWaCnrE9N6qDtMppI6kk0
	aXq+xyHviSlJRn55QISbnG2qXDIIVtFOQ2KVezFz7Lr8gcdj4WoFXMBitKAzuYFUxhcjd+0JwFh5C
	xXNa6OTTJi97GYyFiX77owA9S+olnXzy9HxZAtZkIhwTQURy9Mm4wIyKDip/7jsyBNgXv1BYnzVMH
	MIcaNh2UNf4D/jv0J3E3JG2B2Ms+BBckwuOWg+tSpsvhzMn7We9PnmHJVq/m68fzbmOPwmmRSoJ5p
	sFdXFLWSMhpSk0zFlzSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my9mc-009Gwt-Ie; Fri, 17 Dec 2021 09:44:10 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my9lv-009GfQ-0o
 for linux-amlogic@lists.infradead.org; Fri, 17 Dec 2021 09:43:31 +0000
Received: by mail-wr1-x42f.google.com with SMTP id c4so2877417wrd.9
 for <linux-amlogic@lists.infradead.org>; Fri, 17 Dec 2021 01:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=1qtPajobApofFVdZSOx4QP5IGtLhy9B9FZ44qXwQbeQ=;
 b=QbkwbMWST2Tc4n5emVo9rjXDx7r71Zk7kyElNDeyD7XIHF/vvZmJR0nn4sAlOOpbPG
 vNuxL50TwamelNtotgVwCvL48xBepWVuIcrguiOdIia1A3MUYzIT4/41BWgxuh9JdnWi
 /z1hJv/6i9lHZDizmoSxfNPAch2Oh72oacnKhhVpB0tYE//3bMWyrqpDDPMbpTUB3ypT
 Wo0Qzx8ZblFyRUGzg6YaBJdqHDCnyukLqfrT/KJTM3R0/JBFSR0Y7rm1njH84Bo2qFEa
 OdAPPUDI2s4b+thktJ+AsZMTYl1Q1wCHijPX61PGNaIsVVh8VulrIfkKYEkyu6e43IFf
 DYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=1qtPajobApofFVdZSOx4QP5IGtLhy9B9FZ44qXwQbeQ=;
 b=SOiJO6flSqc/tXZI9rOD2Z4JhnlMDo1n8YiNQwuIp9k8L7Zg9w0ONaVnGGhSA1sMwl
 Oyzdq4ESh9yXuE9ohxn9+Q7fR9HmxHoj27N4+13oDp9H0pDmcWDeGj+FkVKsjOwLNrnS
 W4Uw61S/aYERuoTIBGPFyxL5j1i6O3Z/AxKlcCFgeby4rybqhRStK5mlOu3jmhCpTymB
 SUGTyhisXoI60tsbsQoIuCdhOo2CJQ1eMsQIt/LZJQRbwHD8Ss84CVwP8U5FfHJQ+002
 /yQeecQhc+npvgqZ2VjWawnrEN48A662nhi0oMKuaQu3BVDetJNuiw3XTgcJG4f2rIfT
 6JqA==
X-Gm-Message-State: AOAM530PLkJ7qgba3/ddzw9sOlnj7JEjFzmSu8c9QGTVBJePJ95po+qz
 q+dT05CjY+D7q4yNwBHkfmE09g==
X-Google-Smtp-Source: ABdhPJzBP7nsIuuUpr79idFo7tm7YmFNgyv2VOyh0hqoJVzqy1V4gKGIzQaGfi/DjJavTY31bnOSjg==
X-Received: by 2002:a05:6000:10d2:: with SMTP id
 b18mr991199wrx.193.1639734204422; 
 Fri, 17 Dec 2021 01:43:24 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e11sm8536601wrq.28.2021.12.17.01.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 01:43:24 -0800 (PST)
References: <20210811050941.398360-1-art@khadas.com>
 <64a6a9e1-64de-4b31-9413-cdfd981862de@baylibre.com>
 <1jlf4ayrv1.fsf@starbuckisacylon.baylibre.com>
 <CAKaHn9JOtmYoJsmZed4hLYAbtdyyMkhaM1iVThs0=2SV6y5ojQ@mail.gmail.com>
 <1jtuhwvqxa.fsf@starbuckisacylon.baylibre.com>
 <CAKaHn9LPYVZkXsDb-aAcHfDc1dX6tMd2cYpjrqysL62JCu3EYg@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Art Nikpal <email2tema@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..."
 <linux-amlogic@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>, Artem Lapkin
 <art@khadas.com>, Nick Xie <nick@khadas.com>, Gouwa Wang <gouwa@khadas.com>
Subject: Re: [PATCH] arm64: dts: meson-sm1: add spdifin spdifout nodes
Date: Fri, 17 Dec 2021 10:30:30 +0100
In-reply-to: <CAKaHn9LPYVZkXsDb-aAcHfDc1dX6tMd2cYpjrqysL62JCu3EYg@mail.gmail.com>
Message-ID: <1j8rwja7nr.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_014327_207203_C25DE1B7 
X-CRM114-Status: GOOD (  29.15  )
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


On Wed 15 Dec 2021 at 10:32, Art Nikpal <email2tema@gmail.com> wrote:

> On Mon, Oct 4, 2021 at 9:51 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>>
>> On Mon 06 Sep 2021 at 19:56, Art Nikpal <email2tema@gmail.com> wrote:
>>
>> >> It would be nice to indicate how it was tested ?
>> >
>> > https://github.com/khadas/khadas-linux-kernel/blob/master/patches/linux-5.14-rc5.sound/0001-arm64-dts-meson-khadas-vim3-remake-simple-sound-for-.patch
>> >
>> > i have test it
>> >
>> > i2s  and spdif output from gpio headers - works well
>>
>> You have tested spdifout_a then.
>>
>> Nothing says spdifin (which was only tested on the axg series so far) or
>> spdifout_b would actually work if enabled at a later point.
>>
>> I would prefer if things could at least be tested once before being
>> added DT.
>>
>> >
>> > On Mon, Sep 6, 2021 at 5:29 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>> >>
>> >>
>> >> On Thu 02 Sep 2021 at 15:31, Neil Armstrong <narmstrong@baylibre.com> wrote:
>> >>
>> >> > Hi,
>> >> >
>> >> > On 11/08/2021 07:09, Artem Lapkin wrote:
>> >> >> Add spdifin spdifout spdifout_b nodes for Amlogic SM1 SoCs.
>> >> >>
>> >> >> Signed-off-by: Artem Lapkin <art@khadas.com>
>> >> >> ---
>> >> >>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 40 ++++++++++++++++++++++
>> >> >>  1 file changed, 40 insertions(+)
>> >> >>
>> >> >> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
>> >> >> index 3d8b1f4f2..1efdbb61e 100644
>> >> >> --- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
>> >> >> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
>> >> >> @@ -356,6 +356,33 @@ tdmin_lb: audio-controller@3c0 {
>> >> >>                      status = "disabled";
>> >> >>              };
>> >> >>
>> >> >> +            spdifin: audio-controller@400 {
>> >> >> +                    compatible = "amlogic,g12a-spdifin",
>> >> >> +                    "amlogic,axg-spdifin";
>> >> >> +                    reg = <0x0 0x400 0x0 0x30>;
>> >> >> +                    #sound-dai-cells = <0>;
>> >> >> +                    sound-name-prefix = "SPDIFIN";
>> >> >> +                    interrupts = <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
>> >> >> +                    clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
>> >> >> +                    <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
>> >> >> +                    clock-names = "pclk", "refclk";
>> >> >> +                    resets = <&clkc_audio AUD_RESET_SPDIFIN>;
>> >> >> +                    status = "disabled";
>> >> >> +            };
>> >> >> +
>> >> >> +            spdifout: audio-controller@480 {
>> >> >> +                    compatible = "amlogic,g12a-spdifout",
>> >> >> +                    "amlogic,axg-spdifout";
>> >> >> +                    reg = <0x0 0x480 0x0 0x50>;
>> >> >> +                    #sound-dai-cells = <0>;
>> >> >> +                    sound-name-prefix = "SPDIFOUT";
>> >> >> +                    clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
>> >> >> +                    <&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
>> >> >> +                    clock-names = "pclk", "mclk";
>> >> >> +                    resets = <&clkc_audio AUD_RESET_SPDIFOUT>;
>> >> >> +                    status = "disabled";
>> >> >> +            };
>> >> >> +
>> >> >>              tdmout_a: audio-controller@500 {
>> >> >>                      compatible = "amlogic,sm1-tdmout";
>> >> >>                      reg = <0x0 0x500 0x0 0x40>;
>> >> >> @@ -401,6 +428,19 @@ tdmout_c: audio-controller@580 {
>> >> >>                      status = "disabled";
>> >> >>              };
>> >> >>
>> >> >> +            spdifout_b: audio-controller@680 {
>> >> >> +                    compatible = "amlogic,g12a-spdifout",
>> >> >> +                    "amlogic,axg-spdifout";
>> >> >> +                    reg = <0x0 0x680 0x0 0x50>;
>> >> >> +                    #sound-dai-cells = <0>;
>> >> >> +                    sound-name-prefix = "SPDIFOUT_B";
>> >> >> +                    clocks = <&clkc_audio AUD_CLKID_SPDIFOUT_B>,
>> >> >> +                    <&clkc_audio AUD_CLKID_SPDIFOUT_B_CLK>;
>> >> >> +                    clock-names = "pclk", "mclk";
>> >> >> +                    resets = <&clkc_audio AUD_RESET_SPDIFOUT_B>;
>> >> >> +                    status = "disabled";
>> >> >> +            };
>> >> >> +
>> >> >>              toacodec: audio-controller@740 {
>> >> >>                      compatible = "amlogic,sm1-toacodec",
>> >> >>                                   "amlogic,g12a-toacodec";
>> >> >>
>> >> >
>> >> > Jerome could you quickly review this ?
>> >> >
>> >>
>> >> Just this, without the related card change is not usefull as it won't be
>> >> part of the card.
>
> Current sound card dt configuration not configured for it, but we can
> apply dt overlays anytime.

Maybe you should do so

>
> IMHO: current sound configuration is not ideal and for some tasks
> better to use custom configuration.
> but anyway i think meson-sm1.dtsi must be completed by missed spdif in/out nodes
>

Tested ones, sure

>> >>
>> >> It would be nice to indicate how it was tested ?
>
>> >>
>> >> AFAIK:
>> >> - spdifout b can only be routed to hdmi and dw-hdmi driver does not
>> >>   support that yet
>
> Ok! But why not accept it at this moment - next time will be easy to
> improve dw-hdmi driver
> +like options i can submit new patch without spdifout_b node

Because as it stands, it is useless. No one tried it. What lands in the
kernel should work, or at least we should do our best to confirm it does.

We should not place code here hoping everything will be fine when someone
finally turns it on.

When dw-hdmi driver support spdif input and you can confirm it works with
your change, you are welcome to submit it again.

>
>> >> - the VIM3 does not have connectors for the spdif (in or out). If it
>
> we have test SPDIF in and SPDIF OUT both works fine on VIM3L meson-sm1

Then adding to spdifin and spdifout_a nodes is fine by me

>
>> >>   requires some extension card, it should be noted somewhere, at least
>
> SPDIF in and SPDIF OUT both pins available via GPIO header ( SPDIF_OUT
> PIN 13 and SPDIF_IN PIN 35 - same PWM_F )
>

Like other thing on those GPIO connectors, we don't enable them by
default.

Now that the kernel accepts overlays, it would be nice to submit one so
other can replicate your test setup, if you wish to.

>> >>
>> >>
>> >> > Thanks,
>> >> > Neil
>> >>
>>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
