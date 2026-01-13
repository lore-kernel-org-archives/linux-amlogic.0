Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C95D29DDD
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jan 2026 23:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bt5mwk1+g4DxEM22p+uHS55z4OTWzBhqv7UEqUDTx0k=; b=mrosoyVYEiMZ+T
	U93b1VrXktXUWm8i+biny1FePM0FQH8X3QPx52wUcgt0ry6EzmwN4spKl3RP6WnMrCTNSFhZ+gPUB
	J/7U47De+C1uRcE1MI5eI8yZfMqgr2fuzA1tFUGdfdypipeFP1bdpRiGagBO2/ajO8rrEsTTt6KY9
	dbP8vtldKepizKbMx/vgDhKSI9IblULB0BQANHqS1e7ItHwCbzE1c40JYafNdedErzXQCRF8fz9A2
	IXTYMdDp5j2W16q2nAUo/HMfSJeh4P/aVLe9V0oB1mVNdemBLNemUD3+pN1pQmfrhURo2uPbQTpp7
	h573vW/WcXipoQr9zxRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfnYo-00000007rRI-3U59;
	Tue, 13 Jan 2026 23:12:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfnYl-00000007rQw-3NNB
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Jan 2026 23:12:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2232A4187A;
	Tue, 13 Jan 2026 23:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD7F5C116C6;
	Tue, 13 Jan 2026 23:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768345943;
	bh=KVvUjtgHP/EnKb5VOEjjBg5TqpHapWWCoF0IBZbv+IU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dIsuq2GykDPHWJFBN+4HvzBChNmyu1hHIMJc8+H4jvYmt6n43+njE75R+vlQRLYNN
	 uZ0BrIy8AWcVEC5/DIaiQkv+R/elVNvDWaalS/dQEeBnPIrqw9GWEVFCxBgIfZTtYI
	 oX+Z9IgWJ4pifJfQrKis+JiKRLmljeUw0wK5m2Y6/3K5UzzuX3RybFsJV0ewR3/8yX
	 2DCnCQvhGukGpnarWWhTu8cjDSS4riMOq0yYx+IEZttsqpSWaPQzfGCjHkrPR3vAGb
	 6vcEduOgLU0zPq1eCNnPwX6d17bIAYW/EItgbEpvZGEDrUjdhCQCH8BCC0G/4mb7aa
	 kWVwXKUYByr7w==
Date: Tue, 13 Jan 2026 17:12:22 -0600
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	conor+dt@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
	andrew+netdev@lunn.ch
Subject: Re: [PATCH net-next v1] dt-bindings: net: Convert icplus-ip101ag to
 yaml format
Message-ID: <20260113231222.GA421230-robh@kernel.org>
References: <20260110235544.1593197-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260110235544.1593197-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_151223_908454_1146C4AC 
X-CRM114-Status: GOOD (  19.60  )
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

On Sun, Jan 11, 2026 at 12:55:44AM +0100, Martin Blumenstingl wrote:
> This allows for better validation of .dts.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/net/icplus,ip101ag.yaml          | 75 +++++++++++++++++++
>  .../bindings/net/icplus-ip101ag.txt           | 19 -----
>  2 files changed, 75 insertions(+), 19 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/icplus,ip101ag.yaml
>  delete mode 100644 Documentation/devicetree/bindings/net/icplus-ip101ag.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/icplus,ip101ag.yaml b/Documentation/devicetree/bindings/net/icplus,ip101ag.yaml
> new file mode 100644
> index 000000000000..f245516103b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/icplus,ip101ag.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/icplus,ip101ag.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: IC Plus Corp. IP101A / IP101G Ethernet PHYs
> +
> +maintainers:
> +  - Andrew Lunn <andrew@lunn.ch>
> +  - Florian Fainelli <f.fainelli@gmail.com>
> +  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> +
> +description: |
> +  Bindings for IC Plus Corp. IP101A / IP101G Ethernet MII/RMII PHYs

Drop 'Bindings for'

> +
> +  There are different models of the IP101G Ethernet PHY:
> +  - IP101GR (32-pin QFN package)
> +  - IP101G (die only, no package)
> +  - IP101GA (48-pin LQFP package)
> +
> +  There are different models of the IP101A Ethernet PHY (which is the
> +  predecessor of the IP101G):
> +  - IP101A (48-pin LQFP package)
> +  - IP101AH (48-pin LQFP package)
> +
> +  All of them share the same PHY ID.
> +
> +allOf:
> +  - $ref: ethernet-phy.yaml#
> +
> +properties:
> +  compatible:
> +    contains:

Drop contains. The list(s) of allowed values should be exact.

> +      enum:
> +        - ethernet-phy-id0243.0c54
> +
> +  icplus,select-rx-error:
> +    type: boolean
> +    description: |
> +      Pin 21 ("RXER/INTR_32") will output the receive error status.
> +      Interrupts are not routed outside the PHY in this mode.
> +
> +      This is only supported for IP101GR (32-pin QFN package).
> +
> +  icplus,select-interrupt:
> +    type: boolean
> +    description: |
> +      Pin 21 ("RXER/INTR_32") will output the interrupt signal.
> +
> +      This is only supported for IP101GR (32-pin QFN package).
> +
> +# RXER and INTR_32 functions are mutually exclusive
> +dependentSchemas:
> +  icplus,select-rx-error:
> +    properties:
> +      icplus,select-interrupt: false
> +  icplus,select-interrupt:
> +    properties:
> +      icplus,select-rx-error: false
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    mdio {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ethphy1: ethernet-phy@1 {
> +                compatible = "ethernet-phy-id0243.0c54";
> +                reg = <1>;
> +                icplus,select-interrupt;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/net/icplus-ip101ag.txt b/Documentation/devicetree/bindings/net/icplus-ip101ag.txt
> deleted file mode 100644
> index a784592bbb15..000000000000
> --- a/Documentation/devicetree/bindings/net/icplus-ip101ag.txt
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -IC Plus Corp. IP101A / IP101G Ethernet PHYs
> -
> -There are different models of the IP101G Ethernet PHY:
> -- IP101GR (32-pin QFN package)
> -- IP101G (die only, no package)
> -- IP101GA (48-pin LQFP package)
> -
> -There are different models of the IP101A Ethernet PHY (which is the
> -predecessor of the IP101G):
> -- IP101A (48-pin LQFP package)
> -- IP101AH (48-pin LQFP package)
> -
> -Optional properties for the IP101GR (32-pin QFN package):
> -
> -- icplus,select-rx-error:
> -  pin 21 ("RXER/INTR_32") will output the receive error status.
> -  interrupts are not routed outside the PHY in this mode.
> -- icplus,select-interrupt:
> -  pin 21 ("RXER/INTR_32") will output the interrupt signal.
> -- 
> 2.52.0
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
