Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B36CDB47E
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Oct 2023 07:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZSqKHGzHJpxifQDIhKTLKYZurTGDccwZiJyw4oM2jOA=; b=JL+tgOL7vWs3eb
	VkCyg8KImV5Hq7cNrZl54jTip67gUU5SCVezH+yGZ92TzDLK1L796fWNx9o+njgBbM06b2f0jOwAJ
	LRpy9NUhOzL36qKORJ0v4ykfWj5MdV4ZxGcgtEmWklmx78a3/qXKrzcxdVE/uqwnn2ilEVQNIm7ru
	kh0IHiMWMPNkxmgwqxkt97kcMod1/aM6aNDHwf4zfaW5k6XvAfeuaPOUaCSU8DJk7WTPrZNKI6yLb
	mA5U0yP7jpC4sHjKltyyCAtYoX23iKdMV7fCNABH+iV3E1ZM1seMV65vIuyDXE1VFnpLdHD4NvIVd
	TGqJBpEHF9AgK8zMyW/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrCjT-002izT-2d;
	Fri, 13 Oct 2023 07:37:15 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrCjQ-002iyD-0S
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Oct 2023 07:37:14 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-307d58b3efbso1537481f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Oct 2023 00:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697182628; x=1697787428; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=QwkBCdmPcWNU+7PsxxS80Z7HY5APZAn6IaUDRF9z/7g=;
        b=e6nMCAPrxrXZyax8FOkZbgk9iWKoxV52NHmA5lLSn6oqEnAQbbTCaSx12aV28cPAKh
         h3N7R2kVniYshKD85im5rXEDhKTCwBLkPBzBb9aTooFCRV6W4PuJfR4p8EpnmbS4st8v
         sWunbUnw2DCdGfNpX285g1e3fcsH7RwELs8co9mRu+qVakMZXayXsWmayPS30V4rpaWD
         IRHKlqvgHu9E5zEgUYjDPQSHIArCgz7oIFpot8+q5Gq8WuL6BE+rKFG4XULh2KGOW+aS
         zdvYxLZYage+BmYN8pWO3n1tckfpvuBCnFSvq9U7XyxFm5FpAsUbsQPwNq4STJ4+s6kS
         VINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697182628; x=1697787428;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwkBCdmPcWNU+7PsxxS80Z7HY5APZAn6IaUDRF9z/7g=;
        b=jC5vZkyVTq9LRslv7qCnoJD3MCw/kTBuM20HrGoHCvNKAWgvKlryubRcAiC+GdC3hU
         v75ZnOcxQ4tLVeDNIRXhmCr2tBdqg20e/3IRYq2trrigmcOyn7bTnl0yz0IbgmU8Djf0
         K3G5yMm96+bQpDOdiRtABQVZ/9xE6/0SjZ/z4v/i7gG+/W4nk+Apx5OBDSDUQaQmAuhO
         HVWv1/zqGbPYrEIJRLaH6e7z5gSs3ng5trgbRplZ0TIGXMlPkYpE/cLlgXMt0fNuVjKo
         HH82qC3nG6wDTNfmveZysm/UhvaKLMJLS4hhui4Xz6a1KV6W1QzgY7oNRjSg8vA42gKc
         nDLg==
X-Gm-Message-State: AOJu0Yw4WVZhVkqKoFKp6qJX9zh8Mi5kGDkEbX4pHy/U5HnTeEzBJRzg
	z2dSfyK0jAdUrojdQnR7ASQ/8g==
X-Google-Smtp-Source: AGHT+IF47D5nfuOO1fNDgKrLpZfZIR3LU3/kd21Io+xC0N4oet37n+Sg+1yz+OLQlDvBMZndbRb35Q==
X-Received: by 2002:a05:6000:5c6:b0:32d:5870:8b8a with SMTP id bh6-20020a05600005c600b0032d58708b8amr9030172wrb.56.1697182627837;
        Fri, 13 Oct 2023 00:37:07 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b50c:c5d5:8b1b:e06d])
        by smtp.gmail.com with ESMTPSA id r6-20020a5d4946000000b0032da022855fsm235205wrs.111.2023.10.13.00.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 00:37:07 -0700 (PDT)
References: <20231010062917.3624223-1-xianwei.zhao@amlogic.com>
 <20231010062917.3624223-2-xianwei.zhao@amlogic.com>
 <20231010132151.GA557938-robh@kernel.org>
 <291f03f9-72aa-2842-b44a-c88c812df4f1@amlogic.com>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chuan Liu
 <chuan.liu@amlogic.com>
Subject: Re: [PATCH V2 1/4] dt-bindings: clock: add Amlogic C3 PLL clock
 controller bindings
Date: Fri, 13 Oct 2023 09:35:26 +0200
In-reply-to: <291f03f9-72aa-2842-b44a-c88c812df4f1@amlogic.com>
Message-ID: <1jr0lzvuql.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_003712_185103_1D33BBB2 
X-CRM114-Status: GOOD (  15.92  )
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


On Wed 11 Oct 2023 at 10:50, Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:

> Hi Rob,
>     Thanks for your advise.
>
> On 2023/10/10 21:21, Rob Herring wrote:
>> [ EXTERNAL EMAIL ]
>> On Tue, Oct 10, 2023 at 02:29:14PM +0800, Xianwei Zhao wrote:
>>> Add the C3 PLL clock controller dt-bindings for Amlogic C3 SoC family
>>>
>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>> ---
>>> V1 -> V2: Fix errors when check dtbinding use "make dt_binding_check"
>> Your patches aren't bisectable. It's fine if you want to combine patch 1
>> and 2 into 1 patch. Or just use the raw numbers here instead of the
>> header.
>> 
> I will combine patch 1 and 2 into 1 patch in V3.

