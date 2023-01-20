Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBB7C05027
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Jan 2023 10:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dxt3U1dEMYOByiCi76AL+BnfB57jZWApGRHqi9UOs1Y=; b=yDheYXTltgfiTe
	9QGnk6Km0JJcZ+KQo5uM9br8Mpfjg355tPRxoNqdd+CF1KbvvfxRjidH1o+5HgaFvSQpCcuWMHpgm
	ccZM5zSjyPfmIt2hzoN2BZ1a5Xr8YReQqGVp23Dnrrpe34AZtqpj+6YjOwZD/0T3p/H4vhsLIJdxm
	vp1rVUGo7lnHaldXtANdiDsAYo5YFK0dxAQg403fui5ns17v77617+o7mcv/P4rfEnSKEO79CkxFr
	BFLBnw4LCKHl3iMwVfwwuzoOQv2ockuGmUbS3pJajsVUsJpTWmrp5PIYFYFIsw8Sqd2F9Sd8zxZuP
	wiiDeTirsJShf47fx1Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIoFA-009dxo-Jj; Fri, 20 Jan 2023 10:03:32 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pInuh-009TXE-6d
	for linux-amlogic@lists.infradead.org; Fri, 20 Jan 2023 09:42:25 +0000
Received: by mail-wr1-x431.google.com with SMTP id r9so4315291wrw.4
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Jan 2023 01:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=/gBJ3sFN5CxK6wYl6HVysdNUHMMHr2txe4LdApPF2Po=;
        b=xQdGezIY3CG4KYyGsbNqMw4mhk0P1QswC3K0Xe8FVKdCuFbd/gx0UUpcebZ2YyHzSH
         BSJpAdudEJLl8arWtZ/27pF3zzJ18bwocd6skg75Q1CxRoOr5yLs0owvdM6SIo0DOTy7
         i3WGt86zK/hEfr0LNotSuY5BFpSwmVYdtajiNCY4qrUky5XW3IeKCfW30CdCXrskxVgW
         rB61/EwdEeJ4rq+ZKw//GTjFrgpCY6pk/IGHclhaevpHr1dFOpYRN1rCMnu68pGTqAM2
         JFj264lHq6GIjIQhMYzvhCkx5iZJHeREPtTpWGJrpVzmwf76uUDGCdo0rIKs3YNtDo0e
         jkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gBJ3sFN5CxK6wYl6HVysdNUHMMHr2txe4LdApPF2Po=;
        b=QP6vacTqwNwbe6D7Y06PF7KX8cYI7bkcNgyaA0vsYYGYFjG4S2+0DEa1azHHN2qQLn
         fgWBzMyurET4lSYGplXZ6zQVPI+kqb0SKrug0TlMrXKvSw4Pn5DlOIxYDhzScium+uzc
         LbG42sNWHibq8kn7leJIe5fU+7LsCHwspyZnhEwpfbSts0CpZn33bzh2VPbrCCxhW4Hi
         +NQ0b+PxM9wm6ptnPHVSZn7t2wxb4yx1l/hspec1Ri4mN2qWyX9StOfjptv94N3fE3KY
         V+DZfN26JCyMBJHspjoeMrxcSHhcruBEtDi2W+gT4lujEtII2wZU7Z0WCpWmrHBKrYnV
         8E4Q==
X-Gm-Message-State: AFqh2kqrM4nLsvQZgtLL67aT+/eTKZwv0UaEP9cZ6UiBbVhFysaNokcy
	jWwzWaWc3eIGFdEn8fHgVUV0XA==
X-Google-Smtp-Source: AMrXdXsAm9JDrpxqZQeZF6jNE2Bb2hmU5RKfY53oOAjYb11owYPy49S8BpBP4v+Qa8803vn98g0ZZw==
X-Received: by 2002:a5d:6f15:0:b0:2bb:dcf9:482b with SMTP id ay21-20020a5d6f15000000b002bbdcf9482bmr14182202wrb.47.1674207740660;
        Fri, 20 Jan 2023 01:42:20 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id r10-20020adfda4a000000b0029a06f11022sm35720373wrl.112.2023.01.20.01.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 01:42:20 -0800 (PST)
References: <20230116074214.2326-1-yu.tu@amlogic.com>
 <20230116074214.2326-2-yu.tu@amlogic.com>
 <02b6b3a6-e2ad-8cbc-fa15-fbd2db6ada64@linaro.org>
 <7c0133a2-ea4d-645e-3df2-2bb832bbd498@amlogic.com>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Neil  Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
  Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: "kelvin . zhang" <Kelvin.Zhang@amlogic.com>, "qi . duan"
 <qi.duan@amlogic.com>
Subject: Re: [PATCH V6 1/3] dt-bindings: clock: document Amlogic S4 SoC PLL
 & peripheral clock controller
Date: Fri, 20 Jan 2023 10:37:36 +0100
In-reply-to: <7c0133a2-ea4d-645e-3df2-2bb832bbd498@amlogic.com>
Message-ID: <1j5yd1y22r.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_014223_347133_84B3EF32 
X-CRM114-Status: GOOD (  16.85  )
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


On Mon 16 Jan 2023 at 17:31, Yu Tu <yu.tu@amlogic.com> wrote:

