Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B334EB64DD
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Aug 2023 06:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=weAYzsLdZpzma1VavwM9gJ8v93Zztav57gDLbGbLzEI=; b=r+vtZHhSYQi275
	sx14uZVsnyXyhR5qecPqu3lIbMsQiF8Z4FjFQJ2iT1k+4CE64XT6Gz/+jGd/3VzXnqkqKIjDNS9P3
	a770H6oq5dhWVhPdII8xVFpoHXgxAKc/V7VDmoqcddCfkplaxFZbab1TEB22ivz5dLWHhzKZKWJh2
	ur1XbNOfpHWz3QpVQQeb9PEFGhIF/Z3Pqiu14ZuQnkwxZhuo8D9j+ik8mix3Jcoev8LC6jzUQeBqo
	inUfXmR2ZcnGZ0oA3FpoOcI4rFZfYHGSwK+W2TXg1qWRbpZnkgJTt8MZs+0z8evXbbBIEhtBQRHbn
	LAhbKkKo7sKMzps3z6gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTcuW-004AAc-1E;
	Wed, 09 Aug 2023 06:43:12 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTcuR-004A8n-0t
	for linux-amlogic@lists.infradead.org;
	Wed, 09 Aug 2023 06:43:10 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3177163aa97so5314827f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Aug 2023 23:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691563383; x=1692168183;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=kntP8Y9ceRocWIC/OOeyMK71VIkTrXJ3h5YSVFPUDgI=;
        b=UUuxm641QpLIqcCMKTz1Hhe8xa1cPg319FAwcAqmk9L7jnx6+yB3rE3MUeeUxYeum4
         4J5jKWAiubpyvNvm0MCZwzhZFZl8Ntf4AipleasPre+WF5jfzcAuFhood316C4kqCu0P
         tlrIfiOi4mbZUSporDpm+bRLFXNVKbgYl9h+7w961BTT5RgNOs7ddWdvIpj2/FVr4DgM
         iN/62YbkRBZNhkQ9c7TDvlwvhEZvGi5PtTFaazrdcGeMPMJW1/iKUo3QeDEo8cvO7QMJ
         KNWGsBGDMAUcEHgpMvShBiTWNzkDLIxvaPrVPUHI0eihl/Kc9l83Z3EBUvAgSpDx6sLs
         Hafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691563383; x=1692168183;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kntP8Y9ceRocWIC/OOeyMK71VIkTrXJ3h5YSVFPUDgI=;
        b=k+/Vky/I/6ZAshS4NlMr/B/vfoax189hRpdkQ9LOXH69uHo4XIalR9aBBCXeIqFV+8
         fYMNrAdFqFNbraCs0pojkrBki5c/Il/EW5Nn2uQJkdRc4SdCWnSOfVqHZcEVyQa9waxg
         cVNsHg00EvcxAH+qJ2BLdYRVYzKbQHI1+LUSBonnluf0M99rhUfPdfQfMsLuVea9DH0V
         sAD99/R+1ZgacySIbDn5hEzx59th9s6K4HHr5bAGTpL38IVMwRn2OTL6UOdm0dG8l7ua
         aUQTv61jmuSi2bUuTxqx7szYpBmfx9qteQeangmR254Vru9t1wxPCmCaRm3aXZ5mnqlh
         eq2Q==
X-Gm-Message-State: AOJu0Yys1h4+Dh41kUI1wElhQF1ngW6N6DmODSc2W4PgE0P87Ky1Rnl7
	ijeNkHByuqj0iE3N680TgOX5Vw==
X-Google-Smtp-Source: AGHT+IGT/vP5y+MBd+voB+7NqaVgqtJcETYF5AEG6aT8d/1P4nGajbm9pvnGqEei6sC8DXDyRAQw5Q==
X-Received: by 2002:a05:6000:10f:b0:317:57f0:fae with SMTP id o15-20020a056000010f00b0031757f00faemr1167141wrx.63.1691563383152;
        Tue, 08 Aug 2023 23:43:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c245:8b53:af5b:96f3])
        by smtp.gmail.com with ESMTPSA id b11-20020a05600010cb00b003180822cf8fsm385532wrx.1.2023.08.08.23.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 23:43:02 -0700 (PDT)
