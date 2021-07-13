Return-Path: <SRS0=A3X0=MF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BECC07E95
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 15:05:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19C8D60FEB
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 15:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19C8D60FEB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h5TSqtY2QuAe6jtkjX9PKkf9TlkOBeVsuC43Z3Zywno=; b=AVwC78vi+YNtXW
	UCjfqTJRHBl6BGzpHzYkJ/S1WxYhjp1xih5PxDKCGBQMXZ8HjEoTcYpM+qZi/0766jRw1rIehiH0G
	mtUCz0YxZoBvPuxzf1h61SkuIyY+bG1GlP0sxH8NcOV627h/sjsArcWbznW28yzd3rB9gZZb10ULr
	2p2JNe1m8UQVbIvZeLN0vTshjrmuHV/e2MMF9468UxBQC6CYMaXOe/NehdJ1i8sL56/Vs1SizQvBW
	bHobX3hZq60serYpGUme5wmoXMRfkScQ0t98oVDJLuTXv+7Z6l0qLY3ti/PvG1Yts6HcTaS3xB+xd
	gCO9upu/hMdcI+Agjsww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3Jyo-00Ak3U-M1; Tue, 13 Jul 2021 15:05:50 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3JyW-00Ak1Z-DN; Tue, 13 Jul 2021 15:05:33 +0000
Received: by mail-ej1-x632.google.com with SMTP id ga14so27074834ejc.6;
 Tue, 13 Jul 2021 08:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ptYYbRcdUaGqdzjLb3H+jJHCNcFhan2Bn1jayE6LcgA=;
 b=tR4yp7Ihp42EXJJMuoVskTTc7jSbKuQ1cG9vgRJq/Wjm2L10WeHGPy9UodxhFg61zQ
 kGuNIUIpKCw43MydIDf/k+CcF1m/qBnE74E21xSHwd2IPV5opjL7sI7pRpm48zEAKgLE
 tEXaSINY+9K2Stknhk98Cz3Acu+vaEMrP16oiUXDrPGOIzzlIy1QbgBmO75UBuEED5jk
 OK78wAZ4vAEBz35ltw2+Ky4jVUvmVOE14vXxKhhsqsdzjKPsIuyErV7ENTGlNa1LlXEf
 QXZifY8cu3c+tEOHXaR8etdeb73QxFO7mfTwT8w/i4UgGfgGKqiFTPbrRFvx9W5sC+z+
 er+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ptYYbRcdUaGqdzjLb3H+jJHCNcFhan2Bn1jayE6LcgA=;
 b=fpAG6S5s5kp5Jh0oy/6Ex+MsiV2FUuDs+Umq8g8psNvXAC42eAzvpMWDixFCexUQI3
 XTdKKTch29FCgMK07oezaSLGGgCO5dDHEJrP+lDUPvOxBYpmYl5FjCNjXhf09J7e4PLM
 snKbRnsp+t0sjsVXeovvFp8UhIjuMSX75jOGSFruh4HuHXh6DVKkHf8onSjlyELxBhtd
 TM+Qx8oPGPQheGu0BfWt+31YxxFmfUT6QGCz4GIJ/Gz/ZAHQGbs11FVjfq6uOXIj1re1
 9/greRnk3Xr+BehnjwXZ/A04L3nh0+OFSMh0ONY2ciW/P9UDsdXBo+K9+w/8K1zuzedb
 ulLg==
X-Gm-Message-State: AOAM531wDmu3Ecls4aPfY+2HPqRN67YaI1Wsz4YBfcwYyGQY/ulxd29J
 xBzbUCC7VHC2EkM0xyAKQ0flMmDqJK212GSQV7ju9sEU43c=
X-Google-Smtp-Source: ABdhPJytC12yD22WmJvejZr+l30Aph+KR6/YMsim0nlX0u0TaTNOQ0fJCRXXHrVCZIngCK6Q1hF59pqYFsVrvSC5vyA=
X-Received: by 2002:a17:907:207b:: with SMTP id
 qp27mr6219579ejb.258.1626188730833; 
 Tue, 13 Jul 2021 08:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210713055227.1142-1-linux.amoon@gmail.com>
 <20210713055227.1142-2-linux.amoon@gmail.com>
In-Reply-To: <20210713055227.1142-2-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 13 Jul 2021 17:05:20 +0200
Message-ID: <CAFBinCD3ahpNQhP_jWZ3-4nXx8OqZOAANCpTN3BrsULRbYZHVw@mail.gmail.com>
Subject: Re: [PATCHv1 1/3] ARM: dts: meson8b: odroidc1: Add usb phy power node
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Matt Corallo <oc2udbzfd@mattcorallo.com>, Rob Herring <robh+dt@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, 
 Emiliano Ingrassia <ingrassia@epigenesys.com>, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_080532_511721_6ED36821 
X-CRM114-Status: GOOD (  16.44  )
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

On Tue, Jul 13, 2021 at 7:53 AM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Add missing usb phy power node for phy mode fix below warning.
>
> [    1.253149] phy phy-c1108820.phy.0: Looking up phy-supply from device tree
> [    1.253166] phy phy-c1108820.phy.0: Looking up phy-supply property
>                 in node /soc/cbus@c1100000/phy@8820 failed
I did some testing on my own Odroid-C1+ and this patch is not doing
anything for me.
more information below.

[...]
> +               /*
> +                * signal name from schematics: USB_POWER
> +                */
Just a few lines below you're saying that the name from the schematics is PWREN
If this patch is getting another round then please clarify the actual
signal name, or name both signals if the schematics is actually using
both names.

[...]
> +               gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
I booted my Odroid-C1+ with this and USB was working fine.
Then I replaced these two lines with:
  gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_LOW>;
and I found that USB is still working.

Can you please give this a try on your Odroid-C1 as well?
The conclusion from my own testing is that GPIOAO_5 doesn't seem to be
related to USB1 (host-only) because if it was then inverting the
polarity (from active high to active low) should result in a change.

[...]
>  &usb1_phy {
>         status = "okay";
> +       phy-supply = <&usb_pwr_en>;
From the schematics it seems that this is not the PHY supply (which I
admittedly have used incorrectly for VBUS before).
In the schematics that I have (odroid-c1+_rev0.4_20150615.pdf) it
seems to be enabling VBUS.
So in that case a vbus-supply property should be used inside &usb1 instead.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
