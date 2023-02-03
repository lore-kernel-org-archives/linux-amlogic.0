Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3ACC61DA4
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Feb 2023 08:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q5cIeau411utCdlTDZO6uV+AhmAPd+1Bo1mUcS6UlH0=; b=OlvCWE7LLTR/y7
	gNmnN9Gc+F+TA9hMpTO114OBIhw9/ita2TH1rxy9lJ3Z0yt9yAw4VNVGBi3gG24YmiC8W5NQIH37I
	fnVgJK8cLURG3EQWpdRNuBEtSYP5F/5uJ+U2YCO4QvdpSrRIvvb+Gv9P/KW6iaef3eDsy7BazgGv7
	Iw+RG4slAnTDcWoi0h0RSZGvCkRtrNGr6FQvugkcIZqh47wKM4/FoRiCzrIDRcYLeroU7HaFrq4Qy
	c3y9CMlYg4Xc+0vPSG069vtusli271IQBUugt09g9VXTfUUFrDpoF6+321eqQahQj3I9WW2IQYBYW
	sVJCXCCNA1YFKA+zmIGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNr3F-000vav-W0; Fri, 03 Feb 2023 08:04:06 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNr3D-000vWM-Bf
	for linux-amlogic@lists.infradead.org; Fri, 03 Feb 2023 08:04:05 +0000
Received: by mail-wm1-x32e.google.com with SMTP id o36so3225783wms.1
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Feb 2023 00:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5n5nzjeWYrzvFdzePtFgwKj0yhRVHY39hpZH36NwKnk=;
        b=VKuUvjTlX5a1O4eMIYlvvN7JZ19j0qIbN/KBLlJ4miIJCOS10HO5/biPIEzBjlaL8j
         wJOvFnYXDW/rxLJ/vC2Rh4Bc2rlBVhGOiku0lr+ZhbhOS8GhO3f9cA2XiAx/6XYRgqkg
         1hIRoiQgIXUBb7+LNc3WmyBNsaY2aS9QxITLZPA//DroZJQRHVZblV0r0NKP4wFGJjC9
         hEZLRCCW7BSem7OjHHznc7HSP0JqQrilzIwTzuvMQEXzFA5sR+evvkygqIRDw/6lx3CI
         K+0VwdnsBVuNbJlu7QE1JAGddfd1n4i74dNRpgLBL6cJ+UbGfpFQREllpUEYWxfnFdRY
         3/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5n5nzjeWYrzvFdzePtFgwKj0yhRVHY39hpZH36NwKnk=;
        b=TekuPXRaC5mYgL5cyLZsvjiCySr5YyKg5leNU9f/kz/6xbVUcNdeckurwJdoNbHKYa
         +zXYo1Kt5Syvge+KMVHj/srFdpO3runrwe2mSQpKTiMcLUfugWxCbJB6L676zRrbybc4
         qpB4IxYV9BD8Sm+bdKuUMg3RtRyl/mGBSElrS8KSfL4epw7d5TCKv9G9pV7Jf5v1WG21
         oVngVMJbH/LEL5+rbwXedEle9gwW8rB19rPuzHDcAat+ZnaJNJQJUlgsnB+5E89e/Tcc
         y2V+jr/vZI8e6n6gzicMYpkkyj+/GLdYt5VIAmJRmLT15GFRyyGEsorM1NusopXtxa1N
         ENHA==
X-Gm-Message-State: AO0yUKW0fBMAcaGUPfX5m0eh/GdlTkdlE0TzidVvRe5sl2kdmghipUup
	3dP0I+Nn+qY5xaG8xawc52GyAA==
X-Google-Smtp-Source: AK7set8ndf5+O2ob1W8PMCs/4gc2zLHq73SYbJTh14EOpBU1XesXZgsXJjKB3N2Hs3hq6EQctUIVZw==
X-Received: by 2002:a05:600c:3d88:b0:3d2:3f55:f757 with SMTP id bi8-20020a05600c3d8800b003d23f55f757mr8759506wmb.20.1675411440191;
        Fri, 03 Feb 2023 00:04:00 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q10-20020a05600c330a00b003dc3f195abesm1839823wmp.39.2023.02.03.00.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 00:03:59 -0800 (PST)
Message-ID: <3ac4c315-cff1-b313-6936-2fe5ca87c350@linaro.org>
Date: Fri, 3 Feb 2023 09:03:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 8/9] ASoC: dt-bindings: meson: convert axg spdif output to
 schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-9-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202183653.486216-9-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_000403_439010_11CD4CC4 
X-CRM114-Status: GOOD (  19.19  )
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

On 02/02/2023 19:36, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic axg spdif output to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/sound/amlogic,axg-spdifout.txt   | 25 ------
>  .../bindings/sound/amlogic,axg-spdifout.yaml  | 83 +++++++++++++++++++
>  2 files changed, 83 insertions(+), 25 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
> deleted file mode 100644
> index 28381dd1f633..000000000000
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -* Amlogic Audio SPDIF Output
> -
> -Required properties:
> -- compatible: 'amlogic,axg-spdifout' or
> -	      'amlogic,g12a-spdifout' or
> -	      'amlogic,sm1-spdifout'
> -- clocks: list of clock phandle, one for each entry clock-names.
> -- clock-names: should contain the following:
> -  * "pclk" : peripheral clock.
> -  * "mclk" : master clock
> -- #sound-dai-cells: must be 0.
> -
> -Optional property:
> -- resets: phandle to the dedicated reset line of the spdif output.
> -
> -Example on the A113 SoC:
> -
> -spdifout: audio-controller@480 {
> -	compatible = "amlogic,axg-spdifout";
> -	reg = <0x0 0x480 0x0 0x50>;
> -	#sound-dai-cells = <0>;
> -	clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
> -		 <&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
> -	clock-names = "pclk", "mclk";
> -};
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.yaml
> new file mode 100644
> index 000000000000..c661ce7f8b9d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/amlogic,axg-spdifout.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Audio AXG SPDIF Output
> +
> +maintainers:
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  $nodename:
> +    pattern: "^audio-controller@.*"
> +
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const:
> +              amlogic,axg-spdifout

All usual comments apply.

> +      - items:
> +          - enum:
> +              - amlogic,g12a-spdifout
> +              - amlogic,sm1-spdifout
> +          - const:
> +              amlogic,axg-spdifout
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: Peripheral clock
> +      - description: SPDIF output master clock
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: mclk
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#sound-dai-cells"
> +  - clocks
> +  - clock-names
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - amlogic,g12a-spdifout
> +          - amlogic,sm1-spdifout
> +then:
> +  properties:
> +    resets:
> +      items:
> +        - description: dedicated device reset line
> +
> +  required:
> +    - resets
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/axg-audio-clkc.h>
> +
> +    spdifout: audio-controller@480 {
> +    	compatible = "amlogic,axg-spdifout";

Indentation.


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
