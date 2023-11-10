Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A56C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Nov 2023 20:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OVnQ0ttx1PlIsxKRP3uV0FRKLtn0YEnZ9eIs//HPvwU=; b=c5wd9DgYtZbz9I
	J7x5fI99tg0J6JAIqMLQJu0cKe9fTU9utU6GVKMzuWXtxENDr7vgJqmUldMoYBRPARLeuzASPzAPS
	jQ6S9mZxn1Bm+JOlyIqAjkg28JkFcdh7FuYh50trvuQ3PM8cTwTTIpipbbIZj7sF7PlXlcoLexI8I
	hIJz5do19uDeYwd2+5DrUHBOt3d0+A3s/BCm1qkhoOhSYCQErF/QABUp2/2wLYLlnH3GkjEx2KPQm
	wFIFZGHulsWKbOZLdgrJSd5ORQIsC5/uvhXDXlfuANUaRGckPuprddwr1KDa8q0pAydq+70WI5LH2
	GHIu54N2TCMnac3eCLAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Xrh-009MYi-2H;
	Fri, 10 Nov 2023 20:12:29 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Xrf-009MYH-1j;
	Fri, 10 Nov 2023 20:12:28 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1f066fc2a28so1284279fac.0;
        Fri, 10 Nov 2023 12:12:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699647146; x=1700251946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYPa4O78Tl9tcmK397HC2WttsKjZOddgN547MJ4MmL0=;
        b=jffYXZCuhkV9hyIgKEhd8vSBvtuSJqF2elh9PAoEPrFvyXrdp8kFDdiC2ti2o4UluN
         iODLUdJCmvyspPZCnGcpY88d3A/QGAvBYs5eGj7kpAPkCJ1i1w1JgsGQ0wuVF/zq3+gK
         uNPiNGmw8fu68cU1lDwjOjMgUaebNu1S4UAFik/wkj85rtGYU3ianWXhnh0TX+JU6uwo
         HaJyNUhg0JWXKJPPzKEvh674oB3P6Hvcp1Fs5ITbNwqeo11Ip6BnaeF6kOVLJCUzsaZ/
         6BZxGJFLmUYwPBxvAt5T4k3p+EjyTGGaXvXV1Me//yEDvC43Iwp2RkN1yQcVzn7zHooF
         ogjA==
X-Gm-Message-State: AOJu0YxycgyklTT4E+JyCJlSIVKtW57c/Thka+XT6Dos5HLwGFelhgeu
	dZFLnVPwIlMLu7/F6GYTDIM/q3T1/A==
X-Google-Smtp-Source: AGHT+IGGXIL2O/re8npp6ti2/LlN+F5Sn3lm88DX439xHtC4GKBD8xBJhNWXN6GHMCBpDIWH4xG5Rw==
X-Received: by 2002:a05:6870:2dc6:b0:1c8:c27f:7d9b with SMTP id op6-20020a0568702dc600b001c8c27f7d9bmr282410oab.27.1699647146338;
        Fri, 10 Nov 2023 12:12:26 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y22-20020a056870725600b001ea4324364csm52458oaf.12.2023.11.10.12.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 12:12:25 -0800 (PST)
Received: (nullmailer pid 351692 invoked by uid 1000);
	Fri, 10 Nov 2023 20:12:23 -0000
Date: Fri, 10 Nov 2023 14:12:23 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Jagan Teki <jagan@amarulasolutions.com>, Nicolas Belin <nbelin@baylibre.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 02/12] dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl:
 add example covering meson-axg-hhi-sysctrl
Message-ID: <20231110201223.GA347493-robh@kernel.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
 <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-2-81e4aeeda193@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-2-81e4aeeda193@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_121227_598752_4778A9B0 
X-CRM114-Status: GOOD (  16.80  )
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

On Thu, Nov 09, 2023 at 10:00:03AM +0100, Neil Armstrong wrote:
> Add a thirst example covering the meson-axg-hhi-sysctrl variant and more
> importantly the phy subnode.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
> index 16977e4e4357..2edf4ccea845 100644
> --- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
> +++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
> @@ -158,3 +158,44 @@ examples:
>              };
>          };
>      };
> +

New example should be separate starting with a '-|'.

> +    bus@ff63c000 {
> +        compatible = "simple-bus";
> +        reg = <0xff63c000 0x1c00>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0x0 0xff63c000 0x1c00>;

Why do you need all this? 1 cell is the default for examples.

> +
> +        system-controller@0 {
> +            compatible = "amlogic,meson-axg-hhi-sysctrl", "simple-mfd", "syscon";
> +            reg = <0 0x400>;
> +
> +            clock-controller {
> +                compatible = "amlogic,axg-clkc";
> +                #clock-cells = <1>;
> +                clocks = <&xtal>;
> +                clock-names = "xtal";
> +            };
> +
> +            power-controller {
> +                compatible = "amlogic,meson-axg-pwrc";
> +                #power-domain-cells = <1>;
> +                amlogic,ao-sysctrl = <&sysctrl_AO>;
> +
> +                resets = <&reset_viu>,
> +                         <&reset_venc>,
> +                         <&reset_vcbus>,
> +                         <&reset_vencl>,
> +                         <&reset_vid_lock>;
> +                reset-names = "viu", "venc", "vcbus", "vencl", "vid_lock";
> +                clocks = <&clk_vpu>, <&clk_vapb>;
> +                clock-names = "vpu", "vapb";
> +            };
> +
> +            phy {
> +                compatible = "amlogic,axg-mipi-pcie-analog-phy";
> +                #phy-cells = <0>;
> +                status = "disabled";

Examples should not be disabled.

> +            };
> +        };
> +    };
> 
> -- 
> 2.34.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
