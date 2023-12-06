Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8082C4167B
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Dec 2023 13:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g4nK9ymrVO3Ow9y7462sWKQHtglBBYmdgSyajO/uoxs=; b=qBSr7uvLYWkzQn
	FGap8xWe8DbSyv1oFTVPWVxlj96BCOuZ+j6RqlZv8hoY6xpeGu/f0e9nH4LcYA40iupXCU8pCS5dM
	U8/Rqxr4qSi9yQjpUT30VfKgep13PfNuNdMZ+9QKq/Dn7unBNJzfBYIqbssqRqJZ1gAKxaZ4uMKPw
	hspEk4YLHO0FSJcBi5C5XhHkNv+8lugQF2VsCFOuYd55pH2Vi1xqjJH5DfqWHaMwh6MybVV8IIbE2
	2+zMqgxK2IIQpgR3bMmeVM2+EJi1Wxkx02JdNLXCNb8KIiM2sc+4CLqmPm6cVFyiJZEwxCIY666ZV
	7eDu1v+5fI4VVUjFyo/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAsL0-00AQjv-1J;
	Wed, 06 Dec 2023 13:53:18 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAsKw-00AQjB-2Z
	for linux-amlogic@lists.infradead.org;
	Wed, 06 Dec 2023 13:53:16 +0000
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3b84e328327so4107433b6e.2
        for <linux-amlogic@lists.infradead.org>; Wed, 06 Dec 2023 05:53:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701870793; x=1702475593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELAnzgA5DxDxpCpfzQO17fyyUMvM5sG9LtRZSNKeVTs=;
        b=Q+IPE8sZcasFFOl8j7tW/O0MhZ9JGti3C0EJiIZ6ycQJAQUA75iCdNENwN0Sr7JnTv
         oZnaJhpZfAwxpLUt9CSQ3kyvdjJrLvLBy48G9z3zzwNF9j7Y2RtLf7Z9rWwXq+XRcmZy
         yEZI7+NRBVhwCm/ahN8LbGebhamx62dR1B0dEtmqzM1AGNTExOT6HqG2AV7PZfz1tcUP
         Zv080EtAntu2zgAMKq3PfzO8n813yt7AHC9e3MzC4jNfmF8kgeCSMKzsbmZvcrttq0Qw
         W7x+ALhkBuo1+wC0iR0NWcKIRA3x9F+fAEDjmnM72D2ZbDhHD1Oiap2duKlmJuO93P1v
         w47g==
X-Gm-Message-State: AOJu0YyxYLSJaEyVZnvVJ+vFWFbXzvT31EP1etvPsP8ZavqeOBDxe4wM
	mwT0q5iyynZvT6+spjJCnA==
X-Google-Smtp-Source: AGHT+IEVaa/iHpBSbWcNgoXvomDJzk20fAqRd+fvaRNdmt3y7YPgh2MfstnaZSYrJPliRoSiim9bqg==
X-Received: by 2002:a05:6808:318b:b0:3b8:b55a:84aa with SMTP id cd11-20020a056808318b00b003b8b55a84aamr1125383oib.43.1701870793491;
        Wed, 06 Dec 2023 05:53:13 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bm19-20020a0568081a9300b003b9d36eb9c4sm65604oib.57.2023.12.06.05.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:53:12 -0800 (PST)
Received: (nullmailer pid 2045482 invoked by uid 1000);
	Wed, 06 Dec 2023 13:53:11 -0000
Date: Wed, 6 Dec 2023 07:53:11 -0600
From: Rob Herring <robh@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, Neil Armstrong <neil.armstrong@linaro.org>, linux-amlogic@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: usb: Add the binding example for the
 Genesys Logic GL3523 hub
Message-ID: <20231206135311.GA2043711-robh@kernel.org>
References: <20231204144429.45197-1-linux.amoon@gmail.com>
 <20231204144429.45197-2-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231204144429.45197-2-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_055314_835180_D3B89666 
X-CRM114-Status: GOOD (  20.22  )
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

On Mon, Dec 04, 2023 at 08:14:25PM +0530, Anand Moon wrote:
> Add the binding example for the USB3.1 Genesys Logic GL3523
> integrates with USB 3.1 Gen 1 Super Speed and USB 2.0 High-Speed
> hub.
> 
> For onboard hub controllers that support USB 3.x and USB 2.0 hubs
> with shared resets and power supplies, this property is used to identify
> the hubs with which these are shared.
> 
> GL3523 has built-in 5V to 3.3V and 5V to 1.2V regulators, which serves
> power to the USB HUB, it uses 5V power regulator.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> V6: fix the description of the regulators
> Updated the commit message for regulator updates.
> add reviewed by Conor Dooley
> [1] https://lore.kernel.org/all/20231130053130.21966-2-linux.amoon@gmail.com/
> v5: upgrade peer-hub description : Conor Dooley
> [0] https://www.genesyslogic.com.tw/en/product_view.php?show=67 [Block Diagram]
> v4: Fix the description of peer-hub and update the commit message.
> Schematics of the Odroid N2+
> https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.6_20210121.pdf
> V3: fix the dt_binding_check error, added new example for Genesys GL3523
> v2: added Genesys GL3523 binding
> v1: none
> ---
>  .../bindings/usb/genesys,gl850g.yaml          | 65 +++++++++++++++++--
>  1 file changed, 61 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> index ee08b9c3721f..c6f63a69396d 100644
> --- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> +++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> @@ -9,9 +9,6 @@ title: Genesys Logic USB hub controller
>  maintainers:
>    - Icenowy Zheng <uwu@icenowy.me>
>  
> -allOf:
> -  - $ref: usb-device.yaml#
> -
>  properties:
>    compatible:
>      enum:
> @@ -27,12 +24,46 @@ properties:
>  
>    vdd-supply:
>      description:
> -      the regulator that provides 3.3V core power to the hub.
> +      The regulator that provides 3.3V or 5.0V core power to the hub.
> +
> +  peer-hub:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      For onboard hub controllers that support USB 3.x and USB 2.0 hubs
> +      with shared resets and power supplies, this property is used to identify
> +      the hubs with which these are shared.
>  
>  required:
>    - compatible
>    - reg
>  
> +allOf:
> +  - $ref: usb-device.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - usb5e3,608
> +    then:
> +      properties:
> +        peer-hub: false
> +        vdd-supply: false
> +        reset-gpios: true
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - usb5e3,610
> +              - usb5e3,620
> +    then:
> +      properties:
> +        peer-hub: true
> +        vdd-supply: true
> +        reset-gpios: true

No need for this if schema. The default is they are allowed.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
