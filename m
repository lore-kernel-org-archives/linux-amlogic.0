Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019DDC04A68
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Jul 2022 07:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qT43M3SYdrnUzkUFw5rUAhBAi8x2Md8/yF1lqe4Dd+M=; b=q0CJAbUSdGlg8K
	9Xhqlhjr1DDSkV55RUBE3BmcfJNh3q4Ln//88+91y2lCxbZjz5fkEYLpp1oXa+UsdeuvhCZikpulk
	Edc098JfSm0EBhsQduST3UfC9OxLN27vAH0qQOcN1PDFEhWxqpQ5bzbJh/KxkT7UD78xR+DQt0Eku
	BDwZdK5EBKDWtnvsMp49U+ha3Qx+0lvOH8oSKy33EvjrUEL5/Eul1o5AhCmijx4kMESywEOSCDKAO
	qpWXcDMyLr7rm7p45FWh7eg1KMv/mhSuQ5fznxlmKlvTTcfwksWxpEPPMUuapx0KPMw0lVkRwsZ6Q
	nYCnlFneZPE7nFZ7uLfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGxWC-005H3i-Tq; Thu, 28 Jul 2022 07:01:12 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGxW9-005H1R-4K
	for linux-amlogic@lists.infradead.org; Thu, 28 Jul 2022 07:01:10 +0000
Received: by mail-lj1-x22c.google.com with SMTP id m9so965600ljp.9
        for <linux-amlogic@lists.infradead.org>; Thu, 28 Jul 2022 00:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=nRhU8Xmo8NVx+3hPXhYpUbAwbYIpncAqKvgE1eanWM4=;
        b=Dw02yJpYL/KXSjq0VXkvvmLYDISAKKmLsOkwCxlia2u47URBEuv2/gJF0Epdd3B1LF
         m4Qcw7u/Ts6pp5tKpNC2+GnNveS8BcgpbEa2+MrBArNsmHF5utlF7aBPBjt14ujaO6+l
         XTMwYFByECCRfK2qs2bc6/gCS+3nFCEaDixtd1QWtMPJBvQiYsgZbAAVTIauXeUFLHra
         p3Btvbo+W8ykXDLznW3Po8AGs/sVunLSsYy5QRdxNzUeUiI/nsT7xodaJ+quAqE6TuVo
         IbTbnYsl2ZJOv6eEpbB7BPa00HYp8RmkpmCDAtFrgwVOInWXZu/YgQKnYA7/QzoQHWZ0
         Ax8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nRhU8Xmo8NVx+3hPXhYpUbAwbYIpncAqKvgE1eanWM4=;
        b=59z6KlTnIaRsrGYV1LUIBx9n5MN5zPc8jfUKkWfIpEjCvQMoUJnXzHzMRwdYwzb77A
         Sl5LJMol2ypNMNl/u42hhekheXBhl2CYJAsZnSYAkSphWP3Wlaalv9RLfUs9D3JkSWXK
         6y1O0mPI/odkZJgeQwADKQfqWaBrWb2jA3OxyKcqG7/LWNSuHwmiyg6npxCWolwvB0Cp
         wCuuogJmqpIuq8OIpP0UNwrGEPhtDfcu/Otu6P+37GKW/duOsQfLP2HZUBZnKAqfH60n
         mRf2tG2d6fu986pajAVZfBagFJVdf+goCAA8Q+KGqdORGftlGml4fhoJaC8BzGP9L1wZ
         /4iQ==
X-Gm-Message-State: AJIora9ex40PbF2vcbzEPQsnBaN4YGOTlV3dFU/u204+0kkAtanBkDEv
	t2ZkPr1n5CSRUUdKqO4qM/uysQ==
X-Google-Smtp-Source: AGRyM1vvAFefN8UxewXLvqrhGbBM4U+BhOGlbN6KRptT19q7Jk5gCZOufq2rYPIc2TkOPf+3bA4m+g==
X-Received: by 2002:a05:651c:b23:b0:25e:e2d:9e40 with SMTP id b35-20020a05651c0b2300b0025e0e2d9e40mr5406364ljr.38.1658991662420;
        Thu, 28 Jul 2022 00:01:02 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id r11-20020a2e8e2b000000b0025a70f7ea3asm4390878ljk.138.2022.07.28.00.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 00:01:01 -0700 (PDT)
Message-ID: <91e966c9-b398-1a3a-e4be-8e4e3a0f8d89@linaro.org>
Date: Thu, 28 Jul 2022 09:01:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [v7 3/4] dt-bindings: arm: amlogic: add MagicBox M16S bindings
Content-Language: en-US
To: Zhang Ning <zhangn1985@qq.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 narmstrong@baylibre.com, martin.blumenstingl@googlemail.com, sean@mess.org,
 christianshewitt@gmail.com, linux-amlogic@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20220726143649.142574-1-zhangn1985@qq.com>
 <tencent_A962A641C180EEC2680CA53DDD6643BA6E05@qq.com>
 <b094bf45-ad7e-9e42-89a6-bae0b8e4aae1@linaro.org>
 <tencent_F809BC863B83870BBEB1EF76499B3969B607@qq.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <tencent_F809BC863B83870BBEB1EF76499B3969B607@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_000109_410113_C02DF56D 
X-CRM114-Status: UNSURE (   9.44  )
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

On 28/07/2022 01:48, Zhang Ning wrote:
> On Wed, Jul 27, 2022 at 05:27:25PM +0200, Krzysztof Kozlowski wrote:
>> On 26/07/2022 16:36, Zhang Ning wrote:
>>> Add manufactor bindings for Tmall
>>> Add the board bindings for Magicbox M16S Tv Box
>>>
>>> Signed-off-by: Zhang Ning <zhangn1985@qq.com>
>>
>> Please send patches with correct subject PATCH.
> I got confused, and don't know how to update..
> 
> ad152daedc5c dt-bindings: arm: amlogic: add MagicBox M16S bindings
> 3f7dbd336f36 dt-bindings: arm: amlogic: add Vero 4K+ bindings
> 2ca889b12016 dt-bindings: arm: amlogic: add H96-Max bindings

git format-patch -v8

> 
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Christian Hewitt told me to split to 2 patches, 1st for manufactor, 2nd
> for device, how to handle your Acked-by?
>
If split is the only change, you can add ti both of them


Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
