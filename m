Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD9BEB64D8
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Jun 2023 07:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yEF1MLFUx4LIfxMuBbkShmYbOjzc7dM0FHn5RWzbY/k=; b=QwzE2cKzRrYUIamQL4WUNHMSWT
	5OlgdEgPTzDOqlyw38IHZDred6AVDUr4GrBBklWeXHryiS0gy31obThPoQa7ClGP+g/oUKD4OV5kS
	fLIbD2hdFU5Usbda87W9ucX7ag4Bnl0+jPDybqCXn3lIYxHJCquPJ+3p/c3v7WjNrXhGUFu50J3zj
	Y6cOoiZLHbtDAATKvdw0XgwJOQj1qk5EnRb9TrWqznACXUeiMPpBRforNxUfy3xtSW5vE7YLzmYMa
	1/FUuiwr4lZCE6QP8ZfuOJsDNf+qzZ+cdPtAtJufbLqFcPxiJ9W+RUuDusUkCP2+7vbuD9L0WibV9
	aZaPoIKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBVsK-00AOeF-1L;
	Tue, 20 Jun 2023 07:34:04 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBVsH-00AOce-1a
	for linux-amlogic@lists.infradead.org;
	Tue, 20 Jun 2023 07:34:02 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f900cd3f96so30926385e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 20 Jun 2023 00:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687246439; x=1689838439;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LJZvVnPb+GmVidOHlK5a7n33xKvssaTUl9azRgx5rNc=;
        b=M6jFWHWDhQMBcFwr1oWwZR9s1SVFu87rSYyx/G1DaoprPTjZZLak5RK7GCVjOG4vEg
         wlhhHB27AaJtyXrSz/9yOd2QPiTn9zj1wySF6BIj8qR68OBP/1kChb0S0H448Bs/sK0+
         pUxzsQoeXm3XDoVIF0PtPvYKFo0S4I5rk5nf5qn9CSBn3Q9rX7OcI2ekf6dLY5BBrcpA
         uzBTkf1IRVBdUxQMW55jZS0jBrfsfHxE4RKIiKYHp+by4NCi6rEToLywTHa/Wd28Gj+7
         4VGYAzOPHMDeZ1zanzGIrW1khe+UDAQs5zilpH62zNUn8HP1E5UxznEoC1Wf2EmW6cBG
         xbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687246439; x=1689838439;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJZvVnPb+GmVidOHlK5a7n33xKvssaTUl9azRgx5rNc=;
        b=Jkzu1ZaBoEqHCXhaL78pN4dT0nR53KiGZjUvYMOFSz+RlKOaRbcVHDR0y8gli62rzz
         ormlO1mWALpBHwLQNIynfGTZ1xUGl4LUAUL4tUtwT4rkFOKJFck5JBe0KaAbNI3rvtpf
         xUpWHwrno0j/5YodMp3u3czTYxJ2Irq/iUp5nFPKgiYlLCtG2/DeV+drKrLBLK1Sevei
         /T0qLHmOBFT5SimdmQYQCfbw2vvdtIgtba5fyRY9F+wJhQW+NVvrxwv6SsaIZKf0MuUf
         vAxDfkrVwRTaRKTzjz05qQdNzHz9ILjd3iZItZGwPJmZrnPMLnIya3+hUwKnZNoRlj25
         RuWg==
X-Gm-Message-State: AC+VfDz4timtNrdg5Pde4I4sR6DDSErDhlKwP7hgodm2yute4tKhvQWK
	E109Li2o9lZO04ChzMdYXRcj0Q==
X-Google-Smtp-Source: ACHHUZ538LZx30+T3U70ZFTps+oJApLiDfsaLcxBhtsqhONStoage5d7m32DwMxRaqw1CrVe6oeuZA==
X-Received: by 2002:a7b:cbd0:0:b0:3f8:a56:e9f2 with SMTP id n16-20020a7bcbd0000000b003f80a56e9f2mr8506115wmi.1.1687246439251;
        Tue, 20 Jun 2023 00:33:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:496f:4432:b5b2:1b3b? ([2a01:e0a:982:cbb0:496f:4432:b5b2:1b3b])
        by smtp.gmail.com with ESMTPSA id k4-20020a05600c0b4400b003f727764b10sm1644587wmr.4.2023.06.20.00.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 00:33:58 -0700 (PDT)
Message-ID: <777cf5df-6358-fa46-66cd-153d29763f77@linaro.org>
Date: Tue, 20 Jun 2023 09:33:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: Convert Amlogic
 Meson GPIO interrupt controller binding
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier
 <marc.zyngier@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <e06e9f26-cf55-5596-c799-d698e9d7b409@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <e06e9f26-cf55-5596-c799-d698e9d7b409@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_003401_581444_5BB369C4 
X-CRM114-Status: GOOD (  12.27  )
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

Hi,

On 12/03/2023 22:29, Heiner Kallweit wrote:
> Convert Amlogic Meson GPIO interrupt controller binding to yaml.
> 
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> - consider that more than one compatible may be set
> - remove bus part from example
> - remove minItem/maxItem properties for compatible
> - reduce compatible fallback complexity
> - add that 8 or 12 GIC interrupts can be used
> - fix typo
> ---
>   .../amlogic,meson-gpio-intc.txt               | 38 ----------
>   .../amlogic,meson-gpio-intc.yaml              | 72 +++++++++++++++++++
>   2 files changed, 72 insertions(+), 38 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
>   create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml

Gentle ping, this patch is fully reviewed and is lying on the list for the last 3 months.

Thanks,
Neil


<snip>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
