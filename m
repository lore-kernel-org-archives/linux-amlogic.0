Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAC8C0650F
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 22:19:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07623214C6
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 22:19:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GvDujx9g";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMsu+oJb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07623214C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFgfYzTODJ42c/e5Sk11K4PSzpRssO9PBAygNhqThVY=; b=GvDujx9gwREdHh
	lBA2di6z2TlTIOc/WksLXge2MGW8HK/zP8TRWPcmduyK3J6NyWJh4FcHCP4IRVj2bYk7EIKzJSLpm
	AQI5tw7dTr90x8uABX0U/E61IpQPO2/uUZlJDYqSorIuOjBSRUlTV3GIhgHzKAvlQsfEUKRlkXe2D
	dL9+4c+ROita0HlC2X9T2zTakzvHnMvjFN1xgXoiNQFkYworfU2hmI33eyXkrM23Y1VUBBShPRF6n
	OUueRzhPqK3FW0GXbP5sgYwK/4/Xvg5LCPEaghQjTF7Vve2E9Ggd+8ieIlZ7XDPKx9mXUAED7V3Xq
	PxBfpGlK7uQdbqZis8Ew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hulKA-0006i1-Dz; Mon, 05 Aug 2019 22:19:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hulK7-0006hf-6s
 for linux-amlogic@lists.infradead.org; Mon, 05 Aug 2019 22:19:24 +0000
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BBB64214C6
 for <linux-amlogic@lists.infradead.org>; Mon,  5 Aug 2019 22:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565043562;
 bh=DAJwXEw19Gb3M6Oq5kBaOup970MTSVSAKhmz3GBuXtk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MMsu+oJbyvDnQfp/3Sqw52yu3oTmDrGx7JSFykZCahzUkH1ZG3cT518XVsjvF2OJS
 wrJNhvBMBvhL9qo5jubI/JdMWLyhn0H3wjlPddG0iWsyQSXDXUnV4AH+eFK/e+qLSz
 sptjIsYR7y1qbYOgBXVRxXn+5b/AmGXSWCHqWxuM=
Received: by mail-qk1-f171.google.com with SMTP id s145so61398431qke.7
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2019 15:19:22 -0700 (PDT)
X-Gm-Message-State: APjAAAUS0ZnBrmBnRseW7tzI46BdHnWfI9xZc11g1ArnFnkytVnqZRan
 B5VLk9TDcSxGLfSEDCsNY9CxC4DixZYXfVMsCg==
X-Google-Smtp-Source: APXvYqwz4pf25c01K6WX65UF5AuzkCcAaP6sAPVUCXeRy75ZDEAzBFtayvGaJ/BvtVIeahMI898URW4gNOpYlM5mhJY=
X-Received: by 2002:a37:a010:: with SMTP id j16mr575745qke.152.1565043561946; 
 Mon, 05 Aug 2019 15:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190805134319.737-1-narmstrong@baylibre.com>
 <20190805134319.737-3-narmstrong@baylibre.com>
In-Reply-To: <20190805134319.737-3-narmstrong@baylibre.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 5 Aug 2019 16:19:10 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLMS2y5ZR4SH6TVwnaTDhnGwk2_C_81DTz9J=ypDdBd4w@mail.gmail.com>
Message-ID: <CAL_JsqLMS2y5ZR4SH6TVwnaTDhnGwk2_C_81DTz9J=ypDdBd4w@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: display: amlogic,
 meson-vpu: convert to yaml
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_151923_296856_8623F1AD 
X-CRM114-Status: GOOD (  20.96  )
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
> bindings for the Amlogic Display Controller over to YAML schemas.
>
> The original example has a leftover "dmc" memory cell, that has been
> removed in the yaml rewrite.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/display/amlogic,meson-vpu.txt    | 121 --------------
>  .../bindings/display/amlogic,meson-vpu.yaml   | 153 ++++++++++++++++++
>  2 files changed, 153 insertions(+), 121 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
>  create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml


> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
> new file mode 100644
> index 000000000000..9eba13031998
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
> @@ -0,0 +1,153 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/display/amlogic,meson-vpu.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson Display Controller
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +description: |
> +  The Amlogic Meson Display controller is composed of several components
> +  that are going to be documented below
> +
> +  DMC|---------------VPU (Video Processing Unit)----------------|------HHI------|
> +     | vd1   _______     _____________    _________________     |               |
> +  D  |-------|      |----|            |   |                |    |   HDMI PLL    |
> +  D  | vd2   | VIU  |    | Video Post |   | Video Encoders |<---|-----VCLK      |
> +  R  |-------|      |----| Processing |   |                |    |               |
> +     | osd2  |      |    |            |---| Enci ----------|----|-----VDAC------|
> +  R  |-------| CSC  |----| Scalers    |   | Encp ----------|----|----HDMI-TX----|
> +  A  | osd1  |      |    | Blenders   |   | Encl ----------|----|---------------|
> +  M  |-------|______|----|____________|   |________________|    |               |
> +  ___|__________________________________________________________|_______________|
> +
> +
> +  VIU: Video Input Unit
> +  ---------------------
> +
> +  The Video Input Unit is in charge of the pixel scanout from the DDR memory.
> +  It fetches the frames addresses, stride and parameters from the "Canvas" memory.
> +  This part is also in charge of the CSC (Colorspace Conversion).
> +  It can handle 2 OSD Planes and 2 Video Planes.
> +
> +  VPP: Video Post Processing
> +  --------------------------
> +
> +  The Video Post Processing is in charge of the scaling and blending of the
> +  various planes into a single pixel stream.
> +  There is a special "pre-blending" used by the video planes with a dedicated
> +  scaler and a "post-blending" to merge with the OSD Planes.
> +  The OSD planes also have a dedicated scaler for one of the OSD.
> +
> +  VENC: Video Encoders
> +  --------------------
> +
> +  The VENC is composed of the multiple pixel encoders
> +   - ENCI : Interlace Video encoder for CVBS and Interlace HDMI
> +   - ENCP : Progressive Video Encoder for HDMI
> +   - ENCL : LCD LVDS Encoder
> +  The VENC Unit gets a Pixel Clocks (VCLK) from a dedicated HDMI PLL and clock
> +  tree and provides the scanout clock to the VPP and VIU.
> +  The ENCI is connected to a single VDAC for Composite Output.
> +  The ENCI and ENCP are connected to an on-chip HDMI Transceiver.
> +
> +  The following table lists for each supported model the port number
> +  corresponding to each VPU output.
> +
> +                  Port 0       Port 1
> +  -----------------------------------------
> +   S905 (GXBB)   CVBS VDAC        HDMI-TX
> +   S905X (GXL)   CVBS VDAC        HDMI-TX
> +   S905D (GXL)   CVBS VDAC        HDMI-TX
> +   S912 (GXM)      CVBS VDAC      HDMI-TX
> +   S905X2 (G12A)       CVBS VDAC          HDMI-TX
> +   S905Y2 (G12A)       CVBS VDAC          HDMI-TX
> +   S905D2 (G12A)       CVBS VDAC          HDMI-TX
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - amlogic,meson-gxbb-vpu # GXBB (S905)
> +              - amlogic,meson-gxl-vpu # GXL (S905X, S905D)
> +              - amlogic,meson-gxm-vpu # GXM (S912)
> +          - const: amlogic,meson-gx-vpu
> +      - enum:
> +          - amlogic,meson-g12a-vpu # G12A (S905X2, S905Y2, S905D2)
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +   items:
> +     - const: vpu
> +     - const: hhi
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    description: phandle to the associated power domain
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/phandle

Common properties don't need a type definition. As this can be an
array, you just need 'maxItems: 1'.

Same comments on patch 1 apply here too.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
