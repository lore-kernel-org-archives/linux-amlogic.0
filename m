Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C890D30000
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Oct 2024 12:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AC2RurxlYk43T/85YGQgCs/9XGz63C2w5UKwQr74aYY=; b=3H3csSI9LXPLqS
	feANLqmGZt82L7o2uZ1rBGrOkVDhM+FSviSbeOHmw8lGJubRXGRKBghIsYROe0zaFO3UOY33ghteN
	VqYldQkzMy/V/S24T9iPM5lYaS/JE+G623IgXVfywXKm87bvvhARYsvcXNauX+7w/hDeCPwOJWt/5
	4BlJHacDbv0+0NLpTsWvvh7N4LNm+7DoQoRq1uoOZAdDqqkIgNMaSoHfLWMPCk4eciiaJjGObqJdJ
	y93XfrVmWHL23B70YC9SAa5X3Bkj6wAaenpt/B2l2zfYU7VmWgqIz5WZrmQPY4rebgV3WBgod9lIY
	bmFMlcXIxft1gDM+CMcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1m5J-00000000kWT-39MU;
	Fri, 18 Oct 2024 12:28:01 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1m3p-00000000kOI-1qQf
	for linux-amlogic@lists.infradead.org;
	Fri, 18 Oct 2024 12:26:32 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4305413aec9so21642115e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Oct 2024 05:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729254388; x=1729859188; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5YS74a7m9Z0FRUCbatwYpptX+BA9xoFlV0gIpbemQJQ=;
        b=bbwJRXHL8hP/Tf7g+oc5JYejeuAqgpdtGholeaelAC0hVOVEcXnyyRerIdpBjvWQmG
         MeVFzEmOlTXqjtwX42gZXXZg3OYE0+2h0jYjlBjfjkdkSJO+rJbznzaTI1DsmL3yA34/
         YUWHzFzB3RT/acGlXlcHmfe2QpHvt8zTKLZLq3oneY25aaf0EMHgEx4Jw9YB5LL1Uxfu
         ERXmHg61YfeNj/nJ4zaKYzVeKsNzUewQT/RKopb6dWO8Bv9EqzJqc9P/4TGgB2QYVLfK
         WJRQd0V1GTggiEWmlNMuhI7+Ye5hUckN5yEeadgckDsAx59Z2ZdTkhQ1j8k8GNIY5KPm
         xjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729254388; x=1729859188;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5YS74a7m9Z0FRUCbatwYpptX+BA9xoFlV0gIpbemQJQ=;
        b=hol6SRoxbibfKOTwbolDQce3qjEQTMV453zXfyE8yYXDbPNiBtxaq3FLwTlBusih8x
         VaiS+Vs5bcotujiZiHFU1sTeRdUNtWDaiUJ7jrZ7oBWKCN91k4ZDVYimFiiwpUQ/bV9O
         bfB1IA56pksjQMEvaguylpANtVHvSqvw7Ice3sAXXNYIR2K1x9/KAyjoTZrqxYkZY9KZ
         I1mMOlU90UZ+J/cNXJwvG0q63TIFVrPQP1Qt38cn//Livyr0BJmN6vuFfc5w67Q+FMVm
         o3eCnoT/dJi/i/GRL8hpgYxGR6zWPR0+h8KpEFDFKFkTtlbSDlm5juhXYFDnuFe3jiBJ
         JdiA==
X-Forwarded-Encrypted: i=1; AJvYcCVrcJooj9zxm2a8N7x+VR+ntJo87/Ic7QCkKkdIbJG/EcGWPdcYtvOlz12K8/Gy+JcOxpS+0rur5/GDuGyG@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5H3jr1goE0uIpC1Cz4loBhIwOE0J1lSUNmbXqUrwNLond6+Ui
	atRNUl+x2Il3xJahuAfq2UxRkEsp7rpZQz7PD4swAEHyun13Zt1EZE8Rg7WgG+c=
