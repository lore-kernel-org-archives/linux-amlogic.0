Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B245CC25B4E
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 12:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UFVhfZH8+A4NNDEKsURykWGuXDsnZBSUfiEwYNgVsv4=; b=u4pphxyARqoJMv
	RFTlD7aYQajpSZFrpbidgFhZ2Qvrlqiy44iqS9vHcXI5FgWz5KdUJ6y0oTh0BQ9x4m+X34jw5xXIv
	oMWtM+DvqLN7RvnJ73hlCfizYhqGfP8cR0RmOoKhtSJcIE665sP54rQjb0KaKkiuRMYzDVEmDGlUe
	CCrrepyJw3MzsloLD0Rrz0vPqpODCbM3SrYjIQG/XzCGpSGYCf1w3J6awRZ/Hio+oeNwj9/ZmtdmH
	jay2uao8NQC+HWXTZJsJEDuIgNuRFq1Eb0iO/CsCHahpse66gEUAIEwMzO1cLHrJ2lGTouCY++AFU
	+Z30E6rZRbA6j0Nsy0RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKIsO-003oI3-Qh; Tue, 24 Jan 2023 12:58:12 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKIs5-003o8I-5o
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 12:57:58 +0000
Received: by mail-pl1-x629.google.com with SMTP id a18so2075920plm.2
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 04:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lbga1PekNQG7Wr08X5AD8bYyGj914Yhe8xMoadj6ep8=;
        b=Wkgvt7M/3VLY+FML2DA+LVjnEPI6mopPmwB+jdxBTvY1cW+hfiTbvwPmfPCRqxGI/5
         U3eRsnTqOG/OKrTOaCjpI+jKcytHrjhZx6z39hTcQlghqpfQlhf29szyk26EOPQ81aqv
         RvwwXVDt+PD6CF73FMYrpZEPqnV75wK6k25xYKamIq9l28L6Gp65toSLr+8cLL6q0TLO
         ccCO/h/ArwS/JoxxHnTzcPk2iEfgeIx30Ctb7nPpqPE37BtQA8X64Bv2FTfaU609ago/
         JAZdxoMS/9mYTNvfvzHD4f1RyngBXoDNWTOYRxudbM0n2u2AKtqYXULrUqbNAOiL/GbG
         s51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lbga1PekNQG7Wr08X5AD8bYyGj914Yhe8xMoadj6ep8=;
        b=V0vefPzpZmQlTXtaj5CflphCuAlwOEMfx7O/1/1IPEzPN3YqPUP74a9bPWQQQbHfhM
         Cg4Eo0bdCrLnF4In7dmn+nK/BgmsscxBhAEsGFTvMD37SVyK9fOia7SygOwmPeTPptU8
         v9R1ppgC//tIxEkhNAN0dtx78035ILM9z3lqWTuGQVBaI2q8YcaeO3aunev4iGAVm8Ng
         4gqQBtCu2HaTOGks3sBqnUDeG46/Uc7XLwc8lR6O/pkgb3e851sx3w/1yPeEMBH1KiwM
         xN3yKb794E6mRVn0OwwEjh5VqpHaWjmfJmOFXj9+zoGLP0F7+oG0jZ2UuHgqHvjGqklz
         CedA==
X-Gm-Message-State: AFqh2koZCkP9ktugsfVL/+YBmXsnlR2wyU2yuoxkJ14XlWpUlZSHh5Ub
	IvQlNiPW+8HoDM91nPXxBNjQi7KIFwbb5nd1k9VbSQ==
X-Google-Smtp-Source: AMrXdXtCakx+gDCZWxcq7+x+5SmE+6G1+2IncnakyeXGIZcRncfenaixWLy34xEgyDCGALWUs3tkMTZmGb6hw3x1WUo=
X-Received: by 2002:a17:90a:1d07:b0:228:f08f:a9b3 with SMTP id
 c7-20020a17090a1d0700b00228f08fa9b3mr3625899pjd.202.1674565070644; Tue, 24
 Jan 2023 04:57:50 -0800 (PST)
MIME-Version: 1.0
References: <20221117-b4-amlogic-bindings-convert-v3-0-e28dd31e3bed@linaro.org>
 <20221117-b4-amlogic-bindings-convert-v3-6-e28dd31e3bed@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v3-6-e28dd31e3bed@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 24 Jan 2023 13:57:14 +0100
