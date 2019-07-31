Return-Path: <SRS0=czMH=V4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBDBBC32751
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 17:59:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FF902067D
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 17:59:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dMBb+jBC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+3Cky9w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FF902067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B8gLc6N70L3thLksP7sGf78b/HFKOxnszgPN1LKx4+A=; b=dMBb+jBCN5ivVD
	AyPwCKgEPkl9Of+SJv7yvd/IOvXzynDRtrMXMr2hTHL0Fb3sTnpzyFZe9h4sLe2+xngct4zvHSzju
	nKRSxgxlqNEYOIpRHMwR9BlqTsxWeU2LObiVMKl+GivAnRKBMpOWD4oh3614LeE7AYfnHvjgLfMFj
	Ct8MGELzyd35hAJAqjlWFY+xDXNOzAmVhZy3o5eqZKgn2A2mVyr7Qi06T9+E6QeSU74gvCy6MoNj/
	hQoPH2D4jbFzw3r7YyL9DAUiDVluhiXZJ5GkeJ5o9ZmCZFmHq3P013GputGpRb3JCfeCLDdV3Ibbf
	R4qIdhKubjYZPczgn6vw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hssst-0006TH-Hi; Wed, 31 Jul 2019 17:59:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsssq-0006Sq-Q3; Wed, 31 Jul 2019 17:59:30 +0000
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 46FE3208E4;
 Wed, 31 Jul 2019 17:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564595968;
 bh=NEcDRzJevd+KIyIuh3CpjR4gF6t3vEc53p0FcWTtLWI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=V+3Cky9w/gnN4kXEMxDWMD5MnHLewZ1pxiIZf6mlIMfgMmoZxtIdr1/REo0Vwtwhq
 nvge4kVCvstMykA5EnaWeOTd3osufFD169n3Wqi/7ghc6YNIo5Su492hpn4AIxh4YE
 eEN//AmMDGNkJW4kZ7qDqyKHbSuItzAfyyA+/hY4=
Received: by mail-qk1-f173.google.com with SMTP id m14so24218215qka.10;
 Wed, 31 Jul 2019 10:59:28 -0700 (PDT)
X-Gm-Message-State: APjAAAUlRL+B3OC8TDl1uG0yV8Pc/DbhOYbxtD0bNqKYYbcr+t0gHgtT
 XIGT4qgolgWliFnMKUS1E61cvkuE1ZEHvuCMxA==
X-Google-Smtp-Source: APXvYqxkCHy8Mu4YbKN2nkHxuSAOaPMHVupqx/C61IqD07sDT2Vj84zboBJUD7SDLxAR33ZQy+yLAkoAgVxagzL0504=
X-Received: by 2002:a05:620a:1447:: with SMTP id
 i7mr83131890qkl.254.1564595967401; 
 Wed, 31 Jul 2019 10:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190731153529.30159-1-glaroque@baylibre.com>
 <20190731153529.30159-2-glaroque@baylibre.com>
In-Reply-To: <20190731153529.30159-2-glaroque@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 31 Jul 2019 11:59:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLyhiLkpje8a4Qh5K21s9xU6k1kkR0OtyGPss8=efR5Sg@mail.gmail.com>
Message-ID: <CAL_JsqLyhiLkpje8a4Qh5K21s9xU6k1kkR0OtyGPss8=efR5Sg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: thermal: Add DT bindings
 documentation for Amlogic Thermal
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_105928_880896_F4F44D6A 
X-CRM114-Status: GOOD (  17.81  )
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
Cc: devicetree@vger.kernel.org, "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-amlogic@lists.infradead.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Jul 31, 2019 at 9:36 AM Guillaume La Roque
<glaroque@baylibre.com> wrote:
>
> Adding the devicetree binding documentation for the Amlogic temperature
> sensor found in the Amlogic Meson G12 SoCs.
> the G12A  and G12B SoCs are supported.
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  .../bindings/thermal/amlogic,thermal.yaml     | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
>
> diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> new file mode 100644
> index 000000000000..f10537ab4c8b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/amlogic,thermal.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Thermal Driver

This is not a driver.

> +
> +maintainers:
> +  - Guillaume La Roque <glaroque@baylibre.com>
> +
> +description: Amlogic Thermal driver
> +
> +properties:
> +  compatible:
> +    oneOf:

oneOf is not necessary as there is only one of.

> +      - items:
> +          - enum:
> +              - amlogic,g12-cpu-thermal
> +              - amlogic,g12-ddr-thermal
> +          - const:
> +              - amlogic,g12-thermal

Please run 'make dt_binding_check'. You'll find this is not valid json-schema.

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
> +    allOf:
> +     - $ref: /schemas/types.yaml#/definitions/uint32
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
> +                compatible = "amlogic,g12-cpu-thermal",
> +                             "amlogic,g12-thermal";
> +                reg = <0x0 0xff634800 0x0 0x50>;

Examples are built now and this will have an error. The default
address and size cells are 1 for examples, so you either have to
override them or adjust this.

> +                interrupts = <0x0 0x24 0x0>;
> +                clocks = <&clk 164>;
> +                status = "okay";

Don't show status in examples.

> +                #thermal-sensor-cells = <0>;
> +                amlogic,ao-secure = <&sec_AO>;
> +        };
> +...
> \ No newline at end of file
> --
> 2.17.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
