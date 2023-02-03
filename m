Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE2CC636CC
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Feb 2023 08:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OsENmHaZV2tQvQ1tC6aFr6Mqoe+8ZNNGRbYKyEdvkcM=; b=F686AhetH/viW2
	tghAZK10hN1C5w07+wozpYO97GPUmT/j6Cb/3dWFjBgvUT4qMMQFrqLhItMxG7VhDGhHPKQfwbfsk
	Gxnf+yYD/ogqdHwRYbRL+FO6OKFBvBpdTScAGybpYP3V+0TWFVngTfxxLWNPmFZqda7ZrVPQa8ICb
	U9N3IlMx8Rcga+0vUM7VR8jjAvwM914G7Vb124xno7BuyIv0qo+cTt0lC0ZlKxouOSupTI+USxvNn
	7Mbyior+qDz9skqLVfY/iu+BrR81UUlWKf7ISa7sZ+Z3wv3ZZmB2Sdop+c7b62jtoQx4o+kF8txWH
	PmbYxdnXilb3umtowbOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNr8y-000xj9-GM; Fri, 03 Feb 2023 08:10:00 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNr8u-000xhw-MR
	for linux-amlogic@lists.infradead.org; Fri, 03 Feb 2023 08:09:58 +0000
Received: by mail-wr1-x42b.google.com with SMTP id o18so3903763wrj.3
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Feb 2023 00:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/2gpt9+jyuzhsCsNCqwEjLtpoRUPMsxb4vMtu3+6ej0=;
        b=P3U4RLD7rRE+aBfZvksPjYfn65KjvhvCuCdW3xtjPRBFb0kTttImG5Tew3nY8TRhHZ
         1p81+1cNxJPecFbU0g+WRphPWSXUoDXTgEnqN1yAAQB+Cb0HPIRMlPK3RmFw7bzUT4NE
         SaUZo9LGKh04Dgrl/DtR2UPPfsHktdf36VIQzS3rP6pBF7T+pf4mPIjkjCAtxjUtEulR
         EScyEGAK6LAmgoEdL+Ubt4N4ZLrNUzZmrwi1pxBZzgyr+K4KiL9Pt8aTDmo1KUZGRQV/
         Fg1m3f/Q2e4ypgDGof37rN4AlAaIsU9RI67y7F1yWLPMy7RmzewmtnHD8sZUfOGYqJIc
         wERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/2gpt9+jyuzhsCsNCqwEjLtpoRUPMsxb4vMtu3+6ej0=;
        b=iVxzU2mKQnvMiHcCGg1fBd6jmue711vAzNH2QjKUHLh3g2El5QLXsJksr71grPnMgp
         vPY02Jq3fA6GgU+Bj4pUbiZeIHE7a9meF2YxB67OGKG9zbYtforRJb1GpO+jWyWbp+qS
         7jSEU2XhrA6OCiEZwTc0END0T8gU4xIdA+nAntCCzG1nvmjU2d9xMfmU9rP14ADTzieH
         daWSeK5XisjRfHdSgKPV7lgZBmJHn/nUUq2Q9rVnXk3tqfmLcWkojEMe0ei51gARPu3B
         hmCstd+MHMHOB9Mrb1u/b9tnTq+JINsr/CGtEtYLrUs3cjOze1HMlA22uq39DCBxUUSy
         erDQ==
X-Gm-Message-State: AO0yUKUsgc+6eDqBE/2qGwb8uEru6J/HjXQ2L3PCqQuMYNp2Ygt5uGVH
	R7liASeAJwnb5HjkHrSqlZ1ykg==
X-Google-Smtp-Source: AK7set/JSwnz3mLBg1JZEVQvuLoj2Fc6kwYibVULBNVFtYYWan3R8sOKUs4Fw5/X35J0SK+5XdImnw==
X-Received: by 2002:a5d:6b03:0:b0:2bf:ae3f:640b with SMTP id v3-20020a5d6b03000000b002bfae3f640bmr7379852wrw.70.1675411792942;
        Fri, 03 Feb 2023 00:09:52 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t10-20020a5d690a000000b002bbedd60a9asm1374845wru.77.2023.02.03.00.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 00:09:52 -0800 (PST)
Message-ID: <f229e181-c56d-6ec7-2a1c-754690f70438@linaro.org>
Date: Fri, 3 Feb 2023 09:09:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 9/9] ASoC: dt-bindings: meson: convert axg sound card
 control to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-10-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202183653.486216-10-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_000956_776978_C20C9699 
