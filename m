Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBE5C77B75
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 May 2023 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtgBC229Gvv4oq6DuXclAkuMWL6l0h2x2kdiXM1aYrk=; b=e7GxYhx2VHQi/qyqmU2/MVjvMh
	gpq0Qt/AONnppXKbsvcFCxHDk+vlws8qOv2ucqBot/YGcVZhxH9F2Hq8CrqAvm/7wfUcZlzpmqZsw
	nY7PdmrLhl/mX321g3EXxNOcGFA7wEU91Rv/XPFgYBaPIPLt/zcDhfdQ90Tgp0SoIX1t+ERGEjQ7r
	S3lSa218qhr1F4wXRiqTMYsYaXohCRVTCjgoZBmBT102wm3aVLZ+HCiQzE7iSmzGm2YTmkyk5U+eF
	7DZAopS67944DpvHeMRaxbSj44GWv/nPC1EF2FxFZ9VGQDku4kX5UGy+f5XSZx9UMgH/ZLuhd78r2
	rGhbkOIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyarm-002ifT-0x;
	Mon, 15 May 2023 16:16:06 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyari-002icz-2c
	for linux-amlogic@lists.infradead.org;
	Mon, 15 May 2023 16:16:04 +0000
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f41d087b24so69577755e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 15 May 2023 09:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684167359; x=1686759359;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1eFh76R1BbOhO7jbuJiT5KDrPf1DGlfPfXIlsfDDt+0=;
        b=Qv3cGYa1MY+UApUS2SSzI8upM2KLcv3RozBn7O9YHN7jVF9JvR6Xtzh/HsxdeeQ3yR
         muaB380CPeNT2SzmI+tdjxVBFzpD82fzmUKbwNM0On0PeinadnmlPDcenRkcwfWdUnUp
         UAkshoNmew207+QEZf4lCTKuxIz3KsgnE6rCmbfPaIra7sUcQzCvyh3yqG2/HL24/dME
         VFiqLCpzE83ceqYZ54ZRrVYANzujLXdqUJaqC+1HNEgJKMbWDc1LEVu2t69MHmabcnAm
         atsE3Got5Aq9sKrefAiOXern0fE4uwFPh5uMlKirIIBr6kx2kN0pzRQ+7HtB0D+Z/yBT
         Y3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684167359; x=1686759359;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1eFh76R1BbOhO7jbuJiT5KDrPf1DGlfPfXIlsfDDt+0=;
        b=H46u13hXqiSNy6jkLUnjsUs/cHVLSqp/Iq1ZYieBHVbgF/t1NKDUO+kP18uWFJN+J1
         1KAzPEG72yzde3J4ywCXlYbLWwYZFL/9gVJbCYSC4EVE4XReltrRLYJoIL+ZuNpd5WHi
         efHdqU8smKrbUVCTfHT51UyJEh4pmgR/Ip/rHkA9Z6kDiHMDGhwYgbeeVsLl8evG0sBy
         ogpxUzmKCnQxJBBtRod1Pj/zGMKooLju/1oVkeesyPo/VQXkpMTVHQdnmZviICXo9w/W
         ZCf35YCKY71Ly7MV9fl5+nJj8GQ+kDvystpsd436HG6MhX1CY0h1iqOhiOP+IH92qSkU
         GkLQ==
X-Gm-Message-State: AC+VfDwpKDRRxNX/ncXJO2zh/+r5S5qKt+F5+2YiVYqrbkbP9IkAth6g
	fT/B3aHJJIH4Si5pWR43DdcOug==
X-Google-Smtp-Source: ACHHUZ5wgr21VVtcT7Q5D+SElbddLchkhKpg+bRM3EH8a2/Wwegv+h0BQcv4jrbuguVShjaWyjs2yw==
X-Received: by 2002:a1c:7412:0:b0:3f4:298f:4d01 with SMTP id p18-20020a1c7412000000b003f4298f4d01mr16772932wmc.26.1684167359358;
        Mon, 15 May 2023 09:15:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ee7:a396:6195:bb56? ([2a01:e0a:982:cbb0:ee7:a396:6195:bb56])
        by smtp.gmail.com with ESMTPSA id f24-20020a1cc918000000b003f0ad8d1c69sm37288889wmb.25.2023.05.15.09.15.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 09:15:58 -0700 (PDT)
Message-ID: <eaa3ecd0-dcf0-01d8-b3ea-9dd900215839@linaro.org>
Date: Mon, 15 May 2023 18:15:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 04/13] dt-bindings: display: add Amlogic MIPI DSI Host
 Controller bindings
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
 <fe2f22c7-8c39-faf3-bc65-a7c089200134@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <fe2f22c7-8c39-faf3-bc65-a7c089200134@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_091602_850463_E97C22F4 
X-CRM114-Status: GOOD (  22.07  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 13/05/2023 20:32, Krzysztof Kozlowski wrote:
> On 12/05/2023 15:11, Neil Armstrong wrote:
>> The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
>> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI Glue
>> on the same Amlogic SoCs.
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586

This message may be automatic, but context is always important when reviewing,
this commit message is a re-spin on v3 that was reviewed by rob but I decided to remove the review
tags since I added a new clock and did some other cleanups.

While the process describes "how the patch itself *should* be formatted", it's a best effort
and not a blocker.

I'll fix the wrapping since you pointed out, but referring to the submitting-patches.rst
file (from a very old v5.18-rc4 version) is kind of childish.

> 
> Subject: drop second/last, redundant "bindings". The "dt-bindings"
> prefix is already stating that these are bindings.
> 
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../display/amlogic,meson-g12a-dw-mipi-dsi.yaml    | 117 +++++++++++++++++++++
>>   1 file changed, 117 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml
>> new file mode 100644
>> index 000000000000..8169c7e93ff5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml
>> @@ -0,0 +1,117 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +# Copyright 2020 BayLibre, SAS
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/amlogic,meson-g12a-dw-mipi-dsi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic specific extensions to the Synopsys Designware MIPI DSI Host Controller
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +
>> +description: |
>> +  The Amlogic Meson Synopsys Designware Integration is composed of
>> +  - A Synopsys DesignWare MIPI DSI Host Controller IP
>> +  - A TOP control block controlling the Clocks & Resets of the IP
>> +
>> +allOf:
>> +  - $ref: dsi-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - amlogic,meson-g12a-dw-mipi-dsi
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 3
> 
> Missing maxItems

Ack

> 
>> +
>> +  clock-names:
>> +    minItems: 3
>> +    items:
>> +      - const: pclk
>> +      - const: bit_clk
>> +      - const: px_clk
>> +      - const: meas_clk
> 
> Drop _clk suffixes. pclk can stay, it's a bit odd but recently Rob
> clarified that suffix with underscore should not be there.

Ack

> 
>> +
>> +  resets:
>> +    minItems: 1
> 
> maxItems instead

Ack

> 
>> +
>> +  reset-names:
>> +    items:
>> +      - const: top
>> +
>> +  phys:
>> +    minItems: 1
> 
> Ditto

Ack

> 
>> +
>> +  phy-names:
>> +    items:
>> +      - const: dphy
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Input node to receive pixel data.
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: DSI output node to panel.
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +  - phys
>> +  - phy-names
>> +  - ports
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    dsi@7000 {
>> +          compatible = "amlogic,meson-g12a-dw-mipi-dsi";
>> +          reg = <0x6000 0x400>;
> 
> Your reg does not match unit address. The dt_binding_check should
> actually complain about it.

Well, it doesn't, will fix

Thanks,
Neil

> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
