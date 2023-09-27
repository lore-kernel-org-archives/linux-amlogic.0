Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CD3E80A93
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Sep 2023 06:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+CEe0IgGhIhgdpa/yXZh76y3W+UK4ntGk/+P6avukM=; b=ms2jsBnZXa1fnXLQcxTdKyKJH8
	3twqA1wY2m32WVNnhTMh+V9DNGnp7oSWipaYYVe3XpTdFWEXD1RWbdSJFgKdDaC18Z6dOpL5pjuiX
	nreehvYuAYAi1pk7MUU0A+gFBKz/UrUsXA1FisDEiv9qcYIME0/4KWwAWLLwjDAElHkS3EaxAkTW4
	qeLXyfibX3moTkypjOpdVaKnMgo5xqylDOk2mP2O2FUMal7cotn8gxpqVBro8/EqjcYKIAolrWocI
	cA3V3d91Lp+6HJ7F3cbnPRgrgPWK3Qp0wZxid5TPgPaFEweZyTrNnDWJJWEk6h22H7W1hAdVDK6CT
	hYEzHEJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlNiJ-0004O9-0e;
	Wed, 27 Sep 2023 06:07:59 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlNiG-0004Kc-23
	for linux-amlogic@lists.infradead.org;
	Wed, 27 Sep 2023 06:07:58 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40566f8a093so73038815e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 26 Sep 2023 23:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695794856; x=1696399656;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3jjY/FfCc6ekraoi3nQCSqoiV6P93s2LvkAiJSDSabY=;
        b=DvRJalGRStMjqgUr0Sou7PZH7w17567YJs09Nr39m6dZz1U5Qj8BPFBenGBiW1zSEs
         QJI+2iXWjNxAdGySzPeG0jHMRabVApdAXQ1EB5TL4e4IjUQgw78dB3h6tqttHwRegMMK
         M8EEarMAL9QBxXQ2LTGUTJgELG3bGyJ8vq2eOLCodxXW6iO7nR/9hBbGsm520X4sMIU9
         FFPFbX1/258x7sSB961W5vOgneeKUlxW0qyjP175pKU8c6karwg//zo3ZO2db8mygN2D
         0yVWm1gQEUSbG5bLTH5PGsq2UIacze50OW0Gx+I9/n/wlTq+YaVdXCnVEswt89jq+yVo
         Jsxg==
X-Gm-Message-State: AOJu0Yy6VeNlYKFlW+bXOzVWo4Sgpo1hK/i6sY0G/gg21f7ZqGmnOoYa
	Khx3EaI+h4fVUjMR+y6n4fe6ZFpYFNLXvg==
X-Google-Smtp-Source: AGHT+IHY3aNG9pDy1kLqorRwguPDUZWsu0UvpmkF38PFtZafB88Yz2XenfV1YBhvVRZAjwI4O5GuFA==
X-Received: by 2002:a1c:6a19:0:b0:405:3e5e:6694 with SMTP id f25-20020a1c6a19000000b004053e5e6694mr964833wmc.36.1695794856377;
        Tue, 26 Sep 2023 23:07:36 -0700 (PDT)
Received: from [192.168.86.246] (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id s9-20020a05600c45c900b0040550c20cbcsm12015055wmo.24.2023.09.26.23.07.35
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 23:07:35 -0700 (PDT)
Message-ID: <421955ac-e734-4f5d-a4e8-6b2910e6025c@linux.com>
Date: Wed, 27 Sep 2023 07:07:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: interrupt-controller: Add support for
 Amlogic-T7 SoCs
Content-Language: en-US
To: linux-amlogic@lists.infradead.org
References: <20230913080924.3336391-1-huqiang.qin@amlogic.com>
 <20230913080924.3336391-2-huqiang.qin@amlogic.com>
 <20230913-sizing-attest-bc9bf7806306@spud>
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <20230913-sizing-attest-bc9bf7806306@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_230756_677716_B18F124B 
X-CRM114-Status: GOOD (  11.83  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 13-09-2023 15:32, Conor Dooley wrote:
> On Wed, Sep 13, 2023 at 04:09:22PM +0800, Huqiang Qin wrote:
>> Update dt-binding document for GPIO interrupt controller
>> of Amlogic-T7 SoCs.
>>
>> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks,
> Conor.
> 
>> ---
>>   .../bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml   | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
>> index 3d06db98e978..a93744763787 100644
>> --- a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
>> @@ -36,6 +36,7 @@ properties:
>>                 - amlogic,meson-a1-gpio-intc
>>                 - amlogic,meson-s4-gpio-intc
>>                 - amlogic,c3-gpio-intc
>> +              - amlogic,t7-gpio-intc
>>             - const: amlogic,meson-gpio-intc
>>   
>>     reg:
>> -- 
>> 2.37.1
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
Tested-by: Lucas Tanure <tanure@linux.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
