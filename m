Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B64C6FD1C
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 13:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6RloKXSyP04uE2E1BrmrCEqOA1f1dAi/2nQAt9BaobQ=; b=FzZCm7A9LirsE3
	L2xl7jQ5kjK+gxjLwyJKwqm5qW4WYSxC30N+5+UVNn10kAOqZJ/X1KLCmFy39NPlC6hMz/f+2zohC
	eG5+1GIHR0FyTHmhbxCcFukx10Ywk49HxzGHZ+mezmBKDJPmYd8X2bmCm1AXHtPtHvEn8BioCBE7B
	LVAQKWrewXulN8ZfpNHvRD/CyJFa8aaS8jzuCZ4CTDkNVzCPLpAfeqJ5TKWAJMbzxs2HMXc5dFmK8
	4m3K4vOa6OtkJJDEKIVt6IiYe69r7w+zizKKvkfxatNK1Pm+ikyKy4nTgi9PyP9BMS20jSfu48Zi6
	YpQTQ4su6f9rVy1NTIOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLDu-0024Dv-26;
	Thu, 23 Mar 2023 13:43:22 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLDp-0024Ay-1K;
	Thu, 23 Mar 2023 13:43:20 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32NDMIE6002590;
	Thu, 23 Mar 2023 14:42:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=sQzBCRwn0PSkTfpCL6fVZArvZ3V559r88ED5L6dkNfQ=;
 b=sqOIOV98qbB4h7wX5dg1HQXu19ud+16zOv7nLWSQqlHRQn8oNqxDRDNDMGs5nMylCzoo
 0yK/DNmtCZaCrxxz9ALjY8ISZ38DHXOflq2ZsG05NdpKw79HpCbxJBhJBgQO6wOqGA+5
 6FBvL5QRUIeKLwt6ID4bjNEp4gCH7j6cVjNhQ4D7kBERx7dgLkDJphgiUpvTdKxVT5Ju
 DO/BKFB/HmDD6pGfiQWWykmxnASsNFhOE5oyocC7lDcqZvAeMdBDZwf3QilxTh8KhCc5
 JHUXuzilnOpESAjJwrWQ3GEaPhks0KhO3WMbmpuva+edHaRGDna9ssE7mMr/SxTqqYFi mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pfwcu2bb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 14:42:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C0938100040;
	Thu, 23 Mar 2023 14:42:50 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B20242171F3;
	Thu, 23 Mar 2023 14:42:03 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Thu, 23 Mar
 2023 14:42:03 +0100
Date: Thu, 23 Mar 2023 14:41:56 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome
 Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>,
        Hector Martin <marcan@marcan.st>, Sven
 Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Nicolas
 Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Claudiu Beznea
	<claudiu.beznea@microchip.com>,
        Michal Simek <michal.simek@xilinx.com>, Peter
 Rosin <peda@axentia.se>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>,
        <linux-amlogic@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: i2c: Drop unneeded quotes
Message-ID: <20230323134156.GA4017557@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Peter Rosin <peda@axentia.se>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
References: <20230322173530.3971676-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230322173530.3971676-1-robh@kernel.org>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-22_01,2023-02-09_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_064318_667711_259DCE9D 
X-CRM114-Status: GOOD (  21.63  )
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

On Wed, Mar 22, 2023 at 12:35:29PM -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml | 4 ++--
>  Documentation/devicetree/bindings/i2c/apple,i2c.yaml          | 4 ++--
>  Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml  | 2 +-
>  Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml     | 4 ++--
>  Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml       | 4 ++--
>  Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++--
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml       | 2 +-

Reviewed-by: Alain Volmat <alain.volmat@foss.st.com>

>  .../devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml          | 4 ++--
>  8 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
> index 199a354ccb97..26bed558c6b8 100644
> --- a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
> @@ -2,8 +2,8 @@
>  # Copyright 2019 BayLibre, SAS
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/i2c/amlogic,meson6-i2c.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/i2c/amlogic,meson6-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Amlogic Meson I2C Controller
>  
> diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> index 4ac61fec90e2..243da7003cec 100644
> --- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/i2c/apple,i2c.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Apple/PASemi I2C controller
>  
> diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> index ea2303c0e143..6adedd3ec399 100644
> --- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> @@ -75,7 +75,7 @@ required:
>    - clocks
>  
>  allOf:
> -  - $ref: "i2c-controller.yaml"
> +  - $ref: i2c-controller.yaml
>    - if:
>        properties:
>          compatible:
> diff --git a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> index 2e95cda7262a..7a675aa08c44 100644
> --- a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> +++ b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/i2c/cdns,i2c-r1p10.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/i2c/cdns,i2c-r1p10.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Cadence I2C controller
>  
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
> index 6e0a5686af04..f34cc7ad5a00 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
> @@ -45,7 +45,7 @@ properties:
>  
>    i2c-parent:
>      description: phandle of the I2C bus that this multiplexer's master-side port is connected to
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    $ref: /schemas/types.yaml#/definitions/phandle
>  
>    mux-gpios:
>      description: list of GPIOs used to control the muxer
> @@ -55,7 +55,7 @@ properties:
>    idle-state:
>      description: Value to set the muxer to when idle. When no value is given, it defaults to the
>        last value used.
> -    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    $ref: /schemas/types.yaml#/definitions/uint32
>  
>  allOf:
>    - $ref: i2c-mux.yaml
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> index 0e88c85985b5..9f66a3bb1f80 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/i2c/qcom,i2c-geni-qcom.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/i2c/qcom,i2c-geni-qcom.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Qualcomm Geni based QUP I2C Controller
>  
> diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> index bf396e9466aa..94b75d9f66cd 100644
> --- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> @@ -90,7 +90,7 @@ properties:
>    st,syscfg-fmp:
>      description: Use to set Fast Mode Plus bit within SYSCFG when Fast Mode
>        Plus speed is selected by slave.
> -    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>      items:
>        - items:
>            - description: phandle to syscfg
> diff --git a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
> index 1b598638d457..658ae92fa86d 100644
> --- a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
> +++ b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Xilinx IIC controller
>  
> -- 
> 2.39.2
> 
> _______________________________________________
> Linux-stm32 mailing list
> Linux-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

Regards,
Alain


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
