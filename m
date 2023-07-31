Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B7DC001DE
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Jul 2023 08:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ze0U74xMlTxRDBeQsoAFZ3gCE3iNGq7E29O29Cz+X+4=; b=tTJZKIsMEL4HR1ahW8qyQ1ljAX
	/8I4rNOxribBR7Aqs+rzPBRTfuzRa6Blf3aciMOmwS2SbvP8OxDJwFkjsb/Sh2ELkK37Y2Pqs1ELU
	Z/BcfD56lroqMmQ6Maf/TGBeMAOo6W87tWk9+ZgUL5M9Pk9ASEKIMpcxzYK0JLIRPJskysnTMHIp0
	0MErXMCy+D/TNVtBWzYBLZ2VhJGZIuty+gHoq+zmj3wq4bkSxJgnLVy0/bEmG1mpmZNCR97YSpOCJ
	oY7RIswaw1c7NZcnsSHUMNIheDn2VRkwCLcjCD6WqlrIfN7disY2NHt3JR3jUPhwthWHrxxZ2vUQo
	r3JUmiHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOaZ-00EapF-2h;
	Mon, 31 Jul 2023 08:49:15 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOaW-00Eand-0y
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Jul 2023 08:49:13 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-314417861b9so3523811f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Jul 2023 01:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690793349; x=1691398149;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h7W7YYE2gaBdXvF1/lo7GyDdBy4PWSaCW0nMcp8S290=;
        b=tIPMOZHWC/DCPEOLEvFVLcVItIT0QU/S+4xWkQBcCZ9q7l6eNLELl5hlVuxn/dCxI8
         ls0wK4RTi4m9/MnIcNx1cHV2lgaT9N51vwuHBqSWO7oebJGnUlc50+4QPtwN464XLYn8
         J0MX6/ACCl7PMroV/sKIga+urSCV46HQVKBuGQ/DOwxI5CLCB++K3aHrN9g3ehJMZ0VI
         DQUMmwywvWd9EyHscsVVDwfnLo5R4b/IRTIUWnzDAWUVHet9J+w3jM5tGB6f/ykWg5OR
         R1d6jNIukr/g/kTSD7xsiK5cL9kQhRXNaDTmwUaW47DI0dJ8N5cgoRvhGGt0SAPUVJWA
         5k/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793349; x=1691398149;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h7W7YYE2gaBdXvF1/lo7GyDdBy4PWSaCW0nMcp8S290=;
        b=aWhvtA/ZCWXSRdbV+hyAQvxJHSxFyjRf2qDmCkSWe9t3dVDVtKs/KicAW7LGaA6cOR
         6sygoyCKUVz4jG6ZmIjsVHfzjUfIdEcdELiGgAnizLICMnalGkKvxxywwQL6Flz8NV/q
         mdtANUcm6bxBcPmvNqYqAbmA4GHQMmDtuZCD4sPSawA6A6caHeVu9eCrAEE33ZvjEsCa
         ZvH0DBqCvSpfhr4CghX5RHxnbR81sd//2iB+ix7yPmoVRchk0J3aqUsHd7zOUWJNypT5
         bB6KMUu3W+ypBsstja7IhAifPbmBnaUoePx3PmNz2/kwOKsj3W3IwEScBD9YcmPqS1/l
         5WEA==
X-Gm-Message-State: ABy/qLahCnyoT4XDIR27lZIr+khHmrAIpRBw3dWZ8ORG60zRqnWMeVY4
	rcyEZzXe37PXtkEWtZbb0i2mNSFjED5+ZC3PpIq8ui8G
X-Google-Smtp-Source: APBJJlEzjzzfHPdjAO4t1hPBRUhwt15TSOFm9fPyDYFdX2mgRKf7NwRsU4/mLyv8fkkRD5Pq6zI4Lw==
X-Received: by 2002:adf:f611:0:b0:315:9ee6:132f with SMTP id t17-20020adff611000000b003159ee6132fmr7441633wrp.68.1690793349307;
        Mon, 31 Jul 2023 01:49:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:14b8:9aa7:6bf0:256d? ([2a01:e0a:982:cbb0:14b8:9aa7:6bf0:256d])
        by smtp.gmail.com with ESMTPSA id p16-20020a5d68d0000000b003140f47224csm12339740wrw.15.2023.07.31.01.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 01:49:08 -0700 (PDT)
