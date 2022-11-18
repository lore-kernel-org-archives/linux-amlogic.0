Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFF9C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Nov 2022 14:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hn2NcRcEliMe7ZFP092n1PIwQZ1QhsZSmHz90GwW97g=; b=JeNoQY+tcA/Rb0
	o437IY+ozCCyHiudI1Ksd3/S7T0HfuSjtvK71kXIrGHh9LEjfDnq01Mit7NtQ+HW460bEHNXRqWaw
	7/UdiKmZWJdVcxF2eQB8z4eJw++RWM2XlxkrkK4ZJqoCoiWkz2qU90Itsx+fFANAmRsGaRU6kV1pA
	sKGu5nqkwT2kZ1DjKMTvbXsyEH6wOg4mw4GHCFAvqAtwDz0jkIPePOAmtCkg4GFLO43CuG0gm8lxe
	Zie59HyWz0bHJXFCg2sRlQksG5FCxxiO2o0iIbyhC0GkNNe9Tm6q+MrmYrIawv2EYls5+84ylUi82
	PFkB+OW1LStvxncymjSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2iC-004dR9-6X; Fri, 18 Nov 2022 14:51:24 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2gn-004cZw-0I
	for linux-amlogic@lists.infradead.org; Fri, 18 Nov 2022 14:49:58 +0000
Received: by mail-lj1-x22b.google.com with SMTP id a15so7044130ljb.7
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Nov 2022 06:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xz1fgFvu/EO4HMlO5FNKw0t0f66TQQFrAxbDNME5ooY=;
        b=mCXlT2aWEXGE5G4/8SDvVW5SPhpQwM/LAmoA1FXKxNWbMaxFQJ6lHchC1gmxGvjB1J
         qMGDIa/MyDLZ30UfBbe0oP1mkqBrn2eaC3kS9zBv48nUVlW6PMcU6EBTnuDULS6GTCi9
         e+ez4YhUacjysshZ2bdNrW47yRIj+wJeDXscMFG1mHOGFOWJ1R0r4D1qLEhBBa3s/tVf
         R2kLqtooeIfLpdqw/eBNUO3n+iKXn8zoetYxIGFw8jm9tUo5j2ff60TbmOi3rJhUrYpr
         9igjmxpTDX44ZKxpJxrgAGeCRaebTQnTP66S8cOg2pPG57WDFJrGzM4/6L4R/dmm7J3D
         UkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xz1fgFvu/EO4HMlO5FNKw0t0f66TQQFrAxbDNME5ooY=;
        b=j2mnzHSPrir0IGkF8tF3oC0PhWpVosXeO+qEO0ppa8zIiu078pv+wUWS3XvJyy/YmO
         1jiVoPuHAxM2kLqIQumI7hfccHvq6yd1S7MZfTT1cAhANYTlFhFLsjdWcMMTIPhCICGR
         we2fwH56URACYRyHJckrBqJ4D+YYcgbOzI2pdfU+pRCJBfeY9Yof/P2q45+0gRBCGeN5
         EpEbu8h8Y6l9ASxiKL2UYmx7zgEHN2Ln1VSiDCsqcBcehdUm6P9Iq2DoQKs/ufidhVX9
         qB8DYBBTwNUlyuu80EGjqrj4EZJT7rMBlNagPsojFZVu1BkUCzh/a8neIcbPMQTUZV59
         Evcg==
X-Gm-Message-State: ANoB5plain5hyTgrwwN2vN9NU/j7Pl2WWT48cD1CL+PDCFmVIDjmyBCc
	DyPoH3TLsvKa/igzrAeoRqWmmA==
X-Google-Smtp-Source: AA0mqf6L9W5MCkqEZsf64R6Fo8bZ58XpODRGgBZIIWvJLUKFWkuvQd/iPa+mcXNvtk+PBNvZ12YO+Q==
X-Received: by 2002:a2e:a4c8:0:b0:26c:4c27:a478 with SMTP id p8-20020a2ea4c8000000b0026c4c27a478mr2420022ljm.92.1668782994596;
        Fri, 18 Nov 2022 06:49:54 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id h3-20020ac250c3000000b00492c463526dsm686190lfm.186.2022.11.18.06.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 06:49:53 -0800 (PST)
Message-ID: <2e10ec36-46a4-020f-34f0-30359001ff43@linaro.org>
Date: Fri, 18 Nov 2022 15:49:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 05/12] dt-bindings: media: convert meson-ir.txt to
 dt-schema
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Alessandro Zummo <a.zummo@towertech.it>, Eric Dumazet <edumazet@google.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Kevin Hilman <khilman@baylibre.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Paolo Abeni <pabeni@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Cc: linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org>
 <20221117-b4-amlogic-bindings-convert-v1-5-3f025599b968@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v1-5-3f025599b968@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_064957_106785_DD45D4EF 
X-CRM114-Status: UNSURE (   8.75  )
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

On 18/11/2022 15:33, Neil Armstrong wrote:
> Convert the Amlogic Meson IR remote control receiver bindings to
> dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/media/amlogic,meson6-ir.yaml          | 43 ++++++++++++++++++++++
>  .../devicetree/bindings/media/meson-ir.txt         | 20 --------


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
