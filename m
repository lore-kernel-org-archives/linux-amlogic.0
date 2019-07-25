Return-Path: <SRS0=Jj0Y=VW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899AEC76190
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 22:55:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6175B229F9
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 22:55:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X3jLFTfF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dz09u9S+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6175B229F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GNqcvQdVcUvDC7CgcoFrqHxPdv7sYDOCLCRLG4W/0o=; b=X3jLFTfFyF/o38
	+Fa3fWkOL6FTqOkfGVzQcPupJWLlSHZcersA4XZG4aVlSvXXbc2MFwpUMHTicAnd9u2ysKk2Vnr+W
	6lnD0U+hgOg6ASnwCea6eza+Ty039hOP1ygqYT+lsF3QeN9nmi6ozYCTOgxj4TeW3PI4ZNTz9T8wY
	x4NMQbZtH2HGv0FGVeqH+Wa0nyTTOy6BblRVfbKl8FSaXkEk1LC/BlcMfSVATP5UnaY2iD2G98LBY
	0JIsTPX2Hs24EOOCjJU6ydpX3bD6ppSvkD13DjR7AB3uClYrndKlonsxU1GBg/ftQqEOEoxIIY7z2
	IfPe/vs7oQb6sF5Uq7qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqmeH-00042A-2m; Thu, 25 Jul 2019 22:55:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqmeE-00041m-Qh; Thu, 25 Jul 2019 22:55:44 +0000
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 626AE22BF5;
 Thu, 25 Jul 2019 22:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564095342;
 bh=g812QekVhk9YTdEBM9x7cM1JCaC9kZOURpxH8pDFoBY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Dz09u9S+Y3r70TocpuCA7IhoTLlYKdq7e+lwmbq167Zr4gqovWvCkIFvioJzQc30E
 UExAFN0EUnJRkGN7juvvECfcyT/2dxBkDeevZjvKHHIjF+P3AGjXUkTgj812rRiWOK
 Eqxe4SYbimo13thxamdtxgOCzguesjyhhx+fJq8w=
Received: by mail-qt1-f177.google.com with SMTP id a15so50735846qtn.7;
 Thu, 25 Jul 2019 15:55:42 -0700 (PDT)
X-Gm-Message-State: APjAAAXvC5evuGQNmwOePMsnqNk3dDHgjeuLE+SEm6zB14+jMbjteDX5
 i5YMqitCpyVqGK07jq5c/1H8PkhdxaRQ3nCCGg==
X-Google-Smtp-Source: APXvYqz9DMpk570nuBSorqgYVEjSnP43DJEbGzpTBLg6Vx9QqBo6uQGIKBtq4PAJy2WytaI2Mv9aGYuTo7fmld4NaC4=
X-Received: by 2002:a0c:b786:: with SMTP id l6mr65611308qve.148.1564095341588; 
 Thu, 25 Jul 2019 15:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <1564083776-20540-1-git-send-email-clabbe@baylibre.com>
 <1564083776-20540-2-git-send-email-clabbe@baylibre.com>
In-Reply-To: <1564083776-20540-2-git-send-email-clabbe@baylibre.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 25 Jul 2019 16:55:30 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLbYwRpNWHGkYbomWLMpum_DXW4OjNNRrwTRM=w86dONw@mail.gmail.com>
Message-ID: <CAL_JsqLbYwRpNWHGkYbomWLMpum_DXW4OjNNRrwTRM=w86dONw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: crypto: Add DT bindings documentation
 for amlogic-crypto
To: Corentin Labbe <clabbe@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_155542_901884_10445CC6 
X-CRM114-Status: GOOD (  17.04  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, baylibre-upstreaming@groups.io,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, linux-amlogic@lists.infradead.org,
 David Miller <davem@davemloft.net>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Jul 25, 2019 at 1:43 PM Corentin Labbe <clabbe@baylibre.com> wrote:
>
> This patch adds documentation for Device-Tree bindings for the
> Amlogic GXL cryptographic offloader driver.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  .../bindings/crypto/amlogic-gxl-crypto.yaml   | 45 +++++++++++++++++++

Follow the compatible string for the filename: amlogic,gxl-crypto.yaml

>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/crypto/amlogic-gxl-crypto.yaml
>
> diff --git a/Documentation/devicetree/bindings/crypto/amlogic-gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic-gxl-crypto.yaml
> new file mode 100644
> index 000000000000..41265e57c00b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/amlogic-gxl-crypto.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual (GPL-2.0 OR BSD-2-Clause) is preferred for new bindings. Not a
requirement though.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/crypto/amlogic-gxl-crypto.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic GXL Cryptographic Offloader
> +
> +maintainers:
> +  - Corentin Labbe <clabbe@baylibre.com>
> +
> +properties:
> +  compatible:
> +    oneOf:

Don't need 'oneOf' when there is only 1.

> +      - const: amlogic,gxl-crypto
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: blkmv
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    crypto: crypto@c883e000 {
> +        compatible = "amlogic,gxl-crypto";
> +        reg = <0x0 0xc883e000 0x0 0x36>;

This should throw errors because the default size on examples are 1
cell. But validating the examples with the schema only just landed in
5.3-rc1.

> +        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>,
> +            <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;

This doesn't match the schema.

> +        clocks = <&clkc CLKID_BLKMV>;
> +        clock-names = "blkmv";
> +    };
> --
> 2.21.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
