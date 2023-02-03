Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66AEC61DA4
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Feb 2023 14:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKNku7qcNzKMWWBtm+BgWuJEoIlZQaSChRkQ6nur2dg=; b=hAB3chT9w+06hO
	wfCt9nXxp9s/3YqQYHUPwealUJocZff7J3mthD+9rsfAulSx8ofGe1lqk/Pi3kZZs4D7IaArD9qcz
	oc5HAg6iDDrbYvXuR0ugmK7bh+yREsWr7I/y+S12a0sS3tLTm2g1iejA2edEBjrqvNcLB91D0iCQ0
	Soe+8sWX+nhvCZ/vF27lZUjUsC/ulHlaN5Q6PEDaUFTbyCwomGlo3AmHoyJq3mBfyGKRG4OqWjUg9
	Lo97842NlmVA5JYvg783bqB4p9MFwkfXQvvj2qxT4XGXMgdJIzTXLcoGkokjf2yTlYj3b9BHALUbS
	CVrS/Hkg5An7fnJkKbUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNx66-002S8g-MC; Fri, 03 Feb 2023 14:31:26 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNx3R-002Qfv-2J
	for linux-amlogic@lists.infradead.org; Fri, 03 Feb 2023 14:28:44 +0000
Received: by mail-wr1-x433.google.com with SMTP id y1so4826237wru.2
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Feb 2023 06:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=rp7gK9JaoFD2R09zAmrVW+yQPICqej6NE2E1Xqu4LQs=;
        b=KFnwV263WTYdLgF4LxxNoOcx+r/+v2sGiNNBhFeEPtji+gZYChfPiHsMc7mnJ69WkF
         y1aWIfFmwUp12tlEPhRiitdqDdRXm2avXfW3XP8IwPClWhWxhHwtOqSWvII+WZE+yp85
         yxLxMHNTnSj/5W9jUC77lq5yrrMvc5hqgWJ3057PRXeCxwmmZXXhar82+eqYSkqdZaNw
         GNEiQjMo1wTacw1qHEpoge8HmoFwIUUF+1gsyBvA9QspyGojLgmcqRkyR5WfYZvb8vQm
         O5n/mq5rbzxi6mfQ95W28aozIOIO/CKwtZIvv00b3+x5Kmg6JA/cmLC7I72ayEXBpeHQ
         HfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rp7gK9JaoFD2R09zAmrVW+yQPICqej6NE2E1Xqu4LQs=;
        b=dMSVWrn9n1OfD5Zr4uyyyMsx8PP5KaSshjs86sKhUyHj8sMVoOAYkQdQXro+/+cM7s
         iRBTjCrAwILWgAzlZq2aCcuTjrzoTstwbjMueTpQLkIo74EjsK+/uslIJy3NOv53bhHV
         Z7xoRHj0lotEJC29upyA8czTFpgoLPpj3+j/G+9WRYWhrCuQwVom+hBtGVqVKvB7UKR9
         C8VwayHQy9os0lo/exImpI6Il3DEWTUWDD4gw3dh0Da5yIhZI+mCnyQwbUGCifVE7cr8
         HKLD+nToAYlitMsjLBdGYJOP4rkigrSD/T0ra5EEVlkA4joWq1HlO4MCnJo8oRkaCIUX
         stbQ==
X-Gm-Message-State: AO0yUKUnIYPYJHeIxF4f5gfGytQI3VmsJSARBqr/RNu52Ts54zeFD2yJ
	SUh23V+M0LpFFx8lnQ4+bQk4ng==
X-Google-Smtp-Source: AK7set93G5PXT3Ql9/3C2A3IxbdGVENeyXEqF5PF+p6xWUVX3iXdV3gZzpp6t8poVlFGTcyP/Rl5Lw==
X-Received: by 2002:a5d:4e4f:0:b0:2bf:b7e3:6d69 with SMTP id r15-20020a5d4e4f000000b002bfb7e36d69mr8749694wrt.2.1675434516818;
        Fri, 03 Feb 2023 06:28:36 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id n18-20020adfe792000000b002238ea5750csm2075086wrm.72.2023.02.03.06.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 06:28:36 -0800 (PST)
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-10-jbrunet@baylibre.com>
 <f229e181-c56d-6ec7-2a1c-754690f70438@linaro.org>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown
 <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 9/9] ASoC: dt-bindings: meson: convert axg sound card
 control to schema
