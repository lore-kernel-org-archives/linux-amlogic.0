Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E666C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Nov 2022 14:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zr9fBn1Qv3X+huEKleSKqRrZaBYVLBZLToWKuI4vNV0=; b=LF4m47htN7OqjMffiguEb9bLSQ
	Vij4H5gMgIJvDUYNqHLP1KRFgzFP+D6d8gJjDx8N3cHkFZvwERdaET7qw8zMiEc4iqBndzNg3oD2E
	9sWNtsI5HI5Nep6i3qj4WHPPpwSsjSyo6HFcyPEVtse5dnanCr3MAsfYac8MFEBCcbswiVWCnDUpy
	t1XYV74uukqI2irHaTbx/PKiuZ2VIqXNK8FDqUPNhy/RKz6HUXpSmyCs0DVAftWhFZMom5nJ7q99F
	0yj3J1eeXv/dPQ2btxKk33JO8NfHCoe2cWBT4W9fj1C6S49uAmFR+uMMjx+RvEmR/bMESSzC3FhYO
	r6JMd45Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqdj-00HaUV-D4; Wed, 23 Nov 2022 14:22:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqdF-00HaLr-7X
	for linux-amlogic@lists.infradead.org; Wed, 23 Nov 2022 14:21:47 +0000
Received: by mail-wm1-x331.google.com with SMTP id ay14-20020a05600c1e0e00b003cf6ab34b61so1560913wmb.2
        for <linux-amlogic@lists.infradead.org>; Wed, 23 Nov 2022 06:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s2W7b5464QZ3y8H83iSDFZMEw1jsrSlHRDfoJncclTM=;
        b=je7shZ9Gyzpr/PD97g5u6A8HMxCq+ZUWuC6+eSmw1w+GMN3pmylKToBeH88Mmd3koX
         QHSzHgYt8kTUWugIAOwWDugqG4cABuFnbkv79xI72zd2/sCE+6pyABpf//s4kFQywozf
         tH1f1CGcl9yt9/A5ALUoA4s9hTG3NTMwAqiqbNCUiBQpImNtVqt3tbgWi+TA4sbHA2gA
         wBGO3B4FGCl8KV+TmFoMdHUUMPNbqXAsBw/rm/A8KbFxVXUw5BsbJjmmMQwcoOnXHhM7
         ePjTgIoJRYRLojiixYl41sbxg53tPS5MMWvtY1IYihALpHJbl5CKDpVsBzCMwhYgGSR1
         oNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2W7b5464QZ3y8H83iSDFZMEw1jsrSlHRDfoJncclTM=;
        b=Gk5pGOrEzf/6X8k30g5s5+8ZHSI+kwqH8ZO0pO+AvMS22egiSPo32D51CJOY79GOu0
         zDMCiJQB5UdTc/bMlx0wWVUPYR9U6904LtG3snEkjZvdWEkePVaTXZIIwac/kGMQzh0+
         ZA1I7CQsuh5UN03GzvXUoc5qiUbZNf9Cnf04thcot9Ah0yE4oAHWJk1q5KvfhEBlLZgj
         MlVA1qW37PXtkM5fTTo13+s9nWlw/UdJCYL82Sa/gJVTC1Y4FQ+uHMsv+ceGoltth+jx
         fxsTcodZQcmGJ8nDEXfebEjTyk3ewBzw2bs9E3t7PUbAX0J875VLv6xfizfUgkdQpcbZ
         YcPw==
X-Gm-Message-State: ANoB5plH2gLxSYrkU/MMreHGD3ptKVw22EriXPDw267bIxo1GLdFzYky
	+OnqqmSGcan8mwJ8PvKfWN9UgA==
X-Google-Smtp-Source: AA0mqf7f4zOfnnJVMh7RSMvMRxhALijsWR3bI/57+eyW7MsHBRlpNG3HN3A/HVPrKXZDhtAtQQ/Qog==
X-Received: by 2002:a05:600c:5389:b0:3cf:a343:9a28 with SMTP id hg9-20020a05600c538900b003cfa3439a28mr10285608wmb.186.1669213301323;
        Wed, 23 Nov 2022 06:21:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:e551:24c3:152c:7c05? ([2a01:e0a:982:cbb0:e551:24c3:152c:7c05])
        by smtp.gmail.com with ESMTPSA id q6-20020a1c4306000000b003cf774c31a0sm2006778wma.16.2022.11.23.06.21.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 06:21:40 -0800 (PST)
Message-ID: <2153a111-d5f0-94cf-9cfc-f8ce4b084a1c@linaro.org>
Date: Wed, 23 Nov 2022 15:21:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: neil.armstrong@linaro.org
Subject: Re: [PATCH V5 4/4] arm64: dts: meson: add S4 Soc Peripheral clock
 controller in DT
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com
References: <20221123021346.18136-1-yu.tu@amlogic.com>
 <20221123021346.18136-5-yu.tu@amlogic.com>
 <ae43fadf-9255-7db7-8b5e-01200e02a2c6@linaro.org>
 <9961d579-9463-c585-34a6-a3abcd4b3e52@linaro.org>
 <7f3a34a0-a5b0-3a72-8e0e-00656bd77ff6@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <7f3a34a0-a5b0-3a72-8e0e-00656bd77ff6@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_062145_313076_A982946B 
X-CRM114-Status: GOOD (  13.81  )
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

On 23/11/2022 15:13, Krzysztof Kozlowski wrote:
> On 23/11/2022 14:27, Neil Armstrong wrote:
>> On 23/11/2022 11:10, Krzysztof Kozlowski wrote:
>>> On 23/11/2022 03:13, Yu Tu wrote:
>>>> Added information about the S4 SOC Peripheral Clock controller in DT.
>>>>
>>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>>> ---
>>>>    arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 26 +++++++++++++++++++++++
>>>>    1 file changed, 26 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>>> index bd9c2ef83314..e7fab6e400be 100644
>>>> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>>> @@ -6,6 +6,8 @@
>>>>    #include <dt-bindings/interrupt-controller/irq.h>
>>>>    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>    #include <dt-bindings/gpio/gpio.h>
>>>> +#include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
>>>> +#include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
>>>>    
>>>>    / {
>>>>    	cpus {
>>>> @@ -100,6 +102,30 @@ clkc_pll: clock-controller@8000 {
>>>>    				#clock-cells = <1>;
>>>>    			};
>>>>    
>>>> +			clkc_periphs: clock-controller {
>>>> +				compatible = "amlogic,s4-peripherals-clkc";
>>>> +				reg = <0x0 0x0 0x0 0x49c>;
>>>
>>> This is broken... did you check for warnings?
>>
>> This is actually fine, the parent node has a ranges property:
>> https://github.com/torvalds/linux/blob/eb7081409f94a9a8608593d0fb63a1aa3d6f95d8/arch/arm64/boot/dts/amlogic/meson-s4.dtsi#L93
> 
> The parent ranges do not change here anything. You cannot have a reg
> without unit address and the tools report it. No need to use reviewers
> for this...

Oh I see now, I simply looked at the reg property, not the unit address.

Sorry indeed it's wrong and DTC should complain.

Yu, you should probably update your DTC version.

Neil

> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
