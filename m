Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53BCC4321E
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Nov 2022 12:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YzZXAffEYw4G3s0RUshcV6muYD4Of/C2p/HojxCJe6o=; b=0E3jNWsCIBa3om
	2KyBQ7rDOxViAkgtWLZlISOg+h6uTIlAqwTZpo9EgtO/QmD7spSCzJr2U8BA6AcaJP4MQeezNsszB
	x4shljTFdo3hYras8ruDElZJUHqaeikTdFaVJ9kNcIfur5JjqQCbwi/z64HiU4uFZaW14gcycWIrk
	ggi5rCaOkAN5RA0RFje5XN9CiFckyT8mj3cZR1CpWwntNhN61Fv8ZFciwHPowNX3QzngtLZyyG9GI
	9WlaEThbch9jtyiBVEHSXV1hm5toQRzBwPLsGGNN4vp7uBgIBBsIPVJJn+06BBGTS4WLNMP58htjq
	ySrUX0cPwKh5zAwFN/Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozGjU-00BCV4-L1; Sun, 27 Nov 2022 12:26:04 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozGjI-00BCRV-NJ
	for linux-amlogic@lists.infradead.org; Sun, 27 Nov 2022 12:25:54 +0000
Received: by mail-lf1-x12d.google.com with SMTP id j16so13438982lfe.12
        for <linux-amlogic@lists.infradead.org>; Sun, 27 Nov 2022 04:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZmGgJvzXq1iMGVJs1Dm2uF1Desk7wBIQ6ArKFGrdEHI=;
        b=GtAMlbEdFqyigsatSCsNUpWfqAGSoc0bWwSSqIWTsi4xr0sp4TRd+Q1zekwv4OvpNY
         9wLLC2pyXUCHZMruC/YpwC13ftJoph9ZXnWFrjBkh8cYvoCkcl31GCVQ27CXA8EkDh2y
         4b0UHyJsqgVCtl+NyOmfMZN9JbPpUH2L8MJcf555LMg3ocq4MJ4HBVHaAralSO+zLGEf
         IW8w+7EGLPLwlTAyvOhWRR1baJg9up3psFa/hzEhbYxNRkMc4Zo9hplxy6K2jV5/b0Dv
         g7OJldU02/4UmoY5mMWFmMDsjfQ9jhnQW2x7jlULcOiRxUTWoFgjLg6u5saMkUPhCQWa
         g4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmGgJvzXq1iMGVJs1Dm2uF1Desk7wBIQ6ArKFGrdEHI=;
        b=4aKkcNDsy7dDoELCuv1Vt9ELuHYRWgGF0IPczO69ee5Uuvdr/8B2VbsnJZhyosDjCQ
         hQFwbB+xCc3413etfKCS2j9oiFK1hZTKZORe1PhIbqP/semlyUCRScF+4y422NizD/La
         1DWoTvspm0RVS8r2Ph1ObWsH5oZ4PuEEBOEkhK3CoO5M8YTyH/MtGQwyIcV9zwc19OBv
         mms7hcY5MrHqo9pQ95oL6vgISyjHHauikCk4i7OPak7NJXGXRSeEae+ZCCyJQ4pfM5na
         3QjmLu4T6VM8YD92JK3tmCQGyfss1fac7sDLHigYIoYbZRAQcXDC2DElgwFnrJ5gN6HI
         rabw==
X-Gm-Message-State: ANoB5plJzQC/lSrhZlG6Dx11pfRItwikRyzzkDRKegLvx46vR2RgN8n1
	smjHVBDy1fc1OShZ45l5LLrKjA==
X-Google-Smtp-Source: AA0mqf5RM62IIWyqFgLtB7beWOBoZ6lEksUgu/JYJFO1T3PGJ9hrVnfHE7diWd3Ldd2pQphlHHhG3w==
X-Received: by 2002:a19:f716:0:b0:4b4:b5da:ea56 with SMTP id z22-20020a19f716000000b004b4b5daea56mr15557224lfe.547.1669551949494;
        Sun, 27 Nov 2022 04:25:49 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t27-20020a2e8e7b000000b0026fbac7468bsm873347ljk.103.2022.11.27.04.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 04:25:48 -0800 (PST)
Message-ID: <615eb86b-a00a-56bc-ae1a-9f0e4e86f77c@linaro.org>
Date: Sun, 27 Nov 2022 13:25:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] arm64: dts: amlogic: align LED node names with dtschema
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221125144141.477253-1-krzysztof.kozlowski@linaro.org>
 <3719828c-0ac5-34c9-a04b-251cbeb5f6ef@linaro.org>
 <a135f93a-235a-27b8-f649-69d62f6ebd30@linaro.org>
 <54f500cb-d7d0-8af1-eb58-99fbe71791a5@linaro.org>
 <CAB6niQ4808JEgdQEvRvaYqq8YmFCGo_YLnxXo+rjpSgxQxu+7g@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAB6niQ4808JEgdQEvRvaYqq8YmFCGo_YLnxXo+rjpSgxQxu+7g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_042552_770585_C877AE6E 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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

On 26/11/2022 17:03, Neil Armstrong wrote:
>>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>
>>> Aren't you maintainer of the platform? This means I should take care of
>>> this patch?
>>
>> Ah, this will be picked up by Kevin or Jerome? So this tag means only
>> Reviewer's statement of oversight, right?
> 
> Of course I'll pick it.
> 

So that's confusing to see Review which does not mean review, but
maintainer pick...

Reviewed-by means, I should take your tag and add to v2 or the
maintainer will add it when picking up.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
