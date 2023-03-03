Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEAEC64EC4
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Mar 2023 08:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+kTPA743hFejvuYs6QyUM48aYDfHUcAvtLjSXLgIl2Y=; b=FHeQBHg3+WKBCC
	GncFUrKCthFw0lf48NhZO6wD/2arMpicViTV50PqNqMPoUpmUdUX5Fw1xYUp74E80OJmT2vKjbvx2
	r/Gspf67ul+vVv0yl+/qaql3AlPK1CZzTTG+Pb/Vo1uEd+AOVZBWzdhneho4xy8tLwYKKLG/JF1ke
	C2MeWTt2kXIZUTikB8eA4LLZnoydG/jX2LG8EF6iHIKApQoRx2J113SfsfNPaO8wKLPX6dH2DjWdC
	RRCkb9PFe6BTDePOEJNpusvxoqApQGQEk0WFKoWPWcLZa5JWtVj8KDe4A0TyrMmDBVxD91zoqDmm1
	j9D+z3fvJVKizQuo9zoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0mM-005OOF-BF; Fri, 03 Mar 2023 08:28:38 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0mB-005OL6-Au
	for linux-amlogic@lists.infradead.org; Fri, 03 Mar 2023 08:28:29 +0000
Received: by mail-ed1-x52f.google.com with SMTP id o12so7132577edb.9
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Mar 2023 00:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677832105;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NNoh7Y1eCqw1vILTrX20qgBsgHaoKEZRgMQ7Y2gIJPo=;
        b=TFZ/47LHMyE5A2PfNGsk2pMHpoLlfD+CLOyn7J57fS5+aqQBd8LdoKsTUkmufj55dZ
         5JG74u7zawpRBTIXLULjRMfc3ZLmuMtsA3Lu9I+fj5yLdMTt2Dpob2UzqK/vQ4fRF3Be
         Ohwpi7u2xVkLvopc0D0HwFEuR59z9yfiGUIxD6aNf4XRgOJTWbTRBMOcaM4bWtwP/Fxr
         IoX9rsGvL9/5IB0EDLyoDYeoAR7Tc/PL2YEVbfJUXOP9yFUIs6iFOANuDWqf6+XCOR/S
         gT4ggcGE+o+o7gvPLKH5+VXfkJkn+JVc29OEFdhZsVfRbO1//IknXAKmihP+kpjhxEt6
         /JPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677832105;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NNoh7Y1eCqw1vILTrX20qgBsgHaoKEZRgMQ7Y2gIJPo=;
        b=hdhgpoR+VQ1m1IZWbguh80BsMhN3RuSImqjzkChOUDBVrbSsgLAiZ5OP4A8qKpS9fS
         TtHEAGzEJYK6P0FIXBr2VMpOpO7f5lvVzSnNEA+RwmCvwcvBMbGoNl0uwefvQew8O7n1
         Lt+7EiYBrBKyRr8QchPET3YsNT5pg3j+nvkYLl6YIbxQ5Qo6pz4ndKOa7jQb3Q8sippP
         F+37naxVpWSUBAS5xy3N61P9AtvDBrrXCql0758dnKGqJXeSXFCRJeuVT3ghtbacX11z
         nYuL3GJArnVndPFClchvp2YErv/SphxIFiXoCi/OqyKlpsnIYkJicTKGhbc51ogAcRul
         gclg==
X-Gm-Message-State: AO0yUKUQWs3+D++dVTGALExOHjI+X5lPsV+V0wYr1F98smypAzbFk/Hb
	vdcGsJ5Vk8fpRUBTkOnXgybFzg==
X-Google-Smtp-Source: AK7set8JDCyuD/jVEdIdZMzgRpBie4AkpO5CKfVjB2ToMCxzT2bGHuZqG7hjF2gthEYJRlfjPM0geg==
X-Received: by 2002:a17:906:ee8d:b0:86f:d0c9:4bdd with SMTP id wt13-20020a170906ee8d00b0086fd0c94bddmr1115380ejb.27.1677832105526;
        Fri, 03 Mar 2023 00:28:25 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f21-20020a50d555000000b004c059535b43sm883895edj.31.2023.03.03.00.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 00:28:25 -0800 (PST)
Message-ID: <6a950a51-fe90-9163-b73d-0a396d7187ee@linaro.org>
Date: Fri, 3 Mar 2023 09:28:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 3/5] dt-bindings: clock: meson: add A1 PLL clock
 controller bindings
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, neil.armstrong@linaro.org,
 jbrunet@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230301183759.16163-1-ddrokosov@sberdevices.ru>
 <20230301183759.16163-4-ddrokosov@sberdevices.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230301183759.16163-4-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_002827_452333_12755A85 
X-CRM114-Status: GOOD (  17.16  )
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

On 01/03/2023 19:37, Dmitry Rokosov wrote:
> Add the documentation for Amlogic A1 PLL clock driver, and A1 PLL
> clock controller bindings.
> Also include new A1 clock controller dt bindings to MAINTAINERS.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  .../bindings/clock/amlogic,a1-pll-clkc.yaml   | 59 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  include/dt-bindings/clock/a1-pll-clkc.h       | 20 +++++++
>  3 files changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/a1-pll-clkc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> new file mode 100644
> index 000000000000..8bd2c948df86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,a1-pll-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson A/C serials PLL Clock Control Unit
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +  - Jian Hu <jian.hu@jian.hu.com>
> +  - Dmitry Rokosov <ddrokosov@sberdevices.ru>
> +
> +properties:
> +  compatible:
> +    const: amlogic,a1-pll-clkc
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: input fixpll_in
> +      - description: input hifipll_in
> +
> +  clock-names:
> +    items:
> +      - const: fixpll_in
> +      - const: hifipll_in
> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/a1-clkc.h>

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

> +    apb {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clock-controller@7c80 {
> +            compatible = "amlogic,a1-pll-clkc";
> +            reg = <0 0x7c80 0 0x18c>;
> +            #clock-cells = <1>;
> +            clocks = <&clkc_periphs CLKID_FIXPLL_IN>,
> +                     <&clkc_periphs CLKID_HIFIPLL_IN>;
> +            clock-names = "fixpll_in", "hifipll_in";
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 39ff1a717625..8438bc9bd636 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1895,6 +1895,7 @@ L:	linux-amlogic@lists.infradead.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/clock/amlogic*
>  F:	drivers/clk/meson/
> +F:	include/dt-bindings/clock/a1*
>  F:	include/dt-bindings/clock/gxbb*
>  F:	include/dt-bindings/clock/meson*
>  
> diff --git a/include/dt-bindings/clock/a1-pll-clkc.h b/include/dt-bindings/clock/a1-pll-clkc.h

Filename matching bindings, so amlogic,a1-pll-clkc.h

> new file mode 100644
> index 000000000000..3a559518c6e6
> --- /dev/null
> +++ b/include/dt-bindings/clock/a1-pll-clkc.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */

Any particular reason for using license other than in binding? Was it
intentional (e.g. because it is derivative work)?

> +/*
> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
> + * Author: Jian Hu <jian.hu@amlogic.com>
> + *
> + * Copyright (c) 2023, SberDevices. All Rights Reserved.
> + * Author: Dmitry Rokosov <ddrokosov@sberdevices.ru>


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
