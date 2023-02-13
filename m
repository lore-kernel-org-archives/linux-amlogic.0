Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A087C636D4
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Feb 2023 11:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vId9QnceU2ZUlvbjLjnYVoWuTOJCzWSqu2rTkbH5odg=; b=NsPQgbhndYnEpK
	hAfnyhnUzIOnxo1xJ69EewSO4sRUz7V/vULr58+HSvN5YuWci9pD8DBcwgpozd0Zpr5eL8zj8T010
	mJUo7zFK7l9K34FgFo/9bqVpEl+kAG6LB++4uMiAkk9qyoAf4vAfuSbeQFFikwzfvudTEPzxyAhgw
	/mZKhcIsWfO8G+5aNUVP+RaBZNWvemplO9/rw6MKf99gqbZtaHPtzR66cem7YOWNK9U3JyalsVrY9
	N7lwRc8znmm1QXH8H5zOHjLX0aY1Phpep45hEEBtLmyuO8oHZJi1kXw+mECkoxY98984bVSiq0Fv/
	j0U7X7sD1MIX5HuI+Cxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRWfT-00EKOS-4H; Mon, 13 Feb 2023 11:06:43 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRWfO-00EKLl-Kg
	for linux-amlogic@lists.infradead.org; Mon, 13 Feb 2023 11:06:40 +0000
Received: by mail-wr1-x42a.google.com with SMTP id bu23so11734206wrb.8
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Feb 2023 03:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E1kDvgegzp8HWEVBLAzdwEfk/Chnh0ftRbXNmWsD8bo=;
        b=jOJiSmkmlAxMHR9ru/D7S60yONeX2jqwTsk0E8f9Y0JLDobSdLnNTVoz5yM4pzYvtH
         VSJS7AiseXZJGTo1RKr2M6VDP0/4QEFXCahPPyQJY/pLaURrO3RKCTxRfxXIGEWxPoVd
         7Yeo0HFE/uJ4Q0xMpXGl5nGaYQNBlewpkscThoMr2muEjUIYHnd6H1/adHNSPbOdU8ia
         u5Lv/uAAB0+NfGIRVOlxPxfbHCBmuZlo6xreNhVWT1GJgSaMYpl3dBr4gSZAbI0d0tkM
         FrnTDJ7xxal3f8GpHjv3qhl0DOtVg/fnGyyCg9u0Ng41JELx8N8VBC5DqYveIyEvIbZA
         TOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E1kDvgegzp8HWEVBLAzdwEfk/Chnh0ftRbXNmWsD8bo=;
        b=JPymBZga+9Js+np1N/RL9rud5Cxa1zLLXgzzrF+y0YsO+ucY6Ep0cvfdWMPpymVxu5
         xby3YE8FbDUdMnb7bmkp9Qd31e2xCrVGxNpmyScTrgHyyKx+m3U0UpRYYsWPVBBRHDmN
         NEFu0OnFZxSOJczxB4EZsXINPN/NgwWkLERT29WUk+SuJjMuTPD7YfwIOblQ2k2HZuvG
         HRhYVEJnlYU5cHZXxo6aCSR/RxBTfnpDKohzptMpastc3pU3SU4M366taPgW8ft+hSlc
         HjziM/wJdbtVHf7ISePcVfGnMMiVgjenLxEXH5OAZIvtjFtW5HSO4DskWfAJUPokkx+a
         jZSQ==
X-Gm-Message-State: AO0yUKUqhBHjfdjtqRojjS3rNg+zgBdPi72NBX8nnMHfwJ0hOG5No2h5
	x2wuURn3YS1QZdPc6X8Pi+fSRQ==
X-Google-Smtp-Source: AK7set/w9dCD3bxFSNonkfKDpD4T2DRe0uU35pPoh3abEZ0xxxlBew9+lTJCPWJGeRsvZUh6Kx49DQ==
X-Received: by 2002:a5d:5545:0:b0:2c5:3cfa:f7dc with SMTP id g5-20020a5d5545000000b002c53cfaf7dcmr10443422wrw.7.1676286397447;
        Mon, 13 Feb 2023 03:06:37 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z17-20020a5d6551000000b002c54c8e70b1sm7211342wrv.9.2023.02.13.03.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 03:06:37 -0800 (PST)
Message-ID: <5d6ca298-19c2-3fcf-b025-dd72fa0784eb@linaro.org>
Date: Mon, 13 Feb 2023 12:06:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 6/6] dt-bindings: soc: amlogic: update sysctrl
 clock-controller subnode type
Content-Language: en-US
To: neil.armstrong@linaro.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
 <20230209-b4-amlogic-bindings-convert-take2-v1-6-c4fe9049def9@linaro.org>
 <f18230c9-7c9b-9e59-993f-24d40b74ba9d@linaro.org>
 <039e9f93-5b97-bb5e-e3c0-b8bf2c52a2a3@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <039e9f93-5b97-bb5e-e3c0-b8bf2c52a2a3@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_030638_717389_4D4D4E4B 
X-CRM114-Status: GOOD (  14.32  )
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

On 13/02/2023 12:03, Neil Armstrong wrote:
> Hi,
> 
> On 13/02/2023 12:00, Krzysztof Kozlowski wrote:
>> On 09/02/2023 14:41, Neil Armstrong wrote:
>>> Since the clock controllers are now documented define the right ref
>>> for the clock-controller subnodes and fill up the example node.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml         | 15 ++++++++++++++-
>>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
>>> index 672eabd90c09..57eae355f1b9 100644
>>> --- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
>>> +++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
>>> @@ -43,6 +43,10 @@ allOf:
>>>               - amlogic,meson-gx-hhi-sysctrl
>>>               - amlogic,meson-axg-hhi-sysctrl
>>>       then:
>>> +      properties:
>>> +        clock-controller:
>>> +          $ref: /schemas/clock/amlogic,gxbb-clkc.yaml#
>>
>> You just added this binding. I don't understand the split.
> 
> It's a chicken and egg problem, the clock controller bindings (patches 4 & 6)
> I've added the system-controller top node in the DT example, but this
> example won't be valid until I add the system-controller bindings.

Just drop the parent node or even entire example.



Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