Date: Fri, 03 Feb 2023 15:13:01 +0100
In-reply-to: <f229e181-c56d-6ec7-2a1c-754690f70438@linaro.org>
Message-ID: <1jfsbmn7ql.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_062841_173360_3E420B21 
X-CRM114-Status: GOOD (  29.60  )
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


On Fri 03 Feb 2023 at 09:09, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 02/02/2023 19:36, Jerome Brunet wrote:
>> Convert the DT binding documentation for the Amlogic axg sound card to
>> schema.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  .../bindings/sound/amlogic,axg-sound-card.txt | 124 ------------
>>  .../sound/amlogic,axg-sound-card.yaml         | 182 ++++++++++++++++++
>>  2 files changed, 182 insertions(+), 124 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.txt
>>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.txt
>> deleted file mode 100644
>> index 80b411296480..000000000000
>> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.txt
>> +++ /dev/null
>> @@ -1,124 +0,0 @@
>> -Amlogic AXG sound card:
>> -
>> -Required properties:
>> -
>> -- compatible: "amlogic,axg-sound-card"
>> -- model : User specified audio sound card name, one string
>> -
>> -Optional properties:
>> -
>> -- audio-aux-devs : List of phandles pointing to auxiliary devices
>> -- audio-widgets : Please refer to widgets.txt.
>> -- audio-routing : A list of the connections between audio components.
>> -
>> -Subnodes:
>> -
>> -- dai-link: Container for dai-link level properties and the CODEC
>> -	    sub-nodes. There should be at least one (and probably more)
>> -	    subnode of this type.
>> -
>> -Required dai-link properties:
>> -
>> -- sound-dai: phandle and port of the CPU DAI.
>> -
>> -Required TDM Backend dai-link properties:
>> -- dai-format : CPU/CODEC common audio format
>> -
>> -Optional TDM Backend dai-link properties:
>> -- dai-tdm-slot-rx-mask-{0,1,2,3}: Receive direction slot masks
>> -- dai-tdm-slot-tx-mask-{0,1,2,3}: Transmit direction slot masks
>> -				  When omitted, mask is assumed to have to no
>> -				  slots. A valid must have at one slot, so at
>> -				  least one these mask should be provided with
>> -				  an enabled slot.
>> -- dai-tdm-slot-num : Please refer to tdm-slot.txt.
>> -		     If omitted, slot number is set to accommodate the largest
>> -		     mask provided.
>> -- dai-tdm-slot-width : Please refer to tdm-slot.txt. default to 32 if omitted.
>> -- mclk-fs : Multiplication factor between stream rate and mclk
>> -
>> -Backend dai-link subnodes:
>> -
>> -- codec: dai-link representing backend links should have at least one subnode.
>> -	 One subnode for each codec of the dai-link.
>> -	 dai-link representing frontend links have no codec, therefore have no
>> -	 subnodes
>> -
>> -Required codec subnodes properties:
>> -
>> -- sound-dai: phandle and port of the CODEC DAI.
>> -
>> -Optional codec subnodes properties:
>> -
>> -- dai-tdm-slot-tx-mask : Please refer to tdm-slot.txt.
>> -- dai-tdm-slot-rx-mask : Please refer to tdm-slot.txt.
>> -
>> -Example:
>> -
>> -sound {
>> -	compatible = "amlogic,axg-sound-card";
>> -	model = "AXG-S420";
>> -	audio-aux-devs = <&tdmin_a>, <&tdmout_c>;
>> -	audio-widgets = "Line", "Lineout",
>> -			"Line", "Linein",
>> -			"Speaker", "Speaker1 Left",
>> -			"Speaker", "Speaker1 Right";
>> -			"Speaker", "Speaker2 Left",
>> -			"Speaker", "Speaker2 Right";
>> -	audio-routing = "TDMOUT_C IN 0", "FRDDR_A OUT 2",
>> -			"SPDIFOUT IN 0", "FRDDR_A OUT 3",
>> -			"TDM_C Playback", "TDMOUT_C OUT",
>> -			"TDMIN_A IN 2", "TDM_C Capture",
>> -			"TDMIN_A IN 5", "TDM_C Loopback",
>> -			"TODDR_A IN 0", "TDMIN_A OUT",
>> -			"Lineout", "Lineout AOUTL",
>> -			"Lineout", "Lineout AOUTR",
>> -			"Speaker1 Left", "SPK1 OUT_A",
>> -			"Speaker2 Left", "SPK2 OUT_A",
>> -			"Speaker1 Right", "SPK1 OUT_B",
>> -			"Speaker2 Right", "SPK2 OUT_B",
>> -			"Linein AINL", "Linein",
>> -			"Linein AINR", "Linein";
>> -
>> -	dai-link@0 {
>> -		sound-dai = <&frddr_a>;
>> -	};
>> -
>> -	dai-link@1 {
>> -		sound-dai = <&toddr_a>;
>> -	};
>> -
>> -	dai-link@2 {
>> -		sound-dai = <&tdmif_c>;
>> -		dai-format = "i2s";
>> -		dai-tdm-slot-tx-mask-2 = <1 1>;
>> -		dai-tdm-slot-tx-mask-3 = <1 1>;
>> -		dai-tdm-slot-rx-mask-1 = <1 1>;
>> -		mclk-fs = <256>;
>> -
>> -		codec@0 {
>> -			sound-dai = <&lineout>;
>> -		};
>> -
>> -		codec@1 {
>> -			sound-dai = <&speaker_amp1>;
>> -		};
>> -
>> -		codec@2 {
>> -			sound-dai = <&speaker_amp2>;
>> -		};
>> -
>> -		codec@3 {
>> -			sound-dai = <&linein>;
>> -		};
>> -
>> -	};
>> -
>> -	dai-link@3 {
>> -		sound-dai = <&spdifout>;
>> -
>> -		codec {
>> -			sound-dai = <&spdif_dit>;
>> -		};
>> -	};
>> -};
>> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
>> new file mode 100644
>> index 000000000000..185cd9fbeda1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
>> @@ -0,0 +1,182 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic AXG sound card
>> +
>> +maintainers:
>> +  - Jerome Brunet <jbrunet@baylibre.com>
>> +
>> +properties:
>> +  compatible:
>> +    items:
>
> Drop
>
>> +      - const: amlogic,axg-sound-card
>
> And here you can keep such code in one line?
>
>> +
>> +  audio-aux-devs:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description: list of auxiliary devices
>
> min/maxItems

