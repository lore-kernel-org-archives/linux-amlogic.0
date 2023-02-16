Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C506C61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Feb 2023 13:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2hbJI94F6mItzITLUDgDTSBY2WctJB0K50DvJW7lA8U=; b=F8qzMBRq4SXwGV
	C9yg+A45UFaWG+2VxTLDGDWX7yIVClgf0QYFNvajyS+EJggmuXGoBBV8XzkT3yXp/ICFyPK6XqSdk
	JABMZo2xrgRRhj6j/XF3C/YuFEidLSAHNt5B+O/Pu1DaRxTQIP6uHOA3kxzv+TJ9rdTTMcUyYm2WY
	g5Db+EhXcWg3K5K09L2MDLPfM2eCh+XX65Yq1O+7ooyy9oqxLv4Jgmfpg5AIsyfK2rqNPDlZNxR3P
	QlTnEInTjv/MWFl2AHPaCFGC+nXsfVQWQHseEaeAwdhOICDSPM2SVmwEbRxg457mXBL75ek1BrE1M
	DcXEk4wLw2xFqlKS4cOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSeaa-00AOmk-Vk; Thu, 16 Feb 2023 13:46:21 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSeXT-00AMw8-Al
	for linux-amlogic@lists.infradead.org; Thu, 16 Feb 2023 13:43:10 +0000
Received: by mail-ed1-x52f.google.com with SMTP id dz21so2836776edb.13
        for <linux-amlogic@lists.infradead.org>; Thu, 16 Feb 2023 05:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B5grLXxAB2C9edHtiWdcPQF4DNv/cRB6QAPzd9Oxh6M=;
        b=NQVwbo6Oc/igVtVnE5j9BA51kVTizAW4bXxHKVG4u+nusPCgy7miJHd5yn7E/y/vwE
         Lbs7+8Sr0blHOvDJhNvAZr7/ctXDElFMFdYLzKCICxnJc74z+IRIcXdToaV4DcHNepaB
         sHUNy2du4sdjpZZUwqHJ/IgvysSmtgm5avpBXsoBsvUXr4WwhYESareQBPmsNpkxigqm
         sLvfcnD0IqRS8czrjOh7oiIdJT8zJQz190ZtromTTjlV1Ve9RwuZpddtfThaWKj3nrQD
         Q6Srqfd9txDc1vL5Hddz2gerivCodr1PmQS7WYHJ+hCxy2B2YvYi6XKOqCuu8M5oZ0YX
         k1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B5grLXxAB2C9edHtiWdcPQF4DNv/cRB6QAPzd9Oxh6M=;
        b=zWFSHBltGW+aVvlub0pOh+9arZ3YAQoSEC1HlYHJh5cs7IncRhizw3cLLkUlKFB2VX
         Q8J30ni0rBFwjR/BZuUHrqOo24xVWh5FI2e2/iz84h+2HoiFWAJ6VE6t/nGjpQ5M6CLz
         Z4lmx7R24j5ecTsvRuRKJpkv6FNZTi3M6Xhp2ITelx3/yGLAicnXt0nHNXSNoOOIF2Wi
         XFLgAJSwOgnOmhEUj3Yvzd6M+q8uHrkSErZ6zwIDbyM2dpBkHMDzTBjzSHaURzB4sP1O
         /r9AwC9xq7cfFFU2USWgfV6AwPJBL05ETVFFoiRoaXnhw+6yCXld+cehoQ1r+z2oPK/l
         CHIw==
X-Gm-Message-State: AO0yUKVLvZnEyjXIwOEJ5u00OOq+E96G1B7g1/MTGcv/JtIKCcT3pPwt
	7B4vB4WeYWWGJhy2xLWqUeRzwA==
X-Google-Smtp-Source: AK7set/TRdjG6xv8ct9rhgVcIRiyLMjQGkZkFuhAX6OpQzYrsPbm81px2CSsywNftx89T+9FNn5qpA==
X-Received: by 2002:a05:6402:909:b0:4ab:1715:2858 with SMTP id g9-20020a056402090900b004ab17152858mr2272896edz.11.1676554985181;
        Thu, 16 Feb 2023 05:43:05 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n28-20020a5099dc000000b004aab66d34c7sm898722edb.7.2023.02.16.05.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 05:43:04 -0800 (PST)
Message-ID: <caed0029-57cf-cd95-661f-1657ef0a6d5e@linaro.org>
Date: Thu, 16 Feb 2023 14:43:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings: mmc: meson-gx: fix interrupt binding
Content-Language: en-US
To: neil.armstrong@linaro.org, Heiner Kallweit <hkallweit1@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <d5542f6e-920e-93cf-a453-b0601d03f48d@gmail.com>
 <21ae5f5f-2336-db5b-f98a-f83391e1becd@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <21ae5f5f-2336-db5b-f98a-f83391e1becd@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_054307_461211_1E3035ED 
X-CRM114-Status: UNSURE (   7.84  )
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

On 16/02/2023 13:52, Neil Armstrong wrote:
>>     interrupts:
>> +    minItems: 1
>>       maxItems: 2
>> +    description:
>> +      mmc controller instance interrupt
>> +      optional card detect interrupt
> 
> I would instead write:
> 
> interrupts:
>    minItems: 1
>    items:
>      - description: mmc controller instance
>      - description: card detect
> 
> and drop maxItems.

+1

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
