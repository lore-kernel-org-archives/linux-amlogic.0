Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0734C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Nov 2022 15:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I/TyiPtnOyLY6HJmFJ6zAOjggH55b2ZfeMLyHcxtBTY=; b=YFoJZAMGmntU3H
	OW5+/A0rgVoXcGups3GjXT9ktIBVLC1oobfcbNO693x6ptHGDmPfqAtl4errmvQ9rGkrQ6IiC9FyZ
	rlvqN4jUvR4ludpUSryUvF+7BxxSO2Hptcg7WyRi2cZ9abCWtVM9vFuOG3R5Fj0oOcDFMgn7rsbvR
	fGBGYSmVWbDD809tBn3zibXn5SEwyrOnwpW9G/sU3qaFVbudYXklkB+rWwjusTziDElYF4qCF6a7R
	ftj7D2st1mnlirJsLwwM2lv0Ht/q6b/ZH4+pYvPmM405O1+P5fwyHKWYq6U6IjJOxWpOuU/pR+G6M
	PD6U3cQmoAnLCKldykEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2sM-004ioq-Ku; Fri, 18 Nov 2022 15:01:54 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2p4-004hJX-4X
	for linux-amlogic@lists.infradead.org; Fri, 18 Nov 2022 14:58:32 +0000
Received: by mail-lj1-x22e.google.com with SMTP id x21so7045634ljg.10
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Nov 2022 06:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gibrX75NV0o1Er7DAwf8HIM5v6cqoDdd2wUHdxJchhE=;
        b=xlP2/zPO44yPgOZyJLVvU2O64clebhkb2vmGo5gBNeig3Ow/Ikz9yC2MGIXKRCdvt0
         lgs97gHMJWxLzQeEWAWd4TUPsXItwsIf33R+z474tFpECaZSQxXSRD6nyNHMX84hbFpl
         qOa7JUfbLDERx1AP423afzv+JxxpmRbbuYMBS9sWqWe2PZtbeMfDS7x8nHBfJuKmHUxg
         kakz50WXbg0TKrdI7JcO6MbfKES672Ahu7rdE34KR75q5Ao4y9vUAEZc3V/1XQBycVcI
         +pVtG0Sy08uigqxmUV+gjtdpxRxna5Zpc+pLemPTUQsG29Ar43U8KQBsGmagHGetsxPX
         KQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gibrX75NV0o1Er7DAwf8HIM5v6cqoDdd2wUHdxJchhE=;
        b=Jfo3xMG1i5m+UYEzQx7VFb4KHC4jajp8wm1NUVhuyT486kJLK+ZRDQJfkHW6ZMFMEF
         6NtugZBsfFE5hDfHC7qao4u85jCyc7tC847zt3fdi0+0mP/Gx4L/xFx8ARundlpfP0XF
         ZQxCwHBshgL5ED24bhLWSDwR8z7ZBDGCwXAn4avEypcY2/yV3BzwTA0npGz1cPJryRqe
         triwELCNRD84OqWsZEWGJeHqd1GUKomvVo3OwsXhl+SI//v+roLU3LCc7kjSa7yOj7ol
         sNFjtMfnWQmeLvjP6Cbqg2GqL8z2+ccFMrSopR4O2QhrNo4qOsZUbB4bERUAQqRfxuo2
         oL2g==
X-Gm-Message-State: ANoB5pllyCR1XzbPiwYbX4G8jEov4j8K3C9Y3a9yVrxSSafp57M+gjp6
	WBnZ6S5pdU6jnWcjQfBjOoVg3g==
X-Google-Smtp-Source: AA0mqf4GsDcErhuHhrxTsrc1he+Ga3A4CdIcSPLSlvDmnQTf+lXOnPMqUgqrM17z2dntyeUlAKEDoA==
X-Received: by 2002:a05:651c:301:b0:278:e996:d2b0 with SMTP id a1-20020a05651c030100b00278e996d2b0mr2640287ljp.50.1668783506295;
        Fri, 18 Nov 2022 06:58:26 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s30-20020a05651c201e00b0027758f0619fsm681677ljo.132.2022.11.18.06.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 06:58:25 -0800 (PST)
Message-ID: <35c07fc0-574c-817a-93ed-4575659e767b@linaro.org>
Date: Fri, 18 Nov 2022 15:58:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 07/12] dt-bindings: power: remove deprecated
 amlogic,meson-gx-pwrc.txt bindings
Content-Language: en-US
To: neil.armstrong@linaro.org, Jakub Kicinski <kuba@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
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
 <20221117-b4-amlogic-bindings-convert-v1-7-3f025599b968@linaro.org>
 <15840da8-bae2-3bb2-af0c-0af563fdc27d@linaro.org>
 <95abd39d-b084-68e5-f012-6a1149bdb8a3@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <95abd39d-b084-68e5-f012-6a1149bdb8a3@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_065830_212212_301B23D2 
X-CRM114-Status: UNSURE (   9.84  )
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

On 18/11/2022 15:55, Neil Armstrong wrote:
> On 18/11/2022 15:52, Krzysztof Kozlowski wrote:
>> On 18/11/2022 15:33, Neil Armstrong wrote:
>>> Remove the deprecated amlogic,meson-gx-pwrc.txt bindings, which was
>>> replaced by the amlogic,meson-ee-pwrc.yaml bindings.
>>>
>>> The amlogic,meson-gx-pwrc-vpu compatible isn't used anymore since [1]
>>> was merged in v5.8-rc1 and amlogic,meson-g12a-pwrc-vpu either since [2]
>>> was merged in v5.3-rc1.
>>>
>>> [1] commit 5273d6cacc06 ("arm64: dts: meson-gx: Switch to the meson-ee-pwrc bindings")
>>> [2] commit f4f1c8d9ace7 ("arm64: dts: meson-g12: add Everything-Else power domain controller")
>>
>> As of next-20221109 I see both compatibles used, so something here is
>> not accurate.
> 
> Yes driver still exists, was left for compatibility with older DTs during the migration.

Then the bindings should stay. You can add "deprecated" to its title.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
