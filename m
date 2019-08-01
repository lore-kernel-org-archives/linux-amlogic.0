Return-Path: <SRS0=NajJ=V5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA534C433FF
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 15:09:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96263206B8
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 15:09:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NvkHi/zP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="esx7VY/u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96263206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0HXO9+Sl1jGRW2mz+3Cv8kagArlQZIG5+m44gt9d558=; b=NvkHi/zPYOQz+5
	zq2fjubNPsZdeqGLFIEF07+RWikmmyIuM9q5fmeWXLRsABv2W3bkygJ7B1xCZEvtktnh66ltMmUq4
	n2JvNGYBZnBjFemGm8yV7FV+fMGFTncaxNiPJE4jAuMxu+kuVNZxoOSoc4Lx2ZTnX3py3zU9Y+Bd1
	UpbUqsA2roWVnXPvtF0OOzM2xUe7FMEyO2SNuqONaVasS38dUiUZ8AYc/TyM7BktolL5oKTe79rki
	aFDRkPPISR55AxxPVGNzbljv8IkH0sxnSb+Kl+ONUbiQBNLGoDnlG67zMWS2WYrMu/DKx4gCyIukV
	qqHP/gi1ILIFznkX/d6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htChd-0002Uo-Nl; Thu, 01 Aug 2019 15:09:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htCha-0002UI-1g; Thu, 01 Aug 2019 15:09:11 +0000
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6682F20B7C;
 Thu,  1 Aug 2019 15:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564672149;
 bh=40shE2rxVBiMNf4Kx7yDibqVDgp6W/MOUvF5pi9dMyQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=esx7VY/uwA+q8kHQbxlgeiEwUURr+QZhKig1eK6LJJCwbDUnB2MJVAyoRTvan4wxq
 uVFL5Go6Ayar9EDTWSW1+mgp34leoE1XRLuUmFnL3I7gc2p0Ogj9G2DALK6VPqAFEZ
 qdHAONcfRrVhD1Of2UzivUmJcd4tffAD+MAIo5zM=
Received: by mail-qt1-f177.google.com with SMTP id 44so39519767qtg.11;
 Thu, 01 Aug 2019 08:09:09 -0700 (PDT)
X-Gm-Message-State: APjAAAWx1MnUB1c89E8wt02Gbz/49RXbn0KOyieXLmWixoyhX5O6bS0k
 HUANov/NOPbhOrg6h07yjN4I3IuFrKzZR2N0zQ==
X-Google-Smtp-Source: APXvYqyRObrfCmNAGzN9pkiA5a5qQVLF5gsIcGMCjX9aTatSwQ0ZlLuAnFMBqKA+PE6jbgbW1wX5Wq/pY/fADF3k6sI=
X-Received: by 2002:ac8:36b9:: with SMTP id a54mr92696475qtc.300.1564672148616; 
 Thu, 01 Aug 2019 08:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190801135644.12843-1-narmstrong@baylibre.com>
 <20190801135644.12843-8-narmstrong@baylibre.com>
In-Reply-To: <20190801135644.12843-8-narmstrong@baylibre.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 1 Aug 2019 09:08:54 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+Ytb2eJ4g_BMaCwyjM=taB6Yc8qM=U-==vFJ3LqDqV6Q@mail.gmail.com>
Message-ID: <CAL_Jsq+Ytb2eJ4g_BMaCwyjM=taB6Yc8qM=U-==vFJ3LqDqV6Q@mail.gmail.com>
Subject: Re: [RFC 7/9] dt-bindings: phy: meson-g12a-usb3-pcie-phy: convert to
 yaml
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_080910_132175_CA76749E 
X-CRM114-Status: GOOD (  18.54  )
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
Cc: linux-amlogic@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Aug 1, 2019 at 7:56 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/phy/meson-g12a-usb3-pcie-phy.txt | 22 -------
>  .../phy/meson-g12a-usb3-pcie-phy.yaml         | 61 +++++++++++++++++++
>  2 files changed, 61 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.yaml
>
> diff --git a/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt b/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
> deleted file mode 100644
> index 7cfc17e2df31..000000000000
> --- a/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -* Amlogic G12A USB3 + PCIE Combo PHY binding
> -
> -Required properties:
> -- compatible:  Should be "amlogic,meson-g12a-usb3-pcie-phy"
> -- #phys-cells: must be 1. The cell number is used to select the phy mode
> -  as defined in <dt-bindings/phy/phy.h> between PHY_TYPE_USB3 and PHY_TYPE_PCIE
> -- reg:         The base address and length of the registers
> -- clocks:      a phandle to the 100MHz reference clock of this PHY
> -- clock-names: must be "ref_clk"
> -- resets:      phandle to the reset lines for the PHY control
> -- reset-names: must be "phy"
> -
> -Example:
> -       usb3_pcie_phy: phy@46000 {
> -               compatible = "amlogic,g12a-usb3-pcie-phy";
> -               reg = <0x0 0x46000 0x0 0x2000>;
> -               clocks = <&clkc CLKID_PCIE_PLL>;
> -               clock-names = "ref_clk";
> -               resets = <&reset RESET_PCIE_PHY>;
> -               reset-names = "phy";
> -               #phy-cells = <1>;
> -       };
> diff --git a/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.yaml
> new file mode 100644
> index 000000000000..fe4df6bd51b2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/meson-g12a-usb3-pcie-phy.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic G12A USB3 + PCIE Combo PHY
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,g12a-usb3-pcie-phy

Wrong compatible string.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      A phandle to the clock of this PHY
> +
> +  clock-names:
> +    items:
> +      - const: ref_clk
> +
> +  resets:
> +    maxItems: 1
> +    description:
> +      A phandle to the reset line of this PHY
> +
> +  reset-names:
> +    items:
> +      - const: phy
> +
> +  "#phy-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - "#phy-cells"
> +
> +examples:
> +  - |
> +    phy@46000 {
> +          compatible = "amlogic,meson-g12a-usb3-pcie-phy";
> +          reg = <0x46000 0x2000>;
> +          clocks = <&ref_clk>;
> +          clock-names = "ref_clk";
> +          resets = <&phy_reset>;
> +          reset-names = "phy";
> +          #phy-cells = <1>;
> +    };
> --
> 2.22.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
