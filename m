Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94148C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 08:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=am6QiywPRr9myGv33/POnI6H7Uhh0CzN8bO/pU+bTGw=; b=sot6Alw/a+wVKWPiV/+u9qGfwj
	7jxWS+DLjHIiNc7SPQnF3K9DNT/4tY3lX0uDUlFGMklSFp8XrhRCT6pE9q18V9nG+2d+vokaQ/oLK
	QWZXHKGNA7pVvyjA0fQBpjDIlrszXR7CR+QQ9JfQDbgEKB9DPtJjVScGQrlr8LELdXxxqesE9hzks
	syijGGqNjdiso7lKtAVwNaudi/mRBeWsQ2gDLpRy8u5rb4ERhqdQA1CaeRsmoLZ4W2eE8T/5cwXFv
	VnmRVEEr1vmj0WX8QlyeQB66MTgxMg93BZBndcpgQNMrytYYgzxNK0sNHhl8YfgFAbDCXnPMfZCK2
	d7plv2VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p11s8-00Ejdw-P0; Fri, 02 Dec 2022 08:58:16 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p11rq-00EjTO-V5
	for linux-amlogic@lists.infradead.org; Fri, 02 Dec 2022 08:58:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id h4-20020a1c2104000000b003d0760654d3so4571281wmh.4
        for <linux-amlogic@lists.infradead.org>; Fri, 02 Dec 2022 00:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hrXh1n7+q7fL8fZ+N+AYxQ6Gttv4U1Iv+7uPHyHolo8=;
        b=U3zLU6MZH0G4eEg0jylYeVarVdA0Vp1QAGYYAUzAbngRNP9p9NEf0CJ6ph59Z5vpek
         coZOw6/yF0T05gempG5PoG1gQTl3iISvll/LJ3Ff1ERdgJquIMMlV3txt3CBzVls2vkf
         LvEQapbfpfLWydAb4VuFINZ/Whn/5gCtfiyVuI8jbNzqNLSVUqcU+k4e2ELeYKhj0yrd
         kuBFNzqnLqueFlzR19IK9bwGjAbbq7nI3eSZ7WQt4y+5QQA3mizcjYE8P/xsPzIfJII1
         j+bZlPv0LpmdRjM29qA6oOJEhiNKQ1Bw321ykzly8Lb+wdaqxsFKbeApYdgz8WYC1LqC
         iT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hrXh1n7+q7fL8fZ+N+AYxQ6Gttv4U1Iv+7uPHyHolo8=;
        b=aAlYQBGcbL++89ISnHoCn2hS+cZKxQZQxZti1MI6gZn2i1YbulZK+48R1swWCnp0Mo
         CgE044WqQXZxapHulJ818HnEwEkFWyWw02Tr9qK8w2/ahWBgtpdRTI0bOKYy6bTXJUGJ
         6UE9Mokjk0IXFkLZPEXRC0vsknAPAUwP53ST1SUYTe0j6YqCqKSsg3Rb2QLg4niuBI/Q
         5cmiAHlDsDyHdb6SiDIA2ex8MRzyjl6bsC8PWo3zltDzd1S8UBIcX1lwmLgTlByIqEHt
         4oR/MkGFZgjPWT/yAxErHZSCBEvmUjzYkj3dp9rSxX6dSbSloTKxGozoeX+ym5gMHcP4
         mDhg==
X-Gm-Message-State: ANoB5plAe4JU6BCI4ZSKLL6jF9BvSX9XGNkrJ9CGHjjuxW9d0fwHn0yO
	YeyzHDZN+6LvGBUYjJp9O0vBTA==
X-Google-Smtp-Source: AA0mqf67e2AGKPOEYoS8HO7Jo5+4Ow9tYZY+3J1lJSldilOVMktuVrZk3AiNzzSwU9R64H0rupfNLw==
X-Received: by 2002:a7b:cb91:0:b0:3c6:cb54:ef66 with SMTP id m17-20020a7bcb91000000b003c6cb54ef66mr41088554wmi.90.1669971474508;
        Fri, 02 Dec 2022 00:57:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c6e:eb0:b551:55ee? ([2a01:e0a:982:cbb0:c6e:eb0:b551:55ee])
        by smtp.gmail.com with ESMTPSA id o37-20020a05600c512500b003cf5ec79bf9sm9035533wms.40.2022.12.02.00.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 00:57:54 -0800 (PST)
Message-ID: <600437c7-3ccd-dfce-8fb8-826a608cc06e@linaro.org>
Date: Fri, 2 Dec 2022 09:57:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 4/7] arm64: dts: Add DT node for the VIPNano-QI on the
 A311D
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: italonicola@collabora.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
References: <20221201103026.53234-1-tomeu.vizoso@collabora.com>
 <20221201103026.53234-5-tomeu.vizoso@collabora.com>
 <CAFBinCC8kQ-7v+PCZgsqo2kGzsOi5jT6ekmjvb_D2j5tBmHNoA@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAFBinCC8kQ-7v+PCZgsqo2kGzsOi5jT6ekmjvb_D2j5tBmHNoA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_005759_066430_5D92D274 
X-CRM114-Status: GOOD (  13.54  )
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

On 01/12/2022 23:33, Martin Blumenstingl wrote:
> On Thu, Dec 1, 2022 at 11:31 AM Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
> [...]
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
>> index 45947c1031c4..61c8461df614 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
>> @@ -11,6 +11,7 @@
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>   #include <dt-bindings/reset/amlogic,meson-g12a-reset.h>
>>   #include <dt-bindings/thermal/thermal.h>
>> +#include <dt-bindings/power/meson-g12a-power.h>
> We could now remove the meson-g12a-power include from
> arch/arm64/boot/dts/amlogic/meson-g12.dtsi
> I'm not sure if we have any "rule" about this though, so I'm curious
> to hear what others think.

Actually you're right, Tomeu please remove this include
and remove the:
	power-domains = <&pwrc PWRC_G12A_NNA_ID>;

and move it as:

&npu {
	power-domains = <&pwrc PWRC_G12A_NNA_ID>;
};

into arch/arm64/boot/dts/amlogic/meson-g12b.dtsi

and while you're at it, please add:
&npu {
	power-domains = <&pwrc PWRC_SM1_NNA_ID>;
};

into arch/arm64/boot/dts/amlogic/meson-sm1.dtsi

It's ok to do all this in a single patch.

> 
> 
> Best regards,
> Martin

(PS: Don't forget Philipp's Acked-by on patch 1 for next version)

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
