Return-Path: <SRS0=mN7q=IQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9102C433DB
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Mar 2021 02:56:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68C2064E2E
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Mar 2021 02:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68C2064E2E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S/y3O3OyzM9h1SA5ib41iaaNXgQHN5U9MTYO1XNyEKQ=; b=NxcoJ7BLIjE4yVOTJrnZ+nJ6H
	aEWfIFiY5k9PMmvVZfvywBDlYby90csbfk/TeScP712/8lzmhnF0Ys03JLa6CZ8dn9++JbnoliTBl
	PICCMt+68r3QtOe6az4cBDPf6+npB0CchIvlwPNUavrwYIMcldqUWkA7Eor0IzvsS1HQsGp32xX3H
	b2fg+a+vrbUCbcMQJjWISJP+O4SxS2JIbyOL0VrxG2Hh9pUZWn8TS767Ex9Sue/PWpUkidxghVcpB
	505ibU/m+vwfOpm5jbt0iaHpQpwI1YazsYIY1RdLktQUfyc+B2YV56gNRPIAuFotYHG1iFT26M/Vx
	H+Q/VVMXA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMipZ-004KDd-Pg; Thu, 18 Mar 2021 02:56:13 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMipM-004KCp-4W
 for linux-amlogic@lists.infradead.org; Thu, 18 Mar 2021 02:56:02 +0000
Received: by mail-ot1-x336.google.com with SMTP id
 v24-20020a9d69d80000b02901b9aec33371so3859851oto.2
 for <linux-amlogic@lists.infradead.org>; Wed, 17 Mar 2021 19:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=27W1NAaEDoiN1XjCrbRbIY3sRWmvahk+Y7TUd1HZpNk=;
 b=NNT30YpUOjnTtIIgfpPaaNb1NMWqPi9HZGoaMjkSlCPov7l+5HMwI8MrMlLHCsm+Lk
 vLbpD1HexvGx38mf30KvE8L+mYXcCXiN4RqIaytz9B2dqg0GjdofqlkCWrZnhaqWqzyV
 GrHhWdJpO7P8QlolwKGMCziDVySsJrOBikmTs8tTzWL6/ibmap79OuxlVUp6pAb/IlUU
 6CXY/JltgtoMigly3rllHeZVza0XWr/zyE0Vbnh9bdm6ah5TLYLMCupumLa92xCeKy6R
 DPZ5f4SZqxPt4qiHYsisFA+mrYsYEIKXtW84qLgabMrqlDb46NASckOEFwfF24F8Enfp
 hi+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=27W1NAaEDoiN1XjCrbRbIY3sRWmvahk+Y7TUd1HZpNk=;
 b=mrsBxs+GAalqJWZX9S177kMScfZUEANflZPdhwzOm4nhvxseImZmnd/4zzuvRhjAJF
 rOZ1GbaAj9uHthsx7YPW3UHMVw1siFPI8JRdNbn2EN19fGVLzT9T/TiSh/6nGOm60sT4
 Ub4R/Lp+X5HTUNh4ybtI95cEH6iSdzLY+HxdcHWlZcA+16XF8X4TNsjTzftcU+/BVdwp
 d5q9I/JuJV3LrkWXWBtYx5rObpM2zO/2DnY/+O5ylMp4z33KAvyYCEdDmdv/2D9y4UhT
 JHWcpB0hg6QRtX3v9oByXxuy9cGr7Mwc18L0tun4ENoreoC21utBIb2MilkF/lNuz51r
 +L/Q==
X-Gm-Message-State: AOAM530c0IuwU+zFOiCEKt4j0eGrH7AzPaSC8vx9VugMQLWDCBI+xVdM
 XJPzKwFV1osLqU+jMOQ7aQMjlw==
X-Google-Smtp-Source: ABdhPJzvUIUNj7R3Lxmz3ePp9qfkHXEqAKknhmjyW0ajLAsXeDfcHGJ8d8H2YuhuKEQT9+SLORAolQ==
X-Received: by 2002:a9d:2f24:: with SMTP id h33mr6029369otb.128.1616036158912; 
 Wed, 17 Mar 2021 19:55:58 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id g13sm181622otq.3.2021.03.17.19.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 19:55:58 -0700 (PDT)
Date: Wed, 17 Mar 2021 21:55:56 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, ohad@wizery.com, robh+dt@kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: remoteproc: Add the documentation for
 Meson AO ARC rproc
Message-ID: <YFLBPGNQpT9mM3AJ@builder.lan>
References: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
 <20201230012724.1326156-4-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201230012724.1326156-4-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_025600_568215_CA4BBE7C 
X-CRM114-Status: GOOD (  20.14  )
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

On Tue 29 Dec 19:27 CST 2020, Martin Blumenstingl wrote:

> Amlogic Meson6, Meson8, Meson8b and Meson8m2 SoCs embed an ARC EM4
> controller for always-on operations, typically used for managing system
> suspend.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../remoteproc/amlogic,meson-mx-ao-arc.yaml   | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> new file mode 100644
> index 000000000000..ba5deebaf7dc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/remoteproc/amlogic,meson-mx-ao-arc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson AO ARC Remote Processor bindings
> +
> +description:
> +  Amlogic Meson6, Meson8, Meson8b and Meson8m2 SoCs embed an ARC core
> +  controller for always-on operations, typically used for managing
> +  system suspend. Meson6 and older use a ARC core based on the ARCv1
> +  ISA, while Meson8, Meson8b and Meson8m2 use an ARC EM4 (ARCv2 ISA)
> +  core.
> +
> +maintainers:
> +  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - amlogic,meson8-ao-arc
> +        - amlogic,meson8b-ao-arc
> +      - const: amlogic,meson-mx-ao-arc
> +
> +  firmware-name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      The name of the firmware which should be loaded for this remote
> +      processor.
> +
> +  reg:
> +    description:
> +      Address ranges of the remap and CPU control addresses for the
> +      remote processor.
> +    minItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: remap
> +      - const: cpu
> +
> +  resets:
> +     minItems: 1
> +
> +  clocks:
> +    minItems: 1
> +
> +  sram:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandles to a reserved SRAM region which is used as the memory of
> +      the ARC core. The region should be defined as child nodes of the
> +      AHB SRAM node as per the generic bindings in
> +      Documentation/devicetree/bindings/sram/sram.yaml
> +
> +  amlogic,secbus2:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle to the SECBUS2 region which contains some configuration
> +      bits of this remote processor
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - resets
> +  - clocks
> +  - sram
> +  - amlogic,secbus2
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    remoteproc@1c {
> +      compatible= "amlogic,meson8-ao-arc", "amlogic,meson-mx-ao-arc";
> +      reg = <0x1c 0x8>, <0x38 0x8>;

I'm generally not in favor of mapping "individual" registers, do you
know what hardware block this is part of? Can you express the whole
block as an single entity in your DT?

Regards,
Bjorn

> +      reg-names = "remap", "cpu";
> +      resets = <&media_cpu_reset>;
> +      clocks = <&media_cpu_clock>;
> +      sram = <&ahb_sram_ao_arc>;
> +      amlogic,secbus2 = <&secbus2>;
> +    };
> +
> +...
> -- 
> 2.30.0
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
