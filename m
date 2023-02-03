Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9BFC61DA4
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Feb 2023 08:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G2hFV/WVjPc6EHS7d2hviUaI4v/vwv+CXgFPvLtloUI=; b=gHSVMQO5rHeIJ1
	/gztJu4EbDFIhXPUdViUOT3twV7ielyqSSNO0qEMvo6dWifHsTgeu02leIUoyJ8xrUUT2UpFmRe3B
	bumMCBJHe3r0knMYZyZtP1aWR2VmmRmueDRo9ma6JHXp/4Q3YAFPW01OFRD3mWNJH/Hf2Du2WNHVo
	oFgqm/2sUT+dMh0SoaRtr0puptIHVH3Up2T7HnkybsN0ZuurlXWBFNz2RMHp3wIPdCCeart0PFaZQ
	hYMyX25TENfTjw78X4HaCyxbBR4bPyQEEGsJ9lUOKbi7XDi/JxI7SGWQZ5fSpX9+Xia5v7OSbQluF
	H6zaY6U7WkERQpH6101A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNr0Z-000uXY-2C; Fri, 03 Feb 2023 08:01:19 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNr0W-000uVd-5D
	for linux-amlogic@lists.infradead.org; Fri, 03 Feb 2023 08:01:18 +0000
Received: by mail-wr1-x431.google.com with SMTP id t7so3881801wrp.5
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Feb 2023 00:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7m8f9EyCur2NoecBf9EPSiUVhxuV7BmfZLxYwGH5PkE=;
        b=guxpr1oTjCCk//LD7tIEzHxIsGt3+k3YvQpKzhFw13be5VyuYmjdsNPg+igN6mJTZP
         zGlnrReMLxiB3J+1drmNswO3Qb49rGsbvCfnMzZqu0Ie+/XV4N5FbfwjID+ijTM7hPHP
         GIbxK9BhQLfytmAUWdUM+/gNq+GnZ0OsuywF/SbMQKsr93PH1fIC+vt7Y2Lmueu9gUaM
         poRSdxMhbnhui64JU/44IJi4GKxbOtspEAv28RD9NbSMDAp4owHo0nUf+D1xZWZBM8Ok
         gNoOyCoDx9XR7rm687E88E+/uuJISQKkIsyCZtTsNxy7lYuBjzsPX/YK70zuCjgz49r4
         tpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7m8f9EyCur2NoecBf9EPSiUVhxuV7BmfZLxYwGH5PkE=;
        b=XIBSGBzB1nwFtdU+NSewx0zA0RT5OEmH/QC/PsdW0SFSX42UcDYNVbL4pCBhJxxoaW
         BllZ4H5TEXG7NJ1yaZvwzAc0s1kMI/dgV+tt9kzWnkHP5U6s/98KS2QYQBbFUkPzqnBs
         kt4CSaUC+WAi8tRd2MdunTgXYTypDQaWDw5id5aFvIH5kHVOmqJdG8RWgrF4pZOG0JXF
         dVuPiHRFymVnUwRUfTmbcwtH4n7bSj5zQY3lIyqHGkAOI/dU8H1ih3snbl97PvbpS70g
         XxyLA32uBxcsLNgngJkcNmPWyLTtpVx9t6ycPVBlqyzLtJCRjUIYVySPVK8g8RkOHZoa
         umlQ==
X-Gm-Message-State: AO0yUKV0MuWVLOi3yu5H+BsdrCu/yppA1uIQmF9Z/muFioFYwtyER051
	c9VWwXy+BGHW44cNxgJ6T5HeWw==
X-Google-Smtp-Source: AK7set9OdHSazUeReB4su41/k86JE+27eq8f+sbDll2GVZYYoVPbsF3D45zzdlnihWnmoVcfG3+U3w==
X-Received: by 2002:a05:6000:144f:b0:2bf:95d6:4789 with SMTP id v15-20020a056000144f00b002bf95d64789mr3757520wrx.2.1675411272156;
        Fri, 03 Feb 2023 00:01:12 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q6-20020adfab06000000b002bfcc940014sm1393485wrc.82.2023.02.03.00.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 00:01:11 -0800 (PST)
Message-ID: <512edf50-a74d-815d-1278-39fdeb1c2d35@linaro.org>
Date: Fri, 3 Feb 2023 09:01:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 5/9] ASoC: dt-bindings: meson: convert axg pdm to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-6-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202183653.486216-6-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_000116_253795_FABE9E36 
X-CRM114-Status: GOOD (  20.98  )
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

On 02/02/2023 19:36, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic axg PDM device to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/sound/amlogic,axg-pdm.txt        | 29 -------
>  .../bindings/sound/amlogic,axg-pdm.yaml       | 86 +++++++++++++++++++
>  2 files changed, 86 insertions(+), 29 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
> deleted file mode 100644
> index 716878107a24..000000000000
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -* Amlogic Audio PDM input
> -
> -Required properties:
> -- compatible: 'amlogic,axg-pdm' or
> -	      'amlogic,g12a-pdm' or
> -	      'amlogic,sm1-pdm'
> -- reg: physical base address of the controller and length of memory
> -       mapped region.
> -- clocks: list of clock phandle, one for each entry clock-names.
> -- clock-names: should contain the following:
> -  * "pclk"   : peripheral clock.
> -  * "dclk"   : pdm digital clock
> -  * "sysclk" : dsp system clock
> -- #sound-dai-cells: must be 0.
> -
> -Optional property:
> -- resets: phandle to the dedicated reset line of the pdm input.
> -
> -Example of PDM on the A113 SoC:
> -
> -pdm: audio-controller@ff632000 {
> -	compatible = "amlogic,axg-pdm";
> -	reg = <0x0 0xff632000 0x0 0x34>;
> -	#sound-dai-cells = <0>;
> -	clocks = <&clkc_audio AUD_CLKID_PDM>,
> -		 <&clkc_audio AUD_CLKID_PDM_DCLK>,
> -		 <&clkc_audio AUD_CLKID_PDM_SYSCLK>;
> -	clock-names = "pclk", "dclk", "sysclk";
> -};
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
> new file mode 100644
> index 000000000000..d3da2f8ba7b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/amlogic,axg-pdm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Audio AXG PDM input
> +
> +maintainers:
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  $nodename:
> +    pattern: "^audio-controller@.*"

Drop

> +
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - amlogic,g12a-pdm
> +              - amlogic,sm1-pdm
> +          - const:
> +              amlogic,axg-pdm

One line.

Please use the same coding style as we have in other bindings or
example-schema.

> +      - items:

Drop items

> +          - const:
> +              amlogic,axg-pdm

Keep in one line.

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: Peripheral clock
> +      - description: PDM digital clock
> +      - description: DSP system clock
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: dclk
> +      - const: sysclk
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#sound-dai-cells"
> +  - clocks
> +  - clock-names
> +
> +if:

Keep in allOf here (need to move ref from top to here)

> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - amlogic,g12a-pdm
> +          - amlogic,sm1-pdm
> +then:
> +  properties:
> +    resets:
> +      items:
> +        - description: Dedicated device reset line

Define properties in top level properties.

> +
> +  required:
> +    - resets
> +
> +unevaluatedProperties: false


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
