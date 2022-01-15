Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707E8C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jan 2022 15:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4dHOLhdIvWBrSr675ij5v6l89od0mqM/m2ZaSZMul5U=; b=TIGErha3UIvuWb
	AVg9DqqAnOVSXvnYEWkYq2TKhtJMmYY+dvjghskWzfZiI48baSxS3G3fDTY712dhj/3MQtgiKV2Dn
	VMq/Jw7GU2x/CLT1LOPRYoJIPk1tXwgZjugySiyGyb9DN4ll2R+3IeIEHDAMEM0IarKkZz8SkSYr0
	4NEDY4yka0IsiTC9RN6zc/WFb590RQE8VFYufoAFwC3DX6gBaUW5F/8m7u+WsqNiaHkOXht3w/siw
	vSGAl8aHFMbCHtdhhLi7pGvsCsk60XLEWdZZLbvsAL9ANokt8GVKBtdgvt8W/0BcNb54m0sMZggTm
	MXhNEU5hXFaEXy2iUE9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8kuu-00BDJY-QE; Sat, 15 Jan 2022 15:24:32 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8kuq-00BDIw-O0
 for linux-amlogic@lists.infradead.org; Sat, 15 Jan 2022 15:24:31 +0000
Received: by mail-wm1-x335.google.com with SMTP id v123so11614352wme.2
 for <linux-amlogic@lists.infradead.org>; Sat, 15 Jan 2022 07:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=MIwf8yvIjurNq+8ZmooEUhTCOweGHlhBW+ycD+r+W+M=;
 b=KArD1aJWDBitPrfhrGl4AEVaAm+nWOd47OEZEPcEpS39uG1yWZVVQRwcaoX3UpGUXD
 UVt6S6/vh7k1EwzC0jNltoI5c9RaOZH+Cj4pzE2S4FFcpfDY7XxmoItLgchRmv3XW5NU
 1ZWZLIgogY6z3NWLHpRbk0+4xuRNIAizCFmJPghNxsgge5hSnCd4mSpwFiYBYNI2axi0
 9mjphUR6mqLDnpakeIp+Daay/CgFe9pwv92kJJ5CJZqhcmd/DgMN00iCJDoZk8xMjM5g
 T2M42yUSuv4GO3R6K5zChSyQeidnwyPU1SakWOKkVAACcO3jc0ttUf3tvYfz8gVHBzvF
 R8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=MIwf8yvIjurNq+8ZmooEUhTCOweGHlhBW+ycD+r+W+M=;
 b=XmmAdKaj++HxnYgiGO1mMuOQUmiY67qvWmuK7cbAC51lS6Jd7n0oH/H56PTZ23UW36
 KZcSP1Vmw6WSFEDNR4qgMRjLgZlQEtpPxDr2HEaiDfxd2h0rNH0T8k/ubmVaPFyTvTFC
 79+boOC0NVMEQY1McyEgQdYQIEMNJZowEmgtRkBVWakBLt5XzmTyzCE3fXM3jKR+V/3i
 NqBU+MVSiSAqgjHSGKbIl6ZuxtATBdYRFnfuZ1Ta869msWENEU8sTgQjeUrcRnZoZRVk
 LfGVzhOgmhrPeiQkm8rLRLiZhHYehNw03wOAH5DV7Jx169j+UZqZtcfwPBntT3theVhA
 UH7Q==
X-Gm-Message-State: AOAM533oT0xspCFLSXxKknT9PZ+Tb0NkJEdGwz5tvsSsMOnbxnBntJhS
 USR2QIbzZu0R0FR+1DQqQJKVkwmEf0aihZ3y
X-Google-Smtp-Source: ABdhPJwyC+uOoPCVKfA4kOhT8hoHk7ogCsaJnwifo7tWDptOoKEx/vcPs+iXlLO8CnRHn7I84pJbfg==
X-Received: by 2002:a05:600c:5108:: with SMTP id
 o8mr4437667wms.190.1642260267237; 
 Sat, 15 Jan 2022 07:24:27 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id b6sm9322411wri.56.2022.01.15.07.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 07:24:26 -0800 (PST)
References: <20220115093557.30498-1-alexander.stein@mailbox.org>
 <20220115093557.30498-2-alexander.stein@mailbox.org>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alexander Stein <alexander.stein@mailbox.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 2/2] ASoC: meson: axg-fifo: convert Amlogic FIFO
 controller to yaml
Date: Sat, 15 Jan 2022 16:16:41 +0100
In-reply-to: <20220115093557.30498-2-alexander.stein@mailbox.org>
Message-ID: <1jee59auok.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_072428_809665_DE5E5A73 
X-CRM114-Status: GOOD (  27.53  )
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


On Sat 15 Jan 2022 at 10:35, Alexander Stein <alexander.stein@mailbox.org> wrote:

