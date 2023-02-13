Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72130C636CC
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Feb 2023 11:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sb2DjI0lwzhk1endSe8tUtYpHh1d8md3XwShYs/NQy8=; b=kpHBIqWEC70LaWvgssIAGyLECY
	zr94GGaAHKCS4JUdIORjOopQHICno9hGDdlvCfkPT9zRk4iHsizLg2nRlv8T3rb+tjfy+raJ6PSyu
	F+ym+cDxuPrOscFmAsAA0WGspjaTZk4JXrCU0Fi6weLchkJH1ePHCUvFkRPzG+q6EP4KAECTbsaUG
	SVJcmpr3IgOprKEBxMCORXMXcPpSCyDTYL222yykHrn6/bBakCl3NcR8MEvq7vsd/8WbhNPSt0De6
	vh0N4sRPJLlJDB8oeH8Pea1zKrjX8eCRI5u7uLitDO5h+n+oVSPYuI4zFJ2bl0xnNc1zqmO0DaDxV
	oVdhIrfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRWch-00EJ0D-Iw; Mon, 13 Feb 2023 11:03:51 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRWc8-00EIgs-Lw
	for linux-amlogic@lists.infradead.org; Mon, 13 Feb 2023 11:03:23 +0000
Received: by mail-wm1-x32e.google.com with SMTP id l37-20020a05600c1d2500b003dfe46a9801so8731927wms.0
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Feb 2023 03:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tHAxmSnCLm2NgMlRnfLJnGtOO2fga/60NcX7zQbcUh8=;
        b=KfF7fBNilKnMZqgcE6V8XPcUiYk09Hm4sT39lg6RRFTIBSwdml42IIrUDwc7iTTsYu
         Cr/8MWtZVhejzfRlpN02l90KG0ATpCEUmbEMSJwNoivP8iQnAE+dMMGoc1YaC1YdhD37
         42s36Ol1/6uT4sNd/fspFVsvaXcpylPEzYv+mHOphQJtVsegpEoznNDDAqHbKoMBxWUY
         15xx/4FLu6A5xVNS08tRP/QR+NgsfvL7U0gDDThpUB3A8ek7o7d/ZHXxnInf4GQa+1qV
         RzIbekNUAS7s503q0UzLiLP6Fss2RbYuKvxIzo/EGLbGDHIOd6o/LXLO9yevI32SJNyl
         F3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHAxmSnCLm2NgMlRnfLJnGtOO2fga/60NcX7zQbcUh8=;
        b=1nLe5hvgL9D1ROqs9ozstF2uq/wJZLyA5CEv92G5RsC7Lk7+L2lDLH+R7p4jRGjE9K
         UzvL0zB4n44mcA85J+nCYkDq9MQjrJToVMQZb77zRoQXlolrYmBnc5/sUPm1bp7DhqhU
         gzQTGv4yM+znCFYyjKijFTlHIIRRkc8lizwEfQO3813Dns4jjE3eQueLFzTY0ldufPmh
         vdfuNRvMWHDpus/5NtWtSRzzwAxuml5F4AZnJQBBJTokIdxrBMX3D+PQeo6CklZyJ+/W
         rdwmD7TEmpNHjMXfjZcnq13JDqslSiYGkwHY+lzJIGe3DQFkP4oThQI1HhVD1+aeW+kO
         BSFA==
X-Gm-Message-State: AO0yUKVTiQduFrx847iAopAVInY/+kdW6SXxq2Idz4j+tGJBN6qwud2c
	lB2JOsk5aPtF0LjEF7e5IqAiiw==
X-Google-Smtp-Source: AK7set8BpKWzPhhIpgB4loHWn1A3+YVw2UfajMQoSDwIsHKfg2wAshtqeb5KaWuSutw8xR73pFyMOA==
X-Received: by 2002:a05:600c:3d98:b0:3e1:e149:b67b with SMTP id bi24-20020a05600c3d9800b003e1e149b67bmr5445197wmb.18.1676286194624;
        Mon, 13 Feb 2023 03:03:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6e1e:131f:8bc1:aad8? ([2a01:e0a:982:cbb0:6e1e:131f:8bc1:aad8])
        by smtp.gmail.com with ESMTPSA id q3-20020a1ce903000000b003dfdeb57027sm16654252wmc.38.2023.02.13.03.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 03:03:14 -0800 (PST)
Message-ID: <039e9f93-5b97-bb5e-e3c0-b8bf2c52a2a3@linaro.org>
Date: Mon, 13 Feb 2023 12:03:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 6/6] dt-bindings: soc: amlogic: update sysctrl
 clock-controller subnode type
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
 <20230209-b4-amlogic-bindings-convert-take2-v1-6-c4fe9049def9@linaro.org>
 <f18230c9-7c9b-9e59-993f-24d40b74ba9d@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <f18230c9-7c9b-9e59-993f-24d40b74ba9d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_030316_781414_1BFACB59 
X-CRM114-Status: GOOD (  17.04  )
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

On 13/02/2023 12:00, Krzysztof Kozlowski wrote:
> On 09/02/2023 14:41, Neil Armstrong wrote:
>> Since the clock controllers are now documented define the right ref
>> for the clock-controller subnodes and fill up the example node.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml         | 15 ++++++++++++++-
>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
>> index 672eabd90c09..57eae355f1b9 100644
>> --- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
>> +++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
>> @@ -43,6 +43,10 @@ allOf:
>>               - amlogic,meson-gx-hhi-sysctrl
>>               - amlogic,meson-axg-hhi-sysctrl
>>       then:
>> +      properties:
>> +        clock-controller:
>> +          $ref: /schemas/clock/amlogic,gxbb-clkc.yaml#
> 
> You just added this binding. I don't understand the split.

It's a chicken and egg problem, the clock controller bindings (patches 4 & 6)
I've added the system-controller top node in the DT example, but this
example won't be valid until I add the system-controller bindings.

To solve this, I add it in 2 steps, but if it's an *real* issue I can remove
the top system-controller nodes in the clock controller bindings and add them
later on and add the sysctrl bindings in one step.

Neil

> 
>> +
>>         required:
>>           - power-controller
>>   
>> @@ -53,6 +57,10 @@ allOf:
>>               - amlogic,meson-gx-ao-sysctrl
>>               - amlogic,meson-axg-ao-sysctrl
>>       then:
>> +      properties:
>> +        clock-controller:
>> +          $ref: /schemas/clock/amlogic,gxbb-aoclkc.yaml#
>> +
>>         required:
>>           - pinctrl
>>   
>> @@ -81,7 +89,12 @@ examples:
>>           compatible = "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon";
>>           reg = <0 0x400>;
>>   
>> -        clock-controller { };
>> +        clock-controller {
>> +            compatible = "amlogic,gxbb-clkc";
>> +            #clock-cells = <1>;
>> +            clocks = <&xtal>;
>> +            clock-names = "xtal";
> 
> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
