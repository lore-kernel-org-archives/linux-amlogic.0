Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F1FC0650F
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 22:16:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFEFE2147A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 22:16:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tFBEKT6G";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="p6BYo9vI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFEFE2147A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/oGGg7vqzoTjYxp11/wYYNZBMzVZV3eM4LTAWLhpqEs=; b=tFBEKT6G3xPKnq
	YS5czaoEOB/NB+9RnKCoV5NBcc9Tm8Dj5eO8h8SV3/eLiOS2w57xMcb/0KDcvJMkOk1j8vyj4vgoe
	nGC9ePSOUkdKWA/wqX5o7Kv5cfV/2CAo3CUCpNa0qducSd29u3bgei5Yl9hiA33gk1HsIOObBOSJz
	tYiyTKLI0LhX3Qtf9VNdCOT758721cWJtionAjrzeElpPUoxMkY22EVCynf+jU6C8yDJtBjbx40BD
	YuUTFRLLRqgkHapvaU4StfLh6bpcJRFx97zpWd3ftpwD7YNQurCXFvB+fV4KGwG0ft5yPvnkW4svN
	p36qWbagIS4ltV9j18rw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hulGl-0006aL-BF; Mon, 05 Aug 2019 22:15:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hulGi-0006Zv-O8
 for linux-amlogic@lists.infradead.org; Mon, 05 Aug 2019 22:15:54 +0000
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 497A02147A
 for <linux-amlogic@lists.infradead.org>; Mon,  5 Aug 2019 22:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565043352;
 bh=gqgI7Td8ya5EaOlUxaoHPCuUb9YPdER2f8SpSFfiX3s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=p6BYo9vICP20E2H7J5JD1GPZZEs4RDAqVXatLGvmAGDhU46KMTzTU5U9XchsUqHhh
 Z8Pcsnx/3ClpT7HoPEF32riYteA4LNtuNgDHHLiNdDtZpox3oDnv8kUmjXXD7NvDke
 xuqg1Z/OPzNGOrBeca8XNDs0QCb0rQ8rT5J5/a1c=
Received: by mail-qt1-f176.google.com with SMTP id y26so82612124qto.4
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2019 15:15:52 -0700 (PDT)
X-Gm-Message-State: APjAAAVP8JWrKi5oCg43wl7IZmsuyZdgJv1VyIuffNfkudu6H0KubEit
 uXZIjwncIF8j5yrFV4BNxkawaiKr52Dvr19J2A==
X-Google-Smtp-Source: APXvYqwm/iTNeyoohd5iOgYIhWKWDbDEFpKz7B1Uk8GGEgSBnv2xRcrfIbmRVx/OdCwErm1FdR+0Xcg/0i6B8bMoBaU=
X-Received: by 2002:aed:3f10:: with SMTP id p16mr356023qtf.110.1565043351480; 
 Mon, 05 Aug 2019 15:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190805134319.737-1-narmstrong@baylibre.com>
 <20190805134319.737-2-narmstrong@baylibre.com>
