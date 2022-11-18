Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CB7C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Nov 2022 14:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZoEHtbjzoabEtgbwKdb0spZX1ajJ1vUaUtZoFqy0++I=; b=ozNl9jY/sQ0uTRrBKOe4D9WY4+
	ot4F9nTCoJbLfjyuApUsbAbn0IO0+3gqYEsEIOelw6XWeFyPgICDdsTDXGkmEVJigCyhcvtyuqgPn
	kAibOhqnICzxcMBaEPYgnjCvoK3Z9RyxGeX26tNqWFKERvREs92waoeE/aWb4FZRHSd2L85O7hBt4
	t6FQ3ridWlnwOMJrGIR9ae87y0HXDBkQvalTqLNjEAqpqR4O6I9DqR2vO3UFkQ3GyOwiTTRP9RaC9
	+xA9lGlX7edZKtUFsMNSkv/gn43pb++1/n9byjVRX496CZ1wYsi/A9pGFbpVgiQ64svT4cSF6oUy0
	wezz/0sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2nP-004gQD-GJ; Fri, 18 Nov 2022 14:56:47 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2m7-004fXS-AH
	for linux-amlogic@lists.infradead.org; Fri, 18 Nov 2022 14:55:28 +0000
Received: by mail-wr1-x42c.google.com with SMTP id k8so9691201wrh.1
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Nov 2022 06:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dlGYFl6XUQyH5xQEd1E/V0bevUlACNWAQdHVOgdC8jc=;
        b=yObTaGsa5pkib3AbTNfuBC8H28vZJR4hDG74Zwave5uRYVAMPPJnAqtb7j/mH3O6sN
         wSI/DxmsBmlohnlux6f8e/e9cy7iWKwXJCmVCa+yuWo3AVE4YbIYGt2IWhm86Zq4G+OS
         E3L1fUEWkIpmVIIkYfL9qjsgDvQO0DOUXmLsULq5Ujw5FFziIj5vypCFGt6pI/SXp4VV
         VmcT6KR0S7KVvA08BB1W8rW3T8NaXj7nGnTZiw5Kc11R4HGgm15/moMqyaz+f2pi/hMG
         ecIwHwlKULEctd20uFy9dkSyyiJ7/+B4TWUVhNONlzQQRZEEYY/ujUkktx7nHhV1YDKL
         p/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlGYFl6XUQyH5xQEd1E/V0bevUlACNWAQdHVOgdC8jc=;
        b=rlXy6s/9nCT4VAHTSXTWGATlEmBvoXJos5ykJNzXnxomq8TBRWVve4KsS7WKkDt/pk
         u+k6zBBz+9qoioyQ+NfgxSGBLHY+w6mwhO2UP/B8NDdqTrPASqf3lleeXsL3XbC4Rtuy
         v2GuzBJDJMBCxKj5xSehjikOLacy3MQecSErPXUhLECtV+OrG81dJnOon8mxGf9B/x8X
         7PnY9ELYtBmd6q7gAK8n9prcr4s4nJX6IlcJoPFSoZzTbomTDh8goXLZFanJGuaScknH
         BaJLJw2Z5ghzLc9plzW4BKOAXmCb9gEHrgn+P2XDKveQFWOwjksR51o7vkMBeIXP0KVy
         EZDA==
X-Gm-Message-State: ANoB5plN1mAw7DlnlofAnSRlLjMGUV1YVVDTkZB2MLRJOxcl8D5nDook
	v8jivihI7vPIHPDWMLFmpwq/3Q==
X-Google-Smtp-Source: AA0mqf5B4c3Ofn4nvA8MCzk2t7U4aqKAjKRq8PhiFCL67Pk/bpuzhbbgJcn6qstPNN1EKZyNDibw0g==
X-Received: by 2002:adf:fc48:0:b0:236:e0d:9ad with SMTP id e8-20020adffc48000000b002360e0d09admr4594782wrs.692.1668783324421;
        Fri, 18 Nov 2022 06:55:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:f7cc:460c:56ae:45a? ([2a01:e0a:982:cbb0:f7cc:460c:56ae:45a])
        by smtp.gmail.com with ESMTPSA id a8-20020adffb88000000b002383fc96509sm3742721wrr.47.2022.11.18.06.55.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 06:55:24 -0800 (PST)
Message-ID: <95abd39d-b084-68e5-f012-6a1149bdb8a3@linaro.org>
Date: Fri, 18 Nov 2022 15:55:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 07/12] dt-bindings: power: remove deprecated
 amlogic,meson-gx-pwrc.txt bindings
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
 <20221117-b4-amlogic-bindings-convert-v1-7-3f025599b968@linaro.org>
 <15840da8-bae2-3bb2-af0c-0af563fdc27d@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <15840da8-bae2-3bb2-af0c-0af563fdc27d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_065527_429327_115D6625 
X-CRM114-Status: GOOD (  13.05  )
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

On 18/11/2022 15:52, Krzysztof Kozlowski wrote:
> On 18/11/2022 15:33, Neil Armstrong wrote:
>> Remove the deprecated amlogic,meson-gx-pwrc.txt bindings, which was
>> replaced by the amlogic,meson-ee-pwrc.yaml bindings.
>>
>> The amlogic,meson-gx-pwrc-vpu compatible isn't used anymore since [1]
>> was merged in v5.8-rc1 and amlogic,meson-g12a-pwrc-vpu either since [2]
>> was merged in v5.3-rc1.
>>
>> [1] commit 5273d6cacc06 ("arm64: dts: meson-gx: Switch to the meson-ee-pwrc bindings")
>> [2] commit f4f1c8d9ace7 ("arm64: dts: meson-g12: add Everything-Else power domain controller")
> 
> As of next-20221109 I see both compatibles used, so something here is
> not accurate.

Yes driver still exists, was left for compatibility with older DTs during the migration.

> 
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../bindings/power/amlogic,meson-gx-pwrc.txt       | 63 ----------------------
>>   1 file changed, 63 deletions(-)
>>
> 
> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
