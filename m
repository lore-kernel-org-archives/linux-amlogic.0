Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59239EB64DB
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Jun 2023 07:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amwmGfiS6OZiDRZtMgm7GtBnVZjSW/TF3Ra+3Qw+NSs=; b=Bd9bZVhRiDAoNBMWKyJ3Rj/LYA
	ZfCptv/PnHUaZYpdFprHouwKzvjOjPaVeTRv9AgT+v9o11AMNDCJr4nmi5Vop2SequYvxAOtirnnD
	9MrdK2lt0lHFJEtDvrq4QErJqK6ZS0MPEsx36NWsmZ6t9BdSyJ+6b9mzocM7t2TKA99GroDwMVsvp
	Gd5UYAgOUBZ8pCa819KQgZnSgGK0TuXg4zrh0Yx72WVb84X2NLqmzBRAr/uSLAI3fsDdfOftVkGc8
	LFFzsLcZdQnNH/GTcRK88gxd4wgInN86tAY9aHrNtH9KaLWIqoXtxB9ruMWTGeWEW+nUoGPBZ17FM
	xbNUUVlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBVzy-00AQiF-1s;
	Tue, 20 Jun 2023 07:41:58 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBVzw-00AQhU-2z
	for linux-amlogic@lists.infradead.org;
	Tue, 20 Jun 2023 07:41:58 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f8f3786f20so51247935e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 20 Jun 2023 00:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687246915; x=1689838915;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=24xEFzXasuSMDhm3QYCFsb56SV2SbSTBKcssry+4iMc=;
        b=kb2Ypew2JVaako1bcGbMeyMtw9rEyS3MjlXeVSa1rzdFaA0tb+zNuv3yd75CnSlrX0
         RAUeEPJs1Scs2WXVSqX+DVaMRlosLlmxMkjByobLz5vH4W41Lv6nSVNyRPV2FzKgi7kb
         jtFQ2dJZCwargVV9qCPGrfRj+WCrl6kEtaG1uofaTKh6fLvRPlbfq6e0DI6wdB1mvqe9
         2juetvnY3DQqslLlmyW+zWVyZu6A6zSb7gonuzRhRQEncpFCuLF4Meo3AdPgUjIMxcWx
         50ZoMlX/wMV2y8pFtlkYfzUmbHv8DU/pDX7iuy7XL8OGZZRKjlpznBN65wMseNwVVkbO
         +bcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687246915; x=1689838915;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24xEFzXasuSMDhm3QYCFsb56SV2SbSTBKcssry+4iMc=;
        b=ZXYwafQAvwYa2lI2m1zynEogQTBkEuYfh74X1V6jb8WVBmizb2Bd38D/Pwqo1B6EG3
         pSAwFyhIA3vbB1eOJKkoCoJUwGj3shcirC0qeACUKDAOcY8Xu/Ep6vEaycmJ3n8+5SGi
         5Cy6yKr5Mfq8Gcaeg3xGRQw+VlkDaM6X9iXH1UxnGfohxWL1n5tui4CpqVWMnN+wLAqk
         XTumPoBdzFtgySbXWzlNyE/LeSSmNLZEoa1e90IY/4LS7AXQ9pKX6CaU6qX4vohnZepl
         ZsFoUI52v5KkGh7UY/fHyPLvSve+NrplL43gyisP7Izy6xMsQVE8E/jSDO20fC4TG7iY
         u+rA==
X-Gm-Message-State: AC+VfDy1euuFYFJojh8/VE/htV6+MBf9pAVYS6/99bZ+zvM8wBh7twps
	cdoI+rs+OXANcrTapT+/nctSiQ==
X-Google-Smtp-Source: ACHHUZ6+HLWLmZt8VX1LnCyvr9HhxBusnuGgdSUtNZapl9clhiozcWy6ilLj2fVMlbDOsLulBpAENA==
X-Received: by 2002:a05:600c:ac5:b0:3f9:ac7:6ccd with SMTP id c5-20020a05600c0ac500b003f90ac76ccdmr7273784wmr.26.1687246915248;
        Tue, 20 Jun 2023 00:41:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:496f:4432:b5b2:1b3b? ([2a01:e0a:982:cbb0:496f:4432:b5b2:1b3b])
        by smtp.gmail.com with ESMTPSA id p8-20020adfe608000000b0030ae849c70csm1348077wrm.37.2023.06.20.00.41.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 00:41:54 -0700 (PDT)
Message-ID: <3d0d568f-8b94-9057-6acc-8e0ff773cf4c@linaro.org>
Date: Tue, 20 Jun 2023 09:41:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: Convert Amlogic
 Meson GPIO interrupt controller binding
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <e06e9f26-cf55-5596-c799-d698e9d7b409@gmail.com>
 <777cf5df-6358-fa46-66cd-153d29763f77@linaro.org>
 <a895bdba-a48e-17e9-043e-9b950bbc1a85@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <a895bdba-a48e-17e9-043e-9b950bbc1a85@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_004156_969417_F617BCDB 
X-CRM114-Status: GOOD (  13.86  )
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

On 20/06/2023 09:36, Krzysztof Kozlowski wrote:
> On 20/06/2023 09:33, Neil Armstrong wrote:
>> Hi,
>>
>> On 12/03/2023 22:29, Heiner Kallweit wrote:
>>> Convert Amlogic Meson GPIO interrupt controller binding to yaml.
>>>
>>> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>> ---
>>> - consider that more than one compatible may be set
>>> - remove bus part from example
>>> - remove minItem/maxItem properties for compatible
>>> - reduce compatible fallback complexity
>>> - add that 8 or 12 GIC interrupts can be used
>>> - fix typo
>>> ---
>>>    .../amlogic,meson-gpio-intc.txt               | 38 ----------
>>>    .../amlogic,meson-gpio-intc.yaml              | 72 +++++++++++++++++++
>>>    2 files changed, 72 insertions(+), 38 deletions(-)
>>>    delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
>>>    create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
>>
>> Gentle ping, this patch is fully reviewed and is lying on the list for the last 3 months.
> 
> Maybe just take it through your Amlogic SoC tree in such case? It's less
> preferred than subsystem, but still what matters is to get this merged.


Yep I'll send it via the amlogic tree this week if Marc or Thomas doesn't object,

Neil

 >
 > Best regards,
 > Krzysztof
 >

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
