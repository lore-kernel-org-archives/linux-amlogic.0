Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F22C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 09:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0sG+YTDj53g0IyWH8wqFv1u63vYvnrC50E/BeYXU+w=; b=NJcmzhZl/twOuAsQwetbcVKis3
	TAJbxZAq23DuzTRzxROXClPMk7ssfVXYRUQxi5cGFaEI3VlyLeiZ4bNG5QZh9+HsZ1zAccqkDmddu
	vjRR3rtOcW/wNqGOZwv4Ca5v6UaX45VbkFSNALy5t6f/k2qi1m2UFcLT59BLRWq6uh8jv1pcv/a8T
	I/JkjUXlOG6uAP/A4IjueRB2+1ArU2zB7wsTmDhzxJj5EVOIQax5fQn5sYN3mRcxd6AcMc79smIQY
	dSKa8FEndq0B8SFEOxOkWvz4O7gYQMUMQmM95+ho2z72N7mTILtH1qcaDYe7TUDCvz1z9Ko/bZOjT
	hcsEFNvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGya-001Niv-1T;
	Thu, 23 Mar 2023 09:11:16 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGyW-001Nh9-2X
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 09:11:14 +0000
Received: by mail-wm1-x332.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so653314wmb.5
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 02:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679562671;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DmQXL1sY/EqpZuWTGHMWrHNVpWB1SZ9oyus2f2lfyQI=;
        b=A4vaGdPfQtNgk24cFIN1NE6XyEsLetwpBYabrd1+b5E+3OXJzTw5PTJEmBQ9JBbmmF
         pEk0gCOpY/wrpRnYh/4CXrOZ0+nRFyZ4t92LpXaNolWowVY0NByQChLilcQx91+E0xB1
         n42QgOJMWueZiUzkrKQ6PVnKlURntNVOKGgvTCKErY1q9oMnYyQZN6K4uosRQEI3CbkI
         1DpAVJHOPdiURLlAiag82fCqGJ5cDgnLsDAmYEcWhuZPyjI1lmO05G4qjNhtYhf3Xs57
         SgmHK5YfvJ611vzzWUKs4zOE/MDUOhhV5EWsaZqtbdk3L3RA50ryLjjLeLnaHmohJY/q
         SUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679562671;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DmQXL1sY/EqpZuWTGHMWrHNVpWB1SZ9oyus2f2lfyQI=;
        b=GNLBRYZ6oDsCrYaO3v123RZSH3s/OFNTNsXSfZAuXsV9ESEtLEAJ7qQFWddC16KxS6
         Ex75fXDswhk9e3Qp49agPHonTPyVt5kPPCVn4JLeFuqr6oZUWAnDhpTJWgbWiSuGguHe
         Y/MC6uYZDz141ZfdYsV42jgweib0PP3O22XuTbjTLBdi/cL4I6P0NGsfKB4hBE07Rtwb
         DuKPO6/RxOzWKuWsmlTxv0NWG3b2X7J+wvua/vnO3GaxWFjBe2omd0y3x4KNRMOKpmHh
         HFn1KRlAtp7DiLXV3l1SoDhNApiSUHYUOwwaAiBbwH2dqMetOiiOrLaEE2SfsUuJNNxq
         LB8A==
X-Gm-Message-State: AO0yUKVTcQ4DI32gz0DB3uEMzNBXCxgOH725w3p7qdXd763hJNPwOUP2
	oxXoJjNNX3a2ommeEaZCeLwx4g==
X-Google-Smtp-Source: AK7set9pwOqrjK36IbY4vVd0DZNku1dihrV/e0w+0aowZSWyitLRdpNSeOwCoAQwxt49yQwIDArnZw==
X-Received: by 2002:a05:600c:4f91:b0:3ee:501f:c795 with SMTP id n17-20020a05600c4f9100b003ee501fc795mr1908535wmq.1.1679562671550;
        Thu, 23 Mar 2023 02:11:11 -0700 (PDT)
Received: from [192.168.7.188] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id j9-20020a05600c190900b003eddc6aa5fasm1254605wmq.39.2023.03.23.02.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 02:11:11 -0700 (PDT)
Message-ID: <a1d83076-e42c-3418-f7ff-905abe7b0e97@linaro.org>
Date: Thu, 23 Mar 2023 10:11:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: reset: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Qin Jian <qinjian@cqplus1.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230322173508.3971182-1-robh@kernel.org>
Organization: Linaro Developer Services
In-Reply-To: <20230322173508.3971182-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_021112_854187_641EB77E 
X-CRM114-Status: GOOD (  14.34  )
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

On 22/03/2023 18:35, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   .../bindings/reset/amlogic,meson-axg-audio-arb.yaml         | 4 ++--
>   .../devicetree/bindings/reset/amlogic,meson-reset.yaml      | 4 ++--

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

