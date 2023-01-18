Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0AAC38147
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jan 2023 11:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LMIJivjBaUW9HDtRf51Aq8+OzPMX2/DmnTmt69QjqrE=; b=JLXF6nhfF10re6
	F8DK9FuwmThvGr6NamMRGZCZFJQBaCvvWClCcQv7e7gma/ykhjWSYUmy4rZjhRoQS+H3KhUxhWVQz
	ne/JbvY1nTjGsGEoYMzpEiPGX9zx09GGFjPXhaLUGbrJAEMhKxUYKZ7+D0PT6UHotjOBiQ8Yxmw2f
	N1yPvxDQoXBq3FXnuzINDuIP3Me+BNVfCpYxaiBGUYgLg9atxkyvn5EADInodZR8KxiVrROL94Ag4
	A316Am5X1WG7cMbwJs6glcVzLBxUVuGCdTwKOVw+9eiHjOYc3M5FUDjzjwuutX3RTxDzFyz+/USFm
	+6EIEAq/ZHV12raWsvfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI72J-000ckg-QK; Wed, 18 Jan 2023 11:55:23 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI72G-000cja-WD; Wed, 18 Jan 2023 11:55:22 +0000
Received: by mail-vs1-xe30.google.com with SMTP id l125so16073503vsc.2;
        Wed, 18 Jan 2023 03:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvAQcqbx1FUcQCzp8KB4ljSTPL23uYmDYuGsf37mkgA=;
        b=pTSXekQ15kWo5bKf6kfCu1sC18y2qCRbwDyu1J7wYF9LvFg84utLUKpd/loqasNZ3c
         MmraiAIFg9QL9e0xvJD2iFEjdRcQmM8SZgRnujLwLmSD5ERgJ/2resMnQnHu8xwvGm07
         Vurn9QWcyuAFXq4smz8np4UfwpUtTvwgoSaU5Gtei7YCoRT4oj0YmtELNpu2ioL0Ubhb
         UEaqt4HLaKKYmu5nOCoxrGkXulyXNUCK9vYVQmxsOyU9eq70S2Jn8BgLCPYHPzx6P+iC
         73vXgKUFdixiZC++nP3Nha7el3A245yB60FNIT2bl46PwTPEBGJSCjCOkWRBosXk3j/Y
         QfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZvAQcqbx1FUcQCzp8KB4ljSTPL23uYmDYuGsf37mkgA=;
        b=7Y/3m36QQ7W0zWZ8Nx3/mjC6gxtubHXFz2J5f7ef0QrekAWHM0gvOYA6mp94BYWegT
         v+vA0nXEOwecNNdZqlX/eQg2AUIJOo2+cqcIzwXkU+XWnsP6VxP5HvU2WNwZa9yld2uD
         9iPhe+696zZsGoRak5oQUBgG12c1odNji3UAuII5iWMU6S3xUMfCwu3JWijfXR0vl/82
         NCbV1PGNpFAo5KKh2wF4k2kair3BOgRqvtTnq0aPdzPVK1zx05QSIE77Suf0S8avg7Ev
         egA/nFx6d02UkNnNxQKVGm3oVQdDowJ+wCqHaTjOMXylQXaXm2FDqA5slRFIHdWVx+RP
         u8vw==
X-Gm-Message-State: AFqh2krY5x2KQAXjEHWIOobG8AWLW6To6viy6piFb3binEQ/JwqMtelj
	fEiIIoemZ0XDiY9JhOVmQTu1n3EOI9NbxAUM4yo=
X-Google-Smtp-Source: AMrXdXsTGDwIPrIyj0f0dEF05oYUgttHd+Fpx/8RVdDi1Au7CSkfdIfFULr149JhmOsY/woguSbfxOzkCsjaB9zm5Dg=
X-Received: by 2002:a67:f650:0:b0:3d3:db6b:e761 with SMTP id
 u16-20020a67f650000000b003d3db6be761mr941230vso.46.1674042919647; Wed, 18 Jan
 2023 03:55:19 -0800 (PST)
MIME-Version: 1.0
References: <20230118044418.875-1-linux.amoon@gmail.com> <20230118044418.875-8-linux.amoon@gmail.com>
 <b112ee8e-93ab-2c30-ced3-82ff858884b4@linaro.org>
In-Reply-To: <b112ee8e-93ab-2c30-ced3-82ff858884b4@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 18 Jan 2023 17:25:04 +0530
Message-ID: <CANAwSgQ1b8vj+HCBS0ARnNqOwKHU8VzzsB7htL3L4Sr_v6Y=VQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] arm64: dts: amlogic: Used onboard usb hub reset on
 odroid c4
To: neil.armstrong@linaro.org
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	Matthias Kaehlcke <mka@chromium.org>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_035521_094022_05483FAE 
X-CRM114-Status: GOOD (  27.97  )
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

Hi Neil,

Thanks for your review comments.

On Wed, 18 Jan 2023 at 13:59, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 18/01/2023 05:44, Anand Moon wrote:
> > On Odroid c4 previously use gpio-hog to reset the usb hub,
> > switch to used on-board usb hub reset to enable the usb hub
> > and enable power to hub.
> >
> > USB hub is combination of USB 2.0 and USB 3.0 root hub so
> > use peer-hub node to link then.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v2: - fix the compatible string.
> >      - Fix the hub node to use peer-hub to link the usb 2.0 and usb 3.0.
> > ---
> >   .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  | 36 ++++++++++++-------
> >   1 file changed, 23 insertions(+), 13 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
> > index 8c30ce63686e..d04768a66bfe 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
> > @@ -26,20 +26,30 @@ led-blue {
> >       sound {
> >               model = "ODROID-C4";
> >       };
> > -};
> >
> > -&gpio {
> > -     /*
> > -      * WARNING: The USB Hub on the Odroid-C4 needs a reset signal
> > -      * to be turned high in order to be detected by the USB Controller
> > -      * This signal should be handled by a USB specific power sequence
> > -      * in order to reset the Hub when USB bus is powered down.
> > -      */
> > -     hog-0 {
> > -             gpio-hog;
> > -             gpios = <GPIOH_4 GPIO_ACTIVE_HIGH>;
> > -             output-high;
> > -             line-name = "usb-hub-reset";
> > +     /* USB hub supports both USB 2.0 and USB 3.0 root hub */
> > +     usb-hub {
> > +             dr_mode = "host";
>
> Is this really needed ?
>
I got carried forward from the other device tree binding,
If not needed I will drop this.

> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +
> > +             /* 2.0 hub on port 1 */
> > +             hub_2_0: hub@1 {
> > +                     compatible = "usb2109,2817";
> > +                     reg = <1>;
> > +                     peer-hub = <&hub_3_0>;
> > +                     reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
> > +                     vdd-supply = <&vcc_5v>;
> > +             };
> > +
> > +             /* 3.1 hub on port 4 */
> > +             hub_3_0: hub@2 {
> > +                     compatible = "usb2109,817";
> > +                     reg = <2>;
> > +                     peer-hub = <&hub_2_0>;
> > +                     reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
> > +                     vdd-supply = <&vcc_5v>;
> > +             };
>
> The final discussion in v1 was to drop this /usb-hub node and move the
> hub_2_0 & hub_3_0 node under the dwc3 node.
>

Yes, but It did not work back then, since these are two different events
USB node will try to bring the PHY and dwc2 and dwc2 nodes up.
USB hub supports the reset of the USB hub and links the power supply
to the ports.
This works on this board.

> Neil
>
Thanks

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
