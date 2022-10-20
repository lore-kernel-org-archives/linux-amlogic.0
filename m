Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625E2C433FE
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Oct 2022 12:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3eREAcV0qMvIsOjgcys9UAudXYFpFENKxYH8FxJZhzA=; b=hcB22bKBPTp5qU
	mAoppe6spwBemkAaH4DsKvoaomUmCtip0kZtYbL/7R9GiNZ1n4N1e8yqK7TuDczgfr9TfH8auuRxi
	kOUUQ7kR4O0rNhL5SJvv9bG8yfSxoNlKouKGzKCath9b32CW6X+vlbzQmYRwExl7RFecujaqBWvuo
	T6hofXYpjDk3IIavcjbN1rOf72P14yO3CcmlsUyfPF9HvPpL4eWlr7TK0v3Q6d8dKWKyC6bsO16lL
	cPMmuaJwsIW2XF456gPh5CGJrC/YwTnDMMM7yOxRXQzMz/a42WqSjZ/ydngC2x6OD9ijFxzG01TN/
	6ziw1rPXlOWebuYYOf5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olV97-00FAQC-Fr; Thu, 20 Oct 2022 12:59:37 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olUzA-00F1nR-Lg
	for linux-amlogic@lists.infradead.org; Thu, 20 Oct 2022 12:49:22 +0000
Received: by mail-qt1-x835.google.com with SMTP id cr19so10307588qtb.0
        for <linux-amlogic@lists.infradead.org>; Thu, 20 Oct 2022 05:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7zzLiSLuWDpRehAEZWWY+YVaKXFqQFcIBPnNnew2YXA=;
        b=PdZuxs6MjlDnlNzQz5OvgwlDa4ipQHz3SJcbSHa8GGxbWqYSCrOhrIpgIRmL0bbZyh
         cQ/sT3Wlegy+jRZn9G1hxurXh/athUMdenfE1TvCD29eTKmi6c8pjsNRtPhrotLNmDyI
         Ogiai7InvvtM1nydktd0c3f6udis80eG18SRwTqONqnpXIzVkCOtQd7VCOHq6vwPnThU
         L6zklbV08bsN+NZcOAe15qsbT0g24eNmyKRzjz5G3amKpMkDrQGfNK8lySHp4iVl+7p0
         BuAzVzXn8CEI4UPcx8eE6mZfJ4AZlZXZpqiyZYQ78xKYVX0Mfu3M7j6TgM4q4Cqf9M92
         3+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7zzLiSLuWDpRehAEZWWY+YVaKXFqQFcIBPnNnew2YXA=;
        b=lS2nHuTq3xSeYzoiWhqXQCLlTiBzNDl9HVN3qhvYM5SNW/gGolY6BYB9t7Uk512Qws
         lZyuIZ+9fjbQDqgGEGYEvcjxTWRj/h0AIeMfUwWbHAse2Yk+mRmySBd/g8ErcHRK5aU1
         QdGHwGtKiAL9KZVC1O2px/QokikdmXjrR02LJFNk9oL7Ui3nzqGvU3UOHJVttTK4P2nG
         kCejHOsyE5R3eEIRZZCIcJQE4QipELxpR0bfH5NNQHQfLJhCOWy1ffpbMtZp8W9/GzYC
         sEDYOfDmzN/GdDOrn2Yjhciym4ikYqp00y02AHCyyRdavIIEWHNi4bwp18+QkEW52m86
         PteA==
X-Gm-Message-State: ACrzQf1vxDOFkBHVfvN5O1hNYMRURASVDaQbWdSy5bj7Jo5LQomd+xxT
	XJqGhzOILk1Br2sjeHbcjHtKNA==
X-Google-Smtp-Source: AMsMyM4t+vrwAcBb+25n+go7JZPtlChxYQtXIsomDdytCwaeNLSbAoJXk3x6Ke4EBw9HmsWcmg8Jnw==
X-Received: by 2002:ac8:5a42:0:b0:39d:136e:8a43 with SMTP id o2-20020ac85a42000000b0039d136e8a43mr1118096qta.372.1666270158481;
        Thu, 20 Oct 2022 05:49:18 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id u7-20020a05620a430700b006cf8fc6e922sm7133652qko.119.2022.10.20.05.49.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Oct 2022 05:49:17 -0700 (PDT)
Message-ID: <20c115e0-0acf-dac2-2a30-0f394fa513ab@linaro.org>
Date: Thu, 20 Oct 2022 08:49:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 1/2] spi: dt-bindings: amlogic, meson-gx-spicc: Add
 pinctrl names for SPI signal states
Content-Language: en-US
To: neil.armstrong@linaro.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: Da Xue <da@libre.computer>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221004-up-aml-fix-spi-v3-0-89de126fd163@baylibre.com>
 <20221004-up-aml-fix-spi-v3-1-89de126fd163@baylibre.com>
 <d355ee40-5905-4d10-8300-81e9a63117ee@linaro.org>
 <dc918114-8b89-441b-5ba1-aaf3ae084860@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <dc918114-8b89-441b-5ba1-aaf3ae084860@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_054920_779953_03D1AE8E 
X-CRM114-Status: UNSURE (   9.13  )
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

>>> +      properties:
>>> +        pinctrl-names:
>>> +          minItems: 1
>>> +          items:
>>> +            - const: default
>>> +            - const: idle-high
>>> +            - const: idle-low
>>
>> You should also define in such case pinctrl-0 and others.
> 
> Ok I thought it would be covered by the pinctrl-consumer.yaml
> but yeah we should allow pinctrl-1 and pinctrl-2 here aswell by adding:
> 
>              pinctrl-1: true
>              pinctrl-2: true
> 
>

Yes.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
