Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3029C74A44
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Mar 2023 11:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iw3QhurhlUkajtvaGXf5gDMwCEEp/+rAABBhKGO2QUo=; b=KWyz5Jn0ZufTOh
	dicihUobFRcuB2Za2bNTIufMUEo+ooO5pMQdM2vV7r7WOi5pZ8Z600jZeDi+qHLyPKNFhf8s16oS+
	mARUykq5KlAaIPa0hhh2NBsqJJ66jwge4jE6ISB2XVrjdfoNXyCqj9TxHUywJ7C5TT+oq7x+U0F5+
	vdlcyZGizdN8FJ1c/9Rq0ebxMHFiGej5ILjFCj0YbTgD2224zEMerkplqjkEKZcG7KGYCJJkuWFFy
	NSVjYDoRxXRzqwkUnhQiHBTuYftAihwuXjJLLkpv8woSGiiRRfQllKYtAwOOB+GaaHH0pMCQdgXhV
	479cHXsBDti68ewySl/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc2pk-009umm-1v;
	Tue, 14 Mar 2023 11:28:48 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc2pg-009ulG-1S
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Mar 2023 11:28:45 +0000
Received: by mail-ed1-x530.google.com with SMTP id r11so8994006edd.5
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Mar 2023 04:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678793323;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rOrTbnKTcE7CauGtKPDZAIZx3EY7nUKDtivuP9yBIvs=;
        b=olc0q14IwQ9q8wZw71hvNsbQjPxVbaB7Q1Y5ubAKoYpMubDGVb7FvJf252fUZPXEaZ
         CdZ39e8ufUMdZHhHt2arvPJAWhvWwN3NEhXw9+6z4tHQUw9ap2OijZElmtM1DUCoU4U0
         F/Ni4guEPIUoKilRDKsKY3W9XxsnhfOym61oPQl9wMxAGvJwveC63pZlgmvcvaJyJt8G
         p9ZLlUqg+8OBsgnESYiNj9x2l16/2G2jyUQQF4YBaYzKle/jxjypPZaVtQAzhtbGVqaj
         R3GJuT8bXG1MbIjatgd2qwovq8DhXH3mC02ygXejSwg+QcEe5LW9XhH1+O0EoinsGLDr
         j2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678793323;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rOrTbnKTcE7CauGtKPDZAIZx3EY7nUKDtivuP9yBIvs=;
        b=TEFy1S7aO2vPmilUDaT2XJCnE/w7IKqyiE+5TJNw1qGyPE7RUGsOLp8Bl+DtVC5Gjj
         mG/qS+Jcom4eRLs4yy/eKjlV4dsQ5Ew2/BhS7TAGyiFtkMej0WQp4QhEQQnesXnsHanv
         AyJeeFwzsHBFDXtxv67t66QFwJXVwcqQ/ZjNifuMKFO/kXZF78CNlkau/Q7Zj4uBOHeE
         Jsaah5vEpD+C3HfIgr6O+C4xS+T/zQUbIVR9+0UFTD9WbRhH51UsNsPzSqfCXDRSaNcB
         nTYeN9xZmzhvBeA3EAG/yxRnvwOrxxtBmA/rRDlXCztbnvvBI2SSKw9OIggmJ9p9nQkC
         trRA==
X-Gm-Message-State: AO0yUKWKiOsbLbcUK3uxWKswIxlylKOtCG5gbWvH9Dmq448I3CpD5/0M
	cTpP8KB3eqnCL9ntVeBYi2hfRQ==
X-Google-Smtp-Source: AK7set8Ex15efZPVYFuYY54Frd1acshjdF/oeAMqSwkNIBG/aUh05lW25OUm7KGUBskPUPa6E142uw==
X-Received: by 2002:a17:907:7290:b0:8b1:2eef:154c with SMTP id dt16-20020a170907729000b008b12eef154cmr2370532ejc.0.1678793322773;
        Tue, 14 Mar 2023 04:28:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:59be:4b3f:994b:e78c? ([2a02:810d:15c0:828:59be:4b3f:994b:e78c])
        by smtp.gmail.com with ESMTPSA id z22-20020a170906271600b0091f58083a15sm1015459ejc.175.2023.03.14.04.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 04:28:42 -0700 (PDT)
Message-ID: <ffebef1d-8447-181b-1890-3e638d399c62@linaro.org>
Date: Tue, 14 Mar 2023 12:28:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v10 3/5] dt-bindings: clock: meson: add A1 PLL and
 Peripherals clkcs bindings
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, neil.armstrong@linaro.org,
 jbrunet@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230313201259.19998-1-ddrokosov@sberdevices.ru>
 <20230313201259.19998-4-ddrokosov@sberdevices.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230313201259.19998-4-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_042844_502379_E6CB9063 
X-CRM114-Status: GOOD (  14.67  )
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

On 13/03/2023 21:12, Dmitry Rokosov wrote:
> Add the documentation for Amlogic A1 PLL and Amlogic A1 Peripherals
> clock drivers.
> Introduce Amlogic A1 PLL and Amlogic A1 Peripherals device tree
> bindings and include them to MAINTAINERS.
> 


>  
> diff --git a/include/dt-bindings/clock/amlogic,a1-clkc.h b/include/dt-bindings/clock/amlogic,a1-clkc.h
> new file mode 100644
> index 000000000000..2b16b1f1a5bf
> --- /dev/null
> +++ b/include/dt-bindings/clock/amlogic,a1-clkc.h
> @@ -0,0 +1,100 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */

???

> +#define CLKID_SPIFC		84
> +#define CLKID_USB_BUS		85
> +#define CLKID_SD_EMMC		86
> +#define CLKID_PSRAM		87
> +#define CLKID_DMC		88

And what is here? Between 88 and 121?

> +#define CLKID_GEN_SEL		121
> +
> +#endif /* __A1_CLKC_H */
> diff --git a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
> new file mode 100644
> index 000000000000..8e97d3fb9d30
> --- /dev/null
> +++ b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */

I found in changelog:
"fix license issue, it's GPL-2.0+ only in the current version"
and I do not understand.

The license is wrong, so what did you fix?

> +/*
> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
> + * Author: Jian Hu <jian.hu@amlogic.com>
> + *
> + * Copyright (c) 2023, SberDevices. All Rights Reserved.
> + * Author: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> + */
> +
> +#ifndef __A1_PLL_CLKC_H
> +#define __A1_PLL_CLKC_H
> +
> +#define CLKID_FIXED_PLL		1
> +#define CLKID_FCLK_DIV2		6
> +#define CLKID_FCLK_DIV3		7
> +#define CLKID_FCLK_DIV5		8
> +#define CLKID_FCLK_DIV7		9
> +#define CLKID_HIFI_PLL		10


Probably I asked about this... why indices are not continuous? You know
that consumers are allowed to use number 2 and it will be your ABI, even
though you did not write it in the binding? That's a tricky and
confusing pattern for no real gains.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
