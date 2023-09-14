Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDABEDE985
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Sep 2023 06:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8EYkS+Tq5oKvE7aKTAQPL25Kg3BUz1YIf/qUoBedcD8=; b=h+HTXoyT1yhQy7
	0ANZebcMeMUDhoHhvh87JikMK2j/DJ6MmBIZc00xPn+yQlwAq/FQHRE4lG84ipeyDHCmr+9N045D5
	uxToA2x5JR0FbPpFnJk+uQkUTxPBAUVPlQQ9BkCIdYFPOJnqGyqnfkIfKQnWE1QEo4sZG++WSnMGg
	1nEfoBwow+bu9d7MkN18SqU2ohR9TfUawDhthVRFPIgHbNnLNo6rqY22lAFT7cUVNe7iXIXM6kdyH
	4CF/D9R9VwaTD1rwZLKaeoJXDYC4h5AvVrInPV1zkpt8ctZMITs4xMuBtrI5IrKmwJ9w7c2L4iHLo
	+9VdqbOu+qlR8tIicgXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgff3-007UbW-1y;
	Thu, 14 Sep 2023 06:17:09 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgff0-007Ua7-21
	for linux-amlogic@lists.infradead.org;
	Thu, 14 Sep 2023 06:17:07 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99bcf2de59cso79478766b.0
        for <linux-amlogic@lists.infradead.org>; Wed, 13 Sep 2023 23:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694672223; x=1695277023; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UK0O4WJKJlOZsHN2AORyIn3x8ciKDTzhX6N4dTgrbtM=;
        b=xnqo1N8Xtj9hccV9CevjpZ/TR4NjLlCNyTudVSGcFgthsHAfUbwtJfbNIDVOTybg7k
         xgjc8tsl9zEdmtSKjykvbFtXvBfPggdUnU8AzcYQrTbD+0D2MzKh7i+Pknco7LxB5SHK
         6Irappj4LzOCumYoJWqeHPD7S8P7/fEnA+2RNCe+241Ryw8zBYc5iswMTxSx+Ackyxv7
         fiIwEj9MoablbdfsijlG4iEGaHtsx5b/wAqQzW/o4F2aVcVqvn22/j+wpHax53GubG8N
         2HWeTT51+vd2SXBzF1CggbpFE9JS0rb58Y3XAgDivGKGZ2hNm7/h5d0lgSNeiOMCvg1D
         ThhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694672223; x=1695277023;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UK0O4WJKJlOZsHN2AORyIn3x8ciKDTzhX6N4dTgrbtM=;
        b=Gq6DVD0bUJAaTsKg2etGpC98C8I6VjtvfMs5hPZOGEyqghG5OlmH/anq5o4f0ANENi
         E2U9KjAOjx8TA392HLgUpUxOAILn82vlCTDlZw2o5PqqM/QDn0fOHXQn7m/kcArXTQI3
         MSVOQWurrV9592q1TA0w9g5cRNlaGEaj8j7XMgly14dhnVkJIwefzWNwNlhlgtjKRr1q
         vY/1n8aL0SbHs9agzU65GCDW/Kr6ACiAsG6mmMp4fb/ySIRbO5J8P36YllJCVq16VVr+
         raDuzOJCcIScDcfIXVC5n/EMG1s6mct12+aB8W8uZHyP4vGa6+gQrKjNvoMpLFPZDjJt
         MaiQ==
X-Gm-Message-State: AOJu0YwSr94lcsC0gpCT4EHpTd2/nMg0e07gGviw1TGIO/pVDuk6PtnR
	9BfTCmhzpcoodO5CyhJ2aJBTuw==
X-Google-Smtp-Source: AGHT+IFoQUQl22lWSHFNhUxXzHXGNgTqAInQGx0SzU77yOY3Lg/+ylETFd0JjlYLR9E9wxvPxBnT4A==
X-Received: by 2002:a17:907:62a6:b0:99d:e8da:c20b with SMTP id nd38-20020a17090762a600b0099de8dac20bmr4172306ejc.24.1694672221956;
        Wed, 13 Sep 2023 23:17:01 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id q13-20020a170906770d00b0097073f1ed84sm514322ejm.4.2023.09.13.23.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 23:17:01 -0700 (PDT)
Message-ID: <45637012-0972-fc7b-1276-163da363b962@linaro.org>
Date: Thu, 14 Sep 2023 08:16:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add compatibles for Amlogic T7
 SoCs
Content-Language: en-US
To: Huqiang Qin <huqiang.qin@amlogic.com>, linus.walleij@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, brgl@bgdev.pl, andy@kernel.org
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230914054525.1180595-1-huqiang.qin@amlogic.com>
 <20230914054525.1180595-2-huqiang.qin@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230914054525.1180595-2-huqiang.qin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_231706_663476_1FB4C78D 
X-CRM114-Status: GOOD (  16.24  )
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

On 14/09/2023 07:45, Huqiang Qin wrote:
> Add a new compatible name for Amlogic T7 pin controller, and add
> a new dt-binding header file which document the detail pin names.
> 
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
> ---
>  .../pinctrl/amlogic,meson-pinctrl-a1.yaml     |   1 +
>  include/dt-bindings/gpio/amlogic-t7-gpio.h    | 179 ++++++++++++++++++
>  2 files changed, 180 insertions(+)
>  create mode 100644 include/dt-bindings/gpio/amlogic-t7-gpio.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
> index 4e7a456ea4cc..c7df4cd34197 100644
> --- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
> @@ -16,6 +16,7 @@ properties:
>    compatible:
>      enum:
>        - amlogic,c3-periphs-pinctrl
> +      - amlogic,t7-periphs-pinctrl
>        - amlogic,meson-a1-periphs-pinctrl
>        - amlogic,meson-s4-periphs-pinctrl
>  
> diff --git a/include/dt-bindings/gpio/amlogic-t7-gpio.h b/include/dt-bindings/gpio/amlogic-t7-gpio.h
> new file mode 100644
> index 000000000000..2bab9a99501a
> --- /dev/null
> +++ b/include/dt-bindings/gpio/amlogic-t7-gpio.h

Use compatible syntax.

> @@ -0,0 +1,179 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (c) 2023 Amlogic, Inc. All rights reserved.
> + * Author: Huqiang Qin <huqiang.qin@amlogic.com>
> + */
> +
> +#ifndef _DT_BINDINGS_AMLOGIC_T7_GPIO_H
> +#define _DT_BINDINGS_AMLOGIC_T7_GPIO_H
> +
> +#define	GPIOB_0		0

Why weird indentation?



Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