In-Reply-To: <20190805134319.737-2-narmstrong@baylibre.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 5 Aug 2019 16:15:40 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJPFdR6bj_XuVuEDFYhCpmhQ4pZ66egCNJH_U26tTydmA@mail.gmail.com>
Message-ID: <CAL_JsqJPFdR6bj_XuVuEDFYhCpmhQ4pZ66egCNJH_U26tTydmA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: amlogic, meson-dw-hdmi: convert
 to yaml
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_151552_831793_E7B5FD18 
X-CRM114-Status: GOOD (  22.89  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Aug 5, 2019 at 7:43 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic Synopsys DW-HDMI specifics over to YAML schemas.
>
> The original example and usage of clock-names uses a reversed "isfr"
> and "iahb" clock-names, the rewritten YAML bindings uses the reversed
> instead of fixing the device trees order.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../display/amlogic,meson-dw-hdmi.txt         | 119 -------------
>  .../display/amlogic,meson-dw-hdmi.yaml        | 160 ++++++++++++++++++
>  2 files changed, 160 insertions(+), 119 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml

> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> new file mode 100644
> index 000000000000..1212aa7a624f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> @@ -0,0 +1,160 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/display/amlogic,meson-dw-hdmi.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic specific extensions to the Synopsys Designware HDMI Controller
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +description: |
> +  The Amlogic Meson Synopsys Designware Integration is composed of
> +  - A Synopsys DesignWare HDMI Controller IP
> +  - A TOP control block controlling the Clocks and PHY
> +  - A custom HDMI PHY in order to convert video to TMDS signal
> +   ___________________________________
> +  |            HDMI TOP               |<= HPD
> +  |___________________________________|
> +  |                  |                |
> +  |  Synopsys HDMI   |   HDMI PHY     |=> TMDS
> +  |    Controller    |________________|
> +  |___________________________________|<=> DDC
> +
> +  The HDMI TOP block only supports HPD sensing.
> +  The Synopsys HDMI Controller interrupt is routed through the
> +  TOP Block interrupt.
> +  Communication to the TOP Block and the Synopsys HDMI Controller is done
> +  via a pair of dedicated addr+read/write registers.
> +  The HDMI PHY is configured by registers in the HHI register block.
> +
> +  Pixel data arrives in "4:4:4" format from the VENC block and the VPU HDMI mux
> +  selects either the ENCI encoder for the 576i or 480i formats or the ENCP
> +  encoder for all the other formats including interlaced HD formats.
> +
> +  The VENC uses a DVI encoder on top of the ENCI or ENCP encoders to generate
> +  DVI timings for the HDMI controller.
> +
> +  Amlogic Meson GXBB, GXL and GXM SoCs families embeds the Synopsys DesignWare
> +  HDMI TX IP version 2.01a with HDCP and I2C & S/PDIF
> +  audio source interfaces.
> +
> +  The following table lists for each supported model the port number
> +  corresponding to each HDMI output and input.
> +
> +                  Port 0                 Port 1
> +  -----------------------------------------
> +   S905 (GXBB)   VENC Input    TMDS Output
> +   S905X (GXL)   VENC Input    TMDS Output
> +   S905D (GXL)   VENC Input    TMDS Output
> +   S912 (GXM)      VENC Input  TMDS Output
> +   S905X2 (G12A)       VENC Input      TMDS Output
> +   S905Y2 (G12A)       VENC Input      TMDS Output
> +   S905D2 (G12A)       VENC Input      TMDS Output

Does this ever change?

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - amlogic,meson-gxbb-dw-hdmi # GXBB (S905)
> +              - amlogic,meson-gxl-dw-hdmi # GXL (S905X, S905D)
> +              - amlogic,meson-gxm-dw-hdmi # GXM (S912)
> +          - const: amlogic,meson-gx-dw-hdmi
> +      - enum:
> +          - amlogic,meson-g12a-dw-hdmi # G12A (S905X2, S905Y2, S905D2)
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: isfr
> +      - const: iahb
> +      - const: venci
> +
> +  resets:
> +    minItems: 3
> +
> +  reset-names:
> +    items:
> +      - const: hdmitx_apb
> +      - const: hdmitx
> +      - const: hdmitx_phy
> +
> +  hdmi-supply:
> +    description: phandle to an external 5V regulator to power the HDMI logic
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  port@0:
> +    type: object
> +    description:
> +      A port node modeled using the OF graph
> +      bindings specified in Documentation/devicetree/bindings/graph.txt.

Would be better to say this is the VENC (or ...? input and drop the
reference (as I expect graph.txt will be replaced with graph.yaml).

> +
> +  port@1:
> +    type: object
> +    description:
> +      A port node modeled using the OF graph
> +      bindings specified in Documentation/devicetree/bindings/graph.txt.
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - port@0
> +  - port@1
> +  - "#address-cells"
> +  - "#size-cells"

Should be able to add an 'additionalProperties: false' here.

> +
> +examples:
> +  - |
> +    hdmi_tx: hdmi-tx@c883a000 {
> +        compatible = "amlogic,meson-gxbb-dw-hdmi", "amlogic,meson-gx-dw-hdmi";
> +        reg = <0xc883a000 0x1c>;
> +        interrupts = <57>;
> +        resets = <&reset_apb>, <&reset_hdmitx>, <&reset_hdmitx_phy>;
> +        reset-names = "hdmitx_apb", "hdmitx", "hdmitx_phy";
> +        clocks = <&clk_isfr>, <&clk_iahb>, <&clk_venci>;
> +        clock-names = "isfr", "iahb", "venci";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        /* VPU VENC Input */
> +        hdmi_tx_venc_port: port@0 {
> +            reg = <0>;
> +
> +            hdmi_tx_in: endpoint {
> +                remote-endpoint = <&hdmi_tx_out>;
> +            };
> +        };
> +
> +        /* TMDS Output */
> +        hdmi_tx_tmds_port: port@1 {
> +             reg = <1>;
> +
> +             hdmi_tx_tmds_out: endpoint {
> +                 remote-endpoint = <&hdmi_connector_in>;
> +             };
> +        };
> +    };
> +
> --
> 2.22.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
