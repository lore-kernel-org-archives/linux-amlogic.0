Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0F5C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Nov 2022 13:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MmJGBsSv6FqdBvlJhbcFE5N4kqhqKLZ7Srexyj4TkNI=; b=yi4iQnUiNeR5Df
	j8LncArcaARfcXWw0VJT8P6E2Gzrc2Xw3A0Eq343ge07vZV7F7DZug0hzQ0jrTxjAQqkGBbezlzGm
	Q2Il9BBq8mxfmifg/GEWbjIfyKz3jZ9F0pnVmys+iGV4scCs80N4fFwCwCaqE2uWJYphPk8mArU5n
	zWHmhZDy7LuoTfLQNQeee5LnCxKC4Wkzjag+rZ2YbnYpa5RJBrJlaQQBk7g3AHcO3TCoUFnGZG2XR
	GdcHU+rmevGepWPYCG5Ir1x4u7xRTDBb3ZYqc7UDwwxrU5+rbTSWQcPuyFGTv4OXh1iMw5eZgf/nA
	0Hsxi06ZV6F+zlBhKSjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxpmt-00HE6L-1q; Wed, 23 Nov 2022 13:27:39 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxpmq-00HE4G-EV
	for linux-amlogic@lists.infradead.org; Wed, 23 Nov 2022 13:27:37 +0000
Received: by mail-wr1-x42d.google.com with SMTP id v1so29337272wrt.11
        for <linux-amlogic@lists.infradead.org>; Wed, 23 Nov 2022 05:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fT/xDuYv9xGq77UWP89SFz3uGJYiuqZ8uj1zssl6LEI=;
        b=m4LuSbWqBjT7NwHQH0tifRloLcrY3pwxm1CueZ4AmCT2gUl/V1p8xjXwKORPOqJCsK
         Rqu8SpS/v32Bq9OdGT9TY7Dhs5p1nLKSPt2dtKY3io58zqaHQj9BW4tpcFHZFlNu9Ib8
         AcGwX4cq5h7T4zTzji74Ahi3vC6i3D9LJbAoPYVTBvtel4xOpslBxfIsDolwComWC8RI
         Zi/Y0k4GpHPk6mU9ViYMW2fhXCLlqg6PomorrJEoA5YVpfLNcaTH2vgwZrR4XSt4nvOl
         QPVb5zDfc6vW0uX45KhY20BpCTHoeBQdpxpLnJigbUlq1ck3dMtNMvRYGQgHLY8l5Ezn
         PeeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fT/xDuYv9xGq77UWP89SFz3uGJYiuqZ8uj1zssl6LEI=;
        b=EGqdik6WOB+7zfuA+BeSB4lf07iXCJHUPS34rRKAZ/bMsp6Px9NLYBTVgsYDRgWr/i
         +pTfZytzt1Lgk6hKzvSiPUp1ChQcNXJ7N0Xfc0Ssl2qQSetT16GsWuXvVES7z4gPbXQi
         3NMnEW3zXZt6i1X4WuNSIXGH2tzEo4yZTZ8ZSqiUdvPkPVza2DvKma4G4cxYihFJYbyI
         +f0VAMvOGK5uKaL96sL49FFxcIXI461GKqHH+jqez4lRqERwSh3WPZtEgjmrZkbM1Tdb
         S6x18YRRoWrvLWmR9Q+lAXb3LT/c/P+ah6d4jTNxr2en0q/dWS86pw/yX7e9Lf5wqSWH
         W4IQ==
X-Gm-Message-State: ANoB5pm4mQVZN6PeNeae2e5bP53kTbniHEPdHfHCgjNUoUpjE7YSLPYo
	6NPOFbHLw4TE0+95EWBfN4meQQ==
X-Google-Smtp-Source: AA0mqf6rOqEuavZEDT+cCpsbo0nI8+NuQqSYhObPcsBGUEd3IpX2Pk1gKE8zWfzCrTcLpzL9QcyX8g==
X-Received: by 2002:a5d:6b0c:0:b0:241:c595:9f05 with SMTP id v12-20020a5d6b0c000000b00241c5959f05mr14052664wrw.439.1669210054818;
        Wed, 23 Nov 2022 05:27:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:e551:24c3:152c:7c05? ([2a01:e0a:982:cbb0:e551:24c3:152c:7c05])
        by smtp.gmail.com with ESMTPSA id h20-20020a05600c351400b003c6cd82596esm2609540wmq.43.2022.11.23.05.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 05:27:34 -0800 (PST)
Message-ID: <9961d579-9463-c585-34a6-a3abcd4b3e52@linaro.org>
Date: Wed, 23 Nov 2022 14:27:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <ae43fadf-9255-7db7-8b5e-01200e02a2c6@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_052736_523011_1901BC0D 
X-CRM114-Status: GOOD (  13.59  )
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

On 23/11/2022 11:10, Krzysztof Kozlowski wrote:
> On 23/11/2022 03:13, Yu Tu wrote:
>> Added information about the S4 SOC Peripheral Clock controller in DT.
>>
>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>> ---
>>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 26 +++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> index bd9c2ef83314..e7fab6e400be 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> @@ -6,6 +6,8 @@
>>   #include <dt-bindings/interrupt-controller/irq.h>
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>   #include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
>> +#include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
>>   
>>   / {
>>   	cpus {
>> @@ -100,6 +102,30 @@ clkc_pll: clock-controller@8000 {
>>   				#clock-cells = <1>;
>>   			};
>>   
>> +			clkc_periphs: clock-controller {
>> +				compatible = "amlogic,s4-peripherals-clkc";
>> +				reg = <0x0 0x0 0x0 0x49c>;
> 
> This is broken... did you check for warnings?

This is actually fine, the parent node has a ranges property:
https://github.com/torvalds/linux/blob/eb7081409f94a9a8608593d0fb63a1aa3d6f95d8/arch/arm64/boot/dts/amlogic/meson-s4.dtsi#L93

Neil

> 
> 
> Best regards,
> Krzysztof
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
