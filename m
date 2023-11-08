Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C54C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Nov 2023 17:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y5cvncQsta9TFVIb9veSydHURLs4RUdqFFoUicJjF4E=; b=3Hm7aw0cCELern
	RDlMKyNrbepr/z7rrvUgghmWK0T2lUMi/cNz1LUiwCb8YSINWNlZEiy2/HfQYlhOMGGm6hlc38Eo+
	qWTbbeCniCTcqxPByazXw+ytNULYeNZSxE8VCrTfSqH6Ti/Bxme3qvpLly5ikONL5YMotv8t3ovRB
	F9c6PCPNcvqBfC2SRx12WizfFOuPFQzMEuXqPIXPbFiEJoUFKwc37Wiu51bLg1VWC3sxXs7kUI1Zi
	GYYnEByiPjWaKTZCvAXpOONLJZjJx0j5Z7/xikB4sSU+3XhC0uug/2MlBI8iMU5yEJcli4ZBiNwDv
	elfseHuF7AGun/zEaK3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0m0d-004N00-1w;
	Wed, 08 Nov 2023 17:06:31 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0m0a-004Myv-2V
	for linux-amlogic@lists.infradead.org;
	Wed, 08 Nov 2023 17:06:30 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1e9c9d181d6so4460699fac.0
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Nov 2023 09:06:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699463183; x=1700067983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJ2/nMs6Yhr8uLWvhSvoVwmUCFZ9QIvsLIyUzisytuo=;
        b=PIn0HLnYudcNXpb+CefCZMQT2g66A1lSkV0lVHuMqzl+Qdzsu3xWpezV7s7KNhHEOE
         L6Zz9e8KIPL8cqrMtROPDXHrpwVqTQaar/8iksvFh+627KlsOLAjXrvRXj2QK5r3JgdC
         E7hUF0z2QFj9odmMBVBKiQzkvra9jWflbZeiBi8ZcaCaXatFxxPPzvr9s2hwkp4tsJXA
         gGK33etrcp0i3jyRR1JfY4lUH8f+nyV1zSlowYAEP0yrkocetJcZU6mDDtbWUf3WX5nK
         iiT3wccFoyyIfSBxrF6L29DA9qiKYIY7nD3QPJAWS1yeTNBIVS58YyRWEDa4Qp2dVCLO
         4/rQ==
X-Gm-Message-State: AOJu0YxMrXgZ2Irz3TZoepKaZeujtosiHR9g44c71xJOhLd2L0vsgIKM
	6iWCxkewjFaU8F2+nlnn2w==
X-Google-Smtp-Source: AGHT+IEOaDEK1hhUOVnQKXn6NQZy8cHEJSI37j2QsJ/ZyCIwLP3zjaw2qRMcFv8I7yZh5+9SjZd/9g==
X-Received: by 2002:a05:6870:63a8:b0:1ea:3e52:b66e with SMTP id t40-20020a05687063a800b001ea3e52b66emr3089914oap.41.1699463182820;
        Wed, 08 Nov 2023 09:06:22 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ef4-20020a0568701a8400b001efb3910402sm375323oab.0.2023.11.08.09.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 09:06:22 -0800 (PST)
Received: (nullmailer pid 2432899 invoked by uid 1000);
	Wed, 08 Nov 2023 17:06:21 -0000
Date: Wed, 8 Nov 2023 11:06:21 -0600
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org, JunYi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH 2/6] dt-bindings: pwm: amlogic: add new compatible for
 meson8 pwm type
Message-ID: <20231108170621.GA2417622-robh@kernel.org>
References: <20231106103259.703417-1-jbrunet@baylibre.com>
 <20231106103259.703417-3-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231106103259.703417-3-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_090628_816509_A62028B8 
X-CRM114-Status: GOOD (  23.65  )
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

On Mon, Nov 06, 2023 at 11:32:49AM +0100, Jerome Brunet wrote:
> Add a new compatible for the pwm found in the meson8 to sm1 Amlogic SoCs.
> 
> The previous clock bindings for these SoCs described the driver and not the
> HW itself. The clock provided was used to set the parent of the input clock
> mux among the possible parents hard-coded in the driver.
> 
> The new bindings allows to describe the actual clock inputs of the PWM in
> DT, like most bindings do, instead of relying of hard-coded data.
> 
> The new bindings make the old one deprecated.
> 
> There is enough experience on this HW to know that the PWM is exactly the
> same all the supported SoCs. There is no need for a per-SoC compatible.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 35 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> index 754b70fc2db0..3aa522c4cae4 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> @@ -22,6 +22,7 @@ properties:
>            - amlogic,meson-g12a-ao-pwm-ab
>            - amlogic,meson-g12a-ao-pwm-cd
>            - amlogic,meson-s4-pwm
> +          - amlogic,meson8-pwm-v2
>        - items:
>            - const: amlogic,meson-gx-pwm
>            - const: amlogic,meson-gxbb-pwm
> @@ -37,7 +38,7 @@ properties:
>  
>    clocks:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 4
>  
>    clock-names:
>      minItems: 1
> @@ -70,11 +71,14 @@ allOf:
>                - amlogic,meson-gx-pwm
>                - amlogic,meson-gx-ao-pwm
>      then:
> -      # Historic bindings tied to the driver implementation
> +      # Obsolete historic bindings tied to the driver implementation
>        # The clocks provided here are meant to be matched with the input
>        # known (hard-coded) in the driver and used to select pwm clock
>        # source. Currently, the linux driver ignores this.
> +      deprecated: true
>        properties:
> +        clocks:
> +          maxItems: 2
>          clock-names:
>            oneOf:
>              - items:
> @@ -83,6 +87,26 @@ allOf:
>                  - const: clkin0
>                  - const: clkin1
>  
> +  # Newer binding where clock describe the actual clock inputs of the pwm
> +  # block. These are necessary but some inputs may be grounded.
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,meson8b-pwm-v2
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 1
> +          items:
> +            - description: input clock 0 of the pwm block
> +            - description: input clock 1 of the pwm block
> +            - description: input clock 2 of the pwm block
> +            - description: input clock 3 of the pwm block
> +      required:
> +        - clocks

Again, clock-names?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