Message-ID: <CAPDyKFrRN-+fhvWQNmQfD2u-0+2iqP-iONaKx61K685ZqcrZOg@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] dt-bindings: mmc: convert amlogic,meson-gx.txt to dt-schema
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_045753_278987_E3B1D229 
X-CRM114-Status: GOOD (  23.33  )
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

On Mon, 23 Jan 2023 at 11:10, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Convert the Amlogic SD / eMMC controller for S905/GXBB family SoCs
> to dt-schema.
>
> Take in account the used variant with amlogic,meson-gx-mmc.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  .../bindings/mmc/amlogic,meson-gx-mmc.yaml         | 73 ++++++++++++++++++++++
>  .../devicetree/bindings/mmc/amlogic,meson-gx.txt   | 39 ------------
>  2 files changed, 73 insertions(+), 39 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> new file mode 100644
> index 000000000000..46e235bf228b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/amlogic,meson-gx-mmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic SD / eMMC controller for S905/GXBB family SoCs
> +
> +description:
> +  The MMC 5.1 compliant host controller on Amlogic provides the
> +  interface for SD, eMMC and SDIO devices
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +allOf:
> +  - $ref: mmc-controller.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: amlogic,meson-axg-mmc
> +      - items:
> +          - const: amlogic,meson-gx-mmc
> +          - const: amlogic,meson-gxbb-mmc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: clkin0
> +      - const: clkin1
> +
> +  resets:
> +    maxItems: 1
> +
> +  amlogic,dram-access-quirk:
> +    type: boolean
> +    description:
> +      set when controller's internal DMA engine cannot access the DRAM memory,
> +      like on the G12A dedicated SDIO controller.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    mmc@70000 {
> +        compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
> +        reg = <0x70000 0x2000>;
> +        interrupts = <GIC_SPI 216 IRQ_TYPE_EDGE_RISING>;
> +        clocks = <&clk_mmc>, <&xtal>, <&clk_div>;
> +        clock-names = "core", "clkin0", "clkin1";
> +        pinctrl-0 = <&emm_pins>;
> +        resets = <&reset_mmc>;
> +    };
> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
> deleted file mode 100644
> index ccc5358db131..000000000000
> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -Amlogic SD / eMMC controller for S905/GXBB family SoCs
> -
> -The MMC 5.1 compliant host controller on Amlogic provides the
> -interface for SD, eMMC and SDIO devices.
> -
> -This file documents the properties in addition to those available in
> -the MMC core bindings, documented by mmc.txt.
> -
> -Required properties:
> -- compatible : contains one of:
> -  - "amlogic,meson-gx-mmc"
> -  - "amlogic,meson-gxbb-mmc"
> -  - "amlogic,meson-gxl-mmc"
> -  - "amlogic,meson-gxm-mmc"
> -  - "amlogic,meson-axg-mmc"
> -- clocks     : A list of phandle + clock-specifier pairs for the clocks listed in clock-names.
> -- clock-names: Should contain the following:
> -       "core" - Main peripheral bus clock
> -       "clkin0" - Parent clock of internal mux
> -       "clkin1" - Other parent clock of internal mux
> -  The driver has an internal mux clock which switches between clkin0 and clkin1 depending on the
> -  clock rate requested by the MMC core.
> -- resets     : phandle of the internal reset line
> -
> -Optional properties:
> -- amlogic,dram-access-quirk: set when controller's internal DMA engine cannot access the
> -  DRAM memory, like on the G12A dedicated SDIO controller.
> -
> -Example:
> -
> -       sd_emmc_a: mmc@70000 {
> -               compatible = "amlogic,meson-gxbb-mmc";
> -               reg = <0x0 0x70000 0x0 0x2000>;
> -               interrupts = < GIC_SPI 216 IRQ_TYPE_EDGE_RISING>;
> -               clocks = <&clkc CLKID_SD_EMMC_A>, <&xtal>, <&clkc CLKID_FCLK_DIV2>;
> -               clock-names = "core", "clkin0", "clkin1";
> -               pinctrl-0 = <&emmc_pins>;
> -               resets = <&reset RESET_SD_EMMC_A>;
> -       };
>
> --
> 2.34.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
