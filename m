Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38579C38142
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 10:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S40tAxcbtHp7sSGeezclu4nPNTiLDSQMFMtmKwOGCLE=; b=PZH9X/BCWQvea1mX8HG7E6xjvp
	ZUDSUJp/PEmpMZakVkXWbMrnsbV3gkWx4OWBniYww3kasHDoVtT+KPCDzezy/RNnWjXQZUC4AW3Tr
	z7kS8Yr8LiP/MUxyVZxZrZmHnH/iDsyguUZ7HAWuFMG9iXIFw8ZFNTktEtyIxsk6ciSdU0iW7zlIm
	dlX9tfpiVKYZW6CrIM1Ba8+2mvzTzikFOkkx26H8rB/YbKITeQImGXgnJOEzS6+Na7QYiwcEM7Ti8
	LIf+qPd7CNfekzMSDe1jj+JslvdDDeQzfQystrnudVE08Y3iQXELp5tekq8EM6SEHA/8JzclcglOD
	kSGJmmkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLLf7-00DruE-V6; Fri, 27 Jan 2023 10:08:50 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLLf4-00DrsX-Qc
	for linux-amlogic@lists.infradead.org; Fri, 27 Jan 2023 10:08:48 +0000
Received: by mail-wm1-x331.google.com with SMTP id iv8-20020a05600c548800b003db04a0a46bso5390115wmb.0
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Jan 2023 02:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MWUMgBP7Oku5gYGzZWSP5y1RRsNvwdyRcB7eFWAwTU0=;
        b=MPwJxKjWcAbrgBbFXgrvHR4wjhwuS/a56htKBR+RaxHq0WjuafurnQKOkQK+iODchE
         Jm9X06UK46r8ATa2Ka+fLTrWTr0i1CF6XfPb+CLB22s9omYlHZC5sagsIJfR/yV31lhx
         XeN9qvL6WaJwd/SgTpTxY63h6wFb3GvQrxYBoEJ4XLfa731msqxegoKzyhwAmgbv3tOo
         Sgct7aDGKV4wqWKoysLhpw267DqOb7cBIxUE8T22ymUX7LVfAeBcPX9gNEKK5kt9qxro
         4HMiwiHGJM3ZifyWOEfzZ0U7y+M52O/pmD3hqU1TRAGB4vy4PbBP5T2rzW96in3Fpd32
         hG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MWUMgBP7Oku5gYGzZWSP5y1RRsNvwdyRcB7eFWAwTU0=;
        b=5IjPIHFnNQGa1Zdac2ce5cIbEV9rO20Pk/JhqZUxQDsYGxjlL3Dmm4YALLFXtmPuBM
         PvBVAj85uiyCwmjqlkJuBF1lsBMzUuV4T33q4vmsKDiWZvHbIPKzhhqEOeymqcjJ4ROJ
         y4vxEpY38R45YSlTpL7BYyK6chnyFBH0Kw6VtQ4ZvQx4zc4c+5ZpQ23DJ3Aws+ZP6q+b
         9/uKBsb+RVCU4QH7pj4oHAm+UqWQa7nbUulY1cWtU9OLSJKyOf7QeSWmCPay9/dtijWi
         U6GMow77+lp2u9zLQSpxq/hVD+GQW0s5Wqk/DJc160qkbFg3+/e0hdFDGgIBAVPvI2wA
         49bg==
X-Gm-Message-State: AFqh2kpHVAB/fS9Sr/Gwf7KqaupH0q9C+mDgKs2q4NmuoKYMdL6a0r+U
	oZkTwPpYK5U9tSzsrO73aJ5K0Q==
X-Google-Smtp-Source: AMrXdXtulVyKLYucU9uL1ZxqVBbI4su9SJiwmNAknR7BQz1SBzbCEYaJrMSTQLQhzCzL3+o6kD1VAg==
X-Received: by 2002:a05:600c:3ba5:b0:3da:ff66:e3cc with SMTP id n37-20020a05600c3ba500b003daff66e3ccmr37585096wms.21.1674814125540;
        Fri, 27 Jan 2023 02:08:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d4ec:15ea:873c:61e6? ([2a01:e0a:982:cbb0:d4ec:15ea:873c:61e6])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d6b81000000b002bdc39849d1sm3475326wrx.44.2023.01.27.02.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 02:08:45 -0800 (PST)
Message-ID: <8e7700df-32dd-61ad-93a0-74749751e531@linaro.org>
Date: Fri, 27 Jan 2023 11:08:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/4] arm64: dts: meson: add support for BananaPi M2-Pro
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230127100236.3385154-1-christianshewitt@gmail.com>
 <20230127100236.3385154-5-christianshewitt@gmail.com>
 <a35f7f09-eb19-6cfc-2053-c6b340f10cbd@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <a35f7f09-eb19-6cfc-2053-c6b340f10cbd@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_020846_900954_8DCD73F9 
X-CRM114-Status: GOOD (  15.22  )
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

On 27/01/2023 11:06, Krzysztof Kozlowski wrote:
> On 27/01/2023 11:02, Christian Hewitt wrote:
>> BPI-M2-PRO is based upon the BPI-M5 design except for a different
>> physical board layout and the following changes:
>>
>> - USB 3.0 ports reduced from 4x to 2x
>> - 3.5mm Combined CVBS/Audio Jack removed
>> - RTL8821BU WiFi/BT module (internal USB connected)
>>
>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>> ---
>>   arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>>   .../dts/amlogic/meson-sm1-bananapi-m2-pro.dts | 98 +++++++++++++++++++
>>   2 files changed, 99 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
>> index 97b42e2100e0..644451794aca 100644
>> --- a/arch/arm64/boot/dts/amlogic/Makefile
>> +++ b/arch/arm64/boot/dts/amlogic/Makefile
>> @@ -60,6 +60,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-s4-s805x2-aq222.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air-gbit.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air.dtb
>> +dtb-$(CONFIG_ARCH_MESON) += meson-sm1-bananapi-m2-pro.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-bananapi-m5.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-h96-max.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-khadas-vim3l.dtb
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts
>> new file mode 100644
>> index 000000000000..4890d5d9a4f7
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts
>> @@ -0,0 +1,98 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (c) 2021 BayLibre SAS
>> + * Author: Neil Armstrong <narmstrong@baylibre.com>
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "meson-sm1-bananapi.dtsi"
>> +#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>> +
>> +/ {
>> +	compatible = "bananapi,bpi-m2-pro", "amlogic,sm1";
>> +	model = "Banana Pi BPI-M2-PRO";
>> +
>> +	sound {
>> +		compatible = "amlogic,axg-sound-card";
>> +		model = "BPI-M2-PRO";
>> +		audio-aux-devs = <&tdmout_b>;
>> +		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
>> +				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
>> +				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
>> +				"TDM_B Playback", "TDMOUT_B OUT";
>> +
>> +		assigned-clocks = <&clkc CLKID_MPLL2>,
>> +				  <&clkc CLKID_MPLL0>,
>> +				  <&clkc CLKID_MPLL1>;
>> +		assigned-clock-parents = <0>, <0>, <0>;
>> +		assigned-clock-rates = <294912000>,
>> +				       <270950400>,
>> +				       <393216000>;
>> +		status = "okay";
> 
> It's by default. Did any DTSI disable the sound node?

It's a leftover we keep copying onto new boards, I'll send a patch top remove all those.

Neil

> 
> 
> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
