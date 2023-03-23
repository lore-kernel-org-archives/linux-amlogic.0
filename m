Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C25BC6FD1D
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 09:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9SToL8i0tzXxe/bV91f9dcpLmV/U/dHtNhcKSKnZxY=; b=tjwDCle68xzNzcYxPKjIL49+1E
	ACkjgdtygBt5HS+ys1CIJAk7DnpJTDlq6tocSJyr3atfQBLuP7YoWdQ9vmzBzhr8K8alHV+wgIKa4
	GbJ3gYkU6pqJfJpI7hAGTSxUhFXB/ceGw0Y4ULf2MhsnG43YE+pV3obSX9IGFzVvjSQbLTHN8ApZF
	fVVYPbufeQWZmfBA7wAa6NOqP9XQlyIscmAFJusGKENNYi3oLqr48K0GNNyu5OWJ3Kl9T5sFjDGMd
	d6SoVMRhZeuf9WcLFe8N3w0bK8JaeiMof8RJsH2PE6DSZqrjBSCE1e/dkpb/LMuNLfhJW6wDTZ7f/
	gnU/uSlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGzr-001O4T-1g;
	Thu, 23 Mar 2023 09:12:35 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGzl-001O0y-1j
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 09:12:32 +0000
Received: by mail-wr1-x42f.google.com with SMTP id i9so19638787wrp.3
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 02:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679562746;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Lw2KtnfrXgMSTtwKSsEVf0QKX+9cqYY4BerOVnSFpqg=;
        b=TV+V6f9LUNM0+CzoHHTrQsW8YpC23Qo+YU8xv3lKOiuJP8u3cIraecCZjOcZmHsYlj
         vcoNFC0bq+bU2VpRy24gs1OxJwzBOzhqRYJSs3uw8A3mWIZFDPWvXNUrRkE83gUK/AeR
         cSE8b8YjvBg1Alf5hAMT0bNnYGYTBFJ3HeC/wl4UrGBjYdTADQB/3Sw3niLDjQR4Mo82
         GxehxS2m5AoduZTfUkrHk/NKXR1xNi/69h0MQNkqKpa+6Icv532T8FN6Bt3fcK8CuB91
         4gShbWsbtl3nkQXNZUzliMisB26cWZXaMIAraZWm67oI0csUZ1bfzDqNg7yXWiLRFK/4
         tHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679562746;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lw2KtnfrXgMSTtwKSsEVf0QKX+9cqYY4BerOVnSFpqg=;
        b=NF8sxDP3oo0RCU+ZFO68a5CW0BCYhmKhdE512I0SyFOdVL7M/C/V3SnGwwrc5IsQk5
         oJLYT4i57g1QY7miRptFwqUDslaIbXMucqZDmu95cpAsB/IonLvDLPaHjhBwDWUcflu2
         JldB1ta2bqueaHHvDK7NuGmkC5sL48fa8VESwHol2ZDoUkEVhXGQcjvGhYWCXdehbfC/
         s/ESbZoBm3gJgjJ8t/DdVYDIlwsss+ZYEAFLScc8Uz6wW/5KLRgucs3EdEC0tG9j9eDw
         RHoSe7G7CP1i/1sZRLG1Yq4Cs5eZ3fNQuTIWe1Zeh0QPF3io5iZSbxTe0uEtPJHgRnsy
         vkyw==
X-Gm-Message-State: AAQBX9cU6aC0x4EPrsiMO+KoLsQm2FHVJ4B5ybE1nL3JA5BOIGGcbIdi
	b5j85uh4Iha6M0AmqOjbFnKlAQ==
X-Google-Smtp-Source: AKy350Y5wQTBHdHfn9aM67xMeKdfsK61wnhwAkLOBgELzHwC2WSTeOuu5J/UlaTvNclpU2KgwQ+apA==
X-Received: by 2002:a5d:525c:0:b0:2ce:a7df:c115 with SMTP id k28-20020a5d525c000000b002cea7dfc115mr1978118wrc.41.1679562746582;
        Thu, 23 Mar 2023 02:12:26 -0700 (PDT)
Received: from [192.168.7.188] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id a6-20020a056000100600b002c8ed82c56csm15727085wrx.116.2023.03.23.02.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 02:12:26 -0700 (PDT)
Message-ID: <ca9ee5c3-77cf-af08-1eb1-3e1170e32681@linaro.org>
Date: Thu, 23 Mar 2023 10:12:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: mailbox: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Michal Simek <michal.simek@xilinx.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20230322173449.3970718-1-robh@kernel.org>
Organization: Linaro Developer Services
In-Reply-To: <20230322173449.3970718-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_021229_575965_1C4FA76B 
X-CRM114-Status: GOOD (  12.22  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 22/03/2023 18:34, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   .../devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml   | 4 ++--

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

>   .../devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml   | 4 ++--
>   .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml    | 4 ++--
>   Documentation/devicetree/bindings/mailbox/sprd-mailbox.yaml   | 4 ++--
>   Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml  | 4 ++--
>   .../devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml  | 4 ++--
>   6 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
> index dfd26b998189..385809ed1569 100644
> --- a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
> @@ -2,8 +2,8 @@
>   # Copyright 2019 BayLibre, SAS
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/mailbox/amlogic,meson-gxbb-mhu.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/mailbox/amlogic,meson-gxbb-mhu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Amlogic Meson Message-Handling-Unit Controller
>   
> diff --git a/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
> index 935937c67133..404477910f02 100644
> --- a/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/mailbox/microchip,mpfs-mailbox.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/mailbox/microchip,mpfs-mailbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Microchip PolarFire SoC (MPFS) MSS (microprocessor subsystem) mailbox controller
>   
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> index d888ead09282..7f18fb10435d 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Qualcomm APCS global block
>   
> diff --git a/Documentation/devicetree/bindings/mailbox/sprd-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/sprd-mailbox.yaml
> index bdfb4a8220c5..b526f9c0c272 100644
> --- a/Documentation/devicetree/bindings/mailbox/sprd-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/sprd-mailbox.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/mailbox/sprd-mailbox.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/mailbox/sprd-mailbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Spreadtrum mailbox controller
>   
> diff --git a/Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml
> index 0dfe05a04dd0..134fd223a02b 100644
> --- a/Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/mailbox/st,stm32-ipcc.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/mailbox/st,stm32-ipcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: STMicroelectronics STM32 IPC controller
>   
> diff --git a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
> index 2193141dd7fd..45df46343f6a 100644
> --- a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/mailbox/xlnx,zynqmp-ipi-mailbox.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/mailbox/xlnx,zynqmp-ipi-mailbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Xilinx IPI(Inter Processor Interrupt) mailbox controller
>   


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
