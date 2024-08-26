Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FB4C5472C
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2024 13:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e7htIh7UYVw6C+yuY7kQr6SqeXB/tKLFj6BnGH0gAt4=; b=IWUJkNe9YxdmVo
	Dz22tJQw2iyKbNAs5IH+8Oqh2nMoCc4wmEQoznxVftCWu3oqTIsBy/Rkglf/33+WWM16mEKGc3Qyd
	Yxd+kvBr8KtG2e3N695rKNOH9ahBamtGoxXe6ksGTNdZDAIbNocyiboSZq5x2xIdSYIgVXNH6doAX
	1SX5olrrnyBh62jqGBrGzt2hXNPhryqCGZ9Lm69OTtk5SNKYDt8Mmo/9hePSyD9cgI4wDp6lbKNdj
	q1bP+bkZojkPVk5HxHZjIW2thB6eke256wsL83aiEF7IMeNcmOco8NK2JLmxA+eOw57SGfcAwPEUY
	2fCtv7fG9hEsF4YVdNjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sia98-00000007YuO-0KpW;
	Mon, 26 Aug 2024 13:52:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sia94-00000007YsL-26rW;
	Mon, 26 Aug 2024 13:52:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 59FBFCE0E70;
	Mon, 26 Aug 2024 13:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35F3C52FC0;
	Mon, 26 Aug 2024 13:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724680350;
	bh=Ih2aZy7VK+1vLk929aZ2HrdxEuygnHrgNQUcO7Z4NJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mnF1digAxnCngL9LOjd3YG47mqco03wSu3Rda6ewvhEB2kBiqA7Wl1xSO2TxDQsAa
	 VhHRaztUJAEQYSdkscisW7+ABuMKMe3KlePokEddD1+HCrdkQ0xXmGdzFEr3Y93SeO
	 rJXi1IVbXVPhVW2qN3k97HVHkK5+5HaHV5+Pii+qPP6VmNbdVgtfkColVlwSzG4DJ7
	 BRmRWYFn16OkyvgiOeImC6L0d5vE3Dib/aoCkQiEUa5HkG1EhKezEws1IoRne5i5Ow
	 8NtxXRB2G34ErFIp8GsyvAqLo3Fk9hTFahRD9d5zvPb/UAXFM2uaY8Y8ZYhby/yCRz
	 aeyrcVStCpj/A==
Date: Mon, 26 Aug 2024 08:52:28 -0500
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
Subject: Re: [PATCH v9 18/23] dt-bindings: crypto: meson: support new SoC's
Message-ID: <20240826135228.GA61588-robh@kernel.org>
References: <20240820145623.3500864-1-avromanov@salutedevices.com>
 <20240820145623.3500864-19-avromanov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240820145623.3500864-19-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_065234_768967_E14B0298 
X-CRM114-Status: GOOD (  16.85  )
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

On Tue, Aug 20, 2024 at 05:56:18PM +0300, Alexey Romanov wrote:
> Now crypto module available at G12A/G12B/S4/A1/SM1/AXG.
> 
> 1. Add new compatibles:
>   - amlogic,g12a-crypto
>   - amlogic,axg-crypto
>   - amlogic,a1-crypto
>   - amlogic,s4-crypto (uses a1-crypto as fallback)
> 
> Difference between this compatibles:
>  * Different registers offset and the number of setup descriptors.
>  * GXL doesn't support hashing like the others.
>  * G12A/B and A1/S4 crypto HW don't support 192 AES key.
>  * GXL, G12A/B and AXG require a reverse IV key before processing.
> 
> 2. Add power-domains in schema, which is required only for A1.
> This is specific vendor design: in old SoC's power domain for
> crypto HW was not configurable, but in A1-series it is configurable.

You added this in the previous patch. So I withdraw my Reviewed-by.

> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>  .../bindings/crypto/amlogic,gxl-crypto.yaml   | 21 +++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> index 7300328de1d5..106a9d1fed69 100644
> --- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> +++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> @@ -11,8 +11,16 @@ maintainers:
>  
>  properties:
>    compatible:
> -    items:
> -      - const: amlogic,gxl-crypto
> +    oneOf:
> +      - items:
> +          - enum:
> +              - amlogic,s4-crypto
> +          - const: amlogic,a1-crypto
> +      - enum:
> +          - amlogic,gxl-crypto
> +          - amlogic,axg-crypto
> +          - amlogic,g12a-crypto
> +          - amlogic,a1-crypto
>  
>    reg:
>      maxItems: 1
> @@ -33,6 +41,15 @@ required:
>    - interrupts
>    - clocks
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: amlogic,a1-crypto
> +    then:
> +      required:
> +        - power-domains
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.34.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