> Hi Krzysztof,
> 	Thank you for your quick reply.
>
> On 2023/1/16 16:29, Krzysztof Kozlowski wrote:
>> [ EXTERNAL EMAIL ]
>> On 16/01/2023 08:42, Yu Tu wrote:
>>> Add the S4 PLL & peripheral clock controller dt-bindings in the s4 SoC
>>> family.
>>>
>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>> ---
>>>   .../clock/amlogic,s4-peripherals-clkc.yaml    | 104 ++++++++++++++
>>>   .../bindings/clock/amlogic,s4-pll-clkc.yaml   |  50 +++++++
>>>   MAINTAINERS                                   |   1 +
>>>   .../clock/amlogic,s4-peripherals-clkc.h       | 131 ++++++++++++++++++
>>>   .../dt-bindings/clock/amlogic,s4-pll-clkc.h   |  30 ++++
>>>   5 files changed, 316 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
>>>   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>>>   create mode 100644 include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>>>   create mode 100644 include/dt-bindings/clock/amlogic,s4-pll-clkc.h
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
>>> b/Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
>>> new file mode 100644
>>> index 000000000000..2deeff497754
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
>>> @@ -0,0 +1,104 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/amlogic,s4-peripherals-clkc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Amlogic Meson S serials Peripherals Clock Controller
>>> +
>>> +maintainers:
>>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>>> +  - Jerome Brunet <jbrunet@baylibre.com>
>>> +  - Yu Tu <yu.tu@amlogic.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: amlogic,s4-peripherals-clkc
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: input fixed pll div2
>>> +      - description: input fixed pll div2p5
>>> +      - description: input fixed pll div3
>>> +      - description: input fixed pll div4
>>> +      - description: input fixed pll div5
>>> +      - description: input fixed pll div7
>>> +      - description: input hifi pll
>>> +      - description: input gp0 pll
>>> +      - description: input mpll0
>>> +      - description: input mpll1
>>> +      - description: input mpll2
>>> +      - description: input mpll3
>>> +      - description: input hdmi pll
>>> +      - description: input oscillator (usually at 24MHz)
>>> +      - description: input external 32kHz reference (optional)
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: fclk_div2
>>> +      - const: fclk_div2p5
>>> +      - const: fclk_div3
>>> +      - const: fclk_div4
>>> +      - const: fclk_div5
>>> +      - const: fclk_div7
>>> +      - const: hifi_pll
>>> +      - const: gp0_pll
>>> +      - const: mpll0
>>> +      - const: mpll1
>>> +      - const: mpll2
>>> +      - const: mpll3
>>> +      - const: hdmi_pll
>>> +      - const: xtal
>>> +      - const: ext_32k
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
>>> +    #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
>>> +
>>> +    /* 32KHz reference crystal */
>>> +    ext_32k: ref32k {
>>> +        compatible = "fixed-clock";
>>> +        #clock-cells = <0>;
>>> +        clock-frequency = <32000>;
>>> +    };
>> This wasn't here before. Drop it. It is trivial and it is not needed to
>> illustrate your device bindings. All clock bindings use it...
>> 
>
> I'm fine with that. I don't know if Jerome agrees with that. Wait for
> him. See what he says.

This is a simple change related to your binding example.
Krzysztof is one of the DT maintainer. Please follow his recommendation.

>
>>> +
>>> +    clkc_periphs: clock-controller@fe000000 {
>>> +      compatible = "amlogic,s4-peripherals-clkc";
>>> +      reg = <0xfe000000 0x49c>;
>>> +      clocks = <&clkc_pll 3>,
>>> +              <&clkc_pll 13>,
>>> +              <&clkc_pll 5>,
>>> +              <&clkc_pll 7>,
>>> +              <&clkc_pll 9>,
>>> +              <&clkc_pll 11>,
>>> +              <&clkc_pll 17>,
>>> +              <&clkc_pll 15>,
>>> +              <&clkc_pll 25>,
>>> +              <&clkc_pll 27>,
>>> +              <&clkc_pll 29>,
>>> +              <&clkc_pll 31>,
>>> +              <&clkc_pll 20>,
>>> +              <&xtal>,
>>> +              <&ext_32k>;
>>> +      clock-names = "fclk_div2", "fclk_div2p5", "fclk_div3", "fclk_div4",
>>> +                    "fclk_div5", "fclk_div7", "hifi_pll", "gp0_pll",
>>> +                    "mpll0", "mpll1", "mpll2", "mpll3", "hdmi_pll", "xtal",
>>> +                    "ext_32k";
>>> +      #clock-cells = <1>;
>>> +    };
>>> +...
>>> diff --git
>>> a/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>>> b/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>>> new file mode 100644
>>> index 000000000000..aeda4861cebe
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>>> @@ -0,0 +1,50 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/amlogic,s4-pll-clkc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Amlogic Meson S serials PLL Clock Controller
>>> +
>>> +maintainers:
>>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>>> +  - Jerome Brunet <jbrunet@baylibre.com>
>>> +  - Yu Tu <yu.tu@amlogic.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: amlogic,s4-pll-clkc
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: xtal
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
>>> +    clkc_pll: clock-controller@fe008000 {
>>> +      compatible = "amlogic,s4-pll-clkc";
>>> +      reg = <0xfe008000 0x1e8>;
>>> +      clocks = <&xtal>;
>>> +      clock-names = "xtal";
>>> +      #clock-cells = <1>;
>>> +    };
>>> +
>>> +...
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index f61eb221415b..26c82beeffda 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1897,6 +1897,7 @@ L:	linux-amlogic@lists.infradead.org
>>>   S:	Maintained
>>>   F:	Documentation/devicetree/bindings/clock/amlogic*
>>>   F:	drivers/clk/meson/
>>> +F:	include/dt-bindings/clock/amlogic*
>>>   F:	include/dt-bindings/clock/gxbb*
>>>   F:	include/dt-bindings/clock/meson*
>>>   diff --git a/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>>> b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>>> new file mode 100644
>>> index 000000000000..bbec5094d5c3
>>> --- /dev/null
>>> +++ b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>>> @@ -0,0 +1,131 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>> Unusual license... are you sure to license the bindings under GPLv4 or
>> GPLv5? Fine by me.
>> 
>
> Yes.
>
>> Best regards,
>> Krzysztof
>> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
