Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0219C7EE29
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jun 2023 09:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SWu3c1sSWG1CK7llykkJQltnm+V2Yllj4iujK6E8Weo=; b=jckKA9Er9h375y
	LkQu51DeY+qt+k8diN93we7OLj5PoV8gr/jUH4yWOnMvMl5p/6WuCUcSxK44UGbse5cFLRYaZBsZy
	kcVNk25SR5guQpoxwETPchJasaWuez3ijJwUgnNWnCZ6m7Iwg+MRgxEKJQ+4CTFJPA4u2HUjFy1Zq
	RdAxkPtoC4kd6bPazdgNDcGcSu/zizTcs+ZGl6+t6M3XplF9DuJUe6WKo7dyIt/nGtevugDpKdxHn
	8jqp3UV1PPtFH4NqlC1JtzEppBsMBq4KbU8U7T3zoOPbN9r2EUtI9uprsV3ZCYixIvnn6BafWgOIm
	300kyhHLchfXfD9n1MuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6p9d-005Am1-2b;
	Wed, 07 Jun 2023 09:08:33 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6p9b-005Aij-0y
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Jun 2023 09:08:32 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-978863fb00fso48594666b.3
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Jun 2023 02:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686128907; x=1688720907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f3HXgHwKsy4N8Tpc/elaxbaWilZIps/qalSkKTcZzsY=;
        b=aCFzWsjbotx8Jk1NBq55ns9s0MmDl9b2v4bYD4xHJkszGTRexRhviAIgbATMgEVgD7
         4a1SFUElAKadevTwEppruLY3b911melhqc/cQsRgL+Ol91FE3dFSu439SUYUk7OR1oc6
         3wZUwAHGXHhcIkRjoRMRsABX7UleO5CSR+x8SKjErK9XrRbuewQUE5NdlUBtnfe5Q/x3
         KWml/YgvGyodsBbQjwnHnxl1jplPjZuv73WBn8iZm5XefwBNNz9aaxdfliq0qyTEDCu3
         NzP7D3CeF5d9o3so+m4xPhAMPqD7dKalISMSJbMUaIBk7eZhz63+VefoT47u0bE2xS69
         uCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128907; x=1688720907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f3HXgHwKsy4N8Tpc/elaxbaWilZIps/qalSkKTcZzsY=;
        b=KOVupRJdWaowsnXQdxGFB1yoh6CNXxq4dn6Lhoz6VEfHCedMuorkxFQmTc0I2iRf8A
         /SsKVEajzCRf5S+pO0WUc6QF+EIYZZpCu1Ie2cvwB1TNpvb0zpfMkuj6J/p6vnc9b8ZV
         kRoBkMCLcMrxhgSnn7+QwBAbAX1Wgit+sF4swq/ezQdYtCHznSp2gUvBXzHgXVF5EENG
         9gUdnqzICFeJDfdFdVvzUgb2APh/QS/wFWNC2bjd1a+7IgUMO0efr9J7ctCtKPDs+iMu
         kILIRSMTTMVJgFTHYOQ9fBp8aI+QHwMhATPN9PWLw7fu/VCLeeEig8jbZRPWv4LdT+aB
         Ryaw==
X-Gm-Message-State: AC+VfDwLVGWF1/v5caom8FbU0T6VVgvjpmErNoRBK4IFC4M7MfjX7Wao
	KdL8uxTMt2kFVwygyWYCitGslA==
X-Google-Smtp-Source: ACHHUZ7ZyCS7a5sq4Nvpos2aBqlX93n3jTFDSFT1X51+drYZhfsW7cljvrgMH3xlBTAEOEDdL2/cIw==
X-Received: by 2002:a17:907:a42c:b0:974:1c90:2205 with SMTP id sg44-20020a170907a42c00b009741c902205mr5228122ejc.13.1686128907425;
        Wed, 07 Jun 2023 02:08:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u21-20020aa7d995000000b00514a3c04646sm5990934eds.73.2023.06.07.02.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 02:08:27 -0700 (PDT)
Message-ID: <2ca6e619-1d57-8fff-6176-9ee890e0d167@linaro.org>
Date: Wed, 7 Jun 2023 11:08:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v1] dt-bindings: nand: meson: Fix 'nand-rb' property
Content-Language: en-US
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 oxffffaa@gmail.com, kernel@sberdevices.ru, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230606193507.35024-1-AVKrasnov@sberdevices.ru>
 <20230607095802.3adcd4f9@xps-13>
 <166bdc27-f77c-9076-f866-180cfa5bff76@sberdevices.ru>
 <08da4e86-433a-7d2e-25ff-ffa24221abdf@linaro.org>
 <835a3587-1e0f-64d7-1d1a-b639ae8b7307@sberdevices.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <835a3587-1e0f-64d7-1d1a-b639ae8b7307@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_020831_346512_A458F1CB 
X-CRM114-Status: GOOD (  12.89  )
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

On 07/06/2023 10:57, Arseniy Krasnov wrote:
> 
> 
> On 07.06.2023 11:53, Krzysztof Kozlowski wrote:
>> On 07/06/2023 10:40, Arseniy Krasnov wrote:
>>> Hello Miquel, 
>>>
>>> On 07.06.2023 10:58, Miquel Raynal wrote:
>>>
>>>> Hi Arseniy,
>>>>
>>>> AVKrasnov@sberdevices.ru wrote on Tue, 6 Jun 2023 22:35:07 +0300:
>>>>
>>>>> Add description of 'nand-rb' property. Use "Fixes" because this property
>>>>> must be supported since the beginning. For this controller 'nand-rb' is
>>>>> stored in the controller node (not in chip), because it has only single
>>>>> r/b wire for all chips.
>>>>
>>>> Sorry if I mislead you in the first place, but you could definitely
>>>> have two chips and only one with RB wired. It needs to be defined in
>>>> the chips.
>>>
>>> Ok, so to clarify: is it ok, that in bindings this property will be placed in the
>>> chip, but in driver, i'm trying to read it from the controller node (thus  in
>>> dts file it will be also in controller node)?
>>
>> No, because how would your DTS pass validation? I understand you did not
>> test the bindings, but this will improve, right?
> 
> Ok, i'll follow DTS layout in the driver, "test the bindings" You mean "make dt_binding_check"?

Yes. They were sent without testing.

But please also test your DTS with dtbs_check.


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
