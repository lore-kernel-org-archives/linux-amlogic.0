Return-Path: <SRS0=A5vq=MH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B49F7C07E96
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jul 2021 10:24:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6967261260
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jul 2021 10:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6967261260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V95Wxuw4olRYWTj0KzIq6lE30smI/0kG0YxWWTmtCkA=; b=UoLhtkU4chi5oK
	Bv+xfCCvxavBhN4fcSBam9de85oUBIlkYxvdFj+uiUuS4qcCasQDdqsOsDV2iKrMeu/jj9SlbLNTF
	T4Gt4bNxcO6RotJ5tCWh/0AyN2Q6awUZhACizT/hY0zwv9PwVR81SY9gqlI2YAppOqQxjMXzKiF3Z
	AmEg+wHkFWRFXlo5bK7j/G8+tEetbiFMr733oQ70xSPQhAcT5JqiVwjXQSbpLg9n5icrHkFbVJyiQ
	rqRNK+eNLWLaoweAFV+sMlNtjM+MJW229Bs50hj7UZ5WgEmxe8VvQ9rQpYTtdB3ZcaYZUXCddA8uv
	jNT944xvmebNr0GtxeiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3yXb-000Qpe-IT; Thu, 15 Jul 2021 10:24:27 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3yXO-000QoT-Jh; Thu, 15 Jul 2021 10:24:15 +0000
Received: by mail-ej1-x631.google.com with SMTP id dt7so8400971ejc.12;
 Thu, 15 Jul 2021 03:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3O5J6rqGF6JMDu06boGyrc4Tj9mnTxeHjN3XsbyGvrs=;
 b=q6ZL3uQIevdhZUbDj15RHAlCF1aS0Duaxre+LA3t4f29x1/wHfR62boo6p5nebMWzc
 m8N6n2foBvI4j5z4tsNI+rfuAr585Spa2jGvsS2v2zJ/8D5cA1WWs6g7yrV9V2pcUxQl
 kfxe5qWaqfDfdovV5Va4lTP5m7SO6YcVYZmSv5HPu3HxUT1U8OUCqEHfJK+9jwT0nyzr
 L/N7hGA/7ZPQ+tN7udZKDr9hqxq621/SD+olWyJz4RDnkAIBgeqdBpIkRy5XydnuLq/v
 UJx/KfGe9+32bvVzdaiLNmBQd7N4re2dgjMjnZoN5kknEvEniBsSp7Hc76d8u7w8gkQc
 oVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3O5J6rqGF6JMDu06boGyrc4Tj9mnTxeHjN3XsbyGvrs=;
 b=VSRNqdjU+8Z/bVjkuAAQEo+FAwFuEo8sDVHzRleSGSsmn4WO/FRixjU+1rZVpvUvvq
 wnfSkr6ITik/mOhNOtaC+3TdeFg/l7gyjjLssgyArIdpFSj10U1CE/twf98leVaRV+HW
 Lu8FA88Q5wfaQMP9wAKWWLMny02dQ7YrqUzU527DqI8L95847+xkwRphXWCNYHabQrm5
 mtXCjBpeeXZHKWPE2HzlpLicVb4h9JVCozxE7EtXB5vPwehtFjGGiZ7zKc0oy79PM4CD
 o/bv606by6Ylfi3hJQB2JLbmMOgIUA6/ZJsj+2TLnEqYXETSDOeIc4/xRilyYUApyi/R
 rl5g==
X-Gm-Message-State: AOAM533eTDxXdv5ASRP7+P5w6vpR7F5p3C2hVkhldqGOTaziCClQdMqs
 ePPWtN4DlnpsdO394TUKR6QLVFPe1RucNOBIT60=
