Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628ACC27C4F
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2024 22:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X+jFnK1uf3itXAItuBepjJGiZEBWH5ZQaU0rKonqD9Y=; b=YlUnKCayaoRaB5
	NWzo5N4blmVbjt6pv6B3pKopsq2+r9u2iQw7eBu5ICUD/MZhz+A9dNNT7oDMfO0nSvtu110oeqBzM
	FtjUvjvr7gJh4qU7Rx6+D4zAyPhJalmAFDyOHHEMSfqpmL06BE40tMB/GV5Dg25Ttk7YDPvLqqkXV
	Bs9+Osa4kngwiOaW7hzp7giPJNsFcngsvY+T/bTojxVBl/ZldI0iF/M6zWrzi/9viW4swnHqk+oxo
	waRyu8sVuFsiEVycIOiHh8FTioQnpzscpUGJhuIARSgJpn77mhdXJeZEGMGDjbU2TWl7jmxY942Kl
	l5+3HVU+7AVFITsT/ZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGnYy-00000006gaP-3omP;
	Mon, 10 Jun 2024 22:32:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGnYs-00000006gZh-1wqW;
	Mon, 10 Jun 2024 22:32:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 81B9360C23;
	Mon, 10 Jun 2024 22:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02078C2BBFC;
	Mon, 10 Jun 2024 22:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718058741;
	bh=Wt7Pzfxyq20AcjEBu7nZDSRzfK6ptsm4tLFP5cYJIwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ED7MjdO6mPoaUcOm0MdqhRVSsw69DhTqKOcRTILKsXVHrEkXBEWQ+U4yGFo2svjS4
	 sNAvyU5s9tLXo9MkPr0L7WtTTR+45vq1K+AYi+mpR5I/TwIvJtjOZkz4sVi+xXSi0g
	 rHsIR10ApGF8g06ltOZQXetW9h7x37Q+V98PH71MNd/OsRuzVoLyxywJiYxZ0iOhfo
	 DTO84t5m7HhoAUkVUwWFnMkG53JwpbCWaFQ0Pjous7qt5aHx9K/gOdY8tF8n1GbA4P
	 L/4rUodyejQaRE6u8Mo1AVEKyWMf5QnMnvbbsk/7gj4wNdjuWIo4MW8yaRkIxKh8Rr
	 I8QSfzzS+OlPg==
Date: Mon, 10 Jun 2024 16:32:19 -0600
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
Subject: Re: [PATCH v8 19/23] dt-bindings: crypto: meson: support new SoC's
Message-ID: <20240610223219.GA3175091-robh@kernel.org>
References: <20240607141242.2616580-1-avromanov@salutedevices.com>
 <20240607141242.2616580-20-avromanov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240607141242.2616580-20-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_153222_599291_9BE4772E 
X-CRM114-Status: GOOD (  16.41  )
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

On Fri, Jun 07, 2024 at 05:12:38PM +0300, Alexey Romanov wrote:
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

You added it in the prior patch, was that supposed to be done here? Kind 
of strange for h/w to optionally have a power-domain... It either has 
one or it doesn't. OTOH, making required is an ABI break.

> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>  .../bindings/crypto/amlogic,gxl-crypto.yaml   | 21 +++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> index aff6f3234dc9..a8344de71b4a 100644
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
> @@ -37,6 +45,15 @@ required:
>    - clocks
>    - clock-names
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