References: <20230808194811.113087-1-alexander.stein@mailbox.org>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alexander Stein <alexander.stein@mailbox.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: clock: meson: Convert axg-audio-clkc
 to YAML format
Date: Wed, 09 Aug 2023 08:15:31 +0200
In-reply-to: <20230808194811.113087-1-alexander.stein@mailbox.org>
Message-ID: <1ja5v0bts9.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_234307_534745_65C943E3 
X-CRM114-Status: GOOD (  28.67  )
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


On Tue 08 Aug 2023 at 21:48, Alexander Stein <alexander.stein@mailbox.org> wrote:

> Convert Amlogic AXG Audio Clock Controller binding to yaml.
>
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> ---
> As it is the same directory I picked the same maintainers as 
> Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml.
>
> I'm not 100% sure about the optional clocks constraints. As mentioned in
> the .txt version only pclk is mandatory, others are optional.
>
>  .../bindings/clock/amlogic,axg-audio-clkc.txt |  59 --------
>  .../clock/amlogic,axg-audio-clkc.yaml         | 136 ++++++++++++++++++
>  2 files changed, 136 insertions(+), 59 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
>
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
> deleted file mode 100644
> index 3a8948c04bc9..000000000000
> --- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -* Amlogic AXG Audio Clock Controllers
> -
> -The Amlogic AXG audio clock controller generates and supplies clock to the
> -other elements of the audio subsystem, such as fifos, i2s, spdif and pdm
> -devices.
> -
> -Required Properties:
> -
> -- compatible	: should be "amlogic,axg-audio-clkc" for the A113X and A113D,
> -		  "amlogic,g12a-audio-clkc" for G12A,
> -		  "amlogic,sm1-audio-clkc" for S905X3.
> -- reg		: physical base address of the clock controller and length of
> -		  memory mapped region.
> -- clocks	: a list of phandle + clock-specifier pairs for the clocks listed
> -		  in clock-names.
> -- clock-names	: must contain the following:
> -		  * "pclk" - Main peripheral bus clock
> -		  may contain the following:
> -		  * "mst_in[0-7]" - 8 input plls to generate clock signals
> -		  * "slv_sclk[0-9]" - 10 slave bit clocks provided by external
> -				      components.
> -		  * "slv_lrclk[0-9]" - 10 slave sample clocks provided by external
> -				       components.
> -- resets	: phandle of the internal reset line
> -- #clock-cells	: should be 1.
> -- #reset-cells  : should be 1 on the g12a (and following) soc family
> -
> -Each clock is assigned an identifier and client nodes can use this identifier
> -to specify the clock which they consume. All available clocks are defined as
> -preprocessor macros in the dt-bindings/clock/axg-audio-clkc.h header and can be
> -used in device tree sources.
> -
> -Example:
> -
> -clkc_audio: clock-controller@0 {
> -	compatible = "amlogic,axg-audio-clkc";
> -	reg = <0x0 0x0 0x0 0xb4>;
> -	#clock-cells = <1>;
> -
> -	clocks = <&clkc CLKID_AUDIO>,
> -		 <&clkc CLKID_MPLL0>,
> -		 <&clkc CLKID_MPLL1>,
> -		 <&clkc CLKID_MPLL2>,
> -		 <&clkc CLKID_MPLL3>,
> -		 <&clkc CLKID_HIFI_PLL>,
> -		 <&clkc CLKID_FCLK_DIV3>,
> -		 <&clkc CLKID_FCLK_DIV4>,
> -		 <&clkc CLKID_GP0_PLL>;
> -	clock-names = "pclk",
> -		      "mst_in0",
> -		      "mst_in1",
> -		      "mst_in2",
> -		      "mst_in3",
> -		      "mst_in4",
> -		      "mst_in5",
> -		      "mst_in6",
> -		      "mst_in7";
> -	resets = <&reset RESET_AUDIO>;
> -};
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> new file mode 100644
> index 000000000000..629fa3a81cf7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic AXG Audio Clock Controller
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +  - Jian Hu <jian.hu@jian.hu.com>
> +  - Dmitry Rokosov <ddrokosov@sberdevices.ru>
> +

