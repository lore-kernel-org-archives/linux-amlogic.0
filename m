Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B468C74A5B
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Mar 2023 17:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X69XIgFOBLWZTwh+9/o9Pla9u27yBMss+I3Hut5ZI/s=; b=BGjE6fBfA7QGNR
	HC0F1okBnuZ5Ad4p/sKmlewnfBYapjKV58jQwgKQTcxCqMMF1ff3flzGjg9lUEkjEQBiQeX5PPKKu
	Xm+Ka+fdT6MVugEV+GyrKmBfwHSUdW3+SF4bD17QKH9/KtSBo7PgFseW6K4T2KqR6n8I46SvQI0r2
	INPYCvKg/OPzZjUzB0y6Pjv5xJxktJ/BrKxhnwwlzeMqZ6UZxNtVshs0Ggl/yhqDRPhpdEpR8viTC
	r3n3wRnpee4FUpNUCrHmvrEKpVEOW5XkU9kD2S370pYRkbAP5sFVevKjTVUhc8lDyi5HsGcIkr580
	9UADYmqrFt81+jYLEyRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phZU3-001HNZ-37;
	Wed, 29 Mar 2023 17:21:15 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phZU0-001HMa-1R
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Mar 2023 17:21:14 +0000
Received: by mail-pf1-x433.google.com with SMTP id l14so10753207pfc.11
        for <linux-amlogic@lists.infradead.org>; Wed, 29 Mar 2023 10:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680110470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gutUdfZnZGJz80FqANIFD9947ke4IDEKtmrilCP9Asg=;
        b=uoDbG/Rpr227AQzHfgKoRhIFdGyFDgE38i3QuNOHy1nfld7wbGPfRr9WuTb7JUFFRv
         5S6IUx5xo+jHf4HvuW37VUeU6CjeSxv7fJ3Xu1nDh3LyiSPOzXMvxx0JIjwsnbFpR5AC
         h/Z91+pEymRNAWpDcf4quLxfLPS/ZppPxHBsPd6hfixrDpFQxADA7OvslGVMam2HYR1T
         0nFVVFHIHCF83Qv5QPd7b/P0qCSfQK+pmpvJ/1puEeX934QmJKrQHP2Z5Zao9n2DUn2L
         gkMFCIk+VFJN3pd6/P7u1g6lhw+g3t5dv0cnLwPs3L7zuHEKDj2kEBENZazXqqiHwvYq
         f/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680110470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gutUdfZnZGJz80FqANIFD9947ke4IDEKtmrilCP9Asg=;
        b=XL4uNHafIl5cvgLsXSfyfyRPywxv0g48aCBKjfvrQ30u4bs+msXl0i9hEt2WKq68Fm
         AuITJUUzcgDHRcCt5MKnZ3Il6m+FP65RCpXWhgBCL5hEAgAT4tklQx83wNbXo2ZSW/pl
         BKmn5veqOxj3fL4EEuseYqNM7HqQw+iAOAxoXUE2EHKSlFMs/AVAq/QyEjq14YOooin4
         544BHybIkjXJBhwc9xIjLj6AJZDzQHyyJCpdH6bgCgNpQIqUADJV9aLrvBtGPDWMzP2w
         uMODHrCS7e5u3qilFUgBariuU6rk8u0qXzzWiVTIf9ldqtXWbv7ZNoDQcfDQnAjUCBc6
         m+ug==
X-Gm-Message-State: AAQBX9dSsHgJsHi+MRW4fW9D/x/TbIyIMd/ae2v4nBdJZBhsVsT2E614
	bjWKZg7fH5nfVXITiPKz2L/Dmw==
X-Google-Smtp-Source: AKy350Y9SAYyqMx62p9jKSnHqyG110Q69ooC4fMXn9Wpn/gCEjRcEAoPcOxIkdsN6Ap4ln7XX1StRw==
X-Received: by 2002:aa7:99d2:0:b0:626:7c43:7cb8 with SMTP id v18-20020aa799d2000000b006267c437cb8mr19386468pfi.20.1680110470163;
        Wed, 29 Mar 2023 10:21:10 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:6b79:83ab:5e33:50a5])
        by smtp.gmail.com with ESMTPSA id v3-20020a632f03000000b00502e6bfedc0sm21950243pgv.0.2023.03.29.10.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 10:21:09 -0700 (PDT)