X-CRM114-Status: GOOD (  29.35  )
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
> Convert the DT binding documentation for the Amlogic axg sound card to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/sound/amlogic,axg-sound-card.txt | 124 ------------
>  .../sound/amlogic,axg-sound-card.yaml         | 182 ++++++++++++++++++
>  2 files changed, 182 insertions(+), 124 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.txt
> deleted file mode 100644
> index 80b411296480..000000000000
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.txt
> +++ /dev/null
> @@ -1,124 +0,0 @@
> -Amlogic AXG sound card:
> -
> -Required properties:
> -
> -- compatible: "amlogic,axg-sound-card"
> -- model : User specified audio sound card name, one string
> -
> -Optional properties:
> -
> -- audio-aux-devs : List of phandles pointing to auxiliary devices
> -- audio-widgets : Please refer to widgets.txt.
> -- audio-routing : A list of the connections between audio components.
> -
> -Subnodes:
> -
> -- dai-link: Container for dai-link level properties and the CODEC
> -	    sub-nodes. There should be at least one (and probably more)
> -	    subnode of this type.
> -
> -Required dai-link properties:
> -
> -- sound-dai: phandle and port of the CPU DAI.
> -
> -Required TDM Backend dai-link properties:
> -- dai-format : CPU/CODEC common audio format
> -
> -Optional TDM Backend dai-link properties:
> -- dai-tdm-slot-rx-mask-{0,1,2,3}: Receive direction slot masks
> -- dai-tdm-slot-tx-mask-{0,1,2,3}: Transmit direction slot masks
> -				  When omitted, mask is assumed to have to no
> -				  slots. A valid must have at one slot, so at
> -				  least one these mask should be provided with
> -				  an enabled slot.
> -- dai-tdm-slot-num : Please refer to tdm-slot.txt.
> -		     If omitted, slot number is set to accommodate the largest
> -		     mask provided.
> -- dai-tdm-slot-width : Please refer to tdm-slot.txt. default to 32 if omitted.
> -- mclk-fs : Multiplication factor between stream rate and mclk
> -
> -Backend dai-link subnodes:
> -
> -- codec: dai-link representing backend links should have at least one subnode.
> -	 One subnode for each codec of the dai-link.
> -	 dai-link representing frontend links have no codec, therefore have no
> -	 subnodes
> -
> -Required codec subnodes properties:
> -
> -- sound-dai: phandle and port of the CODEC DAI.
> -
> -Optional codec subnodes properties:
> -
> -- dai-tdm-slot-tx-mask : Please refer to tdm-slot.txt.
> -- dai-tdm-slot-rx-mask : Please refer to tdm-slot.txt.
> -
> -Example:
> -
> -sound {
> -	compatible = "amlogic,axg-sound-card";
> -	model = "AXG-S420";
> -	audio-aux-devs = <&tdmin_a>, <&tdmout_c>;
> -	audio-widgets = "Line", "Lineout",
> -			"Line", "Linein",
> -			"Speaker", "Speaker1 Left",
> -			"Speaker", "Speaker1 Right";
> -			"Speaker", "Speaker2 Left",
> -			"Speaker", "Speaker2 Right";
> -	audio-routing = "TDMOUT_C IN 0", "FRDDR_A OUT 2",
> -			"SPDIFOUT IN 0", "FRDDR_A OUT 3",
> -			"TDM_C Playback", "TDMOUT_C OUT",
> -			"TDMIN_A IN 2", "TDM_C Capture",
> -			"TDMIN_A IN 5", "TDM_C Loopback",
> -			"TODDR_A IN 0", "TDMIN_A OUT",
> -			"Lineout", "Lineout AOUTL",
> -			"Lineout", "Lineout AOUTR",
> -			"Speaker1 Left", "SPK1 OUT_A",
> -			"Speaker2 Left", "SPK2 OUT_A",
> -			"Speaker1 Right", "SPK1 OUT_B",
> -			"Speaker2 Right", "SPK2 OUT_B",
> -			"Linein AINL", "Linein",
> -			"Linein AINR", "Linein";
> -
> -	dai-link@0 {
> -		sound-dai = <&frddr_a>;
> -	};
> -
> -	dai-link@1 {
> -		sound-dai = <&toddr_a>;
> -	};
> -
> -	dai-link@2 {
> -		sound-dai = <&tdmif_c>;
> -		dai-format = "i2s";
> -		dai-tdm-slot-tx-mask-2 = <1 1>;
> -		dai-tdm-slot-tx-mask-3 = <1 1>;
> -		dai-tdm-slot-rx-mask-1 = <1 1>;
> -		mclk-fs = <256>;
> -
> -		codec@0 {
> -			sound-dai = <&lineout>;
> -		};
> -
> -		codec@1 {
> -			sound-dai = <&speaker_amp1>;
> -		};
> -
> -		codec@2 {
> -			sound-dai = <&speaker_amp2>;
> -		};
> -
> -		codec@3 {
> -			sound-dai = <&linein>;
> -		};
> -
> -	};
> -
> -	dai-link@3 {
> -		sound-dai = <&spdifout>;
> -
> -		codec {
> -			sound-dai = <&spdif_dit>;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> new file mode 100644
> index 000000000000..185cd9fbeda1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> @@ -0,0 +1,182 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic AXG sound card
> +
> +maintainers:
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +
> +properties:
> +  compatible:
> +    items:

Drop

> +      - const: amlogic,axg-sound-card

And here you can keep such code in one line?

> +
> +  audio-aux-devs:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: list of auxiliary devices

min/maxItems

> +
> +  audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: |-
> +      A list of the connections between audio components. Each entry is a
> +      pair of strings, the first being the connection's sink, the second
> +      being the connection's source.
> +
> +  audio-widgets:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: |-
> +      A list off component DAPM widget. Each entry is a pair of strings,
> +      the first being the widget type, the second being the widget name
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User specified audio sound card name
> +
> +patternProperties:
> +  "^dai-link-[0-9]+$":
> +    type: object
> +    additionalProperties: false
> +    description: |-

Drop |-

> +      dai-link child nodes:

Drop, this is not a property list.

> +        Container for dai-link level properties and the CODEC sub-nodes.
> +        There should be at least one (and probably more) subnode of this type
> +
> +    properties:
> +      dai-format:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        enum: [ i2s, left-j, dsp_a ]
> +
> +      dai-tdm-slot-num:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +          Number of slots in use. If omitted, slot number is set to
> +          accommodate the largest mask provided.
> +        maximum: 32
> +
> +      dai-tdm-slot-width:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Width in bits for each slot
> +        enum: [ 8, 16, 20, 24, 32 ]
> +        default: 32
> +
> +      mclk-fs:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |-

Drop |-
Drop it everywhere where not needed

> +          Multiplication factor between the frame rate and master clock
> +          rate
> +
> +      sound-dai:
> +        $ref: /schemas/types.yaml#/definitions/phandle-array

Old binding was saying it is just phandle

> +        description: phandle of the CPU DAI
> +
> +    patternProperties:
> +      "^dai-tdm-slot-(t|r)x-mask-[0-3]$":
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description: |-

Drop |-

> +          Transmit and receive cpu slot masks of each TDM lane
> +          When omitted, mask is assumed to have to no slots. A valid
> +          interface must have at least one slot, so at least one these
> +          mask should be provided with an enabled slot.
> +
> +      "^codec(-[0-9]+)?$":
> +        type: object
> +        additionalProperties: false
> +        description: |-
> +          dai-link representing backend links should have at least one subnode.
> +          One subnode for each codec of the dai-link. dai-link representing
> +          frontend links have no codec, therefore have no subnodes
> +
> +        properties:
> +          sound-dai:
> +            $ref: /schemas/types.yaml#/definitions/phandle-array

phandle

> +            description: phandle of the codec DAI
> +
> +        patternProperties:
> +          "^dai-tdm-slot-(t|r)x-mask$":
> +            $ref: /schemas/types.yaml#/definitions/uint32-array
> +            description: Transmit and receive codec slot masks

Are you sure codec has dai-tdm-slot-....?

> +
> +        required:
> +          - sound-dai
> +
> +    required:
> +      - sound-dai
> +
> +required:
> +  - model
> +  - dai-link-0
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    sound {
> +        compatible = "amlogic,axg-sound-card";
> +        model = "AXG-S420";
> +        audio-aux-devs = <&tdmin_a>, <&tdmout_c>;
> +        audio-widgets = "Line", "Lineout",
> +                        "Line", "Linein",
> +                        "Speaker", "Speaker1 Left",
> +                        "Speaker", "Speaker1 Right",
> +                        "Speaker", "Speaker2 Left",
> +                        "Speaker", "Speaker2 Right";
> +        audio-routing = "TDMOUT_C IN 0", "FRDDR_A OUT 2",
> +                        "SPDIFOUT IN 0", "FRDDR_A OUT 3",
> +                        "TDM_C Playback", "TDMOUT_C OUT",
> +                        "TDMIN_A IN 2", "TDM_C Capture",
> +                        "TDMIN_A IN 5", "TDM_C Loopback",
> +                        "TODDR_A IN 0", "TDMIN_A OUT",
> +                        "Lineout", "Lineout AOUTL",
> +                        "Lineout", "Lineout AOUTR",
> +                        "Speaker1 Left", "SPK1 OUT_A",
> +                        "Speaker2 Left", "SPK2 OUT_A",
> +                        "Speaker1 Right", "SPK1 OUT_B",
> +                        "Speaker2 Right", "SPK2 OUT_B",
> +                        "Linein AINL", "Linein",
> +                        "Linein AINR", "Linein";
> +
> +        dai-link-0 {
> +               sound-dai = <&frddr_a>;

Use 4 spaces for example indentation.

> +        };
> +
> +        dai-link-1 {
> +               sound-dai = <&toddr_a>;
> +        };

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