X-Google-Smtp-Source: AGHT+IH0D342MuhKUa3UYsaToIehwKc/N4IfojfzV6RoQLZSnVuOV356C0GEf4yeThmx1zhx7T5kGg==
X-Received: by 2002:a05:600c:4687:b0:42e:d4a2:ce67 with SMTP id 5b1f17b1804b1-4316164dd02mr18506575e9.17.1729254387614;
        Fri, 18 Oct 2024 05:26:27 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:6e2b:4562:2d66:575e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e4fe8bsm22609435e9.44.2024.10.18.05.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 05:26:27 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,  Linus Walleij
 <linus.walleij@linaro.org>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Bartosz Golaszewski
 <brgl@bgdev.pl>,  linux-gpio@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
In-Reply-To: <d654d2b2-977b-44c0-8b01-b26f5eb0a3fe@kernel.org> (Krzysztof
	Kozlowski's message of "Fri, 18 Oct 2024 12:13:14 +0200")
References: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
	<20241018-a4_pinctrl-v3-1-e76fd1cf01d7@amlogic.com>
	<4a79f996-9d82-48b2-8a93-d7917413ed8c@kernel.org>
	<1jttd9rein.fsf@starbuckisacylon.baylibre.com>
	<4127b448-a914-4c69-b938-29512995326f@amlogic.com>
	<1jmsj1rclh.fsf@starbuckisacylon.baylibre.com>
	<d654d2b2-977b-44c0-8b01-b26f5eb0a3fe@kernel.org>
Date: Fri, 18 Oct 2024 14:26:26 +0200
Message-ID: <1jiktpr40d.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_052629_761940_3122DF01 
X-CRM114-Status: GOOD (  21.26  )
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

On Fri 18 Oct 2024 at 12:13, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 18/10/2024 11:20, Jerome Brunet wrote:
>> On Fri 18 Oct 2024 at 17:01, Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:
>> 
>>> Hi Jerome,
>>>    Thanks for your reply.
>>>
>>> On 2024/10/18 16:39, Jerome Brunet wrote:
>>>> [ EXTERNAL EMAIL ]
>>>> On Fri 18 Oct 2024 at 10:28, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>>> On 18/10/2024 10:10, Xianwei Zhao via B4 Relay wrote:
>>>>>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>>>>
>>>>>> Add the new compatible name for Amlogic A4 pin controller, and add
>>>>>> a new dt-binding header file which document the detail pin names.
>>>> the change does not do what is described here. At least the description
>>>> needs updating.
>>>>
>>>
>>> Will do.
>>>
>>>> So if the pin definition is now in the driver, does it mean that pins have
>>>> to be referenced in DT directly using the made up numbers that are
>>>> created in pinctrl-amlogic-a4.c at the beginning of patch #2 ?
>>>>
>>>
>>> Yes.
>>>
>>>> If that's case, it does not look very easy a read.
>>>>
>>>
>>> It does happen. The pin definition does not fall under the category of
>>> binding.
>>>
>>> https://lore.kernel.org/all/106f4321-59e8-49b9-bad3-eeb57627c921@amlogic.com/
>> 
>> So the expectation is that people will write something like:
>> 
>>  reset-gpios = <&gpio 42 GPIO_ACTIVE_LOW>;
>> 
>> And others will go in the driver to see that is maps to GPIOX_10 ? the number
>> being completly made up, with no link to anything HW/Datasheet
>> whatsoever ?
>> 
>> This is how things should be done now ?
>
> Why would you need to do this? Why it cannot be <&gpio 10
> GPIO_ACTIVE_LOW>, assuming it is GPIO 10?
>
> Bindings have absolutely nothing to do with it. You have GPIO 10, not
> 42, right?

That's what being proposed here, as far as I can see.

GPIOX_10 (not GPIO 10) maps to 42. If this goes through, for DTs to be
valid in any OS, all need to share the same definition. That looks like
a binding to me.

On these SOC, gpios in each controller are organized in bank with
different number of pins. So far, this was represented as single linear
array and that was not a problem since the mapping was part of the binding.

Are you suggesting 2 params instead of one ? something like this maybe ?

reset-gpios = <&gpio BANK_X 10 GPIO_ACTIVE_LOW>;

This means this A4 controller will be software incompatible with the
previous generation. It will need to handled differently eventhough the
HW is exactly the same.

Note that some form of binding would still be required to define the
banks which are referenced by arbitrary letter in doc, not numbers.

>
> Best regards,
> Krzysztof

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