Date: Wed, 29 Mar 2023 11:21:06 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] dt-bindings: remoteproc: Drop unneeded quotes
Message-ID: <20230329172106.GA3374270@p14s>
References: <20230327170114.4102315-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230327170114.4102315-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_102112_510417_1BC04912 
X-CRM114-Status: GOOD (  16.20  )
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

On Mon, Mar 27, 2023 at 12:01:13PM -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../remoteproc/amlogic,meson-mx-ao-arc.yaml        |  4 ++--
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         |  4 ++--
>  .../bindings/remoteproc/ingenic,vpu.yaml           |  4 ++--
>  .../bindings/remoteproc/qcom,glink-edge.yaml       |  2 +-
>  .../bindings/remoteproc/qcom,smd-edge.yaml         |  2 +-
>  .../bindings/remoteproc/renesas,rcar-rproc.yaml    |  4 ++--
>  .../bindings/remoteproc/st,stm32-rproc.yaml        | 14 +++++++-------
>  7 files changed, 17 insertions(+), 17 deletions(-)
>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> diff --git a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> index 11cb42a3fdd1..3100cb870170 100644
> --- a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/remoteproc/amlogic,meson-mx-ao-arc.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/remoteproc/amlogic,meson-mx-ao-arc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Amlogic Meson AO ARC Remote Processor
>  
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index ae2eab4452dd..0c3910f152d1 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/remoteproc/fsl,imx-rproc.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/remoteproc/fsl,imx-rproc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: NXP i.MX Co-Processor
>  
> diff --git a/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml b/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml
> index 85b1e43cab08..8b55dbd909b0 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/remoteproc/ingenic,vpu.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/remoteproc/ingenic,vpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Ingenic Video Processing Unit
>  
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
> index 15e6851e1ff8..7b43ad3daa56 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
> @@ -15,7 +15,7 @@ description:
>  
>  properties:
>    $nodename:
> -    const: "glink-edge"
> +    const: glink-edge
>  
>    apr:
>      $ref: /schemas/soc/qcom/qcom,apr.yaml#
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,smd-edge.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,smd-edge.yaml
> index 7ec8a6b6682c..02c85b420c1a 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,smd-edge.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,smd-edge.yaml
> @@ -21,7 +21,7 @@ description:
>  
>  properties:
>    $nodename:
> -    const: "smd-edge"
> +    const: smd-edge
>  
>    apr:
>      $ref: /schemas/soc/qcom/qcom,apr.yaml#
> diff --git a/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
> index 7e0275d31a3c..4bea679a0f61 100644
> --- a/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/remoteproc/renesas,rcar-rproc.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/remoteproc/renesas,rcar-rproc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Renesas R-Car remote processor controller
>  
> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> index 66b1e3efdaa3..37c0d7b4ceef 100644
> --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/remoteproc/st,stm32-rproc.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/remoteproc/st,stm32-rproc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: STMicroelectronics STM32 remote processor controller
>  
> @@ -29,7 +29,7 @@ properties:
>  
>    st,syscfg-holdboot:
>      description: remote processor reset hold boot
> -    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>      items:
>        - items:
>            - description: Phandle of syscon block
> @@ -39,7 +39,7 @@ properties:
>    st,syscfg-tz:
>      description:
>        Reference to the system configuration which holds the RCC trust zone mode
> -    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>      items:
>        - items:
>            - description: Phandle of syscon block
> @@ -95,7 +95,7 @@ properties:
>        (see ../reserved-memory/reserved-memory.txt)
>  
>    st,syscfg-pdds:
> -    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>      description: |
>        Reference to the system configuration which holds the remote
>      items:
> @@ -105,7 +105,7 @@ properties:
>            - description: The field mask of the PDDS selection
>  
>    st,syscfg-m4-state:
> -    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>      description: |
>        Reference to the tamp register which exposes the Cortex-M4 state.
>      items:
> @@ -115,7 +115,7 @@ properties:
>            - description: The field mask of the Cortex-M4 state
>  
>    st,syscfg-rsc-tbl:
> -    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>      description: |
>        Reference to the tamp register which references the Cortex-M4
>        resource table address.
> -- 
> 2.39.2
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
