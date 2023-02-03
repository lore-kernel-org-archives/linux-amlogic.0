Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FD0C636CC
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Feb 2023 07:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9P3Hr524c07/xvF9JyeBKyiZy1Su2Devw/iUFY54KyE=; b=1I6DAXXyi+wTXx
	IC0LEW+poalo53QE56Y9zGox0ync65gFIefP4ITJePB0ddiCddCn/mRIOmbtU0ahz0q470uYs3fgm
	9YjI83HIpUjs/IjGneFXewQgGmsH0ki4+tDEo/zhf7Mv2YXi5RXA9oCBkedpV0N3dStFC8AIgg2hu
	zlS/GOautmGFLsfxSGal52PLX+gl1wQ9npZ3pg8MqOmq3iiwFSQPX3qMdjK874/G4uTVK4nKzHKNi
	tK9m2WOCuDy01/N3Wp+1Yd1/b2Ft1mmVE3B6Bfxsb0QYrRwfSBViC6kGianaPwcpNHvL4JRUq7EMF
	/EgoMkwyp9cekK/pAHBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqnT-000rPc-Gk; Fri, 03 Feb 2023 07:47:47 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqnQ-000rP9-8t
	for linux-amlogic@lists.infradead.org; Fri, 03 Feb 2023 07:47:45 +0000
Received: by mail-wm1-x32b.google.com with SMTP id n13so3184553wmr.4
        for <linux-amlogic@lists.infradead.org>; Thu, 02 Feb 2023 23:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GlzCgLEPZ69auNVfPwbs/k4QDSpIwTCL3k0EZ2tSlBM=;
        b=PAIAnE2BATdpoT1ce0rQ28Kakyc6oP+fK5eZ7MZGwg6pO0XkkLHR7K7O8G78u6CYss
         UNxfDmBs6rd+BrxkIDHyWrTk3BcLUe/pcMgDWNjxUnak4ofjUgNunQDfhh0TQHpCLW6H
         3yp5orDjScmQzNszwo+a6N4OVYlTAIRrdVlU3KmDxhQB9A50lCN4NsStbBLQoj8MCs+Q
         oDqrHrRuQowpbtCJ2S/oITMD256IM2nFXK7xBqu+f/AyTF4xmi981Ck7ZcZKju5k6b9H
         2w4uiTB1MX8Y9HQZPhic1E8RudHoexDIQtJGEBYVlsPyrrlAqcGeGpEtspmNYs4m5oTm
         7sZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GlzCgLEPZ69auNVfPwbs/k4QDSpIwTCL3k0EZ2tSlBM=;
        b=A/r/bvpKZlOeLV1JLjrLZ1tAF96DtEb6WMx6lXFwnNkyQDom6mtB8vgWFLtWOU+z/R
         oIRqEBelpVxdrHFSUDdeaoEuXIaf/NSF9GWU8lQ5LFmTVRSZkV0x0Bao8IfnC4uywwEJ
         IKu1pc/xluy7Ps8OXEPPiiTlJImQ56sE8to0AiZpyedM5rtfx6j4VAgWQBI+p4LLIDS5
         4lAxEahY8+jt6RI1ihQYEht3wsVGx4XVOX8bxWXgk8c9DasFWEHeO7WnQ0aEmlqi+c1+
         ks76pQHGYEi7S+z0x9CrTL4O86WVX2r7NOiP5Dt6FlwFQRC6NWJKoDAMKlF/QYpgz0tR
         8VsA==
X-Gm-Message-State: AO0yUKXV2Z/qppAVIspFk+ZfRwb1592J8+pBULtfBBfPPNurWLl2HLX5
	HsG+2TYff0NUlu6ftpyoC4sIpA==
X-Google-Smtp-Source: AK7set8b6KYrDgJsDUasCRzNkPZH+h6KVrjKEJhah8oImVOIgUZnGx02Z+tXqXj/z7YbwM/PbXFd/w==
X-Received: by 2002:a05:600c:c06:b0:3dc:5a7c:f8ad with SMTP id fm6-20020a05600c0c0600b003dc5a7cf8admr10740538wmb.21.1675410462746;
        Thu, 02 Feb 2023 23:47:42 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j11-20020a5d604b000000b002b57bae7174sm1347095wrt.5.2023.02.02.23.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 23:47:42 -0800 (PST)
