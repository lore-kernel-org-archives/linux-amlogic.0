Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C552C77B7A
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 May 2023 18:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pcYlKkH6Adv9b7jnGydrXoBh1O8dgSonDQWWi6PfaKg=; b=dmqWkczzY+Mkn2
	T9W57QBdg1PrUsBffDA/RxtTPUjKZBOOgl1uaEl1NqxDdSFvksPxip5jBFZcZX879AssHTlvYcfG1
	vTsJCEzPocGj1X8apSAd91LjCMOTIOF94m9aH7NvziLxTMe+ve1drrzMxM89WfYAk4unOCBBa2ipl
	rUczUzabn7KmRWE3xoANTay3WqLLJLkwi6+so10xkHn3+vgF5GJGNNIu5AOouOiHLDxcmOQRCofaw
	s+4dxp1V8JJk06SSQp0ZnsW+zfv8IHMde7sSkCFtXliqOIFwtBTUFdxEVebHWh4/2VbPaceLrHqsx
	e1Kf1JhgU0Dkj9ypMyWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxu2N-00FaJM-0M;
	Sat, 13 May 2023 18:32:11 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxu2K-00FaI3-26
	for linux-amlogic@lists.infradead.org;
	Sat, 13 May 2023 18:32:10 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-96b0235c10bso19001266b.3
        for <linux-amlogic@lists.infradead.org>; Sat, 13 May 2023 11:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684002726; x=1686594726;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c6owmun2vUtEZB5TOq0wkGp9DGK60/+9Z1ayq9n03Xc=;
        b=hhHHv5WrwPvBhaZFdIPSYJ+Jmoii6SjBu9RgdknR/t3A9a/M7OrKPvapzvZsQZGO2y
         Gy92hotVu5kusAnWhXWRQyMG97KTjoAl/VB6nG5qejmgRTAxWP6LDUhkYsxDsg2D1OoE
         xGg462JkwPlJ0tUXplsWebMSfPDXRO2itFBc7//5hSmhXKVwUBe5RbPRdWDbJmnal4OJ
         PdSrNmefKHCD9C1K+/GQPai9nqJZthC6jjeaO5TQZj4MSSM2rb2oGn/SbiI07L406HJz
         fehwp3yivQ1NCF2rR0GkoPq0M6F+tJR9UoCuOAORXfCcr+WrA/lCEHZ+86tge2DTdh3E
         dg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684002726; x=1686594726;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c6owmun2vUtEZB5TOq0wkGp9DGK60/+9Z1ayq9n03Xc=;
        b=lru8qOjaHs65nwuofQmsDyp/YT9pBofIDQXXHUPUwICv0W2fGAUDZzp+T9xNyD/3jD
         XIA/BNfpQ64QqTIe2KU1832lmaDUxa82ibd+M+xVAyUN6wMMeqGXUhzaRaSkrQUG07lg
         bSJmEKOLmpV5EBfq4rKbzdK7v5oO7C664l9PRT/7KHUJov5jAdjSKT4bbpffgh0Wnj3K
         0jijD7/GAk+9r4w+MFHJjajFVSkBPz23P5uhBi/ztCncr/z/VF/9LFXlOBlmn0OeliyX
         pi/K8Edc/EzmJmEXcuHtJXa3szqqLwxasLUGRJeWIbYtB4tVqjafOPliL3U9FHH+rNeQ
         7olg==
X-Gm-Message-State: AC+VfDwhgufcoQJjo41seDoi2eCRURf1v7vHB9F/qIxhdtnydhQoSngX
	rJr7xXNZcNzNFZLxUp9wjRAO9g==
X-Google-Smtp-Source: ACHHUZ6/MJmpQfYL6g1FK30ruhqexm9LOEc7dgLzIBfHIjDo/z+aM8STzBTfNpMl4RM6pAkC6SjPjg==
X-Received: by 2002:a17:907:628c:b0:94f:2a13:4e01 with SMTP id nd12-20020a170907628c00b0094f2a134e01mr26298987ejc.74.1684002726245;
        Sat, 13 May 2023 11:32:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ba68:e5c9:694e:c6e4? ([2a02:810d:15c0:828:ba68:e5c9:694e:c6e4])
        by smtp.gmail.com with ESMTPSA id ml17-20020a170906cc1100b009661484e84esm7099003ejb.191.2023.05.13.11.32.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 11:32:05 -0700 (PDT)
Message-ID: <fe2f22c7-8c39-faf3-bc65-a7c089200134@linaro.org>
Date: Sat, 13 May 2023 20:32:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 04/13] dt-bindings: display: add Amlogic MIPI DSI Host
 Controller bindings
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: Nicolas Belin <nbelin@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-4-2592c29ea263@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-4-2592c29ea263@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230513_113208_701168_8836FF8A 
X-CRM114-Status: GOOD (  18.31  )
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

On 12/05/2023 15:11, Neil Armstrong wrote:
> The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI Glue
> on the same Amlogic SoCs.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586

Subject: drop second/last, redundant "bindings". The "dt-bindings"
prefix is already stating that these are bindings.

> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../display/amlogic,meson-g12a-dw-mipi-dsi.yaml    | 117 +++++++++++++++++++++
>  1 file changed, 117 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml
> new file mode 100644
> index 000000000000..8169c7e93ff5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2020 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/amlogic,meson-g12a-dw-mipi-dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic specific extensions to the Synopsys Designware MIPI DSI Host Controller
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +description: |
> +  The Amlogic Meson Synopsys Designware Integration is composed of
> +  - A Synopsys DesignWare MIPI DSI Host Controller IP
> +  - A TOP control block controlling the Clocks & Resets of the IP
> +
> +allOf:
> +  - $ref: dsi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-g12a-dw-mipi-dsi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 3

Missing maxItems

> +
> +  clock-names:
> +    minItems: 3
> +    items:
> +      - const: pclk
> +      - const: bit_clk
> +      - const: px_clk
> +      - const: meas_clk

Drop _clk suffixes. pclk can stay, it's a bit odd but recently Rob
clarified that suffix with underscore should not be there.

> +
> +  resets:
> +    minItems: 1

maxItems instead

> +
> +  reset-names:
> +    items:
> +      - const: top
> +
> +  phys:
> +    minItems: 1

Ditto

> +
> +  phy-names:
> +    items:
> +      - const: dphy
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input node to receive pixel data.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: DSI output node to panel.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - phys
> +  - phy-names
> +  - ports
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    dsi@7000 {
> +          compatible = "amlogic,meson-g12a-dw-mipi-dsi";
> +          reg = <0x6000 0x400>;

Your reg does not match unit address. The dt_binding_check should
actually complain about it.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
