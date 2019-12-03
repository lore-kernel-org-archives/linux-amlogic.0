Return-Path: <SRS0=15i7=ZZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE41C432C3
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Dec 2019 23:21:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DCDA20684
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Dec 2019 23:21:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tfm2WIr+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DCDA20684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W3Cdzvv704obERv9GcrHNORaP8krSTSTteUIYcQgzvo=; b=tfm2WIr+K6KZXR
	SmdncE7B/iG4zCOKNSc7avT6wswx/VdtQuP7kgasxwFuI/3bmc/Htda/k4H7gMe07jMPWRWfBsKmr
	Gldflf85Lra3Ai1s5SDXrd2pGV5H98oTj94/fPkJmIoQk63nZu2ih7GFibq0jbYpTfkTT1zTBv25T
	KA0UAX8ZEcKahxPzE3l0E7C5IA7Y+KcBn6ld4h5dkL9MIJhT7PYg9yMKE+wpv2gJSKGPDjKawwQeO
	JbjTTJZx3k+qfrzrNRbc4Bbzf7SF6jASp64yB1BYaUeztLxm4BNb5IB8/Phj45qKR8nO53kHqNlAR
	wUVINq6zWfHJbHUoA9iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icHTl-0005O9-US; Tue, 03 Dec 2019 23:21:13 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icHTj-0005NU-Bq; Tue, 03 Dec 2019 23:21:12 +0000
Received: by mail-oi1-f194.google.com with SMTP id t25so2799469oij.10;
 Tue, 03 Dec 2019 15:21:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OLIRLr5XywqWPFFuglLlD1BjNumn3WJ8Ne6YKbN5tvs=;
 b=Lx1kiOvWTgFR+Nry+Ji0Gf5ZW4dF0PjNN3+8iqsPmLFXIwLp+dfU9zomsC2eXnvnmN
 eMpFA/VeuDrnYDcEiVR14EdbZPT78Dv1ZnHzIByNxmryyWnI7KygAYAz4jiDfuogcAfC
 r8MnslyY4K8UKDi61uOzXQ6GospKiTXttIt+dDgqU4oXUEqo/61S0rg+a2zLzYQvYPDn
 bfk0Gii7eSlMJpK1fdvhf6N1RAcQBnCzfG4e8vIUkrQQkk2oW3mq3BJhOfxCH/83lR6O
 XOgzpVIuY6dGf27JhSnCzC9Myfu5Q7XGk94ASQt1CbWkdeWMM2SWxJdUbqBWk2TZs3Fu
 9Y9A==
X-Gm-Message-State: APjAAAVdVuSKV6uKq/IekGKbyLeXCSW9B1ON3107jDtm+MKUDFxppTZI
 xH4vFP/bNxxlvuBhKeXRBg==
X-Google-Smtp-Source: APXvYqzxnxMykdi0OVF/YNoTEiUpYFT5/p0zN9KY5kNFKZUG+9whG8bIMuudZJPbuRke4NTBnJ9HPg==
X-Received: by 2002:aca:52c3:: with SMTP id g186mr140649oib.118.1575415270129; 
 Tue, 03 Dec 2019 15:21:10 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c68sm984963oig.11.2019.12.03.15.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 15:21:09 -0800 (PST)
Date: Tue, 3 Dec 2019 17:21:09 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/4] dt-bindings: media: amlogic,gx-vdec: add bindings
 for G12A family
Message-ID: <20191203232108.GA361@bogus>
References: <20191120111430.29552-1-narmstrong@baylibre.com>
 <20191120111430.29552-3-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120111430.29552-3-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191203_152111_402559_3DB079BD 
X-CRM114-Status: GOOD (  15.98  )
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
Cc: mjourdan@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Nov 20, 2019 at 12:14:28PM +0100, Neil Armstrong wrote:
> Add bindings to support the Amlogic Video Decoder on the Amlogic G12A
> family.
> 
> For the G12A family, a supplementary clock is needed to operate the
> HEVC/VP9 decoder.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/media/amlogic,gx-vdec.yaml       | 57 +++++++++++++++----
>  1 file changed, 46 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
> index 878944867d6e..8ea979bb97e6 100644
> --- a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
> +++ b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
> @@ -27,12 +27,15 @@ description: |
>  
>  properties:
>    compatible:
> -    items:
> +    oneOf:
> +      - items:
> +        - enum:
> +          - amlogic,gxbb-vdec # GXBB (S905)
> +          - amlogic,gxl-vdec # GXL (S905X, S905D)
> +          - amlogic,gxm-vdec # GXM (S912)
> +        - const: amlogic,gx-vdec
>        - enum:
> -        - amlogic,gxbb-vdec # GXBB (S905)
> -        - amlogic,gxl-vdec # GXL (S905X, S905D)
> -        - amlogic,gxm-vdec # GXM (S912)
> -      - const: amlogic,gx-vdec
> +        - amlogic,g12a-vdec # G12A (S905X2, S905D2)
>  
>    interrupts:
>      minItems: 2
> @@ -59,13 +62,9 @@ properties:
>  
>    clocks:
>      minItems: 4
> +    maxItems: 5
>  
> -  clock-names:
> -    items:
> -      - const: dos_parser
> -      - const: dos
> -      - const: vdec_1
> -      - const: vdec_hevc

You can leave this here and add the 5th clock along with { minItems: 4, 
maxItems: 5 }.

Then the 'if' schema just needs a 'maxItems: 4'.

> +  clock-names: true
>  
>    amlogic,ao-sysctrl:
>      description: should point to the AOBUS sysctrl node
> @@ -77,6 +76,42 @@ properties:
>      allOf:
>        - $ref: /schemas/types.yaml#/definitions/phandle
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,gx-vdec
> +
> +    then:
> +      properties:
> +        clock-names:
> +          minItems: 4
> +          items:
> +            - const: dos_parser
> +            - const: dos
> +            - const: vdec_1
> +            - const: vdec_hevc
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,g12a-vdec
> +
> +    then:
> +      properties:
> +        clock-names:
> +          minItems: 5
> +          items:
> +            - const: dos_parser
> +            - const: dos
> +            - const: vdec_1
> +            - const: vdec_hevc
> +            - const: vdec_hevcf
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.22.0
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
