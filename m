Return-Path: <SRS0=wk+L=NV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3F0C4320E
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Aug 2021 19:37:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54D0460F91
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Aug 2021 19:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 54D0460F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jcd7RsV0N33rnqzTD2BblSIMjyicsDgdVG6gDHaZPUU=; b=Eg7Al34LQ4wMSA
	iwlYRYvq+fJWk/h8cD1if+RDarZH1yL4Ed0Zrz5qvn22dMWSUmXIMh4RkEkvOoo29Ady6jazHVCF7
	gKtHl31H4ZV68Vu6QpVbmMKHrG4RO/PfBzHHrMrfYdBog7bGGuWFqdxZSFv82ZWTUiCZ4Gdzgd1hs
	onOsw+pKCpzMknP4oRH/BVy+kpzYWNiLCDMJtm32+BBgdU6h97EqCS1f2gPUGF+Zwdf2nsI990y4l
	BX/DMPT4md0Ijir9RXHvipe+xf2LTsyMvnZawO7E2RP7iRbB/quu0AdzdSH+VQd+/MUVSrhShJ6JA
	uuX4waoZZf1WeLp60bYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKn6D-000Rho-Jv; Mon, 30 Aug 2021 19:37:41 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKn5x-000Rg1-UJ; Mon, 30 Aug 2021 19:37:30 +0000
Received: by mail-ed1-x532.google.com with SMTP id eb14so14060969edb.8;
 Mon, 30 Aug 2021 12:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uTABDWDNLKg61M+R3vjb71MHbfemSFy2AY4zPlg2nE8=;
 b=bXr0Gort95NFKAp8VD/ml/V5CY8ZNac0oRXnVY1cowlNNobODHOf9Q0XPK7aaT0DjW
 8W2RbQj1Wvp+hIQiJt8IseE4/rdqjErLk6nXxYtNWhV+BYcTUpskIFQfq88hd1/VCRhC
 9Ztb0O9/Zm8SvSkxtjtZmGAYuuWa4VDPIzB8eIypxit4AmFVdH34RZaa2FeWqn5W6ERV
 Ebdrl627h+zc2GVqSWVFeoCbyxKKPCtz/rkNZyFPENOBI3UdGrXGa8plkc1h8SocErpV
 46tJnV6jsw0QLZ1jomda7K+zd3IZE+bfZ6fdvdSsA4YLJXFgl9IKJ2HwBeLzhRh2Z9Pp
 mbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uTABDWDNLKg61M+R3vjb71MHbfemSFy2AY4zPlg2nE8=;
 b=LogNCul6R3e9/XjdOqiOio5c+pVoCmNPYxb/SMniNepEbhsVz+BB5MtAo/hNF9hUAu
 UpE3Ukvzdb5MnGuc25X3IlX7r6ldI/8WW0hLeWs+u5MGPDB7lx3toED6zt4OMogCabs0
 lYaund4cBjhh4f3lxKJSL1wpcBOcMvNW+Fa6n4WlmyaG+tlqxWOSQFG0mExZiBcLkdvb
 mehuyaqyWHJTDZrmAFJ0+uUhZDSsAsmFqqKxsdLcwCSl+ZQNTxZ4gNk4MlRJEFKbyzH/
 wPMJywFlFgFioUsA30rCYaJqBGGoOVkjSr4j05dTdv7hzTHMqng7qcutl9zOjNxUPdXh
 4OmQ==
X-Gm-Message-State: AOAM531dKzeUEoX3btQcCF0CJNkC8TQ8/oL484iReNMebooKNQBO4dYU
 gYFcDNYOY5oXuVzSELTxHdAUvqafZ+nb9ylHONE=
X-Google-Smtp-Source: ABdhPJy7qBuvqTVzY7sOAt7tXWrtZHlRPjJ+Pze/MoPqHbrn7gFn2XmnEqO3Omk3qalVhBFRXosf5B1OJ7USzraT1sY=
X-Received: by 2002:a05:6402:313c:: with SMTP id
 dd28mr25477809edb.179.1630352243401; 
 Mon, 30 Aug 2021 12:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210817041548.1276-1-linux.amoon@gmail.com>
 <20210817041548.1276-2-linux.amoon@gmail.com>
 <c7f6213b-5ddc-881c-1aea-9cc7b03e6a4f@baylibre.com>
In-Reply-To: <c7f6213b-5ddc-881c-1aea-9cc7b03e6a4f@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 30 Aug 2021 21:37:12 +0200
Message-ID: <CAFBinCBeNMET2tvH0h6HF3dR+xBb59hifQyaoXigUs3UGkS+KQ@mail.gmail.com>
Subject: Re: [PATCHv3 1/6] ARM: dts: meson8b: odroidc1: Add usb phy power node
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Anand Moon <linux.amoon@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Matt Corallo <oc2udbzfd@mattcorallo.com>, Rob Herring <robh+dt@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Brian Kim <brian.kim@hardkernel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_123726_041918_99B6B4B7 
X-CRM114-Status: GOOD (  18.27  )
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

On Mon, Aug 30, 2021 at 9:45 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 17/08/2021 06:15, Anand Moon wrote:
> > Add missing usb phy power node for usb node fix below warning.
> > P5V0 regulator supply input voltage range to USB host controller.
> > As described in the C1+ schematics, GPIO GPIOAO_5 is used to
> > enable input power to USB ports, set it to Active Low.
> >
> > [    1.260772] dwc2 c90c0000.usb: Looking up vbus-supply from device tree
> > [    1.260784] dwc2 c90c0000.usb: Looking up vbus-supply property in
> >               mode /soc/usb@c90c0000 failed
>
> First of all, DT is not here to fix boot message.
Anand mentioned elsewhere that this is a debug/info message

> Finally, I looked at the Odroid-C1 schematics and the GPIOAO.BIT5 is an input
> to the S805, and the PWREN signal is controlled by the USB Hub so this regulator
> should not be added at all.
I think there's a misunderstanding because there's two PWREN signals
with different meanings.
The PWREN signal for the USB host ports is hard-wired and not
connected to the SoC at all.
The PWREN signal for the Micro-USB port (which Anand is adding here)
is controlled by GPIOAO_5. odroid-c1+_rev0.4_20150615.pdf [0] shows it
as an input to "USB_OTG" on page 1. "USB_OTG" consists of a power
switch and the connector itself as shown on page 28.

Personally I think that the change from Anand itself is good.
If you feel otherwise then please speak up.
As I pointed out three smaller changes I am hoping that Anand will
re-send the updated patch anyways. At that point he can also add the
changes from your feedback.


Best regards,
Martin


[0] https://dn.odroid.com/S805/Schematics/odroid-c1+_rev0.4_20150615.pdf

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
