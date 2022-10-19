Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34A1C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Oct 2022 11:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UbnMJZUmpCuiVHu0+pzmY+2EyXe7o9X+rkqnjGVWDTA=; b=zIiuALzP89fMUDz8gsrMsOKqWH
	twjfiUtHcxdy9AIrkcHOq6Kg7/V4RWIDgIV9omiZB5pDTeEe87QK2/Bvx012xtzVbQdDcZIFsFKU4
	52fIhb+h3+99Stesx755RcHOq14tyoGbP3+pIKs/Dp+dnl5vSRGxwdPcY+wLSwi9iLcfy2CqZXjbQ
	bIoMnnRcFu49mZYshoD/O+qtYsIwj+7l7eG9jcyVj2xpzwG/Ir6kkT8jI0VtdNayzCkLYGbEwWzVC
	GkttWCz/6wTChTvOBSDayZhZ9HDfVq5Fz+RrGm7nsUCMhXccJUdV4h7LSJiBsCEPSNVWs8GdpwPzZ
	l254qvsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol6wc-000o9a-KR; Wed, 19 Oct 2022 11:09:06 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol6wZ-000o22-Vs
	for linux-amlogic@lists.infradead.org; Wed, 19 Oct 2022 11:09:05 +0000
Received: by mail-wr1-x429.google.com with SMTP id bp11so28528011wrb.9
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Oct 2022 04:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nXFGzSS2/u4bVAOtY2OBuez9ms3I4wdkLTeUoseOY3A=;
        b=dAwR0NuwlhUCkeBGQ6sh1KnbolBlC0LAC8xBMz3KtBC/YA7DtkI/75dUzKhfABYoom
         1F29QCCJDyyv+oypS5Q5HFIZOQNSuQKQ4piod2wBha4ZeUBgM48TzD5ThK0h0BkhezNU
         PPvBXURYF7ZhVtKZ2auhrbnW+kCQX9YH/YMA+3g38rm1DR6n5H2mVl0739mUr8a9cD9c
         lVv5PT/D3VkyWmo5RyY1K0fdMQsDmr3/bxK1O0JIEwJUhG4tu3D4c07HN5ZBm+EUvIjY
         k0fTnJ75ht8At1VXZANo36FPJ/BUUI7E4NEh3QjnekedsnJp64CKp4vs10F7ejxqNGoG
         4jjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXFGzSS2/u4bVAOtY2OBuez9ms3I4wdkLTeUoseOY3A=;
        b=6B8Yj1Ez/Yv9rhFmBnIBKF8Amzo5eRERoH2OMItPoLMxaGIEhdpxOBALJEPeG8zx0d
         U94QlUUEphOjBPngvMRcGGc8zx6MY3na6mEWcs+G7LAsz8lE341Xj/nVchYBllCT2SU6
         tATO675tK16+hCg9fydpUMv8oaeFQs1KCjwAol8iYVIozKw3+82LktYO2pcE5MSjW3jy
         18Ed+vu/7MrClw2rHA/s+2iyRycBKx7Dv6NRI01u2x5LuQmOprt9s2ljU/PrCDIpxcuX
         z2XxIltKGcOmFn1H8JM0+m3EnCQ0cYARN8uDin8Q46szfZ2QIUTiGq1oDCEKFyw8uOLD
         R5QA==
X-Gm-Message-State: ACrzQf2TnFwmLt8u+Q9QxhFnAtqwrc+MxBLVpsp45dTWIFIW8p/ATv0e
	fe0x8Q1C0hedGQz/m5LF3LlB9w==
X-Google-Smtp-Source: AMsMyM6R+x5K/qnLw6cpJ0EZKFwazhL6E5XYy0THkjOXdiu8+PRsamzUWkh2rEIb+FAD6dQLyr2RWQ==
X-Received: by 2002:a05:6000:1568:b0:22e:6691:57aa with SMTP id 8-20020a056000156800b0022e669157aamr4569795wrz.708.1666177740730;
        Wed, 19 Oct 2022 04:09:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b15b:4b56:592a:c397? ([2a01:e0a:982:cbb0:b15b:4b56:592a:c397])
        by smtp.gmail.com with ESMTPSA id e26-20020a05600c4b9a00b003a5537bb2besm15694485wmp.25.2022.10.19.04.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 04:09:00 -0700 (PDT)