Jian and Dmitry do not maintain this.

> +description:
> +  The Amlogic AXG audio clock controller generates and supplies clock to the
> +  other elements of the audio subsystem, such as fifos, i2s, spdif and pdm
> +  devices.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,axg-audio-clkc
> +      - amlogic,g12a-audio-clkc
> +      - amlogic,sm1-audio-clkc
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 11
> +
> +  clock-names:
> +    oneOf:
> +      - const: pclk
> +      - items:
> +          - const: pclk
> +          - const: mst_in0
> +          - const: mst_in1
> +          - const: mst_in2
> +          - const: mst_in3
> +          - const: mst_in4
> +          - const: mst_in5
> +          - const: mst_in6
> +          - const: mst_in7
> +      - items:
> +          - const: pclk
> +          - const: slv_sclk0
> +          - const: slv_sclk1
> +          - const: slv_sclk2
> +          - const: slv_sclk3
> +          - const: slv_sclk4
> +          - const: slv_sclk5
> +          - const: slv_sclk6
> +          - const: slv_sclk7
> +          - const: slv_sclk8
> +          - const: slv_sclk9
> +      - items:
> +          - const: pclk
> +          - const: slv_lrclk0
> +          - const: slv_lrclk1
> +          - const: slv_lrclk2
> +          - const: slv_lrclk3
> +          - const: slv_lrclk4
> +          - const: slv_lrclk5
> +          - const: slv_lrclk6
> +          - const: slv_lrclk7
> +          - const: slv_lrclk8
> +          - const: slv_lrclk9
> +

IIUC the above, it means
 - pclk
 - OR pclk with all the master clocks
 - OR pclk with all the slave bit clocks
 - OR pclk with all the slave sample clocks.

Correct ?

If that is what it means, it is wrong.

* pclk is required
* the master and slave clocks are all optional and independent.

Any combination of master and slave clocks is valid from the controller
perspective. For ex: it is perfectly OK to have master 2 and 4, slave 5
and 8, and not the others.

> +  resets:
> +    description: internal reset line
> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,g12a-audio-clkc
> +              - amlogic,sm1-audio-clkc
> +    then:
> +      required:
> +        - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/axg-clkc.h>
> +    #include <dt-bindings/reset/amlogic,meson-axg-reset.h>
> +    apb {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clkc_audio: clock-controller@0 {
> +        compatible = "amlogic,axg-audio-clkc";
> +        reg = <0x0 0x0 0x0 0xb4>;
> +        #clock-cells = <1>;
> +
> +        clocks = <&clkc CLKID_AUDIO>,
> +            <&clkc CLKID_MPLL0>,
> +            <&clkc CLKID_MPLL1>,
> +            <&clkc CLKID_MPLL2>,
> +            <&clkc CLKID_MPLL3>,
> +            <&clkc CLKID_HIFI_PLL>,
> +            <&clkc CLKID_FCLK_DIV3>,
> +            <&clkc CLKID_FCLK_DIV4>,
> +            <&clkc CLKID_GP0_PLL>;
> +        clock-names = "pclk",
> +            "mst_in0",
> +            "mst_in1",
> +            "mst_in2",
> +            "mst_in3",
> +            "mst_in4",
> +            "mst_in5",
> +            "mst_in6",
> +            "mst_in7";
> +        resets = <&reset RESET_AUDIO>;
> +      };
> +    };


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
