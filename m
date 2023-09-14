Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD00EDE988
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Sep 2023 07:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=12aQaGxBivT3Pn4BmF2VCrikoeZbVsLcJPG4vX87kws=; b=OWCBsqoZdGDap7
	0aWSRNKiHbazRcPJ3ASmGFCY5KpWpPepEz6lF9BRCQ4pDRZ/Qi8WuZqThqq7l6YMHp6g2pNLcQG+I
	UPzdaZFZbvlCUszTi4VJChIpcIcwfrAwJ48BGR2DtosTAmCm2vbK02ZoYlqC1CAvhnJXoXQ6u2ogd
	Z7K0P9bzhkxU/9Y2VfZF+WZ21rPvvRFyhv/3ZeqbT2h6GzE9LsaHKRvklhaaHRCvcbcPFUxJfvWfQ
	PUpiYonDjVn0UAOU4dkhoXdQcK6ekvko3WWDVs0JLD0P7o5A1xYHUO+G7FYq4l7VXQFLC/rb2ZqPd
	/gBvydfO+bHjC1fWQX9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qggdV-007apT-0R;
	Thu, 14 Sep 2023 07:19:37 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qggdS-007aon-0z
	for linux-amlogic@lists.infradead.org;
	Thu, 14 Sep 2023 07:19:35 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31aeef88a55so507537f8f.2
        for <linux-amlogic@lists.infradead.org>; Thu, 14 Sep 2023 00:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694675972; x=1695280772; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EuhVNGrFW68jxe2JJJtLZHWfPCfJOHNfdRCfgAWkxb8=;
        b=UoXtAT/YGNLVJSTasaqhrl5RuyrTDLg0lE9BKh7Jn161KejaN5amqvCBBG7Vl8ZX05
         h4qVJglQGFHKAic+wJX8wbv4LUddpwEACVHTicmODhS6uv7INr3fALW9dB61A7IwO0jy
         S58F4X3nWamCknq+TCJIGuwvQTFJExTKCPZcXnnFhhQnfXr63GZj/wi2RNKdUY6jPB1w
         HVBsJlPEqsK8UqmYIffkS8sFcxwp9jVyUznR2FwDUTRi3YL8Cjnfq43rN6lPNp0/6+Ra
         6x0TqjTsJ30U4goDDai3f0fszbce4c5ppOWWO0EPSeJUau6u3563C+EQTgfPlEUJkvVA
         6HfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694675972; x=1695280772;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EuhVNGrFW68jxe2JJJtLZHWfPCfJOHNfdRCfgAWkxb8=;
        b=AsHQ/jMi3DQAkI52h0G6hqG4rRX5ML1drRIz2+4opG3BRSbuqsDvYyWcYB5Rc9LMia
         aPTQgTB2o29FlM96fkDa7+HIR+TC2ZG9aFcBdGNA1904Z9c8ggto0TmrRmCu2hJ5L8yf
         S3vGZF8x3i8bJGPDdle5Q3oHCVdJ2teEZKNCrNR4uQaw3ZObZQbxXZWA2lkMj6eT8R7P
         N7zqDcFGvlQk1TVS80J0x5YF/PjsNM52ATjEYcL/mr31+/6v3nUVQwxnVJ7adm55W8Dc
         pYo9dk+ynEsaaujbuJ1BvgJ2MvPFmEXXHUl9jCUHNHv8mE3YTojf/Pe6k0ZxLzcYWg1M
         2XrQ==
X-Gm-Message-State: AOJu0YynImjOZQfNNOxHyLwCaanvO+ZOCg9I0DPmUmEnvwa9EroA4h45
	9LR55wMQYKEFKwI7Tjy3w4aotg==
X-Google-Smtp-Source: AGHT+IH3nxwuXTTFge+SiA2fbG0x1vjEZPiN16+NTWzo1snCwvJ/WSzxrpwYFfBLDjDyKeinWZOfNA==
X-Received: by 2002:a5d:4944:0:b0:31a:d6cb:7f9d with SMTP id r4-20020a5d4944000000b0031ad6cb7f9dmr4216926wrs.24.1694675972548;
        Thu, 14 Sep 2023 00:19:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d484b000000b00317ddccb0d1sm935246wrs.24.2023.09.14.00.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 00:19:32 -0700 (PDT)
Message-ID: <ff4f2b93-7e22-8b15-aaad-b7d6f8b5517d@linaro.org>
Date: Thu, 14 Sep 2023 09:19:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add compatibles for Amlogic T7
 SoCs
Content-Language: en-US
To: Huqiang Qin <huqiang.qin@amlogic.com>, linus.walleij@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, brgl@bgdev.pl, andy@kernel.org
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230914054525.1180595-1-huqiang.qin@amlogic.com>
 <20230914054525.1180595-2-huqiang.qin@amlogic.com>
 <45637012-0972-fc7b-1276-163da363b962@linaro.org>
 <cde944c4-acfe-b3fb-32b8-072740475e35@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <cde944c4-acfe-b3fb-32b8-072740475e35@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_001934_345521_363CC699 
X-CRM114-Status: GOOD (  12.30  )
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

On 14/09/2023 09:00, Huqiang Qin wrote:
> Hi Krzysztof,
> 
> On 2023/9/14 14:16, Krzysztof Kozlowski wrote:
> ...
>>> diff --git a/include/dt-bindings/gpio/amlogic-t7-gpio.h b/include/dt-bindings/gpio/amlogic-t7-gpio.h
>>> new file mode 100644
>>> index 000000000000..2bab9a99501a
>>> --- /dev/null
>>> +++ b/include/dt-bindings/gpio/amlogic-t7-gpio.h
>>
>> Use compatible syntax.
> 
> The amlogic-t7-gpio.h is not a file in the dt-bindings/pinctrl/ directory.
> Does it also need to be named according to the compatible name of pinctrl?

The convention, which we introduced since ~1-2 years, is to use the
device compatible or binding filename as the headers filename. Now,
where you put what does not affect it.



Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
