Return-Path: <SRS0=AcXA=4Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C6CC3F2CD
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2020 17:18:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BA45246A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2020 17:18:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PFLfwN1F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BA45246A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+jV5FpXNsfLuhrOoAh7NVCkj775IKKZGepibOLTvIo=; b=PFLfwN1FLnV+EY
	XHvntlXbmsq34X3DMESXwu3mExA6yb+ceCzbSBZKBR8OMBAhSCvRBW3tEsHmVTpiTAj3ygx/X6H9y
	9ea2jc3hJJO0WlzxOTwvKkN2bZkI8JKcXhR6NPLmyP1EOJ9iSZZgmhlOSMhmdvhavdvvJKjnFJr7L
	MeQIbx7+gnJNBGN4Os+5ExeNqeUB0JL5hhu6BvR8+kIa4wIWF9qrU5QKj2UA5PaBQiRALa1xSHke1
	9qRo1wtXk/6KQ17L6Zm8kncB7XJQg9bC57BY7l6iHEWUNbr44jI+rZ5RJQTBNV+h9U1Rg1OaVJwU6
	suJdHcPOskCrM4ntgp4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7jHg-0004tE-C1; Fri, 28 Feb 2020 17:18:44 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7jHe-0004sv-0A
 for linux-amlogic@lists.infradead.org; Fri, 28 Feb 2020 17:18:43 +0000
Received: by mail-ot1-f68.google.com with SMTP id g96so3225107otb.13
 for <linux-amlogic@lists.infradead.org>; Fri, 28 Feb 2020 09:18:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pb+PJoJtW2sA5x/kLQp2vnmzDsqGqr65TnSBcPMbR7g=;
 b=ErrxC3HTAKbiOvFWRmfKAZiyOjhjXKfJ7kurSm/kXig2FEEyGjb5okq7DsdyutB4nm
 IHFsMCNKFx3h1v7AXRt+gr3ouyaOmKx/CPZoF8MuotZsa0quHkPx3x/QIJ+0g8R+rZZg
 LbyJ8u3kuJ+YN0wXEFSeIzz4I+7NwWSElqJf+92utVwd+fZYxQfEEdKkMIhvhp4Varvc
 03IlHoJ7Nq2WKQ6+ilkV5ESKOi1RHRFMsnfUs0foWj9GwpD/IMFRL+gaBpwL8Ov+Bcm5
 re4nEwewV5QgQCZlXt4llUDHvkS3sDnhyQHu6mQtdiILAApgqHyyQRT9rYyw7iMmdKd1
 QcGw==
X-Gm-Message-State: APjAAAVq1zVRa1T4X+tvM6VRjOtn4HhYzF3WfpQ9wi9eoz2PZm2Kts9K
 i2+pntYjC5bf9plmez58Qg==
X-Google-Smtp-Source: APXvYqzab5ENBUX7/Dqgb0kBzOfn28/rFZnWr1rJG7CNXgNlbWqOdHwOkN1Yv4PRdvFnNLEteaDSbQ==
X-Received: by 2002:a05:6830:160c:: with SMTP id
 g12mr4121358otr.82.1582910320121; 
 Fri, 28 Feb 2020 09:18:40 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z17sm3296727oic.15.2020.02.28.09.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 09:18:39 -0800 (PST)
Received: (nullmailer pid 26488 invoked by uid 1000);
 Fri, 28 Feb 2020 17:18:38 -0000
Date: Fri, 28 Feb 2020 11:18:38 -0600
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 3/9] ASoC: meson: convert axg tdm formatters to schema
Message-ID: <20200228171838.GA27450@bogus>
References: <20200224145821.262873-1-jbrunet@baylibre.com>
 <20200224145821.262873-4-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224145821.262873-4-jbrunet@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_091842_040104_90957F4E 
X-CRM114-Status: GOOD (  16.42  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Feb 24, 2020 at 03:58:15PM +0100, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic tdm formatters to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../sound/amlogic,axg-tdm-formatters.txt      | 36 --------
>  .../sound/amlogic,axg-tdm-formatters.yaml     | 92 +++++++++++++++++++
>  2 files changed, 92 insertions(+), 36 deletions(-)
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
> index 000000000000..f6f3bfb546f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license please as you're the only author of the .txt file.

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
> +properties:
> +  $nodename:
> +    pattern: "^audio-controller@.*"
> +
> +  compatible:
> +    oneOf:
> +      - items:
> +        - enum:
> +          - amlogic,g12a-tdmout
> +          - amlogic,sm1-tdmout
> +          - amlogic,axg-tdmout
> +      - items:
> +        - enum:
> +          - amlogic,g12a-tdmin
> +          - amlogic,sm1-tdmin
> +        - const:
> +            amlogic,axg-tdmin
> +      - items:
> +        - const:
> +            amlogic,axg-tdmin
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
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - amlogic,g12a-tdmin
> +          - amlogic,sm1-tdmin
> +          - amlogic,g12a-tdmout
> +          - amlogic,sm1-tdmout
> +then:
> +  required:
> +    - resets
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/axg-audio-clkc.h>
> +    #include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
> +
> +    tdmout_a: audio-controller@500 {
> +        compatible = "amlogic,g12a-tdmout",
> +                     "amlogic,axg-tdmout";

This fails validation.

> +        reg = <0x0 0x500 0x0 0x40>;
> +        resets = <&clkc_audio AUD_RESET_TDMOUT_A>;
> +        clocks = <&clkc_audio AUD_CLKID_TDMOUT_A>,
> +                 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK>,
> +                 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK_SEL>,
> +                 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>,
> +                 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>;
> +        clock-names = "pclk", "sclk", "sclk_sel",
> +                      "lrclk", "lrclk_sel";
> +    };
> +
> -- 
> 2.24.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
