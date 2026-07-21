Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2713CC4451C
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2026 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2xqlzELZ+lKFv3Kn7oxAtbIEeixDoXfKYz590Tl+ySY=; b=0utXxzqhD8SjcV
	MyJOjbvsARTXzFazonUYWLHfnjxXLYx552kN+wT3Lkmzv4uH2IrcazOkJtNe7vEfYy95o+/XNr7d4
	gXgQIG1TTf5AKs6PooQFedj56nOgpxlVWTcTm97+95ImIosPUsUo5bEX7IT37T+4cmB+Hsy9GipLV
	99gg/asqI1ufZD/yE7hTCyZf9xk7opJidzT8Va/rIp5T4qG3tVCAifiZ4Yum2BlCIJ5wIqvdHPhmi
	cUMpEv9DePDJuXw/ybL77MppQLc9yQFHEMFCf/rPVpqsArzOHht78o6x0QlywOXiPhaeMSW4m1a2Z
	1q6wWhSQv6mxCss+Go0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7YH-000000095rn-3rLj;
	Tue, 21 Jul 2026 10:18:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7YG-000000095rO-2ffp
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Jul 2026 10:18:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0524A60A95;
	Tue, 21 Jul 2026 10:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2351F00A3A;
	Tue, 21 Jul 2026 10:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784629095;
	bh=r5RopncFPg5QRigLJNMgc9wUVIR6ORq/KvFLSj474Mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M9HJc6UK0ovXEHl6kBjrN7Imtv7NCZKFRoaFp4VcHjxMMizJneVvSjy1z5L4yp1oN
	 xshdlOIXuKbSw3fRJAHEnZ+wngaxxYlAtnsukGx7Zn97Edo0x4tPQzYEJlRqAy6tBy
	 vR4WUKhKFTghsUOtovyPUqVA+KpecjauoSZ73cIvAGeXTM3hEQP0QTvkGT+sfXh1EW
	 oGc20ZFIpZvqZv8X5fsBTujormRpvMfTtYu+bV33MsuF9XWhagJ4Ak0O504H7MvQ1a
	 d0CbtlZIDsNGt+PASALZKgNntwYOceB045vlYyR+9Irf4EPqm8JNN6ueOpLfa9Ko1O
	 DC5s0D79v1nvw==
Date: Tue, 21 Jul 2026 12:18:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] spi: dt-bindings: amlogic: spisg: Document
 A9-specific properties
Message-ID: <20260721-determined-melodic-boa-c379fb@quoll>
References: <20260717-a9-spisg-v1-0-2eeea77be19f@amlogic.com>
 <20260717-a9-spisg-v1-1-2eeea77be19f@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260717-a9-spisg-v1-1-2eeea77be19f@amlogic.com>
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

On Fri, Jul 17, 2026 at 07:49:33AM +0000, Xianwei Zhao wrote:
> Document the Amlogic A9 SPISG controller and its additional
> Device Tree properties.
> 
> Add the "amlogic,a9-spisg" compatible string and define the
> A9-specific "amlogic,mo-idle-output" and "amlogic,word-gap"
> properties, which configure the MOSI idle output level and
> the inter-word gap, respectively.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../devicetree/bindings/spi/amlogic,a4-spisg.yaml  | 36 +++++++++++++++++++---
>  1 file changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml b/Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml
> index 9bfb8089f7ea..7efdc748d566 100644
> --- a/Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml
> +++ b/Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml
> @@ -11,12 +11,11 @@ maintainers:
>    - Xianwei Zhao <xianwei.zhao@amlogic.com>
>    - Sunny Luo <sunny.luo@amlogic.com>
>  
> -allOf:
> -  - $ref: spi-controller.yaml#
> -
>  properties:
>    compatible:
> -    const: amlogic,a4-spisg
> +    enum:
> +      - amlogic,a4-spisg
> +      - amlogic,a9-spisg
>  
>    reg:
>      maxItems: 1
> @@ -42,6 +41,35 @@ required:
>    - clocks
>    - clock-names
>  
> +allOf:
> +  - $ref: spi-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,a9-spisg
> +    then:
> +      properties:

Properties MUST be defined in top-level. You only restrict them here.
See writing-schema and example-schema.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
