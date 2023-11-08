Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79E4C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Nov 2023 17:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pcRZMk+2BXcR7ZM8hrBXYiNW+5VmyX6wcOF3M3qPTaE=; b=ERj9HE1JfGKyL5
	J938Ma/lWwX78YnRjQFO68EzG1wnwYOxy9VAOhYNzovhi3uc55Ykg6eC/l0DTALorjDkmfDoze5tH
	v+FBm+C6e4mXAS9CnFKaJ0BYKQ3+aAzlsaDyFKe/dSGf41WVdUMFjvogQARYsEtniUebnt5VuBjsF
	K1IzP0QxHMswK+LlUhQTBpSfxdoWA1cpgnlhk8njgbh5yreX2pqDQbmlfE3kAdqz9ltVcQq9yHgWk
	2ItemsSxGIGb5Aawa+hudv1kewkZfsnq6bP/uwlWT9Y8XGFg4UuIKJMeMSGHLW14Hq1WIPC7mr0cn
	pYpeb1SEEw5rwrpSsnSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0lz4-004Msx-1r;
	Wed, 08 Nov 2023 17:04:54 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0lz2-004MsT-1Q
	for linux-amlogic@lists.infradead.org;
	Wed, 08 Nov 2023 17:04:53 +0000
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3b3f6dd612cso4124925b6e.3
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Nov 2023 09:04:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699463091; x=1700067891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xj1XYIPtCt7xD0Af65okNbQPMnt8v3pzIoFtsXE0fE=;
        b=b/2pTziJlfQVhTv9CmnQKCtWYhqTuPLLuTSoSanw+xLMvdxn6EkIvNfuWegdUnDCew
         kf25q+b/QP7lHyzwyfMNJw4UovHqzPffSFg5R2yrFYw80L62zXiF83pSLm9J8/5aPkuh
         womgzWlleu6RvNmyT6rQ/fmQFTxNU0UoIkBIukxc14Eb9sb416AkNjrc2OizGVPfp+Fh
         5DupuHOBz3cLmEfCvXfgOX4gViUzGYK9PywIx2SpOLyLd/1CIopgCIAU+jRORs2zk67B
         qyG3TLZtQCng9XsG305GGcOkE70wTcAdnVbcgH3dD5MtgaVoO1E1D3W3TERipNu1ekZp
         ymjA==
X-Gm-Message-State: AOJu0YyLR38ztVeYJLuxyazwsHLFfgpRK0N7qj5byTwZTf+grd8W96w2
	CzlNkja2tycodV7jZNTyzw==
X-Google-Smtp-Source: AGHT+IFUgayMAUgXghb9NJTuV24YA3ejycTle65azlc47oD34VwRdZy3OlWJTd6DlfLxmK7vh9ke9w==
X-Received: by 2002:a05:6808:1382:b0:3ac:aae1:6d64 with SMTP id c2-20020a056808138200b003acaae16d64mr3049174oiw.2.1699463090240;
        Wed, 08 Nov 2023 09:04:50 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u5-20020a056808000500b003ae51628725sm1963024oic.13.2023.11.08.09.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 09:04:49 -0800 (PST)
Received: (nullmailer pid 2416480 invoked by uid 1000);
	Wed, 08 Nov 2023 17:04:48 -0000
Date: Wed, 8 Nov 2023 11:04:48 -0600
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org, JunYi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH 1/6] dt-bindings: pwm: amlogic: fix s4 bindings
Message-ID: <20231108170448.GA2388329-robh@kernel.org>
References: <20231106103259.703417-1-jbrunet@baylibre.com>
 <20231106103259.703417-2-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231106103259.703417-2-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_090452_505117_8A4A9456 
X-CRM114-Status: GOOD (  29.34  )
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

On Mon, Nov 06, 2023 at 11:32:48AM +0100, Jerome Brunet wrote:
> s4 has been added to the compatible list while converting the Amlogic PWM
> binding documentation from txt to yaml.
> 
> However, on the s4, the clock bindings have different meaning compared to
> previous SoCs.
> 
> On previous SoCs the clock bindings used to describe which input the PWM
> channel multiplexer should pick among its possible parents.
> 
> This is very much tied to the driver implementation, instead of describing
> the HW for what it is. When support for the Amlogic PWM was first added,
> how to deal with clocks through DT was not as clear as it nowadays.
> The Linux driver now ignores this DT setting, but still relies on the
> hard-coded list of clock sources.
> 
> On the s4, the input multiplexer is gone. The clock bindings actually
> describe the clock as it exists, not a setting. The property has a
> different meaning, even if it is still 2 clocks and it would pass the check
> when support is actually added.
> 
> Also the s4 cannot work if the clocks are not provided, so the property no
> longer optional.
> 
> Finally, for once it makes sense to see the input as being numbered
> somehow. No need to bother with clock-names on the s4 type of PWM.
> 
> Fixes: 43a1c4ff3977 ("dt-bindings: pwm: Convert Amlogic Meson PWM binding")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 68 ++++++++++++++++---
>  1 file changed, 59 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> index 527864a4d855..754b70fc2db0 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> @@ -9,9 +9,6 @@ title: Amlogic PWM
>  maintainers:
>    - Heiner Kallweit <hkallweit1@gmail.com>
>  
> -allOf:
> -  - $ref: pwm.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
> @@ -43,12 +40,8 @@ properties:
>      maxItems: 2
>  
>    clock-names:
> -    oneOf:
> -      - items:
> -          - enum: [clkin0, clkin1]
> -      - items:
> -          - const: clkin0
> -          - const: clkin1
> +    minItems: 1
> +    maxItems: 2
>  
>    "#pwm-cells":
>      const: 3
> @@ -57,6 +50,56 @@ required:
>    - compatible
>    - reg
>  
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,meson8-pwm
> +              - amlogic,meson8b-pwm
> +              - amlogic,meson-gxbb-pwm
> +              - amlogic,meson-gxbb-ao-pwm
> +              - amlogic,meson-axg-ee-pwm
> +              - amlogic,meson-axg-ao-pwm
> +              - amlogic,meson-g12a-ee-pwm
> +              - amlogic,meson-g12a-ao-pwm-ab
> +              - amlogic,meson-g12a-ao-pwm-cd
> +              - amlogic,meson-gx-pwm
> +              - amlogic,meson-gx-ao-pwm
> +    then:
> +      # Historic bindings tied to the driver implementation
> +      # The clocks provided here are meant to be matched with the input
> +      # known (hard-coded) in the driver and used to select pwm clock
> +      # source. Currently, the linux driver ignores this.
> +      properties:
> +        clock-names:
> +          oneOf:
> +            - items:
> +                - enum: [clkin0, clkin1]
> +            - items:
> +                - const: clkin0
> +                - const: clkin1
> +
> +  # Newer IP block take a single input per channel, instead of 4 inputs
> +  # for both channels
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,meson-s4-pwm
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: input clock of PWM channel A
> +            - description: input clock of PWM channel B
> +      required:
> +        - clocks

What are the 'clock-names' in this case? Because it's still allowed.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
