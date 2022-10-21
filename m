Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CC7C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Oct 2022 13:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QkCtvuzzXV2c4szsWmhSJEQoAqSlz2Yji65xbYiOcsI=; b=tRdAiF8fDOw1xg
	Mga1/cwj5fqAcfyubtjtH3P80E34zQDx2XS6j4ecZZF1hL/JeV6HYk15nLC0+NwNPq+COmxa3bye1
	UmyCXMqmtpxKwM1kEiGrhW6BSl+9cmPWGfNMqkq/ZNLlYdMFKf+5ydzEIazek2IOPfze7/BD8VBwg
	WMayZk8nImCiEsZL5l65BKun47MDDqcSSJbBMWyspQZL/F265CHsj/aJShtvRAdblhpIFuomI8PmS
	cXyMf1PxMw27u1Ctg4cgIcPxCmL31jC6F3UkGCNfArt5BBf5bvLdYxXNxs6sIIvOCltjp8dvmGmQ2
	mC731MkXRLYfuveyEu2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olsVd-008N5h-F3; Fri, 21 Oct 2022 13:56:25 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olsVD-008MIL-Qv
	for linux-amlogic@lists.infradead.org; Fri, 21 Oct 2022 13:56:01 +0000
Received: by mail-qt1-x835.google.com with SMTP id r19so1655092qtx.6
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Oct 2022 06:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=atOz8/XRKPnbyJLTPMaDXLOO7wN9bymw4gIbszWubUs=;
        b=UGaWLB6j8OxVe8dmmcIYNQnaOlpI+0eXu8BajNHD+ZMG4qzneObyu7rcUSIOi1ZUyv
         dYZtPdUG3VVmdsaxuvlXK78Ywy3c7nDrO67d1tfVEv0zq0uzHe4C8c8T/vOlljUe5Osr
         W050SZtwN9P7wkAea8/zllXsPavR27kWRVR8wC1dzNqXrqFOayIPUNPXWTn1SE8Dh/Ud
         0IjrnoiwKi5Dvq1Fvo2hod6lQ1Yjaa3D15s5MRZDDV+7OKM11BzUm+CsTaUz5l941+jT
         YPejLlRpQWjgJRMYEkyXEurngD0pP5Ok1BQU5chbCLayFYSBEb6M7l7Gu+ANz+k3j6EN
         uutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=atOz8/XRKPnbyJLTPMaDXLOO7wN9bymw4gIbszWubUs=;
        b=vEFmLGlOBtusMKxwOk5Q1KpzYIpxZp65RehqR8okd5WTnwvMFs8B6TIauk0bNANfL3
         BT60vDWl4VHXfo+WAP4vMIQJjW3B6VDwnIZYe3eY7/gisc5o24yxbHQMqL0kp42dg/IO
         7nhQOAo/O0DElXuQmBm00guENNd3nVoHnF7OK6bFaU82QR2MeLvnr3BQqScgKlJWBNUf
         FlcmCsLTbH22HSO+TOtwyKJdRwL4ucfWPs6WGCVI1uBlZPJnYfRmU2fpVG/KkTEvbI6P
         xp26Bm5o0w1CDuq+ATMe0ktnNrfieWbChZ72u8IfifKSSkIWN+kuKYZNhMCeuwcVqRAi
         mwbQ==
X-Gm-Message-State: ACrzQf2yvfK0svJKPmXL+ygcZFHOv/lOx34WNPPRfM12gxQrzyQVput0
	pSse+tSbpCJhtstsWLKoVZ2dbA==
X-Google-Smtp-Source: AMsMyM7aTcTuZ74sxriHigv1CN8feEtvci/u09fLiaGKZ0olJSVSsi6r6gwV45XGCsHeYNqSA7mHww==
X-Received: by 2002:ac8:578b:0:b0:39c:f006:3563 with SMTP id v11-20020ac8578b000000b0039cf0063563mr16081124qta.636.1666360556530;
        Fri, 21 Oct 2022 06:55:56 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id y9-20020a05620a25c900b006ed61f18651sm9980834qko.16.2022.10.21.06.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 06:55:55 -0700 (PDT)
Message-ID: <7c6f47ea-5dc8-6662-eeed-81bb14ed3102@linaro.org>
Date: Fri, 21 Oct 2022 09:55:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v4 1/4] spi: dt-bindings: amlogic, meson-gx-spicc: Add
 pinctrl names for SPI signal states
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, Da Xue <da@libre.computer>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20221004-up-aml-fix-spi-v4-0-0342d8e10c49@baylibre.com>
 <20221004-up-aml-fix-spi-v4-1-0342d8e10c49@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221004-up-aml-fix-spi-v4-1-0342d8e10c49@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_065559_890797_AD8BEF8A 
X-CRM114-Status: UNSURE (   7.59  )
X-CRM114-Notice: Please train this message.
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

On 21/10/2022 09:31, Amjad Ouled-Ameur wrote:
> SPI pins of the SPICC Controller in Meson-GX needs to be controlled by
> pin biais when idle. Therefore define three pinctrl names:
> - default: SPI pins are controlled by spi function.
> - idle-high: SCLK pin is pulled-up, but MOSI/MISO are still controlled
> by spi function.
> - idle-low: SCLK pin is pulled-down, but MOSI/MISO are still controlled
> by spi function.
> 
> Reported-by: Da Xue <da@libre.computer>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
