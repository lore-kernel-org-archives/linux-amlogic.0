Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38725D2F7ED
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Oct 2024 09:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3t+mnkPWoFhRy6fPyxU4spRSgoNrkKwg08NPH3eQ9Y=; b=ke/uPYYTNA0Uzb
	tT/9BKrmR6OivKSIyK3AK2Jp4/trKdnrdYsuRaaB2OAbFzy0erTumLHc5stdhPmzOS0fJoDNtqsOv
	CFLRy1HSOViFSnL1k7O6nluz5ELsXrfph/mLCoXr0Ms98iOITXBRw44ht90l2wMx5ZQjm7BFMHZMk
	Svqhxo7soaHU5GBH4ZQlZJAV3+pI0GyzJm+khkvDU1BlfnNbuhyczbSBR85qSqag8kYZ84kR2IEth
	Es09NG4moKeREHgIbszAsnlnLp/Z+JQsyfnate116zOCtwB8fBXnD3vFOGzy0w1q+ZUCZrKQzN02q
	xSlAq0iIFN6Jx+rgcPJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1jDD-00000000BKN-3w42;
	Fri, 18 Oct 2024 09:23:59 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1jAL-00000000Adh-3UMo
	for linux-amlogic@lists.infradead.org;
	Fri, 18 Oct 2024 09:21:04 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-37d50fad249so1342655f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Oct 2024 02:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729243260; x=1729848060; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/6CJlVFCdkLnXR5mIG5TznNaMuOGXx1zBL9Ig1xKknA=;
        b=Hvam9pxXx2LcQ+v4LMLYf6+Zi8pmNXkjzesQM66yqZuZ6Y6VmOrJLNDP2EMejrf+VZ
         lx+XWHuHEG3OgaSdbiW6Hpq0uVHz44kP49nIrHCiXojn8ECVj02R2sRmXrejHnG4L64A
         cdEsFShMgL/85K8tnorpsKbSuykbeFW4zzv+fCA65wga7bqck2zee/cyR5aBK9o4St6h
         Q9uhGVamEFmGgPpahACy/0S+TAkScr+Un6P6AreuxTGVe7DQRXYILrMFBHQJq8roSXBN
         U3FOuKqjQeUTBQ8ha0vV4dp56uQgf4WbAYCOEd9hZ0ZOJcZvCJMEiDBWBRcFtbfVCty3
         M5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729243260; x=1729848060;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/6CJlVFCdkLnXR5mIG5TznNaMuOGXx1zBL9Ig1xKknA=;
        b=R+IT6ZheWkI1DilL10316xTv/NbQXeMaqPwxh3xsrkBCiu4JKVERWwyy/cpjaCUCzl
         Sfzi2Zja2ErJHGTm1AopMnC+u8snIrJjIJ/jBSuASNC9nwwPMvWKv8EGWVTLVSXeJN//
         2lkxUnqTlO16G9yP3BiCQBM4NkzVgWqBXiyeUSbjasUcA1gDT3HkVivq2rFWf+sVq9EI
         K2ZwJeoNownAZuaAngiAKKbkEvP2DQRfze6LPTcAgDUgx0bwAsCCqicjo9bJXEyFcxh7
         Dq8dcz6PdWMAdTdrscohTf9W1hXuBRlnA26YqonM4Ckc44lGf5cA63Zqip7lNfAG8E4y
         dUXg==
X-Forwarded-Encrypted: i=1; AJvYcCVEVV5Ey8N5exLSXqSgaXCaPUreWD3v3Ck+umEI8G81fNdLquVKFS+xZMqe5mmttLPXSNe96mjL0QFS7lAc@lists.infradead.org
X-Gm-Message-State: AOJu0YynPvEgPWQmiUUXw9eGJd9XjmmJP+6UiwMtSo6dBTi5ec3cmkbT
	dUuBtLFXj2C2hlY5RM7Fb7KNCorxVhrTS4GGGtxoN2eDfjOFzE8D6OZKIRK+I/4=
X-Google-Smtp-Source: AGHT+IEjc8x6P1fiXZXvuy0RRWf3NASza2rMgKQJv+Xo7tziKvwCXEKE7ppPcNk2dKWu+ZlA7d9gqg==
X-Received: by 2002:adf:9bce:0:b0:374:c3e4:d6de with SMTP id ffacd0b85a97d-37eb47693ebmr1176601f8f.41.1729243259689;
        Fri, 18 Oct 2024 02:20:59 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:6e2b:4562:2d66:575e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0eccbasm1390562f8f.81.2024.10.18.02.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 02:20:59 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,  Linus Walleij
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
In-Reply-To: <4127b448-a914-4c69-b938-29512995326f@amlogic.com> (Xianwei
	Zhao's message of "Fri, 18 Oct 2024 17:01:09 +0800")
References: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
	<20241018-a4_pinctrl-v3-1-e76fd1cf01d7@amlogic.com>
	<4a79f996-9d82-48b2-8a93-d7917413ed8c@kernel.org>
	<1jttd9rein.fsf@starbuckisacylon.baylibre.com>
	<4127b448-a914-4c69-b938-29512995326f@amlogic.com>
Date: Fri, 18 Oct 2024 11:20:58 +0200
Message-ID: <1jmsj1rclh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_022101_902597_A9798D00 
X-CRM114-Status: GOOD (  18.46  )
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

On Fri 18 Oct 2024 at 17:01, Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:

> Hi Jerome,
>    Thanks for your reply.
>
> On 2024/10/18 16:39, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>> On Fri 18 Oct 2024 at 10:28, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> 
>>> On 18/10/2024 10:10, Xianwei Zhao via B4 Relay wrote:
>>>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>>
>>>> Add the new compatible name for Amlogic A4 pin controller, and add
>>>> a new dt-binding header file which document the detail pin names.
>> the change does not do what is described here. At least the description
>> needs updating.
>> 
>
> Will do.
>
>> So if the pin definition is now in the driver, does it mean that pins have
>> to be referenced in DT directly using the made up numbers that are
>> created in pinctrl-amlogic-a4.c at the beginning of patch #2 ?
>> 
>
> Yes.
>
>> If that's case, it does not look very easy a read.
>> 
>
> It does happen. The pin definition does not fall under the category of
> binding.
>
> https://lore.kernel.org/all/106f4321-59e8-49b9-bad3-eeb57627c921@amlogic.com/

So the expectation is that people will write something like:

 reset-gpios = <&gpio 42 GPIO_ACTIVE_LOW>;

And others will go in the driver to see that is maps to GPIOX_10 ? the number
being completly made up, with no link to anything HW/Datasheet
whatsoever ?

This is how things should be done now ?

>
>>>>
>>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> Best regards,
>>> Krzysztof
>> --
>> Jerome

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
