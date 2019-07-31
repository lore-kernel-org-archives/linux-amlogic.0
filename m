Return-Path: <SRS0=czMH=V4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A19C32751
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 17:02:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4713721851
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 17:02:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VmAKglDY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HbwUPQ/T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4713721851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eBVjNiim8Jk8Kkii29Bw20m/ovGi4HrAnvTFgESnc1I=; b=VmAKglDYdLG7EM
	zbzbx3Xnaa8og/+rbxs6O2sTQj19f2Ei1Jt6OCiDMn+5fuBKibmxczJSqbFmIDmi7XfGwaii7VQyD
	U5qcue6M0Tu4tq8dh1tdWanZpl55phP8GJj89AuBpA1mbxa+/5rDc5K+ETirkF4YKYxqv9vJ3qc4S
	RAm/LddbfrqeJ8UgbYshl0nCjLx5kmPFbzeOuGqw44tBJM94Mfwf7o4L/1fj53/pdRWAU/OXyIT5O
	vzzZ7pjOk85NxrnqLxXJn0ggXUMAYJ13TE3DL1BNvklCF1mpRrG4qAIN8K1rB/16fTkGzXS6ISyJ5
	uTpRNCb08iLRlSjEDdUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsrzT-0004dC-Cd; Wed, 31 Jul 2019 17:02:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsryJ-0002rC-NT; Wed, 31 Jul 2019 17:01:12 +0000
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3462F21851;
 Wed, 31 Jul 2019 17:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564592463;
 bh=y/z8SK50ZpO4nCmvVJnpvHDo1YUj59MbZ52y+l8J5m0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HbwUPQ/TqNvkzRJEcfZ45zRKq9UrnGWvUXJ0/cdlWu/BJVBs2LG/ZZYYUrk4dGsAo
 AjbOYmZU11vX9u5eeQwPrz6tRO6FbPeES2AcQ8GI18tGedmrKCP7LT72FixIM3jwNu
 Aak7Z3x3bzlKlc3NTPWHGAeUTjEWh4pIQALXNY0k=
Received: by mail-qt1-f175.google.com with SMTP id n11so67285371qtl.5;
 Wed, 31 Jul 2019 10:01:03 -0700 (PDT)
X-Gm-Message-State: APjAAAXWWe6bXLNf71nmhvkI6paFr/M8HQsa3EEeZrngVqpEB2rrOFSb
 gZheqav3hjgmUGgZQtPfK4FPn2nPvyDeNDjHuA==
X-Google-Smtp-Source: APXvYqyjhn7/hvSOJl+L9+ZR20USCeZlDySkINDz19gr0YGu/PGoSbb4n4RnD39j2VWH+e65HF3uPE1NOiig1AteLQA=
X-Received: by 2002:a0c:b786:: with SMTP id l6mr89053606qve.148.1564592462233; 
 Wed, 31 Jul 2019 10:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190731121409.17285-1-glaroque@baylibre.com>
 <20190731121409.17285-2-glaroque@baylibre.com>
 <f0f0dfe5-0cd3-5275-53ff-cfc4bb44f7e6@baylibre.com>
In-Reply-To: <f0f0dfe5-0cd3-5275-53ff-cfc4bb44f7e6@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 31 Jul 2019 11:00:50 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+Z1JvvtrDBtqbcuzdy_k5=OSSLQ7ezKvs9-oyvGi=-9A@mail.gmail.com>
Message-ID: <CAL_Jsq+Z1JvvtrDBtqbcuzdy_k5=OSSLQ7ezKvs9-oyvGi=-9A@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: thermal: Add DT bindings documentation
 for Amlogic Thermal
To: Neil Armstrong <narmstrong@baylibre.com>,
 Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_100103_824749_AFA9AA15 
X-CRM114-Status: GOOD (  16.95  )
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

On Wed, Jul 31, 2019 at 6:44 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 31/07/2019 14:14, Guillaume La Roque wrote:
> > Adding the devicetree binding documentation for the Amlogic temperature
> > sensor found in the Amlogic Meson G12 SoCs.
> > the G12A  and G12B SoCs are supported.
> >
> > Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> > ---
> >  .../bindings/thermal/amlogic,thermal.yaml     | 58 +++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> > new file mode 100644
> > index 000000000000..1e2fe84da13d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> > @@ -0,0 +1,58 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/thermal/amlogic,thermal.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Amlogic Thermal Driver
> > +
> > +maintainers:
> > +  - Guillaume La Roque <glaroque@baylibre.com>
> > +
> > +description: Amlogic Thermal driver
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - amlogic,g12-cpu-thermal
> > +              - amlogic,g12-ddr-thermal
> > +          - enum:
> > +              - amlogic,g12-thermal
>
> Shouldn't be :
>     compatible:
>         items:
>           - enum:
>               - amlogic,g12-cpu-thermal
>               - amlogic,g12-ddr-thermal
>           - const:
>               - amlogic,g12-thermal
>
> instead ?

Yes, except 'const' is a string, not list value.

>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  amlogic,ao-secure:
> > +    description: phandle to the ao-secure syscon
> > +    allOf:
> > +     - $ref: /schemas/types.yaml#/definitions/uint32

phandle, not uint32

> > +
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - amlogic,ao-secure
> > +
> > +examples:
> > +  - |
> > +        cpu_temp: temperature-sensor@ff634800 {
> > +                compatible = "amlogic,g12-cpu-thermal",
> > +                             "amlogic,g12-thermal";
> > +                reg = <0x0 0xff634800 0x0 0x50>;
> > +                interrupts = <0x0 0x24 0x0>;
> > +                clocks = <&clk 164>;
> > +                status = "okay";
> > +                #thermal-sensor-cells = <1>;
> > +                amlogic,ao-secure = <&sec_AO>;
> > +        };
> > +...
> > \ No newline at end of file

Fix this.


> >
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
