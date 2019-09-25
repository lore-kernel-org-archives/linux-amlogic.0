Return-Path: <SRS0=JnL7=XU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EBF5C432C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2019 14:30:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F59E21D7B
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2019 14:30:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mVSmEYrw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="TqcyhXTe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F59E21D7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3EzvC6sqmGggqI3H92aAGVzpzRvqnQJLDmJT2VxyFjQ=; b=mVSmEYrw+bLJLS
	c7UIIfUjDnnMZ05ANfWpczCZEzhMFs/SrNFBRd6GlM1RPrPDprdO1d2o+FGbvl1izbqsPZJqy/g4d
	5R8n5DuhCtBABnsZz1G2y+DO4evePoa2t3GliqMhzXmmVD3pueGCRblh2k1apBpq17Wu1cg/BImUZ
	E+Lf2kIbuLKTjVtm4G3uOyco53441tstVExTtHHggzM0o4X/rxO5hwPnIOZvc8bDugyexfhjZcf5d
	3iTZh+e2p0+pWIjXWdmZGwgvG1YqoelDrlCJwqANyddmyRDtoYM/zarR2lrXgeYI8tHa+ONQdApRa
	HyMejFzGAt1wCmRMWvMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iD8Ik-0007mh-MD; Wed, 25 Sep 2019 14:29:54 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iD8Ie-0007lc-Kc
 for linux-amlogic@lists.infradead.org; Wed, 25 Sep 2019 14:29:52 +0000
Received: by mail-wr1-x441.google.com with SMTP id a11so7251779wrx.1
 for <linux-amlogic@lists.infradead.org>; Wed, 25 Sep 2019 07:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=01Kh5AUUblqFWi3ZNkHBI22OYBLpt/UY9FlNGz+JAZo=;
 b=TqcyhXTeBpjPbXHmATEWSbSMssHKlceadH9bNBK2rEENOV8S59lTjB19hASMn9u81X
 Uy53gHROuQETn6BSE3uKBX6Cc2RA0fAdrZx5yXDdezp2nLFGbasbMavfwf7uHfWF7j6G
 0cvSzxdT58fjITWfyWuC2b8+l6b0lt4N3OMerdFAbiWKZa+NjbD9T3kKONiLTpNnNIWl
 fLlOG5d9ez5gNmTciSj0ziVc3cr7T/pZh2Vv/fOd4E8DREYe7DDPddyw2hzLHKNWrafD
 nQva2H+kPP1F+lSYq5sQfjH+uHcxz0TfCRYNQH4UhPQ0AE81x2sJLZom1dCejyBfP0j/
 2yDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=01Kh5AUUblqFWi3ZNkHBI22OYBLpt/UY9FlNGz+JAZo=;
 b=JKtQ4lb+cZBWZLumwuibozIJ3sErZ1+injDcQb38bA+WHYlVKfWLmGqqYzVNt96UG+
 oglbfsZspht0CLWW2r7eiI10ZvLDAVOMauUyZwhqSjCgPZrS9KDclMDYnSZ4ubh87pZW
 6WCjPOc+Igk502MSsiX16WgV/bTaeMX4g66Bq0fraitzL4qERDIFx1lj8N1k3NE2kdfA
 r25F771hzAeNJYy61iz3ykzGLX2LcRmIpfVayiFKz6fFERl58thpx24tgb2aMTv0oFjN
 adVBo0O2ZwJTTrfpXOiui/wyCUxxfivtfO7JWeo2XBXiVXvhx72yBnTYH3LfuH7tcv6k
 JfPg==
X-Gm-Message-State: APjAAAUCWHQ/pA87Cx5slZUIpJskoLBMcipT9drWKWbYxlRq66Bwm+ty
 q6eN2fMq3FZisP6olM22r40l7g==
X-Google-Smtp-Source: APXvYqw6ta3lyXW5QXoDceAQYURMJqtEe8XE0Kee6BcYwayFrIM0iklE0ITqg8crPV7uy5OUMdOb5Q==
X-Received: by 2002:a5d:6812:: with SMTP id w18mr9321474wru.250.1569421784891; 
 Wed, 25 Sep 2019 07:29:44 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i5sm3814592wmd.21.2019.09.25.07.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 07:29:44 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: meson: add A1 clock controller
 bindings
In-Reply-To: <1569411888-98116-2-git-send-email-jian.hu@amlogic.com>
References: <1569411888-98116-1-git-send-email-jian.hu@amlogic.com>
 <1569411888-98116-2-git-send-email-jian.hu@amlogic.com>
Date: Wed, 25 Sep 2019 16:29:43 +0200
Message-ID: <1j4l10motk.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190925_072948_704437_905899FA 
X-CRM114-Status: GOOD (  14.94  )
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
Cc: Rob Herring <robh@kernel.org>, Jianxin Pan <jianxin.pan@amlogic.com>,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Jian Hu <jian.hu@amlogic.com>,
 Qiufang Dai <qiufang.dai@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed 25 Sep 2019 at 19:44, Jian Hu <jian.hu@amlogic.com> wrote:

In addition to the comment expressed by Stephen on patch 2

> Add the documentation to support Amlogic A1 clock driver,
> and add A1 clock controller bindings.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  .../devicetree/bindings/clock/amlogic,a1-clkc.yaml |  65 +++++++++++++
>  include/dt-bindings/clock/a1-clkc.h                | 102 +++++++++++++++++++++
>  2 files changed, 167 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/a1-clkc.h
>
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
> new file mode 100644
> index 0000000..f012eb2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> +/*
> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
> + */
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/clock/amlogic,a1-clkc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson A1 Clock Control Unit Device Tree Bindings
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +  - Jian Hu <jian.hu@jian.hu.com>
> +
> +properties:
> +  compatible:
> +    - enum:
> +        - amlogic,a1-clkc
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 3
> +    items:
> +      - description: peripheral registers
> +      - description: cpu registers
> +      - description: pll registers
> +
> +  reg-names:
> +    items:
> +      - const: peripheral
> +      - const: pll
> +      - const: cpu
> +
> +  clocks:
> +    maxItems: 1
> +    items:
> +      - description: Input Oscillator (usually at 24MHz)
> +
> +  clock-names:
> +    maxItems: 1
> +    items:
> +      - const: xtal
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - "#clock-cells"
> +
> +examples:
> +  - |
> +    clkc: clock-controller {
> +        compatible = "amlogic,a1-clkc";
> +        reg = <0x0 0xfe000800 0x0 0x100>,
> +              <0x0 0xfe007c00 0x0 0x21c>,
> +              <0x0 0xfd000080 0x0 0x20>;
> +        reg-names = "peripheral", "pll", "cpu";

I'm sorry but I don't agree with this. You are trying to regroup several
controllers into one with this, and it is not OK

By the looks of it there are 3 different controllers, including one you
did not implement in the driver.

> +        clocks = <&xtal;
> +        clock-names = "xtal";
> +        #clock-cells = <1>;

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
