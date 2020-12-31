Return-Path: <SRS0=R/Kg=GD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EACB9C433DB
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Dec 2020 18:14:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92625223DB
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Dec 2020 18:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92625223DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7vXQhJJBfS58t92/rWoyuQAjBmwX+0w87Xa4HNX44CI=; b=jYo5xKDqGGy6aUA2D62QUd9pl
	TadwQ4G+cu8BJvT4MwnOVzxtQFjPSCbk3ShW2kcIXHqZuZfYwClV+jVRsHEeseerIpeHSPLKZmGb1
	nBfViH6Mcm/keULeQ0PQYczyGL3YNHMIV5VGQ2fODGk0LVUo021WuScwORX7rGou2oGz8H+hUhir8
	98RccgCtL5CjGh2UPL5XUQF4EQMC5wTHFsrbFVfM9foqH02mAbn6j7bIrn6cAGqcboMyIcIc+DhNh
	kDHrMHqzdZ6i7ars2xsICSHJrmq2R4eJPN3k7FxYAh4g2OIy4ig3+wCm76sQ9ls8N5UbMh6rBe/wR
	Rq38crLUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kv2T5-0006wX-Hz; Thu, 31 Dec 2020 18:14:35 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kv2T2-0006vc-57; Thu, 31 Dec 2020 18:14:33 +0000
Received: by mail-ot1-f41.google.com with SMTP id d20so18595766otl.3;
 Thu, 31 Dec 2020 10:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iq0dcWEVlFUmNv6kk0ISrl3suC2cnVnqKLX0qddM2wo=;
 b=DuNoLxoM/+ZOMCW4u5fZZ1HUJKsv9/PbnBzq1croqi+AG/2gvZfTu82yAt8VcM/hIP
 DND7THn0mDSreHF/odicEAXcm7DSwEDdi+B8K5L6alHOq4T0wt81Re3T5q708x38l9zb
 Jr8D51XbD0MHC2YHq+XqLMN3DkNpPAd46zSxqemFWK0XPQYdOZTR+xZdrAMEnEcqGdta
 np8eu8cNg50brlFCH7M6rwXy6ToVNa+6pHY6HGCJjL3s5TKwYk95/ATNYHg189Bh+WVu
 VBI+Ov02pzqUbkSn4s8egCjfeT8MRBldv/G4Nwr06YWRVxlOJRtzaf4kpO28IXP6m6hQ
 rHYQ==
X-Gm-Message-State: AOAM5316SKuu5I6geAFGvtcZUNVHd+b/bejQ56jFe5iVJneIs+WnvEys
 VqpEx8aazC/A41J69fTVEA==
X-Google-Smtp-Source: ABdhPJxnSl31FNRefQoVvm0p3wnIQvQHkxPiFa4SHrf1hPyKCmgwy5k8a1uYLMvcEdPkcGpykvuJig==
X-Received: by 2002:a05:6830:1de8:: with SMTP id
 b8mr41585182otj.204.1609438470100; 
 Thu, 31 Dec 2020 10:14:30 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id f25sm11148595oou.39.2020.12.31.10.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 10:14:28 -0800 (PST)
Received: (nullmailer pid 2077595 invoked by uid 1000);
 Thu, 31 Dec 2020 18:14:25 -0000
Date: Thu, 31 Dec 2020 11:14:25 -0700
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/5] dt-bindings: Amlogic: add the documentation for the
 SECBUS2 registers
Message-ID: <20201231181425.GA2075418@robh.at.kernel.org>
References: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
 <20201230012724.1326156-3-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201230012724.1326156-3-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201231_131432_242523_B84EF594 
X-CRM114-Status: GOOD (  19.23  )
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
Cc: ohad@wizery.com, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Dec 30, 2020 at 02:27:21AM +0100, Martin Blumenstingl wrote:
> The Meson8/Meson8b/Meson8m2 SoCs have a register bank called SECBUS2 which
> contains registers for various IP blocks such as pin-controller bits for
> the BSD_EN and TEST_N GPIOs as well as some AO ARC core control bits.
> The registers can be accessed directly when not running in "secure mode".
> When "secure mode" is enabled then these registers have to be accessed
> through secure monitor calls.
> 
> So far these SoCs are always known to boot in "non-secure mode".
> Add a binding documentation using syscon (as these registers are shared
> across different IPs) for the SECBUS2 registers.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../arm/amlogic/amlogic,meson-mx-secbus2.yaml | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
> new file mode 100644
> index 000000000000..cfa8e9de6c28
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/amlogic/amlogic,meson-mx-secbus2.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson8/Meson8b/Meson8m2 SECBUS2 register interface
> +
> +maintainers:
> +  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> +
> +description: |
> +  The Meson8/Meson8b/Meson8m2 SoCs have a register bank called SECBUS2 which
> +  contains registers for various IP blocks such as pin-controller bits for
> +  the BSD_EN and TEST_N GPIOs as well as some AO ARC core control bits.
> +  The registers can be accessed directly when not running in "secure mode".
> +  When "secure mode" is enabled then these registers have to be accessed
> +  through secure monitor calls.
> +
> +# We need a select here so we don't match all nodes with 'syscon'

No, you don't. The default 'select' will ignore 'syscon' and 
'simple-mfd'.

> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - amlogic,meson8-secbus2
> +          - amlogic,meson8b-secbus2
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - amlogic,meson8-secbus2
> +        - amlogic,meson8b-secbus2
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    secbus2: system-controller@4000 {
> +      compatible = "amlogic,meson8-secbus2", "syscon";
> +      reg = <0x4000 0x2000>;
> +    };
> -- 
> 2.30.0
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
