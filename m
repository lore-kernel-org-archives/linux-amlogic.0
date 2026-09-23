Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476DDC9830B
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2026 12:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7mqhl2yjnEGKmovAPVhOaz6vo876r3yFlPz0x2GCyO4=; b=m/tPXSUoG8zDot
	X98mVn/r2x+LugM32B4EG72+sxOdZQisQTZhrwvuanc7zGlnYp3l3W5TEOxmdtFQRuZIGMt52MHnC
	Ai629ZF+/9chWZ/n7nIWBhrC/l2VZ8x8xOHHORWYSEwV6D90UpL+KYXP5oRAr3wmXm4qcljBS4wD+
	FdKaMvkjiK4uuN+COekAR5qs9va6QIFackft71a72u3jMncoqC0UGk2JPj1ZTXABRyyT51h3EMkh9
	mfcPAZBb7nJyQ5uDuIzlS/DFu9VnE7mGdIki7apu8gHZalVQYFJvQDXeV70e03hlzA1931Ho9dlAQ
	9cZWkIi/3WizGwNBHSiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lw3-00000008E3O-24CV;
	Wed, 23 Sep 2026 12:18:51 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lvx-00000008E05-1oyV
	for linux-amlogic@lists.infradead.org;
	Wed, 23 Sep 2026 12:18:49 +0000
Message-ID: <3930d120-c412-4c04-afb0-3aee0f162d13@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1790165916;
	bh=71Nr0txiRyDXQQjTVLnQKIL8h5ohanJ0ghTsopnMfII=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=gHNWPBKu5gDiNCJyxS9Ae9UoXA6ZoZFyw/XuUZEHJUth9KeoCscWlIQL5k43kjilW
	 voLUoMYvMswZk2mx/6pvMxW0uOtw9I8SuYlIj7u5rwM9Wvzcv5t0VV4YyIeTc+w+HA
	 8piqH0/iNEbnle+NyMkw8VDYzf9oni4a0ax944KY=
Date: Wed, 23 Sep 2026 14:17:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: linux-kernel-dev@aliel.fr
Subject: Re: [PATCH 1/2] dt-bindings: thermal: amlogic: describe bus clock for
 t7-thermal
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-pm@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260923-fix-t7-thermal-clock-v1-0-7d4c4682f182@aliel.fr>
 <20260923-fix-t7-thermal-clock-v1-1-7d4c4682f182@aliel.fr>
 <8c93d281-981f-40ea-839e-6dd24964fbce@kernel.org>
Content-Language: en-US
In-Reply-To: <8c93d281-981f-40ea-839e-6dd24964fbce@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_051846_569258_34604266 
X-CRM114-Status: GOOD (  12.16  )
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

On 9/23/26 2:02 PM, Krzysztof Kozlowski wrote:
> On 23/09/2026 13:51, Ronald Claveau via B4 Relay wrote:
>> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>
>> The t7 thermal sensor needs a bus clock, in addition to the existing
>> functional clock, to gate register access to the sensor. This bus
>> clock is specific to each sensor, unlike the functional clock which
>> is shared between sensors. The current binding only describes a
>> single unnamed clock and therefore cannot represent this hardware
>> requirement, so add clock-names to disambiguate "bus" from "core" and
> 
> Index distinguishes, not the clock-names because items have strict
> order. That part of sentence is redundant and more important - if I ack
> this patch, people will use it as an argument in the future review
> discussions.
> 
> Drop this part of sentence. clock-names are fine if you need them, but
> still the disambiguation is provided by indices.
> 

Thanks for your feedback.
I will replace `so add clock-names to disambiguate "bus" from "core"` by
`so add a second clock entry and clock-names for clarity` in next version.

>> make the second clock mandatory for the t7-thermal compatible only
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> 
> Best regards,
> Krzysztof


-- 
Best regards,
Ronald

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
