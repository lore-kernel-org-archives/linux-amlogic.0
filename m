Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1AFC54EBC
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Jan 2023 10:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=csQsWe+dfxi0ElApFQPMG+ppvXmaVQbYVRtDj9ggO68=; b=fUryc7x3a2ExKJ
	+k5RuMPshNG1u/O5ZrfgC+O0skJW7T3UGs1uKurOkZv548xvAlDgiKPVyQQcVpbzQEmVsTyKyT3nX
	gXmqaPqTBFOS1D5hbNoHrAh2Yfs7qNFeIm37e8aJT1LM5Gk7o6l1GceXkZSpus9vcdFzDmYC5Fd7w
	UVP+RBhTFZiykNI5Ji3ilj+0HN8a4LfH92XyH+cO6Ra71IoBvJOjoF+gIn6VKLNfyles2jOUwMxhc
	hTQ0g1FI9mNZZV9nPtBy+7/93d7oG2v+BP+wm1an7lfgbfuceQZz9QsMWquGHnzXa3R6i14/yy6iQ
	s1xFkLWgRwj4DPNeQ/ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFBfB-006Ic7-Dc; Tue, 10 Jan 2023 10:15:25 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFBey-006IVv-Nc
	for linux-amlogic@lists.infradead.org; Tue, 10 Jan 2023 10:15:15 +0000
Received: by mail-wm1-x32e.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so9451209wms.2
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Jan 2023 02:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AOaM9klxyd9oBpbyKATfQLn+xwTyF3728aG0uRNv66U=;
        b=yoUk4O+00nkGYkYXyiqjTxWK4c7uEc66lLsyapNN3lN4GWq40l5XLLk6lO9MKtmxLQ
         0mF0Rhs+YcdM7Am20PD9umvFqLKrgIs2WmrZqIoUhClE+yw2sEunnBBIg5tONlN8P8cg
         T/1xm7p/HoG0u7bVzXhlUjL5p8+Fvq6t2cK3PJCGiI7caXb7zzfRZcI4qprHbjxN3Gal
         hVatrgn4tWSnEMLt3nvou6IN6lw7QGsWFvZT88CEO87sTEeS8NAtT4PaEbRYqoFH/rKp
         gsFXYOEShYrosm9/rWZnYkZv6fcSTdHmPOYz9UXe0E+RXWhxZ3TWNIKjLHIFrlUHmJ/e
         RjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AOaM9klxyd9oBpbyKATfQLn+xwTyF3728aG0uRNv66U=;
        b=ypjVPNvbICHm8ZQU6LFo9FOiwbcIRKpn0WYCwQCK3+TAhgQg9Djv+PCNVnJDDJOPPj
         IQyka6OIQHjADTWz8yMmBTyFzldJh1kESyNl+oYMJAVeRGW7goU7s8LYJ6Wd9ws0jNbg
         Xws7Ql408hi3/BpEefUz/ql6yvcrtlIy4xIu8+PjQ3OpI1OTzFLE+4Vo87pghhKw5xj4
         XEDOv4yESTjmcWlaE4yn6YvRsAqSZ9mZLEfsT8VZO60LyZyfMU9f87LN918UBvXHrB5U
         yyY1PwGKIJnSXmW35EyBKCuUgNdYNmhz4JaxuEpcxnlb/ER3huqTxnHTTByIFkWw3Q4E
         Zw6g==
X-Gm-Message-State: AFqh2kpQxo4ocvSskzMqEHa3vv+uLiyDK12hD/Ba0H7zUfl/+elrD8sd
	KLVFxu6PstJxcSKgDs0+VJHnlA==
X-Google-Smtp-Source: AMrXdXstKuMbnF6GLlV2QioeyL83rfUZ/PCM9H9gtVt4kpI2kfbu1FzMUYifSv02GGXMFgTeLR3h+Q==
X-Received: by 2002:a05:600c:3b02:b0:3c7:18:b339 with SMTP id m2-20020a05600c3b0200b003c70018b339mr58648300wms.37.1673345710203;
        Tue, 10 Jan 2023 02:15:10 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f19-20020a1c6a13000000b003d9fb04f658sm754592wmc.4.2023.01.10.02.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 02:15:09 -0800 (PST)
Message-ID: <2a0408ab-085b-c104-7e84-ce2fe1e6bea7@linaro.org>
Date: Tue, 10 Jan 2023 11:15:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 02/11] dt-bindings: nvmem: convert amlogic-efuse.txt to
 dt-schema
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org, netdev@vger.kernel.org
References: <20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org>
 <20221117-b4-amlogic-bindings-convert-v2-2-36ad050bb625@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v2-2-36ad050bb625@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_021512_802322_C4250613 
X-CRM114-Status: GOOD (  10.11  )
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

On 09/01/2023 13:53, Neil Armstrong wrote:
> Convert the  Amlogic Meson GX eFuse bindings to dt-schema.
> 
> Take in account the used variant with amlogic,meson-gx-efuse.
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