Auxiliary devices are not mandatory and there is no limit on how many a
sound card may have. Any number of item is valid.

>
>> +
>> +  audio-routing:
>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>> +    description: |-
>> +      A list of the connections between audio components. Each entry is a
>> +      pair of strings, the first being the connection's sink, the second
>> +      being the connection's source.
>> +
>> +  audio-widgets:
>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>> +    description: |-
>> +      A list off component DAPM widget. Each entry is a pair of strings,
>> +      the first being the widget type, the second being the widget name
>> +
>> +  model:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description: User specified audio sound card name
>> +
>> +patternProperties:
>> +  "^dai-link-[0-9]+$":
>> +    type: object
>> +    additionalProperties: false
>> +    description: |-
>
> Drop |-
>
>> +      dai-link child nodes:
>
> Drop, this is not a property list.
>
>> +        Container for dai-link level properties and the CODEC sub-nodes.
>> +        There should be at least one (and probably more) subnode of this type
>> +
>> +    properties:
>> +      dai-format:
>> +        $ref: /schemas/types.yaml#/definitions/string
>> +        enum: [ i2s, left-j, dsp_a ]
>> +
>> +      dai-tdm-slot-num:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description: |
>> +          Number of slots in use. If omitted, slot number is set to
>> +          accommodate the largest mask provided.
>> +        maximum: 32
>> +
>> +      dai-tdm-slot-width:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description: Width in bits for each slot
>> +        enum: [ 8, 16, 20, 24, 32 ]
>> +        default: 32
>> +
>> +      mclk-fs:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description: |-
>
> Drop |-
> Drop it everywhere where not needed
>
>> +          Multiplication factor between the frame rate and master clock
>> +          rate
>> +
>> +      sound-dai:
>> +        $ref: /schemas/types.yaml#/definitions/phandle-array
>
> Old binding was saying it is just phandle