>   .../devicetree/bindings/reset/bitmain,bm1880-reset.yaml     | 4 ++--
>   .../devicetree/bindings/reset/brcm,bcm6345-reset.yaml       | 4 ++--
>   .../devicetree/bindings/reset/brcm,brcmstb-reset.yaml       | 4 ++--
>   .../devicetree/bindings/reset/marvell,berlin2-reset.yaml    | 4 ++--
>   Documentation/devicetree/bindings/reset/microchip,rst.yaml  | 6 +++---
>   .../devicetree/bindings/reset/qca,ar7100-reset.yaml         | 4 ++--
>   Documentation/devicetree/bindings/reset/renesas,rst.yaml    | 4 ++--
>   Documentation/devicetree/bindings/reset/sunplus,reset.yaml  | 4 ++--
>   10 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.yaml
> index 704a502adc5d..bc1d284785e1 100644
> --- a/Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.yaml
> +++ b/Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.yaml
> @@ -2,8 +2,8 @@
>   # Copyright 2019 BayLibre, SAS
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/reset/amlogic,meson-axg-audio-arb.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/reset/amlogic,meson-axg-audio-arb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Amlogic audio memory arbiter controller
>   
> diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> index 98db2aa74dc8..d3fdee89d4f8 100644
> --- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> @@ -2,8 +2,8 @@
>   # Copyright 2019 BayLibre, SAS
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/reset/amlogic,meson-reset.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/reset/amlogic,meson-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Amlogic Meson SoC Reset Controller
>   
> diff --git a/Documentation/devicetree/bindings/reset/bitmain,bm1880-reset.yaml b/Documentation/devicetree/bindings/reset/bitmain,bm1880-reset.yaml
> index f0aca744388c..1f40b654f6a2 100644
> --- a/Documentation/devicetree/bindings/reset/bitmain,bm1880-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/bitmain,bm1880-reset.yaml
> @@ -2,8 +2,8 @@
>   # Copyright 2019 Manivannan Sadhasivam <mani@kernel.org>
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/reset/bitmain,bm1880-reset.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/reset/bitmain,bm1880-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Bitmain BM1880 SoC Reset Controller
>   
> diff --git a/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml b/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml
> index 560cf6522cb8..00150b93fca0 100644
> --- a/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/reset/brcm,bcm6345-reset.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/reset/brcm,bcm6345-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: BCM6345 reset controller
>   
> diff --git a/Documentation/devicetree/bindings/reset/brcm,brcmstb-reset.yaml b/Documentation/devicetree/bindings/reset/brcm,brcmstb-reset.yaml
> index e00efa88a198..b115b86e2fe6 100644
> --- a/Documentation/devicetree/bindings/reset/brcm,brcmstb-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/brcm,brcmstb-reset.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/reset/brcm,brcmstb-reset.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/reset/brcm,brcmstb-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Broadcom STB SW_INIT-style reset controller
>   
> diff --git a/Documentation/devicetree/bindings/reset/marvell,berlin2-reset.yaml b/Documentation/devicetree/bindings/reset/marvell,berlin2-reset.yaml
> index d71d0f0a13ee..dc86568bfd75 100644
> --- a/Documentation/devicetree/bindings/reset/marvell,berlin2-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/marvell,berlin2-reset.yaml
> @@ -2,8 +2,8 @@
>   # Copyright 2015 Antoine Tenart <atenart@kernel.org>
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/reset/marvell,berlin2-reset.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/reset/marvell,berlin2-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Marvell Berlin reset controller
>   
> diff --git a/Documentation/devicetree/bindings/reset/microchip,rst.yaml b/Documentation/devicetree/bindings/reset/microchip,rst.yaml
> index 81cd8c837623..f2da0693b05a 100644
> --- a/Documentation/devicetree/bindings/reset/microchip,rst.yaml
> +++ b/Documentation/devicetree/bindings/reset/microchip,rst.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/reset/microchip,rst.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/reset/microchip,rst.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Microchip Sparx5 Switch Reset Controller
>   
> @@ -36,7 +36,7 @@ properties:
>       const: 1
>   
>     cpu-syscon:
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    $ref: /schemas/types.yaml#/definitions/phandle
>       description: syscon used to access CPU reset
>   
>   required:
> diff --git a/Documentation/devicetree/bindings/reset/qca,ar7100-reset.yaml b/Documentation/devicetree/bindings/reset/qca,ar7100-reset.yaml
> index 9be60e55cd71..47f8525a9b38 100644
> --- a/Documentation/devicetree/bindings/reset/qca,ar7100-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/qca,ar7100-reset.yaml
> @@ -2,8 +2,8 @@
>   # Copyright 2015 Alban Bedel <albeu@free.fr>
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Qualcomm Atheros AR7xxx/AR9XXX reset controller
>   
> diff --git a/Documentation/devicetree/bindings/reset/renesas,rst.yaml b/Documentation/devicetree/bindings/reset/renesas,rst.yaml
> index 0d1b89e2fe9c..e7e487247751 100644
> --- a/Documentation/devicetree/bindings/reset/renesas,rst.yaml
> +++ b/Documentation/devicetree/bindings/reset/renesas,rst.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/reset/renesas,rst.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/reset/renesas,rst.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Renesas R-Car and RZ/G Reset Controller
>   
> diff --git a/Documentation/devicetree/bindings/reset/sunplus,reset.yaml b/Documentation/devicetree/bindings/reset/sunplus,reset.yaml
> index f24646ba9761..205918ce324c 100644
> --- a/Documentation/devicetree/bindings/reset/sunplus,reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/sunplus,reset.yaml
> @@ -2,8 +2,8 @@
>   # Copyright (C) Sunplus Co., Ltd. 2021
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/reset/sunplus,reset.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/reset/sunplus,reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Sunplus SoC Reset Controller
>   


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
