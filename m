Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D55C43334
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 06:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MQCKecjrr1Qr6acsN+SZXP9b8GspwAoSHehRet1ClOU=; b=0hr6C/Lf/Ism59
	epNiivP7HorWJD5jdnAQUs5MDK2sIY2d7k/TU6PWCLm0rayasJ/96X5leYqNTvXodczQLU1yvZDej
	5BnvE8s+7HC9BXaEgDI6Harl9bFNt9NVBtwsEbQk4JcK33ipR7ErOWuwUhaCF6oYUcmxpkFeSDmUw
	AlgJ6UB2M41C5l2CYougTUN2ofqxMwJlo9g6IHf++i8mZWe1uLyVU3urARGLhOlseawgD1e1WgYKx
	/HqlvrjTL7tXfhQx6yYt2i69hRGSqSvHeeaLBJX/LCguRBavndEMUaV9hW1n1kA6ltiSNHNnxp1dS
	1On6SV45pNQzblv43iqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGENB-0091V7-34; Tue, 26 Jul 2022 06:48:53 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGEN7-0091SF-QY
	for linux-amlogic@lists.infradead.org; Tue, 26 Jul 2022 06:48:51 +0000
Received: by mail-lj1-x22c.google.com with SMTP id p21so7840942ljh.12
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Jul 2022 23:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YQAX1nHFxjgbPeWSF5HcitnTzR9QJkqmNB7ys8ahImk=;
        b=ZAQg6RBStU2emVYsrxY8SB+/iLgCdCdZppEZKCGHFcxK1B9TaEM9cGtzToIUJzmgXG
         jqm/pS2AIkbr70qUJtwGqOycsbSyLmGMZY+zpkotF+FSw7GmcqhIlrfofQbcVnVymSC2
         VxPFBg5JwJLNJPPdmylHpHT5vH1SmKsSeRH4VVcDs3MgrK6+AiyfC+cshQ1DMC047/KL
         MxbyGITrMZKRQvZLik7XvFGdoIpR/EvPBnugXEnea3HwkOBart/qpUagxM2BkKb0Yn07
         HWxYBXCu009+/uaz2rvV3j3DzLfHgHtLJhAevpB6t9ZgL+0+uNTQ8QuAkdE2e6zQXJLe
         iw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YQAX1nHFxjgbPeWSF5HcitnTzR9QJkqmNB7ys8ahImk=;
        b=dEuLUHIOGFogxQzjJFt+kwI/H+DifkPtFOpAsPw4IKHby8/P5hNxfHFRlH0vzQ5lpx
         6RcBAlmShBhy/7gsVglppTh9/oaDOo/Zl+iVw1OXzyRpLS9A1WbgtRSjy7oB7h3HGSbW
         CDei4rzGT2EUy0VzDyP2QL9j3r9pePCw9HIZWuiLwt/X3h4Htl7j9E8NS6FO6ZKf9AXO
         v08CIj/oCVPaanmS0xR94Zac1lKXHjPfgfjuTv0DzGtxR+YRJyAftz+nOgndmeB6khvZ
         IUNWGZt4T4nNPFlQU6cJ1b9vLVn9QVoPbBISYTW3X8GCu+3V5pLR+L/6J6T4Z7cdq0Wu
         7Q8g==
X-Gm-Message-State: AJIora+9YhcYokWqHnwcoZyntCrim1mp3QZSLtEl7dDPeu4fqDs+Wphx
	QDsJvOCR+hor6ir6QwiniThOOA==
X-Google-Smtp-Source: AGRyM1v50oF7j0YPM0N9tEZsNCmSS9smoq4lDxi2jLcRE6+q/pABRsU6NY2KTXRoxfo1f4c5dXAvnA==
X-Received: by 2002:a2e:b947:0:b0:25d:d6f6:adaf with SMTP id 7-20020a2eb947000000b0025dd6f6adafmr5720547ljs.230.1658818127437;
        Mon, 25 Jul 2022 23:48:47 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id j7-20020a2e6e07000000b0025d53e34fe7sm3136020ljc.56.2022.07.25.23.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 23:48:46 -0700 (PDT)
Message-ID: <62334f55-df8a-936a-ec88-2db469aede21@linaro.org>
Date: Tue, 26 Jul 2022 08:48:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [v5 4/4] arm64: dts: meson: Add MagicBox M16S support
Content-Language: en-US
To: Zhang Ning <zhangn1985@qq.com>
Cc: martin.blumenstingl@googlemail.com, narmstrong@baylibre.com,
 linux-amlogic@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sean@mess.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
References: <20220724231704.132472-1-zhangn1985@qq.com>
 <tencent_9D885D188E51B537DB904A774CEC35E4180A@qq.com>
 <677c9314-593e-3512-539a-fd74f634c470@linaro.org>
 <tencent_1B5B069917D86370ED4136BDD2C413240D08@qq.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <tencent_1B5B069917D86370ED4136BDD2C413240D08@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_234849_911833_4A941FF9 
X-CRM114-Status: UNSURE (   8.07  )
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

On 26/07/2022 02:04, Zhang Ning wrote:

>>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
>>> @@ -0,0 +1,40 @@
>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>> +/*
>>> + * Copyright (c) 2022 Zhang Ning <zhangn1985@qq.com>
>>> + */
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include "meson-gxm.dtsi"
>>> +#include "meson-gx-p23x-q20x.dtsi"
>>> +#include <dt-bindings/input/input.h>
>>> +
>>> +/ {
>>> +	compatible = "magicbox,m16s", "amlogic,s912", "amlogic,meson-gxm";
>>> +	model = "MagicBox M16S";
>>> +
>>> +	gpio-keys-polled {
>>
>> Just gpio-keys (or even "keys").
> I see all dts for amlogic platform are using gpio-keys-polled, could I
> keep current name?

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
