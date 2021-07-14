Return-Path: <SRS0=A5vq=MH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5F7C12002
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jul 2021 00:24:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D589613C2
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jul 2021 00:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D589613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJw+g8wg8Zyuvj7a6DpY8rz/ZVZFQNq2tKVW+bP6jI4=; b=TA/92J+MEaVfu6
	XywILmqeSpxiL44jzsYFyZ30aA0CClDRQwSzhTZBsc0MkmLrxoKNtH2Dglmv8Xkht4/fh7g951HPF
	KFHviMzBvejfsPF/UCi6Z3vAn7HJzFxaPjFoIxMkin5z+xL8z1b/N3K7KFvS2IzBwqMCls1ezLceI
	vwTZy53io4tYNa+mZhSzmY5hTZkQ/orzqbFDTWma8z467+pPS2aG3jrmofkqWhalZ+5Ha/FQVTTEC
	suwrq2OR8pXlrPscdz9TG8duFF3F/ehjhBvOv/zt+k0KhET++oOD4lx2Jg2r0AZXuj0984m15MgPj
	dU2HkNSIqEJG022lrbRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3pAi-00GejD-Lh; Thu, 15 Jul 2021 00:24:12 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3oKu-00GIkF-KC; Wed, 14 Jul 2021 23:30:42 +0000
Received: by mail-ed1-x52f.google.com with SMTP id l1so5427393edr.11;
 Wed, 14 Jul 2021 16:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MmCo10phYZjnbz7riI2lrli8JFJM355EZ/EUboI7RsU=;
 b=My1Ium+lDPZ1IpppOuHRs5Rld6fPeNYboQtih5zVYSNhf8OdDVyrpePQfdoMOrt1r9
 OFI8VVztFDz5MXAi091VMsBMCykOgIgvsbfiyE6RsveTx6CNaybjRu+Cso+cNrcbZBoQ
 EFHV+E8/55eMS1PedK98tgQC5osmTkOTz7dT+QwXUiGc8+ypaY4y7uh7NX+3jdWPTzp5
 7A5oEG+Ys8HJwcG8+awuIx7XeSeo9nZbkTOED098L/GmipR7hR8vSG8CU2kkU4pUnya9
 FHh5ZOthocyuVXCPf++3jMtGkL4G4H3J8uyVK5sl8NbnlRlorb6FUsGpm68WNF5xjVo+
 QGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MmCo10phYZjnbz7riI2lrli8JFJM355EZ/EUboI7RsU=;
 b=tK8mb6w7e3XfCj6TF/iMSKliFtzYTNV6QFE5lnQbePLt6pE/OtslDw6euIaDuv4juC
 ap6jv5DxuAti9r4qW8Ea8AYuY9E6W7LoSSG0Y9xRj5d5beqNjDQllKderp2Ee7JDG4l6
 2RxyLeUTv1H5G2zr8XoHG0sqk5UjLlWlckbHPwb7+JFy5hwQ5MZ1UanmDGbfziPaIvXy
 rKatBSAUw05pyWUMXKRLOftXOyejkus09itAbiaIlAlXkdznZXOHdL4WXomvtoO+luzN
 DvPQ2NJmPPfBEKYEYFbT8go6dtNRkP82LaR079ClnckGxY6aJkONvszqLTlbfqS+0zuy
 ZOSg==
X-Gm-Message-State: AOAM530EVatECwpOFA5o+w6Z98V2IS6gx2TLVnxp3s0B0tLJt4APsOwu
 cZKNnwji6XXE/j1dKH4+xEyK+XeSg5SGh9r7618=
X-Google-Smtp-Source: ABdhPJx0AQ7rkwJFWL2C/MDHijIvmNvm54SQAgQmq5qCp0CnWv4FoADx+pvNp6QTpflL4QPnwnAIjBW8BH4NjkrJEOM=
X-Received: by 2002:a05:6402:190c:: with SMTP id
 e12mr1132461edz.176.1626305433797; 
 Wed, 14 Jul 2021 16:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210713055227.1142-1-linux.amoon@gmail.com>
 <20210713055227.1142-2-linux.amoon@gmail.com>
 <CAFBinCD3ahpNQhP_jWZ3-4nXx8OqZOAANCpTN3BrsULRbYZHVw@mail.gmail.com>
 <CANAwSgTh02qg=cMT8tpHcEfAs5yW2vHQ7tPOkvuKXos_fOmh8A@mail.gmail.com>
 <CAFBinCC-kD-MW+bwqCZH5AjYDhxWa_pN2WEnHuiZpx=RhUdROQ@mail.gmail.com>
 <CANAwSgTf4sjoufrZuK-EjE=+yA8zSoVbqhEyNhJJFBLUCOVZmQ@mail.gmail.com>
 <CANAwSgR5nNN3D+NZjqNNjyp=rVYE=RG2icnJAc=5F23xSh9Bvg@mail.gmail.com>
In-Reply-To: <CANAwSgR5nNN3D+NZjqNNjyp=rVYE=RG2icnJAc=5F23xSh9Bvg@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 15 Jul 2021 01:30:23 +0200
Message-ID: <CAFBinCBtZDRH_xTn3hUBbAPNGrut2cbEQOSuEN1vwObP1Ns5qw@mail.gmail.com>
Subject: Re: [PATCHv1 1/3] ARM: dts: meson8b: odroidc1: Add usb phy power node
To: Anand Moon <linux.amoon@gmail.com>
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
X-CRM114-CacheID: sfid-20210714_163040_733960_DB1E27DE 
X-CRM114-Status: GOOD (  20.34  )
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

Hi Anand,

On Wed, Jul 14, 2021 at 7:25 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> Can you give these small changes a try,
> $ git diff
> diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts
> b/arch/arm/boot/dts/meson8b-odroidc1.dts
> index 748f4c6a050a..066523f14074 100644
> --- a/arch/arm/boot/dts/meson8b-odroidc1.dts
> +++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
> @@ -47,8 +47,9 @@ usb_pwr_en: regulator-usb-pwr-en {
>                 /*
>                  * signal name from schematics: PWREN
>                  */
> -               gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
> +               gpio = <&gpio_ao GPIOAO_5 GPIO_OPEN_DRAIN>;
>                 enable-active-high;
> +               regulator-always-on;
>         };
>
> [alarm@archl-c1e ~]$ sudo cat /sys/kernel/debug/gpio | grep usb
>  gpio-1953 (USB_HUB_RST_N       |usb-hub-reset       ) out hi
>  gpio-1954 (USB_OTG_PWREN       |regulator-usb-pwr-en) out lo
I can reproduce the /sys/kernel/debug/gpio output with this patch

Still USB works for me regardless of whether USB_OTG_PWREN is HIGH or LOW
This is something that is not possible if the regulator is really
connected on the board like you are describing in this patch.
If this .dts change was correct then I would expect that USB is
breaking when inverting the GPIO polarity.

I am using the "inverted GPIO polarity" approach to find the Ethernet
PHY reset GPIO when working on boards for which I don't have the
schematics:
1) make an assumption of which GPIO to use
2) try with GPIO_ACTIVE_LOW -> PHY should be detected
3) change it to GPIO_ACTIVE_HIGH -> PHY should not be found anymore
(because it's in reset)
4) before submitting the board.dts upstream I of course change it back
to GPIO_ACTIVE_LOW

If during step 3) the PHY is still found then I know that it's not the
correct GPIO.
I am seeing the same behavior with this USB regulator. My
interpretation of this is: either you are not using the right GPIO or
the GPIO is not related to &usb1 (or it's PHY).


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
