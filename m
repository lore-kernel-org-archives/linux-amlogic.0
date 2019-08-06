Return-Path: <SRS0=TmCu=WC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7A7C433FF
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 19:18:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C849205C9
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 19:18:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T8Z79ehU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="iw+xNSGe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C849205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EeP70cQbpfsK88dlUjOrJih9h70oNiXF4ysaWVPDhGs=; b=T8Z79ehUF25ylt
	ZNhcZtvpJi4fFuTjTEdSJ/fz5R0/9GDJRzYkLi1/bJJoBkWrZNrXHw2ROEfqQ/aOKmiklOd7PBz3P
	7JOVKLAA2Ia6RcG8IUir0url3ZFs8njBWCAHsStg6WVYSHpG3Aa63UkAJ7tiLmMXDYSNmTJoohsYg
	Hb0M9y1yR2bHg4Xvvee43e2m8EDW1G1pZUkNYQygMbWzf/tkUxVFkXFDxAZRrl3lfvJ8v+9NLkTJN
	AcGQ84tIFIO2aO3Ds66nr/yvoAUmWEydfARy+vFZNuD8mT0giEy1Csd5WogXCwY2ydf2hI99CsAxX
	fw0DQkllvDnlnnDlxgHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hv4yO-0005TL-WD; Tue, 06 Aug 2019 19:18:17 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hv4yM-0005Sv-PN; Tue, 06 Aug 2019 19:18:16 +0000
Received: by mail-oi1-x243.google.com with SMTP id a127so68194003oii.2;
 Tue, 06 Aug 2019 12:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QksYxQSRVQDPGMXGjLmAF5kWT3zgenhIbfjlqIRDB50=;
 b=iw+xNSGevvMp6QLQVcVDCK0k0UGmX2/q6doQuB+4F7OBPyZTK3hzRgdZyPv1BpuCNR
 41aiHV5FtoCKa7c9e/LEqc6QhaFwd3tNOcUN9yCOJI6Zm91427xrlixL94Wu1vF8XPjI
 lk/YT2YB+3V1T5s1DuyLpLYeVLSqkc5lgcYyWMTEIAf/oqnKgmsRyr8Vv5WYQQCXddgv
 a0y9wO5WiWcFZm6yav6zWYEo2+sguptnPXTLjcnOZc97NgZf4+0SKGbl/8dWSsf2wfyF
 cheAsvSdNs+6FEn03jWyUp6ZC4jz6sgBeJyM+/l58GHPZfm24/PyjQQIaju/mlTAq993
 2exQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QksYxQSRVQDPGMXGjLmAF5kWT3zgenhIbfjlqIRDB50=;
 b=Qsd2VXAC7Z2sDn5UQiyPV/8XidEaHvC4ASk2jyxf4gqkBybXKiH3+fN2KuSh8TZ5Fu
 YmJkOwkFV/PNJRluYjbCP20rsMPu4BDN0bQWSBNGUPQ2XtbwrQs89CKacSDD/8SwElDU
 D+QJjZgPe12dqgrleCPh3X8qYU6ZS3qJ2mE/jeQxTX914WXjebIxYnQYP1tDjUpqggha
 oe3EJF0Im8aPYhGnm3eS8jZTYLNs44jrXGfMzg8wLehcOPwCM0ht5qNAR95ztadZTBWi
 N/viukkII748oPEco1Il8C/oQxnPPIAlJ2N+6O7rmRa1drFa4kpeqFkBHxujTVpLkn60
 rkRQ==
X-Gm-Message-State: APjAAAXaQ7bfSxp6dyU5z7vvlmo0j8UtTT6iYJFo6ykHqqRgelzYd23D
 tglPuHPzmiOpJW/LReBRkyvJcDiXvD9Y3ogszMM=
X-Google-Smtp-Source: APXvYqwZTvJvfIjhNSPBRRSCo+e2K2SBi/qn4E7udh0JEH4LHYhlDQFNci1czKK09aurjIPZPDW+4WBLDxj7tgdfX8I=
X-Received: by 2002:a05:6808:8f0:: with SMTP id
 d16mr2928463oic.47.1565119093090; 
 Tue, 06 Aug 2019 12:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190805120320.32282-1-narmstrong@baylibre.com>
 <20190805120320.32282-9-narmstrong@baylibre.com>
