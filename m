Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505EFE810A0
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Sep 2023 07:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JgIL5/PEoQCe+Hj/XTgDTo5KeahSI2FtnagcaJezwvY=; b=zfRCUxh29UJbJV
	K7BSq8uUXFn/X+6dWCxQBBphcxey32bwOu/cpt5hEtUwfjfymNFzfPfORUH01GNjhrv+q+R/s3czy
	BvM/dkBit83pyt7Kly/eAcmML9ztt35ly/KoaUdD4mgR+fr7pwOeexfekfwVhAr9JS1HLwcLU+aW4
	n5By5K722kn6piA01Q0bZAomvBYEVnkxVs3Su31M6W44dvmowtepKcp5Mj/jvrjCoE5WO92UoMzzl
	wQI2dLOKFsbStzeLppgYGDP4t0a+kmOaUOJbhskwX5JfRXypmyf3vfH4nPaaE/o/JldBzDhkfbhZE
	Q9Eeo/yn2wFAyImgSR9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlPJ8-000Fn9-1x;
	Wed, 27 Sep 2023 07:50:06 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlPHs-000Ec7-2U
	for linux-amlogic@lists.infradead.org;
	Wed, 27 Sep 2023 07:48:50 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b962c226ceso177981961fa.3
        for <linux-amlogic@lists.infradead.org>; Wed, 27 Sep 2023 00:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695800921; x=1696405721; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cjDOYF7T/FlNaBw6bgVsIRpbkeeR+8h756YrDe1mwTU=;
        b=f61B7hsrLFnR7KqdG0ep4+I9B3XS3qGV7Y4tFacpPrrRMzrxkFsbyTVpoIl9qXv2SI
         L8+ahVQsgqYKsvE/T5kfghntJKd95ypdI8KHAtzeipOcLHMs+c2/iSKD9aKewQMu6YR7
         aEkL4TrR51ZTLnETpO55tchWADG1Nq0cnaGo2LhvUhoFGV42oZyfYHzvPxhuO/HrjI0+
         A/IIUqsGHuLZhP9stzHuQJfAmK101qYVc5s3dwZarc32z8RyLL0tQlewwjHg3+UuENV4
         76A5k9P+fI2Rs+I5J/ZMuKwUkFpaTFjXO4DT7z/7Fo3qtkho11qv0a6sa3MGNScSAcT4
         2XVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695800921; x=1696405721;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cjDOYF7T/FlNaBw6bgVsIRpbkeeR+8h756YrDe1mwTU=;
        b=fS1azcDqdSJfiMkcqEHRuhlxNh2j//OzDMUV/HXJqN1KPmkpjKPjVgs1DsoXQ7uO22
         nxk1FqOjmCjIPt0+jXPPYDupaO3JxRJf71Tr8NSaOc+AVc7dZbVJpMSoBzmZqF8esWyG
         xWvVm1e+WIaok2keqCS27+/ClIZhSfNQJD0uz0B7GhvEQvG4pUc8PgDTUVewxZLZjJh4
         FbgjY8aGpzTXAahOXUdsF7QkR/s46Akue4cK25KzEtK/rZfrbJ2NEnE4hiQJQylltDsH
         DUBrXS0CN8KEpvdOHXoL+6kJCfurjSvHCdwg+NdDiW55qD8wN5W8mBylLuX3JRLaWBO4
         EDgw==
X-Gm-Message-State: AOJu0YwMS6OBwiDKf2422EpO56BiwzzEMkBRpMwGsPkH9adhtCKFz/EL
	3m8eFGDfsam+IRO8naJvji/hUg==
X-Google-Smtp-Source: AGHT+IEyfcxZXq2JD3kKUo5F/6BG1ZAgNVJbuPYFPpf0IaIJR+PXVWQoMudr1psd/L+lxT2RdDmeYw==
X-Received: by 2002:a2e:9919:0:b0:2bc:e46d:f4ca with SMTP id v25-20020a2e9919000000b002bce46df4camr1211139lji.46.1695800921549;
        Wed, 27 Sep 2023 00:48:41 -0700 (PDT)
Received: from [192.168.1.160] (host-87-4-82-94.retail.telecomitalia.it. [87.4.82.94])
        by smtp.gmail.com with ESMTPSA id v5-20020a1709064e8500b00993470682e5sm8792520eju.32.2023.09.27.00.48.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 00:48:40 -0700 (PDT)
Message-ID: <2d7eac30-480c-49a4-903c-d4f2b3cdfc8d@linaro.org>
Date: Wed, 27 Sep 2023 09:48:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/3] dt-bindings: pinctrl: Add support for Amlogic T7
 SoCs
Content-Language: en-US
To: Lucas Tanure <tanure@linux.com>, Huqiang Qin <huqiang.qin@amlogic.com>,
 linus.walleij@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, brgl@bgdev.pl, andy@kernel.org
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20230922094342.637251-1-huqiang.qin@amlogic.com>
 <20230922094342.637251-2-huqiang.qin@amlogic.com>
 <ff2c6d41-7c9a-4633-8343-eb94404de6e8@linux.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ff2c6d41-7c9a-4633-8343-eb94404de6e8@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_004848_846139_FCD8E284 
X-CRM114-Status: UNSURE (   7.68  )
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

On 27/09/2023 08:08, Lucas Tanure wrote:
> On 22-09-2023 10:43, Huqiang Qin wrote:
>> Add a new compatible name for Amlogic T7 pin controller, and add
>> a new dt-binding header file which document the detail pin names.
>>
>> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>
>> V1 -> V2: Rename amlogic-t7-gpio.h to amlogic,t7-periphs-pinctrl.h
>>            Corrected indentation format.
>> V2 -> V3: Updated subject.
>>
>>   .../pinctrl/amlogic,meson-pinctrl-a1.yaml     |   1 +
>>   .../gpio/amlogic,t7-periphs-pinctrl.h         | 179 ++++++++++++++++++

...

>> +#define GPIOH_0		148
>> +#define GPIOH_1		149
>> +#define GPIOH_2		150
>> +#define GPIOH_3		151
>> +#define GPIOH_4		152
>> +#define GPIOH_5		153
>> +#define GPIOH_6		154
>> +#define GPIOH_7		155
>> +
>> +#define GPIO_TEST_N	156
>> +
>> +#endif /* _DT_BINDINGS_AMLOGIC_T7_GPIO_H */
> Tested-by: Lucas Tanure <tanure@linux.com>

How can you test bindings?

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
