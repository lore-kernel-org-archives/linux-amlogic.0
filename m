Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03683C00140
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Aug 2022 06:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U3rYRr+JCEhdM6MmpUiq/Zz26aMHGeCeRcqumBDCUBs=; b=PJe+CiEmeAVPG/
	ike6mIk0Y3b5gdGW8zJaLx1oYUT511CqLHwvZw7KDoW0bqY4K8yf54LEeMyRgYgPzdZ71bQFLADRG
	nt9Q6BbN33SHHUEWX10i4hSON94t63LyKhmxmbEKwNLP+tkoPy9ZQfVBoejQYtJtsuFDCNaS0J7B6
	UftcKxzwNIChjQgD1DQxUlInMDgTYZHF3PL9VCZAtqsUmetil8EzPSLgPAXMdTXWx4E0VeH2OSEVT
	9X459dCrEAs80rwy9lTA9pkamjP6vewM262X4dhvHBvVLP1EGgtoo1EMtLMwC2qZ1eGZMhhpoHlPc
	LwG88+oQZRqpJtZNEvpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKw4p-00Bdyy-9a; Mon, 08 Aug 2022 06:17:23 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKw4l-00BdtR-UI
	for linux-amlogic@lists.infradead.org; Mon, 08 Aug 2022 06:17:21 +0000
Received: by mail-lf1-x12d.google.com with SMTP id v2so2582959lfi.6
        for <linux-amlogic@lists.infradead.org>; Sun, 07 Aug 2022 23:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=T8rNmdfGQpLyT9LR1PlSucPj1KAkeGsYwmxlQxDnSLI=;
        b=n81MxZvnNSuI3qedxwTMbxCFELlr2YlwnyP2qLYqK1c/SiDxMXsTtUG3FtobrlPbYP
         MqpGRBS7hjPRvy5ZbJcmxV3y+h4X55ggJZGQsx1ZzRI19tyuNRIp0m3YrIyb9gFIdECT
         OwpOT7oR+kzjXXn1347GjVpsS9NpKCCLugjrkK8VCkbryi/Vg+dAD9nFbYB4y3yXoNEx
         Xl0qk28VL2+ndU05Pa/NdmtNyu07O0NewSgFCMOQUvyH9vS1nvVj4LpzYKfnVqm2XQXB
         EMZ+3RO9+IUyO7wZvyLdupA2MsUVmfwlaNY1ipTkBVGTW/AO6rlODxdELiXJM/y/Eoem
         BhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=T8rNmdfGQpLyT9LR1PlSucPj1KAkeGsYwmxlQxDnSLI=;
        b=52O9NRVw24LqJkQEjCb26LOJLHjR2UdOqPWIHdVfWssYlomBDEQy2drZaVlQ8CrWl1
         tkfe8vLvlXtT+FmQWnHS+GTztujriAqrycEIFuDLEqNfYlMbWi/IsZnuHWmrz6nm7BmR
         aj4gK9WCl5RQrwWkmAy9dAVCjlI+WC+0WtNU6SmK/X5jVanvYYOh5ZXpqi5G1Wl3trg5
         FpQu12h+q845tEU9OzY2IuscCsTQxkpsaNBC8rL/D1WYA6kH0HerOd9Mor8Z2n8XB5sF
         y85FXuPhLqYSCUWBLIrDuX6lflizA2TOa3Wh2XVjGCYJz8cDRYbwISwXfCT2ub7P/uIV
         DIcg==
X-Gm-Message-State: ACgBeo2ISaYfzmhpA1XbJjekLWN0VtRxnCP81GV5+igZdxtGBuqRSUvb
	0bfcVXknCC0P6dF4Ih3adeuKwQ==
X-Google-Smtp-Source: AA6agR6wuDSwNpJO7sX9bE+MUbq7BFPZE72HpVs62s7NS6I5udUt1KcwXlyjOTAa/6+TRhKTd/fxMA==
X-Received: by 2002:ac2:43d4:0:b0:48a:f6bf:1185 with SMTP id u20-20020ac243d4000000b0048af6bf1185mr5938168lfl.197.1659939436119;
        Sun, 07 Aug 2022 23:17:16 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id f12-20020a056512360c00b0047f77eb8f0csm1310277lfs.36.2022.08.07.23.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Aug 2022 23:17:15 -0700 (PDT)
Message-ID: <fe04e8ab-f8de-2c03-17e8-8960e5b460af@linaro.org>
Date: Mon, 8 Aug 2022 09:17:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V3 5/6] arm64: dts: meson: add S4 Soc Peripheral clock
 controller in DT
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220805085716.5635-1-yu.tu@amlogic.com>
 <20220805085716.5635-6-yu.tu@amlogic.com>
 <60f30470-ca14-1e12-3ed2-7b34c7a93f8a@linaro.org>
 <759c681e-ec03-4230-b34e-0b2ee67ac870@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <759c681e-ec03-4230-b34e-0b2ee67ac870@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220807_231720_045535_09A16116 
X-CRM114-Status: UNSURE (   8.05  )
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

On 05/08/2022 11:36, Yu Tu wrote:
>>> @@ -100,6 +102,30 @@ clkc_pll: pll-clock-controller@8000 {
>>>   				#clock-cells = <1>;
>>>   			};
>>>   
>>> +			clkc_periphs: periphs-clock-controller {
>>
>> Node names should be generic, so "clock-controller"
>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>>
>> You miss here unit address. Test your DTS with dtbs check and with
>> regular compile with W=1.
> I will change to clkc_periphs: clock-controller@0 {.
> Is that okay?

I cut the context, so if "0" was the value in reg, then it is OK.

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
