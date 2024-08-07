Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E5FC52D6F
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Aug 2024 07:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZC0rnnYtAsCuHYES5uNXkZXsP94u87fVTfpqGC0feS4=; b=noviL3mwqoyx+k
	dqajqMVqfDJHJ2fr0/oj8rIc0u8l4uQNyfsQf8hlbcCRxwnt0NdzkWVPNYo8hYYc8hHZjLkCSPLe0
	SZeUAQVLZOkhLVDvha4jx3dP1pLMMSHnBwF78oxXN2SGF85xkJkpQZppYgMn6PasVafapCAy5dMfe
	XLGAIukYpcb8ontoCvt3ijSjmY6ku73u7hLpha5m5BZQCj4xVWi32YK5TedJTRRo8tEW3KAzuEZ+N
	rrsvmEPEwKKGs0KdxhLOwkYo19bjkw3so52KzkGs9B91JC+3ps75IjoOkEGE8N8Gp1Trn/zvBncii
	8x6I9RJ3zBzwruB42LyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbbXf-00000004Haf-0Hao;
	Wed, 07 Aug 2024 07:57:07 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbbX4-00000004HUR-4AXk
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Aug 2024 07:56:34 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so14102235e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Aug 2024 00:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723017389; x=1723622189; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ktBsuVntx5CKBaIkvERUELLULJMhvpoXFdOfuPtWMM=;
        b=y5w9qihITQSfofvdBJ2JiZ27CWEnGqcitLVTZTLjifJLE9EmnidEwOmZL5jb2Qzd15
         hvnLU+lXVdIdhylMbrnnuUHnYKZ7dEJHjrg9FZACSqtwywP1cY8zFwEiHHyEQlX26T63
         HARdNE2GkYAMgi0JV0iNTm/fuaDlKEa57KwsSPwIaN1w9S4aapJcZjHX1NGgeeibBxo2
         Rajff7vXJIQdDZQYPHI6IsfBDEWi41zBxHTnL4YZ8bUEzqIYo+viUUZD/NcGpR4PqUgb
         YZS/xTm03si8yJkdEEN18cbWIN7Uv2uiJh1bjKx2L0OG9zP8QDBU0sd61tOroLk7gSHa
         AOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723017389; x=1723622189;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ktBsuVntx5CKBaIkvERUELLULJMhvpoXFdOfuPtWMM=;
        b=lr2MN2/S9Q6w9LkgMjeUIuS98SNXQtPT6Vv1nfOiV6ux/J/BCW8ow6Qa90kOIPxx7c
         6ZMJDd6sgPVMxgShS1FFjyKO0TeVmw/bt82Q3HI22p0AdmkJLy4wF/RDDuPsCM+8WfUv
         P2PP1VjGCWzU/Bi+NFV9ZJPHSGgfeeGQIEmlXV6AJl9JbjAIiOQ0/UYnVtcP2xeczdUA
         P69MqAW6IrFvWprlea1SqM8YpFrk5gS/c3GTTcti43ShWY7lbz9ezk4orHrHOInw5R+z
         +Zh0EgJvdF7W+zythHtl89aY35oYT3tFEVyEPUn59CpCE6c7MF5NgbGiVPF1A2y1cm8A
         benw==
X-Forwarded-Encrypted: i=1; AJvYcCVaiEkNjGfVOigIX2m4ThT+IIC4DUlhrweiPz3nJyigHF/JELW9U3XPCyu8gEobS085AaKvj0Inxyw4HvLSWMkXQTQ4GkA8uwaJRtkVit/IvZQ=
X-Gm-Message-State: AOJu0Yxf3afsN0LJQyOWXV/c3/rHuaE//7m9F1smSrLR+TU4Is0dR6at
	467F/4OOpeMR4QeTForSmyW/twXalThArGhMexIlGXc1ucPG7zVPY1FVw5qmiBU=
X-Google-Smtp-Source: AGHT+IGskVKryQc7c2Sq7ODREtI2rDRljGWb2FWdDD6mhqLi5bMAsqY/qQptHY9YdskM5dh8W7Fw0A==
X-Received: by 2002:a05:600c:4713:b0:426:593c:9359 with SMTP id 5b1f17b1804b1-428e6b954cfmr178276335e9.32.1723017388917;
        Wed, 07 Aug 2024 00:56:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:90f1:3c4c:261c:b0f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42905991434sm16305765e9.30.2024.08.07.00.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 00:56:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,  Krzysztof Kozlowski
 <krzk@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,  Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Chuan Liu <chuan.liu@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: fix C3 PLL input parameter
In-Reply-To: <2da06dac-7a1a-461c-956d-13b74320723e@linaro.org> (Krzysztof
	Kozlowski's message of "Wed, 7 Aug 2024 07:44:18 +0200")
References: <20240806-c3_add_node-v1-0-c0de41341632@amlogic.com>
	<20240806-c3_add_node-v1-1-c0de41341632@amlogic.com>
	<b63fe216-ee29-489e-a175-e1525ac12722@kernel.org>
	<86b01ecb-6ca8-496e-b3a8-0b21bb951a60@amlogic.com>
	<2da06dac-7a1a-461c-956d-13b74320723e@linaro.org>
Date: Wed, 07 Aug 2024 09:56:27 +0200
Message-ID: <1jikwczrys.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_005631_046128_7A641B8B 
X-CRM114-Status: GOOD (  20.87  )
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

On Wed 07 Aug 2024 at 07:44, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 07/08/2024 03:55, Xianwei Zhao wrote:
>> Hi Krzysztof,
>>      Thanks for your review.
>> 
>> On 2024/8/6 21:10, Krzysztof Kozlowski wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On 06/08/2024 12:27, Xianwei Zhao via B4 Relay wrote:
>>>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>>
>>>> Add C3 PLL controller input clock parameters "fix".
>>>
>>> What is "parameters" here? Why you are adding it? Is it missing?
>>> Something is not working?
>>>
>> Yes. The previous submission was lost.
>
> What submission is lost?
>

He means it was just forgotten in the submission and noboby picked up on
it at the time. He is not not trying to sneak anything new. That input
is used everywhere in the driver and nothing would work without it.

It is just an honest mistake that he is trying to correct

Indeed the description could certainly detail this a bit more

>> 
>>>>
>>>> Fixes: 0e6be855a96d ("dt-bindings: clock: add Amlogic C3 PLL clock controller")
>>>
>>> Why? What bug are you fixing?
>> 
>> The input clock of PLL clock controller need the clock whose fw_name is 
>> called "fix".
>
> Then explain this in commit msg.
>
>>>
>>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>> ---
>>>>   Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml | 7 +++++--
>>>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml
>>>> index 43de3c6fc1cf..700865cc9792 100644
>>>> --- a/Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml
>>>> +++ b/Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml
>>>> @@ -24,11 +24,13 @@ properties:
>>>>       items:
>>>>         - description: input top pll
>>>>         - description: input mclk pll
>>>> +      - description: input fix pll
>>>>
>>>>     clock-names:
>>>>       items:
>>>>         - const: top
>>>>         - const: mclk
>>>> +      - const: fix
>>>
>>> and that's not an ABI break because?
>> This is "fixed" clock.
>> I will modify "fix" to "fixed",in next version.

No keep the original name. No reason to change it and make more of a mess.

>
> With "fixed" it is still ABI break, right?

It is an ABI break but on a new and immature platform.
Noboby could really use that platform at this stage, so nothing is going
to break on anyone really.

>
> Best regards,
> Krzysztof

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
