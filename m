Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D959C88E5C
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2026 12:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ym2Omu4Ba83jaD98JVVTBHqrmdBTHyB8RIgk5iNmoo8=; b=M5lk0RclqR/+9a
	s6uaBxat1q65IWlWEfim7Z0NwSgWo6nkfGdDqG2zO6Y8R255MMFjSUaJEfi/zxsHggngSsSl/PqfK
	fzRLEiO16Ph5GNgWtoFKtRHJwBg4nx5zypxN++Xl5bf5jzWai8U8g64us1yBYp3F68XxkZJq5O1OQ
	F8eBlbw3OeRkMAa5SXQkEdYnZN5vrX6Y/acB/j+CNIudULp+8vbD27DHXKRACN+I8ZvQVPnB0gbcM
	Q6rRhGsYE+WX8dG+h+xA9W+dNO7PblfZcMTDyiQUQwPv2ILzXyzrsed4HyRSodIoSEIpB2AHYBnfA
	tWNrxTZCTaOFOLvDDWMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pCP-00000009DhY-11oA;
	Wed, 16 Sep 2026 12:57:17 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pCM-00000009DgE-1QLP
	for linux-amlogic@lists.infradead.org;
	Wed, 16 Sep 2026 12:57:16 +0000
Message-ID: <28052bf6-1a8a-42e9-86c7-cfb89d663a06@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1789563426;
	bh=SsctNH5FmqemHATJAMbpcX9sz+jJtOnczWLqKjqnwQ8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=sOFMQxfrqZCMmKHyB1FwqzOMR9479k/3p9m2Y56tUSKt5UItQWQP8RH/hV+0BdkAa
	 Un8y+T0KuN1LtANnhkKEEqF31aBn/A0XbNGqsqDZjyXW/LHRBrotqlXr8zz1gzkKkQ
	 fIfw9LQ4sngGhQD0LkajpBcw4ZN8gnSWsfxJzEhI=
Date: Wed, 16 Sep 2026 14:55:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v11 1/6] mfd: khadas-mcu: Add per-variant configuration
 infrastructure and VIM4 support
To: Lee Jones <lee@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org,
 conor+dt@kernel.org
References: <20260902-add-mcu-fan-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr>
 <20260902-add-mcu-fan-khadas-vim4-v11-1-5f1610d83bf0@aliel.fr>
 <20260902130216.55BC21F00A3A@smtp.kernel.org>
 <20260910141629.GE1051768@google.com>
Content-Language: en-US
In-Reply-To: <20260910141629.GE1051768@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_055714_947686_904ED68D 
X-CRM114-Status: GOOD (  12.77  )
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

On 9/10/26 4:16 PM, Lee Jones wrote:
> On Wed, 02 Sep 2026, sashiko-bot@kernel.org wrote:
> 
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Low] Parent MFD driver introduces child-specific private resources (fan configuration) via a platform data struct in a global MFD header, violating MFD separation and coupling principles.
>> --
>>
>> commit 85d716a1f91fa9e8e2f48479df8c7b07e0cf0279
>> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>
>> mfd: khadas-mcu: Add per-variant configuration infrastructure and VIM4 support
>>
>> This commit introduces per-variant configuration structures for the KHADAS MCU
>> driver, adding support for VIM4 specific registers. It also introduces an enum
>> for variant matching and a fan platform data struct to pass fan configuration
>> to a sub-driver.
>>
>>> diff --git a/include/linux/mfd/khadas-mcu.h b/include/linux/mfd/khadas-mcu.h
>>> index a99ba2ed0e4e0..7a9980ea63e7e 100644
>>> --- a/include/linux/mfd/khadas-mcu.h
>>> +++ b/include/linux/mfd/khadas-mcu.h
>>
>> [ ... ]
>>
>>> @@ -88,4 +95,21 @@ struct khadas_mcu {
>>>  	struct regmap *regmap;
>>>  };
>>>  
>>> +/**
>>> + * struct khadas_mcu_fan_pdata - fan sub-driver configuration
>>> + * @fan_reg: register address to write the fan level
>>> + * @levels: table mapping logical cooling-device states to raw fan levels
>>> + * @nlevels: number of entries in @levels
>>> + */
>>> +struct khadas_mcu_fan_pdata {
>>> +	unsigned int fan_reg;
>>> +	const unsigned int *levels;
>>> +	unsigned int nlevels;
>>> +};
>>
>> [Severity: Low]
>> Does this struct introduce child-specific private configuration into the core
>> MFD driver?
>>
>> By defining khadas_mcu_fan_pdata to pass thermal cooling state levels, it
>> appears the parent MFD driver will be forced to handle configurations specific
>> to a single sub-driver. The MFD subsystem principles indicate that the core
>> driver should only handle shared core resources, while child drivers should
>> manage their own private configurations.
>>
>> Could this approach create tight coupling where any new fan variant requires
>> changes to the core MFD driver, rather than keeping those details contained
>> within the thermal driver?
> 
> Agreed.  Why can this not live in the fan driver?
> 

Thank you for the feedback, I will send a new proposal without this.

-- 
Best regards,
Ronald

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
