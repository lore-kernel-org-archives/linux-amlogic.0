Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5BFC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Jul 2022 17:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zka/3SmxNGq8ehsMg7alIL2s1lJPRpY4LtIdcAHJWJ4=; b=GzrhlNN97w735E
	pcf475CvAlRqt+OHnfvUJ36YKs/BQkXdEtYqodK9uWO0VEurXWd/QlWGxNombJt5yEdVNRzGWGPHX
	fUxPpYNqDdlht4K3P+sq+MOQTzvW4Ot1rxi2Y7cFndRt1FscuwdxomiGJgLFOb+qnDhIGQbOouK3p
	5QmeACPWy2ye3Tog8HQ6no+bj91WdypgPl4OIZFVpHtNrqjKoWa94m5vW9M7p9PWfnH3vNqbfYu4z
	PbkoTFc3/VtrDyBr6hsA/I225ZrkM3c8OT66VfqUaOPpTmaaJtN0NIeEJ8FozFooJupoyeIjMzOG2
	sj+MA1hBOvsWJcKSqA6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEaOI-00AzDh-5D; Thu, 21 Jul 2022 17:55:14 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEaOE-00AzAU-ST
	for linux-amlogic@lists.infradead.org; Thu, 21 Jul 2022 17:55:12 +0000
Received: by mail-wr1-x42a.google.com with SMTP id bu1so3322371wrb.9
        for <linux-amlogic@lists.infradead.org>; Thu, 21 Jul 2022 10:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=i4cDjf1Cjd0yOw7f6RDaSHI7QfV0U03RCOe+RqMOiHM=;
        b=3qp8L6iiIFbNgY8Rq98TiLMJtgEeK9PLQueSkCCCniUVIFRzRd3VeBgwjF2ImnbvUe
         EjJR2YZjDpOWrBDJDiOt8F7sl31tDvPqK5i7IukZn/PjA9ReRA49ZFS9/9nDSke6h+be
         6bAsjgLFoydTT9tMfVavkXWZKxoN17M/rRz7M40i+XyR/cJGlO0kqvNOYiEmtdqtmkl7
         3YrZU1P7uYpor6t7vdI7R4eBuBigOAj+QdP/KoDFeXsa+AhjSBbGHGSr2t9bFOgwYRvx
         cQ9am5xCxqAWtUyXHTwmqF8N/ofbev+U0BD+Fzfyp73vn0PCYywygtDefUOFSFDS83NC
         9P9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=i4cDjf1Cjd0yOw7f6RDaSHI7QfV0U03RCOe+RqMOiHM=;
        b=pkIzqYNUP+Ffe3v4+G60s5UDTw1KReV9ns++VDc0O/mL5SQniJynI1+by+gUOOhzs0
         206D1rdN35nRshnZ0+RknbH1do5bRStJwLT2O4S4pwNScjnSSqGo3xpRXIeSZr2gsLp0
         MDCjI0CLa8aRmJqD6WtFd1W6GlTeAlxI88PojBbWQZEyi/XMcXs7qC085ZeB4lcci7ZH
         yla4Mnfnfz6YUQKHAqp9nkcvMcu9jATcDBt9Sex1gJ3TKVorNKoiwzDAvtw2rU4zbuU7
         Xv51qXxfH7UHLcE4o1o2Slk+Lr3XXplbM0OAmtsIkxWsgdgbt85k5jk8hAZ4LltUNVc0
         debg==
X-Gm-Message-State: AJIora+wTHasHg3cgEy8wGuKt5gXn5qYMWsjMcx4//173trdcN7DW44H
	eQB0Ep0FpoECexZ9ljbuqr+DMA==
