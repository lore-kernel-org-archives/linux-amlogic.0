Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDFCC4829E
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Feb 2024 14:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vc0vzbuFYm1YtFj0Uci8eCMlmWPQxwEW6ow031iXkTw=; b=kbJrL4pf+sqeVo
	hJuLEEipQr9YJlOKyGIjSLfnB6rw+PAQiQG8vJW3/ZEM8G3oLB2PhZJj9OVibV4u9KHoDeO3UwvCM
	dV52uX0pWX36MF/p6BUpesKSSx/PUUsTB3Zv3gcAoc51J2S5r4x4GdC6vo7bFA2Q2a0tXqh3w+kRg
	Bo4hpZg4ouT4qIDU50B2kGcrWcP5U6SwUSonAX8iEyLFPtEXwEwVUcCm3zC3NdZ5rHNAUyLr+iH6V
	eOOizMN6Iq/mbv84BP1SzWju5Pa7T8hpzrPByYa5kGaUkpwAimzRfhGhJjyG84YxumhCIgVhIuKHv
	u7eC5MSoWGAvtuiqoNrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1racjJ-0000000GYPh-0UTm;
	Thu, 15 Feb 2024 14:28:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1racjH-0000000GYPI-0iNj;
	Thu, 15 Feb 2024 14:28:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A131361DC8;
	Thu, 15 Feb 2024 14:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E47C433F1;
	Thu, 15 Feb 2024 14:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708007326;
	bh=Wf73cxr87GHpuYxipFrmEqJpur94FjNtOwVM6tDrmHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OnwrRn4YKZaN4o1RuqeBymMAMru8kHE4Q7Da3aedo1qE+afwhoWtdDqJtOIdPWKgw
	 gQvyrUrqgOnWGPZ8/Qgu959Z3QHSL8emHdN4LSum5F2q+AOImwwJWUtxDRwS/V6NFt
	 IOIjYalS6OCk1hpZ9ib+aTK9CXfLC7i9svg2cimI9AZ5Gn9rA5fOZtr0PsWyDtAb9e
	 UP6WsTWcu0klLjyEGsrTOgn4OZeKLWmwxP0PEvgDQra4BCCDFE9lbdwG8ex0YOlxoi
	 FGFl2LjoTrW3gTrV2auku35SWYgHg/5nMzk9odSNesFJDa+gvBenTcg0Pwvd5a6wi6
	 rr5Vo/HIhkmvw==
Date: Thu, 15 Feb 2024 08:28:36 -0600
From: Rob Herring <robh@kernel.org>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: neil.armstrong@linaro.org, clabbe@baylibre.com,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, vadim.fedorenko@linux.dev,
	linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com
Subject: Re: [PATCH v4 16/20] dt-bindings: crypto: meson: support new SoC's
Message-ID: <20240215142836.GA1186-robh@kernel.org>
References: <20240212135108.549755-1-avromanov@salutedevices.com>
 <20240212135108.549755-17-avromanov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240212135108.549755-17-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_062847_272277_CDC95F64 
X-CRM114-Status: GOOD (  15.74  )
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

On Mon, Feb 12, 2024 at 04:51:04PM +0300, Alexey Romanov wrote:
> Now crypto module available at G12A/G12B/S4/A1/SM1/AXG.
> 
> 1. Add new compatibles:
>   - amlogic,g12a-crypto
>   - amlogic,s4-crypto (uses g12a-crypto as fallback)
>   - amlogic,a1-crypto (uses g12a-crypto as fallback)
>   - amlogic,axg-crypto
> 
> 2. All SoC's, exclude GXL, doesn't take a clock input for
> Crypto IP. Make it required only for amlogic,gxl-crypto.
> 
> 3. All SoC's, exclude GXL, uses only one interrupt flow
> for Crypto IP.
> 
> 4. Add power-domains in schema.
> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>  .../bindings/crypto/amlogic,gxl-crypto.yaml   | 43 ++++++++++++++++---
>  1 file changed, 36 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> index 948e11ebe4ee..41f0153d58c8 100644
> --- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> +++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> @@ -11,20 +11,30 @@ maintainers:
>  
>  properties:
>    compatible:
> -    items:
> -      - const: amlogic,gxl-crypto
> +    oneOf:
> +      - items:
> +          - enum:
> +              - amlogic,a1-crypto
> +              - amlogic,s4-crypto
> +          - const: amlogic,g12a-crypto
> +      - enum:
> +          - amlogic,gxl-crypto
> +          - amlogic,axg-crypto
> +          - amlogic,g12a-crypto
>  
>    reg:
>      maxItems: 1
>  
>    interrupts:
> -    items:
> -      - description: Interrupt for flow 0
> -      - description: Interrupt for flow 1
> +    minItems: 1
> +    maxItems: 2

Just keep the descrptions here and add 'minItems: 1'. Then in the 
if/then schema, you only need minItems and maxItems to require 1 or 2 
interrupts.

>  
>    clocks:
>      maxItems: 1
>  
> +  power-domains:
> +    maxItems: 1
> +
>    clock-names:
>      const: blkmv
>  
> @@ -32,8 +42,27 @@ required:
>    - compatible
>    - reg
>    - interrupts
> -  - clocks
> -  - clock-names

New chips work without clocks? Cool!

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