Message-ID: <691102a4-e920-ef88-3c5b-8240b8f87c5b@linaro.org>
Date: Mon, 31 Jul 2023 10:49:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH V2 0/3] Add binding header file for GPIO interrupt of
 Amlogic Meson-G12A
Content-Language: en-US
To: linus.walleij@linaro.org
Cc: robh+dt@kernel.org, martin.blumenstingl@googlemail.com,
 jbrunet@baylibre.com, khilman@baylibre.com, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Huqiang Qin <huqiang.qin@amlogic.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20230724060108.1403662-1-huqiang.qin@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <20230724060108.1403662-1-huqiang.qin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_014912_361697_011B598E 
X-CRM114-Status: GOOD (  12.18  )
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

Hi Linus,

On 24/07/2023 08:01, Huqiang Qin wrote:
> After adding this binding header file, you can intuitively find
> the interrupt number corresponding to each GPIO, and apply it
> in the format of IRQID_XXX where it needs to be used.
> 
> Associated platforms:
> - Amlogic Meson-G12A
> - Amlogic Meson-G12B
> - Amlogic Meson-SM1
> 
> [PATCH 1/3]:
>    V1 -> V2: Rename irq-meson-g12a-gpio.h to amlogic,meson-g12a-gpio-intc.h
> 
> [PATCH 2/3]:
>    V1 -> V2: Include header file changed to amlogic,meson-g12a-gpio-intc.h
> 
> [PATCH 3/3]:
>    V1 -> V2: Include header file changed to amlogic,meson-g12a-gpio-intc.h
> 
> Huqiang Qin (3):
>    dt-bindings: interrupt-controller: Add header file for Amlogic
>      Meson-G12A SoCs
>    pinctrl: Replace the IRQ number in the driver with the IRQID macro
>      definition
>    arm64: dts: Replace the IRQ number with the IRQID macro definition

What's the best way to apply this patchset ?

Thanks,
Neil

> 
>   .../boot/dts/amlogic/meson-g12-common.dtsi    |   1 +
>   .../boot/dts/amlogic/meson-g12a-x96-max.dts   |   2 +-
>   .../dts/amlogic/meson-g12b-bananapi-cm4.dtsi  |   2 +-
>   .../boot/dts/amlogic/meson-g12b-bananapi.dtsi |   2 +-
>   .../amlogic/meson-g12b-odroid-go-ultra.dts    |   4 +-
>   .../dts/amlogic/meson-g12b-odroid-n2.dtsi     |   2 +-
>   .../boot/dts/amlogic/meson-g12b-w400.dtsi     |   2 +-
>   .../dts/amlogic/meson-sm1-a95xf3-air-gbit.dts |   2 +-
>   .../boot/dts/amlogic/meson-sm1-bananapi.dtsi  |   4 +-
>   .../boot/dts/amlogic/meson-sm1-h96-max.dts    |   2 +-
>   .../boot/dts/amlogic/meson-sm1-odroid.dtsi    |   2 +-
>   .../boot/dts/amlogic/meson-sm1-sei610.dts     |  12 +-
>   .../dts/amlogic/meson-sm1-x96-air-gbit.dts    |   2 +-
>   drivers/pinctrl/meson/pinctrl-meson-g12a.c    |  35 ++---
>   .../amlogic,meson-g12a-gpio-intc.h            | 126 ++++++++++++++++++
>   15 files changed, 164 insertions(+), 36 deletions(-)
>   create mode 100644 include/dt-bindings/interrupt-controller/amlogic,meson-g12a-gpio-intc.h
> 
> 
> base-commit: c58c49dd89324b18a812762a2bfa5a0458e4f252


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
