Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C38C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Nov 2022 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hQ9RlFBqEdv0a7y0qD3TSuJHDXQKk/Fsfwiy7aQHYU8=; b=zi4MIipFjjW+Zt
	2JMfeUqsxSWVmMnLSxPOgixEp+wofRV7XB7g+UHoZaMr2zdjYs5PI8s1/lSeZid+ykyzlaK74bXUF
	Vaxsjdc3Aubos722BzjIAlJc5QVWQpuW1QUi5czS0cgRbDpdYhH9gyVrOQpwKU6L06oh6BZHHvRRd
	Uz/nieph7kW8DwbVFDBv8j5VM16zfpuhWWSKKro9+831PrHZMANKKSh2W56sN2Fc6mlw4NrWKyQ3w
	br5Hty1ls66LngdJXzh0ig8PcL2+jNEQcFnpUxYcuaQBWUkzjNHu+UQzenYW7qlMzxt3wCDXq5ah/
	TdrrF91fo0xbjZjWA9kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2ge-004cUA-K7; Fri, 18 Nov 2022 14:49:48 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2fx-004c69-2u
	for linux-amlogic@lists.infradead.org; Fri, 18 Nov 2022 14:49:06 +0000
Received: by mail-lf1-x133.google.com with SMTP id d6so8540928lfs.10
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Nov 2022 06:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+xECLjM+1wJ3tyU5u/WQawVGRXnB8gHjb6MLiqzOmuE=;
        b=Zs12YmMMSavyYzmNqKcCRYMCcx5tO7qpQ0VvE7hyvFNBku6wyFMWhXNVMlF+Sqg0KT
         WoIA+w4A8iuBJ/Z1AAHH4aIRydfpKhe7bF24gwy0bRzlEk0jYncnokHI+00AlKhVfGXV
         JIIp3E5uA+gM7soG5wopEU+Lv1q63Zy9Cg91suTl/dBPE5V24XVYczE01kWsKEHVfQGb
         dBT162Z4F1TG+7XSK0OcZOSsHy+CA846o55K/WA07GJriE9bcEJQUbPZyZbcV94cF4R/
         VfK+gBKT/TkzM9E9oq25330xsTCuei+8omVXqqLIW5R7KPXHwfeYtmnlKBMLd61OMOgq
         UpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+xECLjM+1wJ3tyU5u/WQawVGRXnB8gHjb6MLiqzOmuE=;
        b=d7U1LKGIRMlDMEfSPult7/8tdZM14StgHc3lxEWgR+U9hWtkXZxQdemyiOYfYwou68
         IG9lbXjnoxk8dF5Rwxtacu2fMBb1cbzXoFqlx4pbuXCd+V1RYILuafWZfGjjpBCE3r+8
         6W3O9RRzI/O9bKApD3T+URzJPsI8VzC7ExxYpK+kR38ab/u3XDPehXoiNe7usD2cuoeX
         pYtKHoynPvxocAyr5FPFg16RzL9Lfs/8DitSu7kgRRZG5s2qoYWUdkSKOXg6BiaFf9tU
         ydDo36OniVFksZUr/nR4Dn4WzJVkJLcYSs4Dxfxm1+BjD0rpemy1pAah8PsIm6xrno6J
         JWbQ==
X-Gm-Message-State: ANoB5pklXAfehi1+7+E9ppe1ihKCeZcsqyWqGmo808sC03BapKZ2/0o2
	KdSe8MoSWcybqPx9Jz/erbdW5Q==
X-Google-Smtp-Source: AA0mqf7ZXIKPBh9Rz/8NI/J74R1K82UMSY4YzepugR6KIDjTrCZkpyZFe0babnYb4sjivNlfYP6QJQ==
X-Received: by 2002:a19:5019:0:b0:4b4:8d47:7057 with SMTP id e25-20020a195019000000b004b48d477057mr2868955lfb.376.1668782943480;
        Fri, 18 Nov 2022 06:49:03 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id h3-20020ac250c3000000b00492c463526dsm685909lfm.186.2022.11.18.06.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 06:49:03 -0800 (PST)
Message-ID: <24296f7d-416d-e5f5-ef6a-c960b59513cb@linaro.org>
Date: Fri, 18 Nov 2022 15:49:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 04/12] dt-bindings: watchdog: convert meson-wdt.txt to
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
 <20221117-b4-amlogic-bindings-convert-v1-4-3f025599b968@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v1-4-3f025599b968@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_064905_226074_A881FE5B 
X-CRM114-Status: UNSURE (   7.58  )
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
> Convert the Amlogic Meson6 SoCs Watchdog timer bindings to dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
