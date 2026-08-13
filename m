Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76495C5CFDB
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Aug 2026 08:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HukqWie9sVVa+yXxFBBUe7HAQFtNQtYhenjDR1igwLQ=; b=0kMOyJON10G9AN
	A/vSyiZERCc2aDVo0YkYyDb//HGDHig6co2OYpsHVud8P1UTFk119pG/SfxEYTkEEqkjACcyI3But
	S58H/EyKPfSmw42OfOjx/WYvZ/w8rRv2cG+gBsHpwsFTTfJh9HhANGeRq4yNKRnUMagDyETjj5PHG
	Ofzq1ysccxXsdP8UpxEwWyh5DyJOlsjnn27ijm4Uvbpof4ETDs7WPR2B8PpTFpfSrtng6WqN6esT0
	96Xzal3Je695xoD703HYRfHIqJogzbGQnQ9YlDd+NRBI474eBGhh5OstyKC3qo7K8LdtIp4zy28Gh
	NG0SgeAFzTp0a+JGA2FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQna-000000008SB-3AUW;
	Thu, 13 Aug 2026 08:28:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQnZ-000000008S4-2CCk
	for linux-amlogic@lists.infradead.org;
	Thu, 13 Aug 2026 08:28:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CBD32600AF;
	Thu, 13 Aug 2026 08:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C921F000E9;
	Thu, 13 Aug 2026 08:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786609704;
	bh=DrCppzolJDbBGIHmFRLxn1uZx4F/MBvG12Nh0mtaG60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IajlGgYQjxra7W4hfzoJNu+BNaUAhnLcNO2HkVMOZXk90QPBw6EiBMGmJHwpwRozR
	 Qe7KJ5NJ0YqYdeQowxb1IWsOJZ/vhKJ8obkWVH0UdyD5/X1cSyF0FGfzfHFUDupR4B
	 rU8ZyGxFbPXo2m35TlASGS9+0OEzaSIn5Rmmp8yMwiE2n7D7G4acUCLiWd7TygkpL2
	 XnHKjDFES1rTI1mOQIZodldz7plUuTl+1uykPr0ZLpUURa+FvJoX9u9ClIh56FpEgh
	 hTkp0HDmYvOPtbVtgljVTtUXtTKDb4DKRZxCJ+U1zbDkglC6246gtLcnchGVXdku7p
	 iPAPSinKCXp+g==
Date: Thu, 13 Aug 2026 10:28:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: thermal: amlogic: Add A9 thermal
 bindings
Message-ID: <20260813-international-optimal-limpet-dfb06e@quoll>
References: <20260811-a9-thermal-v2-0-7ddc33b11b9a@amlogic.com>
 <20260811-a9-thermal-v2-1-7ddc33b11b9a@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260811-a9-thermal-v2-1-7ddc33b11b9a@amlogic.com>
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

On Tue, Aug 11, 2026 at 08:37:43AM +0000, Xianwei Zhao wrote:
> Document the thermal controller compatibles for the Amlogic A9 SoC.
> 
> Describe the required "core" and "plck" clocks, add the optional
> "amlogic,hw-reset-temp" property, and update the schema constraints for
> A9-specific thermal controllers.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../bindings/thermal/amlogic,thermal.yaml          | 28 +++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> index 8cfa44dcda58..f73ee66bcc47 100644
> --- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> @@ -23,6 +23,7 @@ properties:
>            - const: amlogic,g12a-thermal
>        - enum:
>            - amlogic,a1-cpu-thermal
> +          - amlogic,a9-thermal
>            - amlogic,t7-thermal
>  
>    reg:
> @@ -32,7 +33,13 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: pclk
>  
>    power-domains:
>      maxItems: 1
> @@ -52,6 +59,10 @@ properties:
>            - description: phandle to the secure monitor
>            - description: sensor index to get specific calibration data
>  
> +  amlogic,hw-reset-temp:
> +    description: The hardware-controlled reset temperature value.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Thermal zones define that, not custom properties.

> +
>  required:
>    - compatible
>    - reg
> @@ -73,6 +84,21 @@ allOf:
>        required:
>          - amlogic,secure-monitor
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,a9-thermal

Why is one clock valid as well for the new device?

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
