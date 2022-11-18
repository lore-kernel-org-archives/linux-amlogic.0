Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93CAC433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Nov 2022 15:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mBtSzBUMzkgu0wl4gaSnBQ8k3aO/w1vWw4gKx/EJvxQ=; b=VO8prOmr8NVRYN
	v6uvEuuw4/J2XOvVdUKgqP6oKf5MR1NTcncH0JzlPHXCB2NJa9W1ZLtGUZxgw/XeKBU2RzZbjqn0+
	WiBVMEuMvXrDT9O1Yloa2BK2Fu8hBodFiWJldQu60hxss1fFnMgJr9rhIVXbZbzD76XvpdLWsIM+c
	3/O98/nGVBktlQlVoMmxHk+AdJNjB/8vU8n9AXdGRbYFAP0UZuwkJ+zgmdRIQIhiZPu5/Sib4oeH0
	lJ6pLpkVVGamR+RRRx/y5Dt2xfMBywnbKiobSLEYTEoK6UVjj4QVZgUYWWWieR2zUMEdC1Qi4bmap
	V10n2zf5TwSgwDBTroQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2sm-004jDH-RD; Fri, 18 Nov 2022 15:02:20 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2rL-004iN0-Jn
	for linux-amlogic@lists.infradead.org; Fri, 18 Nov 2022 15:00:53 +0000
Received: by mail-lf1-x135.google.com with SMTP id r12so8639572lfp.1
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Nov 2022 07:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xZwVEy9nYMOGJVqNuOaZMQiT5Q9vQhLz7eqb5cQdZQw=;
        b=tqVpDafz2JPxpjQRqsyFMMJaYBXdKwQkLbZoJLNsDj9VCVAb7mK9tiv6F2SDhe3ufq
         rwM92bgOOptB7jG/c5D4/Ya+FzHgR+tYlaNW6eTN2kHmmTzAofF5DcT1dlQaMSerR17G
         rDqMG22aJ95f4773TiYyo8QPHpyb2j/dcpg7OfC+6nEshU7MsKGELcm1Mj/Tr+dhfK/5
         4FZKPlIoRdC13WaDRNKf0g2s7vkFRT812d+h70WXPAsVX3F3+fzudapLPjmkSYVt89c4
         Rc4kbe8E4a1WUuJcEcJQWGtK1FS4uE1x8EUvsNIFRLE2En48mecdHTbxq/5Nv3LwVNDB
         CEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZwVEy9nYMOGJVqNuOaZMQiT5Q9vQhLz7eqb5cQdZQw=;
        b=hC01e0srU0ykWAuGEvLYkaVnH4UwXyZVG2eigh3HEMbcSaQ8/vf+cvBmC1vhr731j7
         dSD7xDJqDJbwtZWA2v/mmYhnyctvCudbmar7fDUYybY6ytlyvnU1XDWcsNtFjTwdk7+T
         0mA8qpTHN5t3qRUJUyTccwltAUmdJ+jcbkua/X3z04HiyjnljkBahLUfwsSmlvaa6h4+
         7e9YSBF9ryjGqQQskyKziuajGspgWXsBFgsIPUZg4+AzukNfubuz6/lwc36/M0cYQUmv
         mBUniwEDQ7GWKHAs89Rdx0XU1gxuZsd96uwHDUVpoEF8fc07XoRRUmhsggJ2t5BKFKuM
         qW9Q==
X-Gm-Message-State: ANoB5pk7iVOMkDhIuRqJGeQ5WRwTWGw7fwakvhzEFfWlE3IzrfnftDJZ
	ty1pFi0sSB+urj/68GkYEijvnQ==
X-Google-Smtp-Source: AA0mqf6BTjsS+TwWckVjHa91aDENgfUjJrDrDj2CcWJkPyIdf7Ut+Y1Rzl3SNKwLnI6zGlVaoA3a5w==
X-Received: by 2002:a05:6512:6d:b0:4a8:ebec:7143 with SMTP id i13-20020a056512006d00b004a8ebec7143mr2515960lfo.493.1668783649650;
        Fri, 18 Nov 2022 07:00:49 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p5-20020a19f005000000b004b48e0f619asm694119lfc.48.2022.11.18.07.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 07:00:48 -0800 (PST)
Message-ID: <838b278a-aa3c-c34c-4277-e50079512b47@linaro.org>
Date: Fri, 18 Nov 2022 16:00:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 11/12] dt-bindings: pcie: convert amlogic,meson-pcie.txt
 to dt-schema
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
 <20221117-b4-amlogic-bindings-convert-v1-11-3f025599b968@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v1-11-3f025599b968@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_070051_705754_71FA0B72 
X-CRM114-Status: UNSURE (   9.38  )
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
> Convert the Amlogic Meson AXG DWC PCIE SoC controller bindings to
> dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/pci/amlogic,axg-pcie.yaml  | 129 +++++++++++++++++++++
>  .../devicetree/bindings/pci/amlogic,meson-pcie.txt |  70 -----------
>  2 files changed, 129 insertions(+), 70 deletions(-)
> 

Use subject prefixes matching the subsystem (git log --oneline -- ...).

With fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