In-Reply-To: <20190805120320.32282-9-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Aug 2019 21:18:02 +0200
Message-ID: <CAFBinCBSC-wrSxKajwfQNJuzf3ZGFNS4bYPE8qnJF92gTMK_8w@mail.gmail.com>
Subject: Re: [RFCv2 8/9] dt-bindings: serial: meson-uart: convert to yaml
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_121814_845561_3BD563F5 
X-CRM114-Status: GOOD (  21.57  )
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
Cc: linux-amlogic@lists.infradead.org, robh+dt@kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, Aug 5, 2019 at 2:06 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic UART Serial controller over to a YAML schemas.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
two nit-picks below, but overall this looks good:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  .../bindings/serial/amlogic,meson-uart.txt    | 38 ----------
>  .../bindings/serial/amlogic,meson-uart.yaml   | 73 +++++++++++++++++++
>  2 files changed, 73 insertions(+), 38 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt
>  create mode 100644 Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
>
> diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt
> deleted file mode 100644
> index c06c045126fc..000000000000
> --- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -Amlogic Meson SoC UART Serial Interface
> -=======================================
> -
> -The Amlogic Meson SoC UART Serial Interface is present on a large range
> -of SoCs, and can be present either in the "Always-On" power domain or the
> -"Everything-Else" power domain.
> -
> -The particularity of the "Always-On" Serial Interface is that the hardware
> -is active since power-on and does not need any clock gating and is usable
> -as very early serial console.
> -
> -Required properties:
> -- compatible : compatible: value should be different for each SoC family as :
> -       - Meson6 : "amlogic,meson6-uart"
> -       - Meson8 : "amlogic,meson8-uart"
> -       - Meson8b : "amlogic,meson8b-uart"
> -       - GX (GXBB, GXL, GXM) : "amlogic,meson-gx-uart"
> -       eventually followed by : "amlogic,meson-ao-uart" if this UART interface
> -       is in the "Always-On" power domain.
> -- reg : offset and length of the register set for the device.
> -- interrupts : identifier to the device interrupt
> -- clocks : a list of phandle + clock-specifier pairs, one for each
> -          entry in clock names.
> -- clock-names :
> -   * "xtal" for external xtal clock identifier
> -   * "pclk" for the bus core clock, either the clk81 clock or the gate clock
> -   * "baud" for the source of the baudrate generator, can be either the xtal
> -       or the pclk.
> -
> -e.g.
> -uart_A: serial@84c0 {
> -       compatible = "amlogic,meson-gx-uart";
> -       reg = <0x0 0x84c0 0x0 0x14>;
> -       interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
> -       /* Use xtal as baud rate clock source */
> -       clocks = <&xtal>, <&clkc CLKID_UART0>, <&xtal>;
> -       clock-names = "xtal", "pclk", "baud";
> -};
> diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> new file mode 100644
> index 000000000000..5d48a8c04aa9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/serial/amlogic,meson-uart.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson SoC UART Serial Interface
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +description: |
> +  The Amlogic Meson SoC UART Serial Interface is present on a large range
> +  of SoCs, and can be present either in the "Always-On" power domain or the
> +  "Everything-Else" power domain.
> +
> +  The particularity of the "Always-On" Serial Interface is that the hardware
> +  is active since power-on and does not need any clock gating and is usable
> +  as very early serial console.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - description: Allways-on power domain UART controller
Always instead of Allways

[...]
> +examples:
> +  - |
> +    serial@84c0 {
> +          compatible = "amlogic,meson-gx-uart";
> +          reg = <0x84c0 0x14>;
> +          interrupts = <26>;
> +          clocks = <&xtal>, <&pclk>, <&xtal>;
> +          clock-names = "xtal", "pclk", "baud";
> +    };
more a hint than a nit-pick: you can add #includes to the example,
just like in the real .dtb
then you can keep the GIC_SPI and IRQ_TYPE_... macros

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