Message-ID: <e7ad1251-12b5-4161-8b51-f51ee77d0eb2@linaro.org>
Date: Fri, 3 Feb 2023 08:47:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/9] ASoC: dt-bindings: meson: convert axg tdm formatters
 to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-5-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202183653.486216-5-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_234744_351088_1DC5F8CC 
X-CRM114-Status: GOOD (  19.73  )
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
> Convert the DT binding documentation for the Amlogic tdm formatters to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../sound/amlogic,axg-tdm-formatters.txt      | 36 --------
>  .../sound/amlogic,axg-tdm-formatters.yaml     | 90 +++++++++++++++++++
>  2 files changed, 90 insertions(+), 36 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
> deleted file mode 100644
> index 5996c0cd89c2..000000000000
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -* Amlogic Audio TDM formatters
> -
> -Required properties:
> -- compatible: 'amlogic,axg-tdmin' or
> -	      'amlogic,axg-tdmout' or
> -	      'amlogic,g12a-tdmin' or
> -	      'amlogic,g12a-tdmout' or
> -	      'amlogic,sm1-tdmin' or
> -	      'amlogic,sm1-tdmout
> -- reg: physical base address of the controller and length of memory
> -       mapped region.
> -- clocks: list of clock phandle, one for each entry clock-names.
> -- clock-names: should contain the following:
> -  * "pclk"     : peripheral clock.
> -  * "sclk"     : bit clock.
> -  * "sclk_sel" : bit clock input multiplexer.
> -  * "lrclk"    : sample clock
> -  * "lrclk_sel": sample clock input multiplexer
> -
> -Optional property:
> -- resets: phandle to the dedicated reset line of the tdm formatter.
> -
> -Example of TDMOUT_A on the S905X2 SoC:
> -
> -tdmout_a: audio-controller@500 {
> -	compatible = "amlogic,axg-tdmout";
> -	reg = <0x0 0x500 0x0 0x40>;
> -	resets = <&clkc_audio AUD_RESET_TDMOUT_A>;
> -	clocks = <&clkc_audio AUD_CLKID_TDMOUT_A>,
> -		 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK>,
> -		 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK_SEL>,
> -		 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>,
> -		 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>;
> -	clock-names = "pclk", "sclk", "sclk_sel",
> -		      "lrclk", "lrclk_sel";
> -};
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
> new file mode 100644
> index 000000000000..f618724411de
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Audio AXG TDM formatters
> +
> +maintainers:
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +
> +allOf:
> +  - $ref: component-common.yaml#
> +
> +properties:
> +  $nodename:
> +    pattern: "^audio-controller@.*"

Drop.

> +
> +  compatible:
> +    oneOf:

Drop oneOf.

> +      - enum:
> +          - amlogic,g12a-tdmout
> +          - amlogic,sm1-tdmout
> +          - amlogic,axg-tdmout
> +          - amlogic,g12a-tdmin
> +          - amlogic,sm1-tdmin
> +          - amlogic,axg-tdmin
> +
> +  clocks:
> +    items:
> +      - description: Peripheral clock
> +      - description: Bit clock
> +      - description: Bit clock input multiplexer
> +      - description: Sample clock
> +      - description: Sample clock input multiplexer
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: sclk
> +      - const: sclk_sel
> +      - const: lrclk
> +      - const: lrclk_sel
> +
> +  reg:
> +    maxItems: 1

Missing property resets

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +if:

Put it under allOf.

> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - amlogic,g12a-tdmin
> +          - amlogic,sm1-tdmin
> +          - amlogic,g12a-tdmout
> +          - amlogic,sm1-tdmout
> +then:
> +  properties:
> +    resets:

Properties are defined in top-level. You can disallow it for other variants.

> +      items:
> +        - description: Dedicated device reset line
> +
> +  required:
> +    - resets
Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
