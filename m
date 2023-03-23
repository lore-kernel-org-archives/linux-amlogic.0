Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BBFC7619A
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 07:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mywCCRK4aBSCEZxUtzj1lP9v2D9sZ4Z8wIQs+rfMH5o=; b=dp159KNkPJ7BMH
	M0XCJUVtzn1znMz97fT5B2vICh6e17eUYEJXBmZ0C410f8AtqNSEu3aRJQUE8jGyG//DWqvVPD43N
	khCbvGG9rpgBuLoRGvReoWLWVdLE/sCae7Fzk/o1zvr8PyG4UOSYEq6ZjKOpofbtRfg28IJafcbce
	jQFYqXbGUjYyGeq/03L9BQIOzvu/MkjRdITBawUZBuR/zWt6Ej2STRyrbCDpIeG6oLt7LMVCnv+f9
	hzePJFUP7MUv5pO39lUKmRz+wpUfH2FvyNi+ctvRFG1ZGAmOpO/O3rNili07qYhpCFMzIVcQPiIHX
	veVc+yr4EXgFD/mv3S8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfFR4-0016no-1U;
	Thu, 23 Mar 2023 07:32:34 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfFR2-0016lX-1V
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 07:32:33 +0000
Received: by mail-ed1-x532.google.com with SMTP id ew6so19642166edb.7
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 00:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679556748;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5krubHHgKYJDCf8X0UvJA7y8q2NbVKxEV7FY/oHuAps=;
        b=w3awquQKTHeWDx/yCfCfHfdrLUAb+7cmTUbCxlDsTXtHqnC/KTdLvanL3T8U7h9Hn+
         T2KyJY5oy1yPQyU6mzgUZh1CzH88VAPkqy8k2SW2SwKq45G6DggQbSFKp7id0BSjS8Rp
         VoHzkI+PUoz4dQKhOTIWOYjtIUHmYVlbCNMKTKatuW6HXvZvM2uiVdheYJwhuBaoVv6r
         XUFm0HfHybe27otwo9wNuL61H0cKrxmMAqzuTsillUtZ3oANbuyNtcnMhqKcUnzq/u1/
         nw9/mhXmeh0zZJ/KOLNvHLyQee+sIyAd8AbaOqnSeke6JK3XQ1qUndFUTGYQb65Q7Z6P
         x2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679556748;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5krubHHgKYJDCf8X0UvJA7y8q2NbVKxEV7FY/oHuAps=;
        b=JNKKKzdFDQYU3x7PhcAfnnUI4aVzaEwoaTgu8cD0WeGPHlyUtKhWDLFu7xunaXiW+K
         hkxwMnT1jCBtP979zUfHCXqMdYw6tW0brld6FdouEO52gx1yxV0bnJqypPUcO8jAVZaJ
         rz+7YA8NI64xUKgtWyMZiI6Mjz4RWaFJrmCXo5HWfSdvjhjlbEZChaEOkObhHXpED//V
         0LjPxCvHQuj/75tovu+9W5rBmajPEDn7YvMQSd/8M9oRycbW0/ArSlfaYPk/G/OUR7r9
         fCHwDaUGqkwPp0n3zaHTT+KtFjZ2WxhYWEAJTk9OGOYH2JS33Q4Bqk7S/hZ2xKAUKjb2
         c0Nw==
X-Gm-Message-State: AO0yUKW7WEzvXLCr8IFUopCEnIONlqjvw4abFLRON119B4FKfnwkE+kc
	fl2Mz3ShPdw9TohlTvM2A1sXWA==
X-Google-Smtp-Source: AK7set/JB2xOMNVpHVZoowg3tmnBogfsihGn8UMB3eRY9FKEh8TiRmePaafNm/r4PfEQeqBy+Y5BPA==
X-Received: by 2002:a17:906:1152:b0:930:c417:1ad2 with SMTP id i18-20020a170906115200b00930c4171ad2mr9679120eja.65.1679556747895;
        Thu, 23 Mar 2023 00:32:27 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a665:ed1e:3966:c991? ([2a02:810d:15c0:828:a665:ed1e:3966:c991])
        by smtp.gmail.com with ESMTPSA id v19-20020a1709067d9300b008cff300cf47sm8240016ejo.72.2023.03.23.00.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 00:32:27 -0700 (PDT)
Message-ID: <8fe6ee60-b8e8-e2d1-881d-544e12a7325b@linaro.org>
Date: Thu, 23 Mar 2023 08:32:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: i2c: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Michal Simek <michal.simek@xilinx.com>, Peter Rosin <peda@axentia.se>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20230322173530.3971676-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230322173530.3971676-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_003232_503380_E1CCDEBD 
X-CRM114-Status: UNSURE (   9.63  )
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

On 22/03/2023 18:35, Rob Herring wrote:
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
>  .../devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml          | 4 ++--
>  8 files changed, 14 insertions(+), 14 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