> Convert Amlogic FIFO controller documentation to yaml format.
>
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> ---
> Things to note:
> First of, Jerome, sorry for adding you as maintainer, but
> 1) it's mandatory
> 2) your are the (only) author of amlogic,axg-fifo.txt
>
> Please add your Signed-off-by if that is okay with you.
>
> License is mandated by checkpath, not my choice.
>
> I'm not so sure about the compatible check. Essentially it is either
> * 'amlogic,axg-frddr' OR
> * 'amlogic,g12a-frddr' + 'amlogic,axg-frddr'
>   (or 'sm1' instead of 'g12a')
>
> Same goes for *-toddr. Is this schema correct in that regard? At least I
> got no warnings on existing device trees.
>

There has already been a submission of this.
It should answer your questions. You've also missed some
constraints regarding resets. Please check:

https://patchwork.kernel.org/project/linux-amlogic/list/?series=246453&state=%2A&archive=both


>  .../bindings/sound/amlogic,axg-fifo.txt       | 34 -------
>  .../bindings/sound/amlogic,axg-fifo.yaml      | 97 +++++++++++++++++++
>  2 files changed, 97 insertions(+), 34 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
> deleted file mode 100644
> index fa4545ed81ca..000000000000
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -* Amlogic Audio FIFO controllers
> -
> -Required properties:
> -- compatible: 'amlogic,axg-toddr' or
> -	      'amlogic,axg-toddr' or
> -	      'amlogic,g12a-frddr' or
> -	      'amlogic,g12a-toddr' or
> -	      'amlogic,sm1-frddr' or
> -	      'amlogic,sm1-toddr'
> -- reg: physical base address of the controller and length of memory
> -       mapped region.
> -- interrupts: interrupt specifier for the fifo.
> -- clocks: phandle to the fifo peripheral clock provided by the audio
> -	  clock controller.
> -- resets: list of reset phandle, one for each entry reset-names.
> -- reset-names: should contain the following:
> -  * "arb" : memory ARB line (required)
> -  * "rst" : dedicated device reset line (optional)
> -- #sound-dai-cells: must be 0.
> -- amlogic,fifo-depth: The size of the controller's fifo in bytes. This
> -  		      is useful for determining certain configuration such
> -		      as the flush threshold of the fifo
> -
> -Example of FRDDR A on the A113 SoC:
> -
> -frddr_a: audio-controller@1c0 {
> -	compatible = "amlogic,axg-frddr";
> -	reg = <0x0 0x1c0 0x0 0x1c>;
> -	#sound-dai-cells = <0>;
> -	interrupts = <GIC_SPI 88 IRQ_TYPE_EDGE_RISING>;
> -	clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
> -	resets = <&arb AXG_ARB_FRDDR_A>;
> -	fifo-depth = <512>;
> -};
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
> new file mode 100644
> index 000000000000..54bc073591f4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/amlogic,axg-fifo.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Audio FIFO controllers
> +
> +maintainers:
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +
> +allOf:
> +  - $ref: name-prefix.yaml#
> +
> +properties:
> +  $nodename:
> +    pattern: "^audio-controller@.*"
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - amlogic,g12a-frddr
> +              - amlogic,sm1-frddr
> +          - const: amlogic,axg-frddr
> +      - const: amlogic,axg-frddr
> +      - items:
> +          - enum:
> +              - amlogic,g12a-toddr
> +              - amlogic,sm1-toddr
> +          - const: amlogic,axg-toddr
> +      - const: amlogic,axg-toddr
> +
> +  reg:
> +    items:
> +      - description: physical base address of the controller
> +
> +  interrupts:
> +    items:
> +      - description: FIFO interrupt
> +
> +  clocks:
> +    items:
> +      - description: FIFO peripheral clock provided by the audio clock controller
> +
> +  resets:
> +    minItems: 1
> +    items:
> +      - description: memory ARB line
> +      - description: optional device reset line
> +
> +  reset-names:
> +    minItems: 1
> +    items:
> +      - const: arb
> +      - const: rst
> +
> +  amlogic,fifo-depth:
> +    description: >
> +      The size of the controller's fifo in bytes. This
> +      is useful for determining certain configuration such
> +      as the flush threshold of the fifo
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  sound-name-prefix: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - resets
> +  - reset-names
> +  - '#sound-dai-cells'
> +  - amlogic,fifo-depth
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/axg-audio-clkc.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
> +
> +    frddr_a: audio-controller@1c0 {
> +        compatible = "amlogic,axg-frddr";
> +        reg = <0x1c0 0x1c>;
> +        #sound-dai-cells = <0>;
> +        interrupts = <88 IRQ_TYPE_EDGE_RISING>;
> +        clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
> +        resets = <&arb AXG_ARB_FRDDR_A>;
> +        reset-names = "arb";
> +        amlogic,fifo-depth = <512>;
> +    };


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