X-Google-Smtp-Source: ABdhPJylikKFjvKIyxFG5Ozacn86GpWtIUI198XuwTYlxY4CemQ1wYGJNseEMr5sYfAje7CcLtrI9SVLi3YgKnYSYsM=
X-Received: by 2002:a17:907:3c16:: with SMTP id
 gh22mr4844903ejc.158.1626344652261; 
 Thu, 15 Jul 2021 03:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210713055227.1142-1-linux.amoon@gmail.com>
 <20210713055227.1142-2-linux.amoon@gmail.com>
 <CAFBinCD3ahpNQhP_jWZ3-4nXx8OqZOAANCpTN3BrsULRbYZHVw@mail.gmail.com>
 <CANAwSgTh02qg=cMT8tpHcEfAs5yW2vHQ7tPOkvuKXos_fOmh8A@mail.gmail.com>
 <CAFBinCC-kD-MW+bwqCZH5AjYDhxWa_pN2WEnHuiZpx=RhUdROQ@mail.gmail.com>
 <CANAwSgTf4sjoufrZuK-EjE=+yA8zSoVbqhEyNhJJFBLUCOVZmQ@mail.gmail.com>
 <CANAwSgR5nNN3D+NZjqNNjyp=rVYE=RG2icnJAc=5F23xSh9Bvg@mail.gmail.com>
 <CAFBinCBtZDRH_xTn3hUBbAPNGrut2cbEQOSuEN1vwObP1Ns5qw@mail.gmail.com>
In-Reply-To: <CAFBinCBtZDRH_xTn3hUBbAPNGrut2cbEQOSuEN1vwObP1Ns5qw@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 15 Jul 2021 15:54:01 +0530
Message-ID: <CANAwSgTowgbjLm56oH553ji8G8SiLVKyb3oaQzrR=hAp5t78Zw@mail.gmail.com>
Subject: Re: [PATCHv1 1/3] ARM: dts: meson8b: odroidc1: Add usb phy power node
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-phy@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>, 
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 devicetree <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_032414_697615_FE8E4F7F 
X-CRM114-Status: GOOD (  32.40  )
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

Hi Martin,

On Thu, 15 Jul 2021 at 05:00, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Wed, Jul 14, 2021 at 7:25 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
> > Can you give these small changes a try,
> > $ git diff
> > diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts
> > b/arch/arm/boot/dts/meson8b-odroidc1.dts
> > index 748f4c6a050a..066523f14074 100644
> > --- a/arch/arm/boot/dts/meson8b-odroidc1.dts
> > +++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
> > @@ -47,8 +47,9 @@ usb_pwr_en: regulator-usb-pwr-en {
> >                 /*
> >                  * signal name from schematics: PWREN
> >                  */
> > -               gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
> > +               gpio = <&gpio_ao GPIOAO_5 GPIO_OPEN_DRAIN>;
> >                 enable-active-high;
> > +               regulator-always-on;
> >         };
> >
> > [alarm@archl-c1e ~]$ sudo cat /sys/kernel/debug/gpio | grep usb
> >  gpio-1953 (USB_HUB_RST_N       |usb-hub-reset       ) out hi
> >  gpio-1954 (USB_OTG_PWREN       |regulator-usb-pwr-en) out lo
> I can reproduce the /sys/kernel/debug/gpio output with this patch
>
> Still USB works for me regardless of whether USB_OTG_PWREN is HIGH or LOW
> This is something that is not possible if the regulator is really
> connected on the board like you are describing in this patch.
> If this .dts change was correct then I would expect that USB is
> breaking when inverting the GPIO polarity.
>
> I am using the "inverted GPIO polarity" approach to find the Ethernet
> PHY reset GPIO when working on boards for which I don't have the
> schematics:
Thanks for the hint,
> 1) make an assumption of which GPIO to use
> 2) try with GPIO_ACTIVE_LOW -> PHY should be detected
> 3) change it to GPIO_ACTIVE_HIGH -> PHY should not be found anymore
> (because it's in reset)
> 4) before submitting the board.dts upstream I of course change it back
> to GPIO_ACTIVE_LOW

Yes I am going to changes this to GPIO_ACTIVE_LOW in the next version.
These dts changes just assist in power through PHY to USB ports.
After going through the previous email I got this working see below.

[alarm@archl-c1e linux-amlogic-5.y-devel]$ sudo cat
/sys/kernel/debug/gpio | grep usb
 gpio-1953 (USB_HUB_RST_N       |usb-hub-reset       ) out hi
 gpio-1954 (USB_OTG_PWREN       |regulator-usb-pwr-en) out lo ACTIVE LOW

>
> If during step 3) the PHY is still found then I know that it's not the
> correct GPIO.
> I am seeing the same behavior with this USB regulator. My
> interpretation of this is: either you are not using the right GPIO or
> the GPIO is not related to &usb1 (or it's PHY).
>
With reference to the schematic  odroid-c1+_rev0.4_20160226
section USB HOST POWER ---- MP62551DGT-LF-Z
Both USB POWER and PWREN help control the power to USB Ports.

>
> Best regards,
> Martin

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
