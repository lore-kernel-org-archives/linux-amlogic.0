Return-Path: <SRS0=NajJ=V5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97942C433FF
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 15:07:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6926C206B8
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 15:07:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cjqR03Su";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="gwPTDBqS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6926C206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DzJ17+re9mFH/roE1PHPYDhgAw5p9xwwQMFWRzC/VOw=; b=cjqR03Sur6FWDM
	wgSAafZzrIlLzuS54khhVn0laC0SOiYe13/r+6JNxAB3k7Ki+fJmYD0CO1nxqMCq3yJvvNzh3/T9S
	JB+nw+OX1vKA4i9Do6irBZw6jWftSrvkNvY46M7uIj6/ygn3WWJC0y8pZen7Sv4esn9amUwoK9Soh
	27joFYdTP/13iR14z1cWfrtwv+Zi2kZaMzm7++3S3gr+zxeVE5vNWrO4JOWz3giODTO+phcWCWFzP
	F57hEZEJoq45Al3SHT78NvWtxFuc6ZloCMZKbhnTbSiJXyy5sMv26mMtAi0mJOI0pZF3BMUl65U85
	p1uUFQ6QLPCbbvNdPKhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htCgE-0002Bp-UF; Thu, 01 Aug 2019 15:07:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htCgC-0002BS-H0; Thu, 01 Aug 2019 15:07:46 +0000
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E672F216C8;
 Thu,  1 Aug 2019 15:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564672064;
 bh=iSl6ok6B2SROLYHTwlF9Rt9vwiSJ20o3/syGoRjvS4k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gwPTDBqSBdwKa7yeRMuwVfg3mJvvuhisdPYP1JnpirCoSUXWvBLGj+YvmKnoOLAWO
 SEMLFTYKzvNxJ9AShvtkVCIEhmy/WLWSD9Y5OwRQX8fhhoaUyS0HorXz0AtNbmA1SQ
 zIzhJQ5lx2n8XBdwrhIk4iciJE4J11QnvRUPvoQY=
Received: by mail-qt1-f172.google.com with SMTP id l9so70504538qtu.6;
 Thu, 01 Aug 2019 08:07:43 -0700 (PDT)
X-Gm-Message-State: APjAAAU4rhDa363MLF9YjwkPjEVDzw3JVSYaYUe/ZITumubMsVu2772L
 tR+MjjXKPoXf8EARBQSB+tf5TOciNbk/1FXHgQ==
X-Google-Smtp-Source: APXvYqy7Pqe/EM1KT5Xeue0nhWEZlvbnoGusFTQHCOXMTlxdphxp7CGKAsGtOykYhiSsvQo3hQWcwNukIZ5EHYeeHME=
X-Received: by 2002:a0c:b627:: with SMTP id f39mr94377748qve.72.1564672063061; 
 Thu, 01 Aug 2019 08:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190801135644.12843-1-narmstrong@baylibre.com>
 <20190801135644.12843-7-narmstrong@baylibre.com>
In-Reply-To: <20190801135644.12843-7-narmstrong@baylibre.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 1 Aug 2019 09:07:31 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJbt=rzDrD8+Py0EcGx8ZiaqEupv5Rq+tCMk1ZcxKaOcg@mail.gmail.com>
Message-ID: <CAL_JsqJbt=rzDrD8+Py0EcGx8ZiaqEupv5Rq+tCMk1ZcxKaOcg@mail.gmail.com>
Subject: Re: [RFC 6/9] dt-bindings: phy: meson-g12a-usb2-phy: convert to yaml
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_080744_611572_BF2AAA64 
X-CRM114-Status: GOOD (  19.21  )
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
>  .../bindings/phy/meson-g12a-usb2-phy.txt      | 22 ------
>  .../bindings/phy/meson-g12a-usb2-phy.yaml     | 67 +++++++++++++++++++
>  2 files changed, 67 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.yaml
>
> diff --git a/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt b/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
> deleted file mode 100644
> index a6ebc3dea159..000000000000
> --- a/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -* Amlogic G12A USB2 PHY binding
> -
> -Required properties:
> -- compatible:  Should be "amlogic,meson-g12a-usb2-phy"
> -- reg:         The base address and length of the registers
> -- #phys-cells: must be 0 (see phy-bindings.txt in this directory)
> -- clocks:      a phandle to the clock of this PHY
> -- clock-names: must be "xtal"
> -- resets:      a phandle to the reset line of this PHY
> -- reset-names: must be "phy"
> -- phy-supply:  see phy-bindings.txt in this directory
> -
> -Example:
> -       usb2_phy0: phy@36000 {
> -               compatible = "amlogic,g12a-usb2-phy";
> -               reg = <0x0 0x36000 0x0 0x2000>;
> -               clocks = <&xtal>;
> -               clock-names = "xtal";
> -               resets = <&reset RESET_USB_PHY21>;
> -               reset-names = "phy";
> -               #phy-cells = <0>;
> -       };
> diff --git a/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.yaml
> new file mode 100644
> index 000000000000..4cd5ba97d469
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/meson-g12a-usb2-phy.yaml#"

For this and the filename, use the compatible string (i.e. add 'amlogic,').

> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic G12A USB2 PHY
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-g12a-usb2-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      A phandle to the clock of this PHY

As mentioned elsewhere, this description can be dropped.

> +
> +  clock-names:
> +    items:
> +      - const: xtal
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
> +    const: 0
> +
> +  phy-supply:
> +     maxItems: 1
> +     description:
> +       Phandle to a regulator that provides power to the PHY. This
> +       regulator will be managed during the PHY power on/off sequence.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - "#phy-cells"

phy-supply was required in the old doc though the example disagrees.
If dropping required is desired, just mention so in the commit
message.

> +
> +examples:
> +  - |
> +    phy@36000 {
> +          compatible = "amlogic,meson-g12a-usb2-phy";
> +          reg = <0x36000 0x2000>;
> +          clocks = <&xtal>;
> +          clock-names = "xtal";
> +          resets = <&phy_reset>;
> +          reset-names = "phy";
> +          #phy-cells = <0>;
> +    };
> --
> 2.22.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
