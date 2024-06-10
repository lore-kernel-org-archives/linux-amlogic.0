Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1ECC27C55
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2024 22:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ufPLpNfrNP+ooCXXSZL4b3gybgaFrdsRAu/m0mOmSH8=; b=Daz/tXDw90NCNq
	AhU57vSLQmzvhx28OUY93PzGR1sUZY6K9JcJMGHcYi7ooQYyOzVmaGCHjc4qjvxwYqNyGA6JII2oA
	LjKtCaJhY5TStwcHIkLrZ+gkI4Mf1ZalXVqtonfBcLQxruk18Z3wEihGgN4x83l9CR0WVEWUdzOVB
	VtAAYEpwwLb3HV68O9Sk1XfYDuTzqu+HMUQp01IRh5Zsjoh4l0SzKYL51EUqIKh/LSd4EIDLhcdao
	aNdL5Bom7U2Mv47XVHS2QWMe/fr/SXdjNOxDpsBhleys2QY0kRbL+06Dxfz3HPNs7dV1q8DPgdwzE
	6+Fc5Bywu6tTfV/VEjXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGnVC-00000006g6C-28fl;
	Mon, 10 Jun 2024 22:28:34 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGnV8-00000006g43-3fAi;
	Mon, 10 Jun 2024 22:28:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 26C31CE18CE;
	Mon, 10 Jun 2024 22:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E78C2BBFC;
	Mon, 10 Jun 2024 22:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718058508;
	bh=jGyCsYSq/UxDN4mBtbNa7oTMO5CREgU3nQw/d+1YT7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f46QHQYaT8efpXnW7g3klN5PIH6ovp9Gh+9wrYe1BexiGVnwrIOFdjS3q10YVryGa
	 INfl/LYTVO8mKs1o2AalrkDD0a51pEGI5cQKwT+RfK+mAL1YLG9ajFTFXvqBTmuuAn
	 aAxielqwOTuHkAd9jFowHSpVFTTklmAA1ZR0gXo0iEo7OYAZtF1vIFaRB2Qc0TpcPe
	 IFR09v8sZ7brPKgybBxuFi6Qy1QttxCtUUa95kU1Thw3dw7gz0t1hhBFxJOt/JT3g3
	 18xYi4QMbladdyrqTi7lKzHiW3cfltIEc6DnT+zC4FZp/8CHdDghQMRr4/aKh4+zNo
	 GWYyS1wiK4pIQ==
Date: Mon, 10 Jun 2024 16:28:27 -0600
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
Subject: Re: [PATCH v8 17/23] dt-bindings: crypto: meson: correct clk and
 remove second interrupt line
Message-ID: <20240610222827.GA3166929-robh@kernel.org>
References: <20240607141242.2616580-1-avromanov@salutedevices.com>
 <20240607141242.2616580-18-avromanov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240607141242.2616580-18-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_152831_283533_723C066D 
X-CRM114-Status: GOOD (  19.35  )
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

On Fri, Jun 07, 2024 at 05:12:36PM +0300, Alexey Romanov wrote:
> GXL and newer SoC's uses the DMA engine (not blkmv) for crypto HW.
> Crypto HW doesn't actually use the blkmv clk. At RTL level, crypto
> engine is hard weired to a clk81 (CLKID_CLK81).

typo.

> 
> Also, GXL crypto IP isn't to seconnd interrput line. So we must

2 more typos. Spell checkers exist. Use them instead of me please.

I think you forgot the word 'connected' too.

> remove it from dt-bindings.


So did this binding not work at all? Are there any users? You need a bit 
more justification for an ABI breaking change.

> 
> Fixes: 7f7d115dfb51 ("dt-bindings: crypto: Add DT bindings
> documentation for amlogic-crypto")

This line should not be wrapped.
> 

Drop the blank line.

> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>  .../bindings/crypto/amlogic,gxl-crypto.yaml          | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> index 948e11ebe4ee..aff6f3234dc9 100644
> --- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> +++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> @@ -20,13 +20,15 @@ properties:
>    interrupts:
>      items:
>        - description: Interrupt for flow 0
> -      - description: Interrupt for flow 1
>  
>    clocks:
>      maxItems: 1
>  
>    clock-names:
> -    const: blkmv
> +    const: clk81

Clocks are supposed be named local to the block like what function or 
part of the block they clock. This sounds like something global. 

With only 1 clock, I'd just drop the name altogether.

> +
> +  power-domains:
> +    maxItems: 1
>  
>  required:
>    - compatible
> @@ -46,7 +48,7 @@ examples:
>      crypto: crypto-engine@c883e000 {
>          compatible = "amlogic,gxl-crypto";
>          reg = <0xc883e000 0x36>;
> -        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>, <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
> -        clocks = <&clkc CLKID_BLKMV>;
> -        clock-names = "blkmv";
> +        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
> +        clocks = <&clkc CLKID_CLK81>;
> +        clock-names = "clk81";
>      };
> -- 
> 2.34.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
