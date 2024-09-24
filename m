Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83051CF9C6B
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2024 09:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XszAgNx84rGWqiFE7J6S5IP0HQGwhs76O+Tv8fpNG88=; b=XdZ4HXeerCMI2L
	lqtPKr4RQZ1X9+BhU4dDetvuzTINNDdKO8wsuStvo1ZVgTJ8Szr/ggzgti84MWet+yeMhpPUKbymF
	Uttc5pLTcfwhyCGNb1ovKC0ghc48p1+NHwIG+d+VOVEdQ5ljBPAevp7TS9Y45lNmyaTzOu9CTjDM4
	FjH+ybxuVH3KMnC7ODHpmZ2zo4O8CS+mg3iFuYh7y4Ob9E3UMAzTT0PSq/plnRXu1NEzqWTBBm2dx
	+RXjpQfRYv9xtYWCxPPyzac/IQx19gYUvO8I0L1aXM6hjDYomUXbj+muNvVcz2sKQdAmtnPm8rfxY
	bTwpeeEfnU+qBM24E8cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st1gl-00000001lj5-0Y5g;
	Tue, 24 Sep 2024 09:18:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st1gi-00000001lhv-3gqz;
	Tue, 24 Sep 2024 09:18:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3713B5C5740;
	Tue, 24 Sep 2024 09:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DCF8C4CEC5;
	Tue, 24 Sep 2024 09:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727169507;
	bh=pN30MXgNTMZzoPVWBePwvf9D4eXRBCcLLbOa8I8Cew0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HEflUu9Ndq28Rb1X+YLgRa/Jabxwf9wTMs2iBS3b6ERa7ny6Gjo17THqNzWiXZEXi
	 glkjl132IGbmFozdqvKpFWCFCuQgGVdjB3inDKNBfgatfoxcA23wNlEFSW8G5hRSMf
	 8LIYv8IK4uNhW+2gF6v/00nP+eGH7eC0Wr7WVtcUqpoHL2SiKAUXWrhXRlJhOWZ8pr
	 /a+pXkI2Nz2EJepVEkhkbddQ/AvPHe5J7gg3sgD/xvyHPhtiHHDbuvYACOE7ckNN9V
	 JNVzU2vI8ns4ClKmEn9zYcnmrJ+RP0mV009AB7mD19N2oiCKbpHp1+CSbV6E5fm8Lk
	 jlOv0mh2rYZ4w==
Date: Tue, 24 Sep 2024 11:18:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: mmc: convert
 amlogic,meson-mx-sdio.txt to dtschema
Message-ID: <mbc2cacow73vmwn3w42aucq6x6xijbpgustkv3v6etgv35xih7@truf2rbgf3vo>
References: <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-0-5aa8bdfe01af@linaro.org>
 <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-3-5aa8bdfe01af@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-3-5aa8bdfe01af@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_021829_074626_64ED318F 
X-CRM114-Status: GOOD (  11.66  )
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

On Fri, Sep 20, 2024 at 10:38:05AM +0200, Neil Armstrong wrote:
> Convert the Amlogic Meson6, Meson8 and Meson8b SDIO/MMC controller
> bindings to dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

...

> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - amlogic,meson8-sdio
> +          - amlogic,meson8b-sdio
> +      - const: amlogic,meson-mx-sdio
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: clkin
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "slot@[0-2]+$":

^slot@[0-2]$

(because foo-slot@22 is wrong)


> +    $ref: mmc-slot.yaml#
> +    description:
> +      A node for each slot provided by the MMC controller
> +
> +    properties:
> +      reg:
> +        description:
> +          the slot (or "port") ID

Drop description. Should be rather part of mmc-slot.yaml.

> +        enum: [0, 1, 2]
> +
> +      bus-width:
> +        enum: [1, 4]
> +
> +    unevaluatedProperties: false

Hm, I wonder why not all slots are defined in your DTS? Why not all of
them are required? I assume the slots are there always, as part of the
controller.

Is this because of driver limitation mentioned in the old binding?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    mmc@c1108c20 {
> +        compatible = "amlogic,meson8-sdio", "amlogic,meson-mx-sdio";
> +        reg = <0xc1108c20 0x20>;
> +        interrupts = <GIC_SPI 28 IRQ_TYPE_EDGE_RISING>;
> +        clocks = <&clk_core>, <&clk_in>;
> +        clock-names = "core", "clkin";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        slot@1 {
> +            compatible = "mmc-slot";
> +            reg = <1>;
> +            bus-width = <4>;

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
