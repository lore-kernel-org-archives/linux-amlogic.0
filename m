Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF16C4345F
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Apr 2024 14:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qKYEdsvvOTqloPaQA+bhBDnIJjwOdDKOuL2bSRn/qLA=; b=KEYOHAR+wfJc4U
	clvh4Rp4LkfT29/n5lHdXBWXEskjoUMMwnSfZre7BRTBAMtj/bu8iyjV5X5lQflO5S74eVdnspUzm
	ejIizjzBpKAf10vKyO03tVa4M4w9P61p1iwppa/vd5AsAkYyrQqO20gzNKty+z4mqHMxK5hiRAZE6
	M22pqu80AT32htycfJasdIE/hxRPXrC+iYK11GFCQPXvnHIGYSfWIuyDu2Hy5AxE+ZKh3qaMf/ApE
	bS/PSGocTtng4UReqyLasI2x2RD9hb2jyzjWmwBXJWkMMyxtquWHImKMO5t2aJ4BlV4fOuBAjrNjn
	qzAYMgZ0Skgc/YFOYpLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxoso-00000005t71-2NkT;
	Fri, 19 Apr 2024 14:06:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxosh-00000005t41-3s10;
	Fri, 19 Apr 2024 14:06:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 57D81619D9;
	Fri, 19 Apr 2024 14:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F94C072AA;
	Fri, 19 Apr 2024 14:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713535583;
	bh=4UGNFSgesygAGdY3+MGHMKJc99PPaLznLJdQZQ/rwtE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ZYqlq4Z74AjyMmlDE49kSVz2iBj4zc10qPrwK1niIt1XzFW9efJG5QID/x9MmV/fQ
	 1H1hSWoRVpAmxbtOjlN+Gq5Lw0opN0UePuVWeI8wKOdXzndVs3oB1VM1OgCsiIGzm+
	 MFyt6NDNXY1TTCbecb0yhNyp8/tQw4l7rapi9xH0nav5Wqp0eDHmWrMJvAS88jbzce
	 U77U+IIWp49aSViR8mtCju3xYcBsItij8R9HAHSlTbPaRDQhMhurAGaZfFYIjG/IKM
	 R02ux3aoppqb0odbH9kGMXrC14zMuni5NffggDIKFu9THKWoZz/ME1eBLOKL45e+Rh
	 El/wI83RyLjOw==
Message-ID: <07b1ca57-49a0-4151-99bf-caac053eaa01@kernel.org>
Date: Fri, 19 Apr 2024 16:06:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 4/6] dt-bindings: clock: meson: document A1 SoC
 audio clock controller driver
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jiucheng Xu
 <jiucheng.xu@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240419125812.983409-1-jan.dakinevich@salutedevices.com>
 <20240419125812.983409-5-jan.dakinevich@salutedevices.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240419125812.983409-5-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_070624_322023_9AD19C3D 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

On 19/04/2024 14:58, Jan Dakinevich wrote:
> Add device tree bindings for A1 SoC audio clock and reset controllers.
> 
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>

This is still RFC, so not ready.

Limited, incomplete review follows. Full review will be provided when
the work is ready.

Drop "driver" references, e.g. from subject. Bindings are about hardware.


....

> +
> +  clocks:
> +    maxItems: 26
> +    items:
> +      - description: input main peripheral bus clock
> +      - description: input dds_in
> +      - description: input fixed pll div2
> +      - description: input fixed pll div3
> +      - description: input hifi_pll
> +      - description: input oscillator (usually at 24MHz)
> +    additionalItems:
> +      oneOf:
> +        - description: slv_sclk[0-9] - slave bit clocks provided by external components
> +        - description: slv_lrclk[0-9]- slave sample clocks provided by external components

What does it mean the clocks are optional? Pins could be not routed?
It's really rare case that clocks within the SoC are optional, so every
such case is questionable.


> +
> +  clock-names:
> +    maxItems: 26
> +    items:
> +      - const: pclk
> +      - const: dds_in
> +      - const: fclk_div2
> +      - const: fclk_div3
> +      - const: hifi_pll
> +      - const: xtal
> +    additionalItems:
> +      oneOf:
> +        - pattern: "^slv_sclk[0-9]$"
> +        - pattern: "^slv_lrclk[0-9]$"
> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: amlogic,a1-audio-clkc
> +    then:
> +      required:
> +        - '#reset-cells'
> +    else:
> +      properties:
> +        '#reset-cells': false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
> +    #include <dt-bindings/clock/amlogic,a1-peripherals-clkc.h>
> +    #include <dt-bindings/clock/amlogic,a1-audio-clkc.h>
> +    audio {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clkc_audio: clock-controller@fe050000 {
> +                compatible = "amlogic,a1-audio-clkc";
> +                reg = <0x0 0xfe050000 0x0 0xb0>;
> +                #clock-cells = <1>;
> +                #reset-cells = <1>;
> +                clocks = <&clkc_audio_vad AUD_CLKID_VAD_AUDIOTOP>,
> +                         <&clkc_periphs CLKID_DDS_IN>,
> +                         <&clkc_pll CLKID_FCLK_DIV2>,
> +                         <&clkc_pll CLKID_FCLK_DIV3>,
> +                         <&clkc_pll CLKID_HIFI_PLL>,
> +                         <&xtal>;
> +                clock-names = "pclk",
> +                              "dds_in",
> +                              "fclk_div2",
> +                              "fclk_div3",
> +                              "hifi_pll",
> +                              "xtal";

Make it complete - list all clocks.

> +        };
> +
> +        clkc_audio_vad: clock-controller@fe054800 {

Just keep one example. It's basically almost the same.



Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
