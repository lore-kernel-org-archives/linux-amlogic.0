Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A14EC4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Nov 2022 14:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EmD5yv49CpgpdSm21oxZewwMAKRk2DBsTIitZVx5GTo=; b=jSLLt55+69sPzf
	9M/tInph6r9HR+jQIyrcI1THJQtrNyi4dXHJ3uUPEnhPi210WcyxcnYthe6+gCaq+YsL6jHsMEQXB
	4THD/cfjBMQ3Dw6bd75lDSl3usq/Lgzg7KQOyf0lUQlchkqTmH8ELzjDFRQIFZdeexZ/1BDaAcekr
	PKuxLcA9lTfxdI78aL5kKSB7LxSRUAqnEE3UOwreEvpi58PDDh3SpEroustR6RE4D2xot+cruHWwW
	tFM3MQ1/PTX3edPlt1Zf3ma4oR+tcF5gh5AnL1JXtl1Ittztl+VbgRskoz3xsP8cANc+tvEsdBAd5
	obwlx9XuNYWURBf0sGRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqVT-00HXHg-TE; Wed, 23 Nov 2022 14:13:43 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqVF-00HXBB-Lx
	for linux-amlogic@lists.infradead.org; Wed, 23 Nov 2022 14:13:31 +0000
Received: by mail-lf1-x133.google.com with SMTP id d6so28309723lfs.10
        for <linux-amlogic@lists.infradead.org>; Wed, 23 Nov 2022 06:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8/Gp8oNJZw3cLXUYP8ks4PwvnFzrrxOR4KiPfsrpS5s=;
        b=Eu4w0mKIlQN/48m6aFJ+zpEBptQk93sPQh9M8czvaTGBgj/obNFUppnhII4bHaL+t8
         WDRLzC/3Bq9UVwLtv7GnkM96heFTdJivk2h6ne0AJWun7grt5tlGRIkzjFdSsrMuxmm9
         fOEoOPvp1SOx/oesbnKiK5xb2kGivh5DafLvQPvRzONO+0HYgfFbCsn5INIWAqht3SWV
         XGyvUJUdga+HZqaWOemqlq7N/FMRO9J5Gswx85kxcWL5ADEik4+K0/FZgRLrjRPkD6Cx
         EIDe//PF9Abt7YL/j3jqsSf12pvXQUFX1J8fSacwR2zK+LGdDdBoE3fd3uPb87puxjNj
         KbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8/Gp8oNJZw3cLXUYP8ks4PwvnFzrrxOR4KiPfsrpS5s=;
        b=nCu/W2Wf4TNNksrKO+mb9MQA5FGJ6HRzkjN3CztL+d0P7iGs/Jeeuz247Yy/KkEOaF
         tmW+hqVcD+9/aVJwlMwhOGonieyG1bBrhvc5zDg6O2dZvLZjn7FpqmX3Z1rt+IpMOGmn
         ggWgE1Y+zsyVnZ7j3dGttIOzdMBNB5ukJyvWX0NV7YbbSDtlGSz3Z3sXLMTLVnchTASr
         RFE0/CjkgyL4Gxq/sIdFyFXC9qdBbgus+4flMArbTlvrUSe8Ds8R7eUyTyJTFKm1f3rX
         Q3lEzVHlzvHYhMICu6wYHf2+xW33fUySlX9SUfegaZD6+9DVvV30Yo1QrYPnlKuwron+
         +OJg==
X-Gm-Message-State: ANoB5pkgeNjq2gBVh2tV6TWVDrJzwWGfE9GdQ3NoIKPehvD1NZFNkYCe
	AqntTyYRTBDFa3afC8wnFw++Cg==
X-Google-Smtp-Source: AA0mqf5quQBr81TBL9QYOBAQk89wKtHmN891t6m5JcSES8bjEfXcUWIQE5L7V2X5rE6LA0yj51omnw==
X-Received: by 2002:ac2:5f62:0:b0:4b4:6ca6:c669 with SMTP id c2-20020ac25f62000000b004b46ca6c669mr9176286lfc.338.1669212804830;
        Wed, 23 Nov 2022 06:13:24 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 21-20020ac24835000000b004a2588520f5sm2893414lft.166.2022.11.23.06.13.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 06:13:24 -0800 (PST)
Message-ID: <7f3a34a0-a5b0-3a72-8e0e-00656bd77ff6@linaro.org>
Date: Wed, 23 Nov 2022 15:13:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH V5 4/4] arm64: dts: meson: add S4 Soc Peripheral clock
 controller in DT
Content-Language: en-US
To: neil.armstrong@linaro.org, Yu Tu <yu.tu@amlogic.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <narmstrong@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com
References: <20221123021346.18136-1-yu.tu@amlogic.com>
 <20221123021346.18136-5-yu.tu@amlogic.com>
 <ae43fadf-9255-7db7-8b5e-01200e02a2c6@linaro.org>
 <9961d579-9463-c585-34a6-a3abcd4b3e52@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9961d579-9463-c585-34a6-a3abcd4b3e52@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_061329_725808_2E000260 
X-CRM114-Status: GOOD (  12.86  )
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

On 23/11/2022 14:27, Neil Armstrong wrote:
> On 23/11/2022 11:10, Krzysztof Kozlowski wrote:
>> On 23/11/2022 03:13, Yu Tu wrote:
>>> Added information about the S4 SOC Peripheral Clock controller in DT.
>>>
>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>> ---
>>>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 26 +++++++++++++++++++++++
>>>   1 file changed, 26 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>> index bd9c2ef83314..e7fab6e400be 100644
>>> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>> @@ -6,6 +6,8 @@
>>>   #include <dt-bindings/interrupt-controller/irq.h>
>>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>   #include <dt-bindings/gpio/gpio.h>
>>> +#include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
>>> +#include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
>>>   
>>>   / {
>>>   	cpus {
>>> @@ -100,6 +102,30 @@ clkc_pll: clock-controller@8000 {
>>>   				#clock-cells = <1>;
>>>   			};
>>>   
>>> +			clkc_periphs: clock-controller {
>>> +				compatible = "amlogic,s4-peripherals-clkc";
>>> +				reg = <0x0 0x0 0x0 0x49c>;
>>
>> This is broken... did you check for warnings?
> 
> This is actually fine, the parent node has a ranges property:
> https://github.com/torvalds/linux/blob/eb7081409f94a9a8608593d0fb63a1aa3d6f95d8/arch/arm64/boot/dts/amlogic/meson-s4.dtsi#L93

The parent ranges do not change here anything. You cannot have a reg
without unit address and the tools report it. No need to use reviewers
for this...

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