I'd prefer if you used raw ids or even fake node for the example, like
<&pll_in> and <&mpll_in> for readability, rather than combining the patches

>>> ---
>>>   .../bindings/clock/amlogic,c3-pll-clkc.yaml   | 59 +++++++++++++++++++
>>>   .../dt-bindings/clock/amlogic,c3-pll-clkc.h   | 42 +++++++++++++
>>>   2 files changed, 101 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml
>>>   create mode 100644 include/dt-bindings/clock/amlogic,c3-pll-clkc.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml
>>> new file mode 100644
>>> index 000000000000..a646992917b7
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml
>>> @@ -0,0 +1,59 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +# Copyright (C) 2022-2023 Amlogic, Inc. All rights reserved
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/amlogic,c3-pll-clkc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Amlogic C3 serials PLL Clock Controller
>> s/serials/Serials/
>> 
> Will fix
>>> +
>>> +maintainers:
>>> +  - Chuan Liu <chuan.liu@amlogic.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: amlogic,c3-pll-clkc
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    minItems: 1
>>> +    items:
>>> +      - description: input pll_in
>>> +      - description: input mclk_pll_in
>>> +
>>> +  clock-names:
>>> +    minItems: 1
>>> +    items:
>>> +      - const: pll_in
>>> +      - const: mclk_pll_in
>>> +
>>> +  "#clock-cells":
>>> +    const: 1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - clocks
>>> +  - clock-names
>>> +  - "#clock-cells"
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/amlogic,c3-peripherals-clkc.h>
>>> +    apb {
>>> +        #address-cells = <2>;
>>> +        #size-cells = <2>;
>>> +
>>> +        clkc_pll: clock-controller@8000 {
>> Drop unused labels.
>> 
> Will delete clkc_pll.
>>> +          compatible = "amlogic,c3-pll-clkc";
>> Your indentation is not consistent.
>> 
> Will fix it in V3.
>>> +          reg = <0x0 0x8000 0x0 0x1a4>;
>>> +          clocks = <&clkc_periphs CLKID_PLL_IN>,
>>> +                   <&clkc_periphs CLKID_MCLK_PLL_IN>;
>>> +          clock-names = "pll_in", "mclk_pll_in";
>>> +          #clock-cells = <1>;
>>> +        };
>>> +    };
>>> diff --git a/include/dt-bindings/clock/amlogic,c3-pll-clkc.h b/include/dt-bindings/clock/amlogic,c3-pll-clkc.h
>>> new file mode 100644
>>> index 000000000000..aa731e8fae29
>>> --- /dev/null
>>> +++ b/include/dt-bindings/clock/amlogic,c3-pll-clkc.h
>>> @@ -0,0 +1,42 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>>> +/*
>>> + * Copyright (c) 2023 Amlogic, Inc. All rights reserved.
>>> + * Author: Chuan Liu <chuan.liu@amlogic.com>
>>> + */
>>> +
>>> +#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_C3_PLL_CLKC_H
>>> +#define _DT_BINDINGS_CLOCK_AMLOGIC_C3_PLL_CLKC_H
>>> +
>>> +#define CLKID_FIXED_PLL_DCO                  0
>>> +#define CLKID_FIXED_PLL                              1
>>> +#define CLKID_FCLK_DIV40_DIV                 2
>>> +#define CLKID_FCLK_DIV40                     3
>>> +#define CLKID_FCLK_DIV2_DIV                  4
>>> +#define CLKID_FCLK_DIV2                              5
>>> +#define CLKID_FCLK_DIV2P5_DIV                        6
>>> +#define CLKID_FCLK_DIV2P5                    7
>>> +#define CLKID_FCLK_DIV3_DIV                  8
>>> +#define CLKID_FCLK_DIV3                              9
>>> +#define CLKID_FCLK_DIV4_DIV                  10
>>> +#define CLKID_FCLK_DIV4                              11
>>> +#define CLKID_FCLK_DIV5_DIV                  12
>>> +#define CLKID_FCLK_DIV5                              13
>>> +#define CLKID_FCLK_DIV7_DIV                  14
>>> +#define CLKID_FCLK_DIV7                              15
>>> +#define CLKID_GP0_PLL_DCO                    16
>>> +#define CLKID_GP0_PLL                                17
>>> +#define CLKID_HIFI_PLL_DCO                   18
>>> +#define CLKID_HIFI_PLL                               19
>>> +#define CLKID_MCLK_PLL_DCO                   20
>>> +#define CLKID_MCLK_PLL                               21
>>> +#define CLKID_MCLK_PLL_CLK                   22
>>> +#define CLKID_MCLK0_SEL                              23
>>> +#define CLKID_MCLK0_SEL_OUT                  24
>>> +#define CLKID_MCLK0_DIV                              25
>>> +#define CLKID_MCLK0                          26
>>> +#define CLKID_MCLK1_SEL                              27
>>> +#define CLKID_MCLK1_SEL_OUT                  28
>>> +#define CLKID_MCLK1_DIV                              29
>>> +#define CLKID_MCLK1                          30
>>> +
>>> +#endif  /* _DT_BINDINGS_CLOCK_AMLOGIC_C3_PLL_CLKC_H */
>>>
>>> base-commit: 57b55c76aaf1ba50ecc6dcee5cd6843dc4d85239
>>> --
>>> 2.37.1
>>>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
