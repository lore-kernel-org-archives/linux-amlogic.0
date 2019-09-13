Return-Path: <SRS0=L2Ze=XI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E802DC49ED7
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Sep 2019 10:42:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC7EA208C2
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Sep 2019 10:42:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gVAkd+7V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=verdurent-com.20150623.gappssmtp.com header.i=@verdurent-com.20150623.gappssmtp.com header.b="f3NLr6fb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC7EA208C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=verdurent.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PP7h9xmEhOmlYXyAzCC+FoXqSjEdGE1v8VPAhLUgDy4=; b=gVAkd+7Vtbx0Io
	CnFja+5qu0Nh+dqlg/q0CCCjAbLcAwb/5Mh6psHrssVpwfG70Pa5ysHL8rdRyA4jhrRKH8gAr0QPz
	iNxFxhaB0pv5nUsuCRMrzfmEHWEl2qxOn/ICCrtLjAllCQvpCacXabJSfj0aCOcxHoGsaJNehmoe6
	p4YhFiaXjkT4z10kLS1Sqbze8oRV17t83s7jYjtZHXt0gCa9dZ14LCChR9+wwB6sFy6Pa66rd8Uws
	b1YGdRGsHFDPyseU4hqely5c1oqV3IwBfhi7a2+vy3XmobZa9neWK8kJmAb49qIsqnDYk9PzhbgFC
	5GYHWbwyelLbMcDfW34g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i8j1c-0003QQ-I1; Fri, 13 Sep 2019 10:42:00 +0000
Received: from mail-vk1-xa43.google.com ([2607:f8b0:4864:20::a43])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8j1Z-0003P0-EI
 for linux-amlogic@lists.infradead.org; Fri, 13 Sep 2019 10:41:59 +0000
Received: by mail-vk1-xa43.google.com with SMTP id v78so5825425vke.4
 for <linux-amlogic@lists.infradead.org>; Fri, 13 Sep 2019 03:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=verdurent-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VzFtOukORn6BTxSSinbhVvnit+eXevFHlnBe06UcHUA=;
 b=f3NLr6fbzNYDtDc9NetNG83qATddX3ST7qNfOKiC7D5A26Lz2W6t+TDvpUxWeoYtT3
 M4aApAZGloRKGHMgH5L8irTiEYBLKD3B/TRtWOrBOlsAjjACHoc4sHORYAgqvS0mL4E7
 t30zdO7NhhgWVnNDKr0/2Bh3D/lnBW2Kv3e4DwIMIDa17R97vTDrnH1O2Okzk0a4Kq+o
 kQ7BLoiH1T9lNsHm2mbS7J+LamF28uuFHwj5hA7c0oM0csUOHIolCIFZAva9Njfv3iIH
 Dtn3ozGFbppAKM4KDwUz8SJW1Z+2yZo2q6DQ2w3yD6hcXQSIQMiQ8gv7iN/j0A0ewzRo
 yIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VzFtOukORn6BTxSSinbhVvnit+eXevFHlnBe06UcHUA=;
 b=oSa68AACjXUOJpjv/cnYvn1pk4jmDl+KH7QeOCLUv4lfCBxBjJ9LEuoHuHvbXoh8eG
 G1jgSJj7PaW2rLo+ZPBHbpQWKUfdh9AVXPPiRamWmsgmyVKPuJ07OGPRoV5fWrZ0pNVI
 5eT8JmQJHhgMXZ2AC04uVONZLFNI05CsJenkZuH7o//PHztNhMIhQYUbupcXej2kGUHz
 1NjhMSsPd5LAHtN1T4zfiNc2nvBzCCbHrzyqqW03lK02FUx3v5VMr8p44BB6xG3a88VT
 3fZgl0f21n6/2exkeBNiO5GGVFQxWkm6LQwmUAxkMDVzCDFJJnEhOjIvr1Zw9PPIbGzh
 8bpQ==
X-Gm-Message-State: APjAAAXshNfBLfg2xAHE0Dkx3D5c1Gte9nA4i19JbvE+sCjNCCJDfHTA
 tXKBfRKlLB3Gz23eFv6wbRVNWDYAUN7vnaxoOQvLLA==
X-Google-Smtp-Source: APXvYqxu3cBj6Axf6oFZHBU9kgVq97krzKOT0Ts3wNrOj22Hb1h0mDeMG74eyOdiEpKHd1mAbLgszYVEJZSRRFRkBo8=
X-Received: by 2002:a1f:410f:: with SMTP id o15mr19922615vka.82.1568371312972; 
 Fri, 13 Sep 2019 03:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190821222421.30242-1-glaroque@baylibre.com>
 <20190821222421.30242-2-glaroque@baylibre.com>
In-Reply-To: <20190821222421.30242-2-glaroque@baylibre.com>
From: Amit Kucheria <amit.kucheria@verdurent.com>
Date: Fri, 13 Sep 2019 16:11:41 +0530
Message-ID: <CAHLCerONjCa4Az7+d_0Qn8X36oOxXEMps++5MnBRdH5QE+aS=g@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: thermal: Add DT bindings
 documentation for Amlogic Thermal
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190913_034157_540264_67EB1960 
X-CRM114-Status: GOOD (  13.51  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Eduardo Valentin <edubezval@gmail.com>,
 linux-amlogic@lists.infradead.org, Zhang Rui <rui.zhang@intel.com>,
 lakml <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Aug 22, 2019 at 3:54 AM Guillaume La Roque
<glaroque@baylibre.com> wrote:
>
> Adding the devicetree binding documentation for the Amlogic temperature
> sensor found in the Amlogic Meson G12 SoCs.
> the G12A  and G12B SoCs are supported.

Merge the two sentences into a single one?

> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/thermal/amlogic,thermal.yaml     | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
>
> diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> new file mode 100644
> index 000000000000..f761681e4c0d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/amlogic,thermal.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Thermal
> +
> +maintainers:
> +  - Guillaume La Roque <glaroque@baylibre.com>
> +
> +description: Binding for Amlogic Thermal
> +
> +properties:
> +  compatible:
> +      items:
> +        - enum:
> +            - amlogic,g12a-cpu-thermal
> +            - amlogic,g12a-ddr-thermal
> +        - const: amlogic,g12a-thermal
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
> +  amlogic,ao-secure:
> +    description: phandle to the ao-secure syscon
> +    $ref: '/schemas/types.yaml#/definitions/phandle'
> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - amlogic,ao-secure
> +
> +examples:
> +  - |
> +        cpu_temp: temperature-sensor@ff634800 {
> +                compatible = "amlogic,g12a-cpu-thermal",
> +                             "amlogic,g12a-thermal";
> +                reg = <0xff634800 0x50>;
> +                interrupts = <0x0 0x24 0x0>;
> +                clocks = <&clk 164>;
> +                #thermal-sensor-cells = <0>;
> +                amlogic,ao-secure = <&sec_AO>;
> +        };
> +...
> --
> 2.17.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