X-Google-Smtp-Source: AGRyM1uOfbxXgRLwmkYBzhfykIJonAAq54TnBmhDotxBZ3VtXs9L7VXTSL/Xz0+Yps7lwWlsRIooHw==
X-Received: by 2002:a5d:47aa:0:b0:216:9eff:342b with SMTP id 10-20020a5d47aa000000b002169eff342bmr37601684wrb.356.1658426109168;
        Thu, 21 Jul 2022 10:55:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4c23:a5d2:f5f6:4cd7? ([2a01:e0a:982:cbb0:4c23:a5d2:f5f6:4cd7])
        by smtp.gmail.com with ESMTPSA id r13-20020a05600c35cd00b003a046549a85sm6804613wmq.37.2022.07.21.10.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 10:55:04 -0700 (PDT)
Message-ID: <44f1117c-3e9a-e9d0-6d88-0f4a233f19e1@baylibre.com>
Date: Thu, 21 Jul 2022 19:55:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] Add MagicBox M16S support
Content-Language: en-US
To: Zhang Ning <zhangn1985@qq.com>
Cc: robh+dt@kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
References: <tencent_5FC75850BB8ECD9374E98461C38C41CAC506@qq.com>
 <050c3f94-5c65-d745-ffe7-6035e55a372f@baylibre.com>
 <tencent_C06302ED0F3660D25A133B0D4506EC17B908@qq.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <tencent_C06302ED0F3660D25A133B0D4506EC17B908@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_105510_951821_E343885B 
X-CRM114-Status: GOOD (  20.18  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 21/07/2022 16:37, Zhang Ning wrote:
> On Mon, Jul 18, 2022 at 10:02:32AM +0200, Neil Armstrong wrote:
> 
> Thank you for review.
>> Hi,
>>
>> On 12/07/2022 16:24, Zhang Ning wrote:
>>> MagicBox M16S or MagicBox 3Pro is popular Tv box in China.
>>>
>>> it's gxm_q201_v1 according u-boot log.
>>> and it's almost same as Q201 reference design.
>>>
>>> add a simple dts to support this Tv box.
>>>
>>> Signed-off-by: Zhang Ning <zhangn1985@qq.com>
>>> ---
>>>    arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>>>    .../dts/amlogic/meson-gxm-magicbox-m16s.dts   | 20 +++++++++++++++++++
>>>    2 files changed, 21 insertions(+)
>>>    create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
>>> index 8773211df50e..e0907fb41829 100644
>>> --- a/arch/arm64/boot/dts/amlogic/Makefile
>>> +++ b/arch/arm64/boot/dts/amlogic/Makefile
>>> @@ -44,6 +44,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc.dtb
>>>    dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
>>>    dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
>>>    dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
>>> +dtb-$(CONFIG_ARCH_MESON) += meson-gxm-magicbox-m16s.dtb
>>>    dtb-$(CONFIG_ARCH_MESON) += meson-gxm-mecool-kiii-pro.dtb
>>>    dtb-$(CONFIG_ARCH_MESON) += meson-gxm-minix-neo-u9h.dtb
>>>    dtb-$(CONFIG_ARCH_MESON) += meson-gxm-nexbox-a1.dtb
>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
>>> new file mode 100644
>>> index 000000000000..be543d65a529
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
>>> @@ -0,0 +1,20 @@
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
>>> +#include <dt-bindings/leds/common.h>
>>> +
>>> +/ {
>>> +	compatible = "magicbox,m16s", "amlogic,s912", "amlogic,meson-gxm";
>>> +	model = "MagicBox M16S";
>>> +};
>>
>> The compatible should be documented in the DT bindings in:
>> Documentation/devicetree/bindings/arm/amlogic.yaml
> 
> I will update this part next version.
>>
>>> +&ethmac {
>>> +        phy-mode = "rmii";
>>> +        phy-handle = <&internal_phy>;
>>> +};
>>
>> Is the sd_emmc_a change incompatible with the M16S ?
> 
> sd_emmc_a is used as SDIO for wifi/bt. and wifi/bt works with this dtb.
> I checked mrvl-sd8997 DT bindings,  missing a lot of properties need
> by mrvl-sd8997.
> 
> I don't have schematics to fill these properties, need more time to
> check vendor OS or try each GPIO.

Ok fine no problem, you can push it later when you figure out the properties.

>>
>> Neil

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
