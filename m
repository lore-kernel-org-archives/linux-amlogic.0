Return-Path: <SRS0=6csC=YU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8121ECA9EAF
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Oct 2019 10:13:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52A0020717
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Oct 2019 10:13:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mPFl7jJ2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXSrnSic"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52A0020717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HvHNVVI5aqIAbEYDo8np8/5iLeHTx6U1ubg6tDR3pLI=; b=mPFl7jJ29noVVU
	3v8X8FuIIj92jubDFulxQBXcEQwgqe6mdUe5MQi57IxRuB5LQ8n+y8raHz06oFCLtIoEoTYSAdP+k
	qn2Ou4i5D5L2+NMFMBvWi0LYeCA20VupkG/i/yDbC1QwvGuZsfgeS8AWEYTspF1V3Da6EanUqaMTD
	V9QtxVWHDcVRDhkcw8AnqaQlpFDPgH+RvbT8oh0wlzr6t1pZ8EMEkWsyMYXRkLBxnptVMKaOfDPtr
	0xOaQy5ZEDq8tZc1y0FBUQsYy8phRdTuOi9qUvy+92crMEkHxUhKi1qFW8PkyWTvl/TzTX9cat8eT
	JufQ1OWRq3cmBSCfIP6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iOfYK-0000BI-AX; Sun, 27 Oct 2019 10:13:40 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOfYH-0000At-0g; Sun, 27 Oct 2019 10:13:38 +0000
Received: by mail-wr1-x442.google.com with SMTP id c2so6837858wrr.10;
 Sun, 27 Oct 2019 03:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3IpxudYqh0cSrXHsSd20R7gPXReXwAlu/vXTGneJYeA=;
 b=hXSrnSicmffaawvfQsBwMScW37guK9vJsdCcRiACwyis734sAiZI/nTCvDoOIDsET7
 TxtFjanFZ02nUA7cHDwWPIFp3Wx9wPk9pHfz4krCdEpKEoPX88wY3FMAVOWGpc/OX7B7
 Bh1E0NNOMzTeVp4Ue0NCazljr31u3LzQ5gMLo8SsI4wQzZaKYBiglONEya/fahW+Ur24
 LYh1aPSCIPEnF5yPeMBKq7cfSMD04Tn75BpyUpRxCuL7HuhYqTCa0qEi32R38iOoOK4r
 CEYbDUa53uUuTladP7ghiETvoYMGUus48sJzOtcbbKyTm+HJp9KLFhdzkdxw26oeLZoq
 lZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3IpxudYqh0cSrXHsSd20R7gPXReXwAlu/vXTGneJYeA=;
 b=frDmxrBRwwHooSDH3w8owcc4SD088UEir5jJ60kjxKb4SAXiQVwMYe/eC+pgvZtuD3
 rMvY2mpeufEErQ7eJz3x3CLZHhT63DRz/dHfwLFZI4Te4GgJcltmyJ3G60QfQX2sgHJ5
 giN0ZraorOx1jKawm++XSwkqn/TVrhzLVOR3bCk2Gm5Mdkxi0eppmfrbDVE+Uux2clxP
 d3Qh+2IkriHSRuMM98FCgFyvQ6D5Y8HNLE3DXkCCRMRcKrQFHfnI7GGJCzcDRU3oaNni
 VgAPB2DJz7LjwbhRZ5pHbG0YvPwk6VJ6l2DwF8njAQnhpvoSU9MJ+tFa/Vs2O+JJ2ijI
 K1jQ==
X-Gm-Message-State: APjAAAURlouZ66a0PRZWDmMG33g9BE2K9nZz0WzHS2/H0SMtEgHKHMZk
 4jwSQBTsj5a0MOn6eaaRDDVU34FRyPg=
X-Google-Smtp-Source: APXvYqw1cxLvV4/3XED3x2mClTOpoL5pylt99SzhNdORtAzzBZRNtAnqcjg/6X+pCOpQ4725HtypWQ==
X-Received: by 2002:a5d:4589:: with SMTP id p9mr10044913wrq.397.1572171214637; 
 Sun, 27 Oct 2019 03:13:34 -0700 (PDT)
Received: from gmail.com (host159-41-dynamic.116-80-r.retail.telecomitalia.it.
 [80.116.41.159])
 by smtp.gmail.com with ESMTPSA id d199sm8235130wmd.35.2019.10.27.03.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2019 03:13:33 -0700 (PDT)
Date: Sun, 27 Oct 2019 11:12:45 +0100
From: Beniamino Galvani <b.galvani@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] dt-bindings: i2c: meson: convert to yaml
Message-ID: <20191027101245.GA2194@gmail.com>
References: <20191021140053.9525-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191021140053.9525-1-narmstrong@baylibre.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191027_031337_082675_F0793940 
X-CRM114-Status: GOOD (  18.71  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Oct 21, 2019 at 04:00:53PM +0200, Neil Armstrong wrote:
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic I2C Controller over to YAML schemas.

Acked-by: Beniamino Galvani <b.galvani@gmail.com>


> Cc: Beniamino Galvani <b.galvani@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/i2c/amlogic,meson6-i2c.yaml      | 53 +++++++++++++++++++
>  .../devicetree/bindings/i2c/i2c-meson.txt     | 30 -----------
>  2 files changed, 53 insertions(+), 30 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-meson.txt
> 
> diff --git a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
> new file mode 100644
> index 000000000000..49cad273c8e5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/i2c/amlogic,meson6-i2c.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson I2C Controller
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +  - Beniamino Galvani <b.galvani@gmail.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson6-i2c # Meson6, Meson8 and compatible SoCs
> +      - amlogic,meson-gxbb-i2c # GXBB and compatible SoCs
> +      - amlogic,meson-axg-i2c # AXG and compatible SoCs
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +examples:
> +  - |
> +    i2c@c8100500 {
> +        compatible = "amlogic,meson6-i2c";
> +        reg = <0xc8100500 0x20>;
> +        interrupts = <92>;
> +        clocks = <&clk81>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        eeprom@52 {
> +            compatible = "atmel,24c32";
> +            reg = <0x52>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-meson.txt b/Documentation/devicetree/bindings/i2c/i2c-meson.txt
> deleted file mode 100644
> index 13d410de077c..000000000000
> --- a/Documentation/devicetree/bindings/i2c/i2c-meson.txt
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -Amlogic Meson I2C controller
> -
> -Required properties:
> - - compatible: must be:
> -	"amlogic,meson6-i2c" for Meson8 and compatible SoCs
> -	"amlogic,meson-gxbb-i2c" for GXBB and compatible SoCs
> -	"amlogic,meson-axg-i2c"for AXG and compatible SoCs
> -
> - - reg: physical address and length of the device registers
> - - interrupts: a single interrupt specifier
> - - clocks: clock for the device
> - - #address-cells: should be <1>
> - - #size-cells: should be <0>
> -
> -For details regarding the following core I2C bindings see also i2c.txt.
> -
> -Optional properties:
> -- clock-frequency: the desired I2C bus clock frequency in Hz; in
> -  absence of this property the default value is used (100 kHz).
> -
> -Examples:
> -
> -	i2c@c8100500 {
> -		compatible = "amlogic,meson6-i2c";
> -		reg = <0xc8100500 0x20>;
> -		interrupts = <0 92 1>;
> -		clocks = <&clk81>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -	};
> -- 
> 2.22.0
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