Message-ID: <402500e8-b4fe-9b8f-d634-e329191af1b8@linaro.org>
Date: Wed, 19 Oct 2022 13:08:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: meson: Enable active coling using gpio-fan on
 Odroid N2/N2+
Content-Language: en-US
To: Anand Moon <linux.amoon@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221018195122.8877-1-linux.amoon@gmail.com>
 <CAFBinCCqXBk9Xq0k=NA3zGi8spwyPQN7dMVWcjE+pXkXYf+FKQ@mail.gmail.com>
 <CANAwSgSR6jHRQR6QgzUop_B4gcOsQnfc6LoUXrP0CSTasZkVfQ@mail.gmail.com>
 <CANAwSgRLZfon5qUFeKW9U9AbHvSa=uKVaVgqghVk554-H1LVKw@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CANAwSgRLZfon5qUFeKW9U9AbHvSa=uKVaVgqghVk554-H1LVKw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_040904_070511_3A992A6C 
X-CRM114-Status: GOOD (  20.37  )
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

Hi Anand,

On 19/10/2022 11:48, Anand Moon wrote:
> Hi Martin,
> 
> On Wed, 19 Oct 2022 at 08:36, Anand Moon <linux.amoon@gmail.com> wrote:
>>
>> Hi Martin,
>>
>> On Wed, 19 Oct 2022 at 02:46, Martin Blumenstingl
>> <martin.blumenstingl@googlemail.com> wrote:
>>>
>>> Hello Anand,
>>>
>>> On Tue, Oct 18, 2022 at 9:53 PM Anand Moon <linux.amoon@gmail.com> wrote:
>>>>
>>>> Odroid N2/N2+ support active cooling via gpio-fan controller.
>>>> Add fan controls and tip point for cpu and ddr thermal sensor
>>>> on this boards.
>>> In the schematics for board rev 0.6 [0] I cannot find any information
>>> about a fan connector.
>>> The schematics for board rev 0.3 [1] on the other hand document a PWM
>>> based fan connector on page 16.
>>> So now I am not sure whether your patch only applies to certain board
>>> revisions, the schematics are incorrect, etc.
>>>
>>> Can you please provide some details about the fan connector on
>>> Odroid-N2/N2+ and which hardware revisions are supported (and which
>>> aren't) by your patch?
>>>
>>>
>> Ok I got this wrong the schematics below there is pwm controller, not
>> gpio controller
>> GPIOAO.BIT10 (PWM)
>> I will correct the patch sorry for the mistake I did not look more carefully.
>>
> 
> As per the schematics GPIOAO_10 is controlled by PWMAO_D
> But looking into the datasheet [0] I could not find the relevant
> PWMAO_D pmw ip block to link the fan to the PWM controller.
> 
> [0] https://dn.odroid.com/S922X/ODROID-N2/Datasheet/S922X_Public_Datasheet_V0.2.pdf
> 
> I could get the PWM node but is not working for me.
> 
> @@ -547,6 +588,14 @@ &pwm_ab {
>          status = "okay";
>   };
> 
> +&pwm_AO_ab {

&pwm_AO_cd not _ab

> +       pinctrl-1 = <&pwm_ao_d_10_pins>;
> +       pinctrl-names = "default";
> +       clocks = <&xtal>;
> +       clock-names = "clkin0";
> +       status = "okay";
> +};
> +
> 
> Thanks
> -Anand
> 
> 
>>> Thank you!
>>> Martin
>>>
>>>
>>> [0] https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.6_20210121.pdf
>>> [1] https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.3_20190117.pdf
>> Thanks
>> -Anand

Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
