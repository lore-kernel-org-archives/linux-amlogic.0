Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920B7C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jan 2022 15:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GIMyt/vjSCRXu4fxaLT9S3O2WsmXKn7XwyE1WIC1i4A=; b=c9NUQD3zbW3q/fRhQ9+JdQmjLn
	/fhLrJEDj6ILVvv6mTScXhh1O60d8tE0m43i2yVfWLOXKoCy2shUHooCgYctJMc1ETbJrq19mon2s
	QdyKHP1ld3XwgEjlGiDoGmU7+leRPLayMH3WSQ8eV3TedDDP5WUGhzw9hUuvP+ZDec13xn1V9NWdC
	qMt6LS7Odva5nxzo+PuTQ9T0eXwZsB1dinLgZQN71NaKHgd/d8YvXglKBUwTDgnG4aOrwEKHffqE6
	B3bPdCsw8ZDD2fsYMzvN2Xj25c8+seSkiJDE3Ygoimxj102yrpN8vZleG7AuxeD39+eOTTnP4bbDm
	QSVna2Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD6KT-00GAjo-9G; Thu, 27 Jan 2022 15:04:53 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD6KG-00GAgU-De
 for linux-amlogic@lists.infradead.org; Thu, 27 Jan 2022 15:04:42 +0000
Received: by mail-wr1-x430.google.com with SMTP id e2so5374446wra.2
 for <linux-amlogic@lists.infradead.org>; Thu, 27 Jan 2022 07:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UMKuVNBRdUmBO6bqf3G9634FTapek7K5cBdiVlU2Ubo=;
 b=XVmjh52EEkKaQ772bgoWhgWDVQBdgnYC9RXtQ1CvVwWl/h3j/mjYB2DTk6qOvAi0Co
 msl4NRedfE8JnPXCervBDSrFBia7d9dxBB9vF/8D+QFkOjKF9ptQnNyXmFlfudYvxYk9
 n0JElnOlUoyBS48QfaS3IQcZI8QYHyMsjGT7XjEDAI5INT9Q6CXTMRv5Jcco4dFdom0W
 P5CGkj4OKMt3+UzO7ASMscCMJWaxrj8USCNTFu1w/A2JFQzjxBcEqmt0LNQAvxwJWEYv
 tovGrSx99YIEUGCA0ejx10hdwqGnWVBh52ENy/9usgeL1mrYbXDUia/2LGhbfF1eTdmb
 f0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=UMKuVNBRdUmBO6bqf3G9634FTapek7K5cBdiVlU2Ubo=;
 b=b0GrpK2c7g7x0bUJ54DJ3hDXimTc3VR2KTJZfIjTpgesDh9kg6e8Mkg1iCOtSdNlAF
 nRG3piin5495G3eUcHvFAl2Le3JERlIEOzpu1YIbBxt8tR9FyJxZpqH1fe/FZXqOKLk1
 myy6kUtifzYwz8vr9+sdISANe01fDh9XImrqL27JRYNxhdmjnpbb8DaMCXqa28A5IuAT
 hrLbldeizBQ055TFlhtIynWkF5sr5xrr83Md+8aZ0W+e2Eb1SgexdoQdjVq8BMsH56vk
 7di8L+5hcIZHE0I1r3/hG8B8v0P5Qjmlr665XzP8u5G3pLNcBzE6VcrbzZyS1H4uMqjJ
 ggfg==
X-Gm-Message-State: AOAM532s0Dgvidn397X4pdg8Qj0Da/MDgU8/uIZpP3DagTJKJwTLLg2V
 3x3k/CqyUJs+QUu7dSA8lASaGQ==
X-Google-Smtp-Source: ABdhPJzZQjRi9UhDrokMlFUxWckDfeLDzyDDR2wuvAbpOMyGH3UhLZdqGjN9AF/IzsuC5bT6IQ3vYQ==
X-Received: by 2002:a05:6000:2ac:: with SMTP id
 l12mr3563417wry.371.1643295878409; 
 Thu, 27 Jan 2022 07:04:38 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:bd6:ac2b:1e48:f2ff?
 ([2001:861:44c0:66c0:bd6:ac2b:1e48:f2ff])
 by smtp.gmail.com with ESMTPSA id n14sm2480842wri.75.2022.01.27.07.04.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 07:04:37 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: meson-sm1: fix wrong GPIO domain for GPIOE_2
To: Dongjin Kim <tobetter@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <YfKPSvnFKOaLr74+@anyang>
 <dcb67b4e-6a46-86a6-b21f-99263cc9ff05@baylibre.com>
 <20220127145338.GB2417963@paju>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <ec1e087f-efee-fb02-9ae2-3039725538e4@baylibre.com>
Date: Thu, 27 Jan 2022 16:04:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220127145338.GB2417963@paju>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_070440_542687_978B735A 
X-CRM114-Status: GOOD (  18.37  )
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

Hi,

On 27/01/2022 15:53, Dongjin Kim wrote:
> On Thu, Jan 27, 2022 at 02:00:11PM +0100, Neil Armstrong wrote:
>> Hi,
>>
>> On 27/01/2022 13:25, Dongjin Kim wrote:
>>> GPIOE_2 is in AO domain and "<&gpio GPIOE_2 ...>" changes the state of
>>> GPIOZ_14 connected to INTR of 'RTL8211F' on ODROID-HC and TF_PWR_EN of
>>> 'FC8731' on BPI-M5
>>>
>>> Fixes: 1f80a5cf74a6 ("arm64: dts: meson-sm1-odroid: add missing enable gpio and supply for tf_io regulator")
>>> Fixes: 976e920183e4 ("arm64: dts: meson-sm1: add Banana PI BPI-M5 board dts")
>>>
>>> Signed-off-by: Dongjin Kim <tobetter@gmail.com>
>>> ---
>>>  arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 2 +-
>>>  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi     | 2 +-
>>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
>>> index 212c6aa5a3b8..5751c48620ed 100644
>>> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
>>> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
>>> @@ -123,7 +123,7 @@ vddio_c: regulator-vddio_c {
>>>  		regulator-min-microvolt = <1800000>;
>>>  		regulator-max-microvolt = <3300000>;
>>>  
>>> -		enable-gpio = <&gpio GPIOE_2 GPIO_ACTIVE_HIGH>;
>>> +		enable-gpio = <&gpio_ao GPIOE_2 GPIO_ACTIVE_HIGH>;
>>>  		enable-active-high;
>>>  		regulator-always-on;
>>>  
>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
>>> index bf29afac645f..d4349b355e4a 100644
>>> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
>>> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
>>> @@ -52,7 +52,7 @@ tf_io: gpio-regulator-tf_io {
>>>  		regulator-max-microvolt = <3300000>;
>>>  		vin-supply = <&vcc_5v>;
>>>  
>>> -		enable-gpio = <&gpio GPIOE_2 GPIO_ACTIVE_HIGH>;
>>> +		enable-gpio = <&gpio_ao GPIOE_2 GPIO_ACTIVE_HIGH>;
>>>  		enable-active-high;
>>>  		regulator-always-on;
>>>  
>>>
>> Thanks for the fixes,
>> can you send 2 patches fixing each files instead ?
>>
>> Thanks,
>> Neil
> 
> Sure.
> By the way, I would drop a fix for 'meson-sm1-odroid.dtsi' since I found a
> patch just now.
> https://patchwork.kernel.org/project/linux-amlogic/patch/20220127130537.GA187347@odroid-VirtualBox/

Sure, you sent the v1 at the same time, and he just resend a new version.

Neil

> 
> Thanks,
> Dongjin.
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
