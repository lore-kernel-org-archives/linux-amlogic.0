Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E37C19F2C
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Jul 2022 10:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rogngl1bJc/7y4WN/9kQbywOLHBwed4XvMtCS8O4qHs=; b=eoxgcd2V+LcyLj
	2OvwaQSCRWJ0QCahREybSJuc5MrMK2co6w6o0PgzOnFGcemJwRK0XfmMtc84KYGblliOdHtBhPuPT
	rJWANzPM9eJWVAbgSg2xqqDaP4UTFFoxMc8i6VsIKJg2C4gFiNIYCJ51arWSJ1zPs6fAy2ac7shhS
	36yUyOgPtVQ/kjoEnfKYEJXC3ANWpYEtwW6kFBCrbq0VicwiOD0cESIl47lFH+yDFCekuo9NOcwdW
	P0fkSCGFf3Lq7IeNXyT5OU24Cc8AZPEhJsaODLi1ppQANynVUUWVJ8F9cBw1eI2ynCy2B/Ws32Fow
	9zsERHnI0Yfo5WJTOMaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH0Sc-008FCc-Or; Thu, 28 Jul 2022 10:09:42 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH0SZ-008FAD-Md
	for linux-amlogic@lists.infradead.org; Thu, 28 Jul 2022 10:09:41 +0000
Received: by mail-lf1-x12d.google.com with SMTP id t1so2112054lft.8
        for <linux-amlogic@lists.infradead.org>; Thu, 28 Jul 2022 03:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=BUqatnFwzy7O1x1Y7oCnQMez3coEtfR7Z07+z2mqDIM=;
        b=E/+uSTOSDSMvIY911TS6NsLjCU2k5JY7OTPnQwHkFPfSSxSmQGgjn1sEpME7hms5ZR
         udL2kU6KX8ZxUX99L46psZjfg3TT5nvmXLXWfHc/d9bggduvWGgRDkWgumNGS/Zel5fu
         ZEqZRpZD4u5xuxoz/bZkGwJstGQrFfUmURRspcm4jdU8imSn92Rudp12WY0adZGvFzNE
         4eRsD29SasU+m/xUUqqfrrZRIiCJj/8fE/P3bZ4dgAfc+jVo/OhicYsvtKdLZas86Gcg
         zgnuxQQg71FxjYslCFtwEdvfHAtPgvytwVUXUgeMWsVTG0lwxUyOGrMutbMuFr9rlSuX
         /Hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BUqatnFwzy7O1x1Y7oCnQMez3coEtfR7Z07+z2mqDIM=;
        b=Dh6woFMh4xB0zEN0Jj0nGLou5LhnQAvo0g0qEJ9u8tLX4fLoJ1IJn5ArYr7zizU4bu
         ZP4OP0yN8fTPs1pHTBdUTuJ+9j7yXh0cD7CaidFY2igiIcd/hxKRX23ck2vwyNtWFphG
         aWDd6TN0J3s1sUrherDabn5Mq4rDBcmtrNRo0fbhDgvf2vJtX9zD7kV3M4jhyQCPV8Ms
         CPmizHvFEYCzpYzfyaJOWfQftaJ8B+0XbLcjkfhN235ldnKHTQ6tI+xiVkTeWQTHbPw4
         0qfeZUJZm1Zh2S2Xi8F2x2oVG0CBrGjFUJTrpBqG5HtczZMlRDxqGTVwKxXhdnweaurZ
         TzMA==
X-Gm-Message-State: AJIora87do5LavKKaVHDEM2CobQ7yr42XptB33DY/tk6hwplWkDIZY/+
	YeZUzwXJyFxkQPlNVo6GXwKVEA==
X-Google-Smtp-Source: AGRyM1vweiBCNpCytMP732q5tdxS2gLMfJ+RJ+bhKD3ocWCdE4ymh77QcXFo4IWFINCqGpkFYitrnw==
X-Received: by 2002:a05:6512:b21:b0:47f:752a:c140 with SMTP id w33-20020a0565120b2100b0047f752ac140mr9193515lfu.349.1659002977983;
        Thu, 28 Jul 2022 03:09:37 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id 10-20020ac25f0a000000b0048137a6486bsm125870lfq.228.2022.07.28.03.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 03:09:37 -0700 (PDT)
Message-ID: <39395257-703b-a5e9-17c3-80f79f67fdc7@linaro.org>
Date: Thu, 28 Jul 2022 12:09:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V2 1/3] dt-bindings: clk: meson: add S4 SoC clock
 controller bindings
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220728054202.6981-1-yu.tu@amlogic.com>
 <20220728054202.6981-2-yu.tu@amlogic.com>
 <82e3fd36-df96-a555-4cea-47fabd26502b@linaro.org>
 <74cd833a-4773-eeb0-80aa-75ea1cdc093e@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <74cd833a-4773-eeb0-80aa-75ea1cdc093e@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_030939_791651_F4972064 
X-CRM114-Status: GOOD (  11.62  )
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

On 28/07/2022 12:05, Yu Tu wrote:
> Hi Krzysztof,
> 	Thanks for your reply.
> 
> On 2022/7/28 16:41, Krzysztof Kozlowski wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On 28/07/2022 07:42, Yu Tu wrote:
>>> Add new clock controller compatible and dt-bindings header for the
>>> Everything-Else domain of the S4 SoC.
>>>
>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>
>>
>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index c1abc53f9e91..f872d0c0c253 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1775,6 +1775,7 @@ F:	Documentation/devicetree/bindings/clock/amlogic*
>>>   F:	drivers/clk/meson/
>>>   F:	include/dt-bindings/clock/gxbb*
>>>   F:	include/dt-bindings/clock/meson*
>>> +F:	include/dt-bindings/clock/s4-clkc.h
>>>   
>>>   ARM/Amlogic Meson SoC Crypto Drivers
>>>   M:	Corentin Labbe <clabbe@baylibre.com>
>>> diff --git a/include/dt-bindings/clock/s4-clkc.h b/include/dt-bindings/clock/s4-clkc.h
>>> new file mode 100644
>>> index 000000000000..b686c8877419
>>> --- /dev/null
>>> +++ b/include/dt-bindings/clock/s4-clkc.h
>>
>> Filename with vendor prefix, so:
>> amlogic,s4-clkc.h
> It's fine with me. It's mainly Jerome's opinion.

To clarify: I understand such naming might bring inconsistency, but we
want to bring some order in the bindings directories. They keep growing
and at some point the model names might start conflicting.


Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
