Return-Path: <SRS0=GiEQ=LK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08FE1C48BE6
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jun 2021 23:31:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAB8661245
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jun 2021 23:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAB8661245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9lIOUMXUvxiDl3WJfdodE2CF68oYXcag9KSbGDPtlU=; b=Ilk8ILMRykbfNX
	a9mHmMAY7h5Tw90n1wyl9BeISgvZDyr12PVTfqSwEryat4uTZqUyeEJRFVrxZ1DRR70EzXLYOrT6E
	wDt7NYOX9aiKiN9NgbuBoBMO7RW7VaP7t4agoXSgjUgc9RW/5S3APMykyYw5kCBLlxRGenp25ZcD1
	ocC+Da2cGZPgIWa7cY9k9sU7he94hu0WaQRU6RbyaUrbpOtwMYUpF/gyPIdkZ9t5TJNAQKHdxntCa
	EyVgMJ9SiOdCTGG8Waq7tKyL9Bt/tZ0JrB8+GL6ldB0JTEAB3fz4zpplxyO2Qmw4TVjbJgwMhUGRX
	/xi2/TpMkTKrvzr6PHEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltf07-0089zH-R5; Wed, 16 Jun 2021 23:31:15 +0000
Received: from mail-io1-f50.google.com ([209.85.166.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltf05-0089yA-3h; Wed, 16 Jun 2021 23:31:14 +0000
Received: by mail-io1-f50.google.com with SMTP id k16so1031223ios.10;
 Wed, 16 Jun 2021 16:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xYjPOVFrGcuwzYtCkpC3/ADNpp9HDl4uS6+qpD2/Jyw=;
 b=XTirVzKIGCFWf+WumCNWD72yxAnBMhXX6jjx2ILclWKCsm22hdppUBtiEDfll30+iV
 Iz018kzvbd6IaaZEM8p3RS4QSrhau680JD3COpBEgrNVc/Voya1ULYwnwjPTxXR1Ihwg
 zOYACujuGeuPogW9K71MOsXwfLps6ElXyjgBvqwW5XWyXP1i16oXUTYFS//537qxnnyh
 nDjgfYGsaReGkJfF81F0smB+8a/OhzluZu277X/ZfPKORYUxvxMQpeL6Kz5mmS75+btQ
 XmDy9BYEw7E6dnJfW3/HKmglxTr0RXJC5UyKE7xX15d71WGBVrpjOhf+q4YssYQ1zYXw
 0/Kw==
X-Gm-Message-State: AOAM532skP3ajU6TT+vmLgoITvsiXbx9iFzcZP3Z43ufaI2JLOHv6pv8
 40ImqYb3j4zZMvhE/N+rEw==
X-Google-Smtp-Source: ABdhPJyyUtjrWdXCPRwIyDSdK8eyilrcAdS/kqWlBnMmR3Kq3QNqwcTLrFso8p3R0dLnOz85MLm7Iw==
X-Received: by 2002:a05:6638:3298:: with SMTP id
 f24mr1587297jav.25.1623886272107; 
 Wed, 16 Jun 2021 16:31:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id p19sm1953479iob.7.2021.06.16.16.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 16:31:11 -0700 (PDT)
Received: (nullmailer pid 288247 invoked by uid 1000);
 Wed, 16 Jun 2021 23:31:09 -0000
Date: Wed, 16 Jun 2021 17:31:09 -0600
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, kishon@ti.com, vkoul@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add the Amlogic Meson8 HDMI TX PHY
 bindings
Message-ID: <20210616233109.GA285667@robh.at.kernel.org>
References: <20210604190338.2248295-1-martin.blumenstingl@googlemail.com>
 <20210604190338.2248295-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604190338.2248295-2-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_163113_200274_98E836E8 
X-CRM114-Status: GOOD (  18.13  )
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

On Fri, Jun 04, 2021 at 09:03:37PM +0200, Martin Blumenstingl wrote:
> Amlogic Meson8, Meson8b and Meson8m2 all include an identical (or at
> least very similar) HDMI TX PHY. The PHY registers are part of the HHI
> register area.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../phy/amlogic,meson8-hdmi-tx-phy.yaml       | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson8-hdmi-tx-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson8-hdmi-tx-phy.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson8-hdmi-tx-phy.yaml
> new file mode 100644
> index 000000000000..18a123b9bb0a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/amlogic,meson8-hdmi-tx-phy.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/amlogic,meson8-hdmi-tx-phy.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson8, Meson8b and Meson8m2 HDMI TX PHY
> +
> +maintainers:
> +  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> +
> +description: |+
> +  The HDMI TX PHY node should be the child of a syscon node with the
> +  required property:
> +
> +  compatible = "amlogic,meson-hhi-sysctrl", "simple-mfd", "syscon"

Is there a sub range of registers for this functionality in 
"amlogic,meson-hhi-sysctrl"? If so, please add a 'reg' property.

> +
> +  Refer to the bindings described in
> +  Documentation/devicetree/bindings/mfd/syscon.yaml
> +
> +properties:
> +  $nodename:
> +    pattern: "^hdmi-phy$"
> +
> +  compatible:
> +    enum:
> +      - amlogic,meson8-hdmi-tx-phy
> +      - amlogic,meson8b-hdmi-tx-phy
> +      - amlogic,meson8m2-hdmi-tx-phy
> +
> +  clocks:
> +    minItems: 1
> +    description:
> +      HDMI TMDS clock
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hdmi_tx_phy: hdmi-phy {
> +      compatible = "amlogic,meson8-hdmi-tx-phy";
> +      clocks = <&tmds_clock>;
> +      #phy-cells = <0>;
> +    };
> -- 
> 2.31.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