It is just a phandle but the bindings used to have problem with phandle
that had cells.

See:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml?h=v6.2-rc6&id=d031d99b02eaf7363c33f5b27b38086cc8104082

Was it wrong or did the situation change since then ?

>
>> +        description: phandle of the CPU DAI
>> +
>> +    patternProperties:
>> +      "^dai-tdm-slot-(t|r)x-mask-[0-3]$":
>> +        $ref: /schemas/types.yaml#/definitions/uint32-array
>> +        description: |-
>
> Drop |-
>
>> +          Transmit and receive cpu slot masks of each TDM lane
>> +          When omitted, mask is assumed to have to no slots. A valid
>> +          interface must have at least one slot, so at least one these
>> +          mask should be provided with an enabled slot.
>> +
>> +      "^codec(-[0-9]+)?$":
>> +        type: object
>> +        additionalProperties: false
>> +        description: |-
>> +          dai-link representing backend links should have at least one subnode.
>> +          One subnode for each codec of the dai-link. dai-link representing
>> +          frontend links have no codec, therefore have no subnodes
>> +
>> +        properties:
>> +          sound-dai:
>> +            $ref: /schemas/types.yaml#/definitions/phandle-array
>
> phandle
>
>> +            description: phandle of the codec DAI
>> +
>> +        patternProperties:
>> +          "^dai-tdm-slot-(t|r)x-mask$":
>> +            $ref: /schemas/types.yaml#/definitions/uint32-array
>> +            description: Transmit and receive codec slot masks
>
> Are you sure codec has dai-tdm-slot-....?

Yes. Both CPU and and codecs have slots.

A classic case is a CPU with 2 codecs attached
Codec #0 plays slots 0,1
Codec #1 plays slots 2,3

CPU tx slots is       <1, 1, 1, 1>
Codec #0 rx slots is  <1, 1, 0, 0>
Codec #1 rx slots is  <0, 0, 1, 1>

>
>> +
>> +        required:
>> +          - sound-dai
>> +
>> +    required:
>> +      - sound-dai
>> +
>> +required:
>> +  - model
>> +  - dai-link-0
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    sound {
>> +        compatible = "amlogic,axg-sound-card";
>> +        model = "AXG-S420";
>> +        audio-aux-devs = <&tdmin_a>, <&tdmout_c>;
>> +        audio-widgets = "Line", "Lineout",
>> +                        "Line", "Linein",
>> +                        "Speaker", "Speaker1 Left",
>> +                        "Speaker", "Speaker1 Right",
>> +                        "Speaker", "Speaker2 Left",
>> +                        "Speaker", "Speaker2 Right";
>> +        audio-routing = "TDMOUT_C IN 0", "FRDDR_A OUT 2",
>> +                        "SPDIFOUT IN 0", "FRDDR_A OUT 3",
>> +                        "TDM_C Playback", "TDMOUT_C OUT",
>> +                        "TDMIN_A IN 2", "TDM_C Capture",
>> +                        "TDMIN_A IN 5", "TDM_C Loopback",
>> +                        "TODDR_A IN 0", "TDMIN_A OUT",
>> +                        "Lineout", "Lineout AOUTL",
>> +                        "Lineout", "Lineout AOUTR",
>> +                        "Speaker1 Left", "SPK1 OUT_A",
>> +                        "Speaker2 Left", "SPK2 OUT_A",
>> +                        "Speaker1 Right", "SPK1 OUT_B",
>> +                        "Speaker2 Right", "SPK2 OUT_B",
>> +                        "Linein AINL", "Linein",
>> +                        "Linein AINR", "Linein";
>> +
>> +        dai-link-0 {
>> +               sound-dai = <&frddr_a>;
>
> Use 4 spaces for example indentation.
>
>> +        };
>> +
>> +        dai-link-1 {
>> +               sound-dai = <&toddr_a>;
>> +        };
>
> Best regards,
> Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
