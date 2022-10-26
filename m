Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B588C38A2D
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Oct 2022 08:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Spasb/z+GWc7PqkD4CPyF5v1kNCBvtAccDNR0WlAtcA=; b=aJCybcDnpA2yE0WhwG0ETeRpDU
	ydXZwR3OIQR0Yn4as/lHnRegl3bX9Ly497taMy5KmCAmnlrhOjpNngKYIu/JOAPTl9BgVCfQbC5Mn
	6fvrDNVly4HTK0yXEGbMafiBH+9ioESTzwcbUtLNPHOM88TB2vvWqUJ5OPikfOzanhW3xeuuwbt5Y
	48WOjGGG0ZClDDiBpI8wn3EnPowK/nwdtvLCU0bb0ZnkqmJng7mnui060smorNCTVIN7O64h10Dfl
	us1/93oTdfK27CAQuxQ9U90ZhnkQuuo75kjio23MpBPLpLoU9kPTL7slCRGb9Oz4Hd9dILwzRXQ6z
	HrERqCwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onbNQ-008U84-VE; Wed, 26 Oct 2022 08:03:04 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onbNF-008U4N-3U
	for linux-amlogic@lists.infradead.org; Wed, 26 Oct 2022 08:02:54 +0000
Received: by mail-wr1-x431.google.com with SMTP id g12so12188676wrs.10
        for <linux-amlogic@lists.infradead.org>; Wed, 26 Oct 2022 01:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YyPwO7rl+gX39UNWAmiOxo6E2JYfZJtVX93jxGyGRgU=;
        b=PuRDg6g8vE/Kmsy/HXW2aR4DBNamMoZxiJHU4GN0BUDeWEzc4IgxUwgy7Ixwjz4Ofw
         8x3MXAzIIB3n1TmHVTwoTcdDMby6OcEsRQAmxt1/qpkoouMO71atWLSLm9ox614DP4Eu
         x1lpKX834t/hf4dWr6qS8KhQgWWSxoxKQ1MUw+lJcx+pRJ6ayE7ig4zeUSub6t40aeMw
         aArsBRynHmBpxkTCqYLCHORe/tqFJmciiSPRbm/jZ8grRTY78VSpj0dMhZfsDtlDLTSS
         PIcMVWAHuqkSMu0ajNpolEaYdB/IqDFIUkZ6dM0z00AWTxdKduOtW5U8DHK9cxkw+M4z
         mfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YyPwO7rl+gX39UNWAmiOxo6E2JYfZJtVX93jxGyGRgU=;
        b=5l0rz57RaN+K0XKZS8sVVvLPZY2+KuTwISGfoLoZZNcJhrVdaOnlMpJZLv1fGY0rM2
         Nwd2tU+1lZT1x/pxChpQucsalr4TN1qjYcdM40J/H1wSvrn9T6C4jUci6A563qOHbv7w
         5ZqbMHs8PzM2f0PRmp/nVVEuHx4BFyS46A+nUUVY/oRQw3RzRvpwZ5gs8B41HIvvjbnL
         cxgAyjMLd6MDOR+owrCFpz1q4yVC9M1qcQ6X8cuULNu/b4CcA2GL208jYSPBm7I1Wddo
         IigT1NYDc4fhPkwZfvjyA+Xn7cG5vQQx0pxpuJROC93DG4gGzGEJz3yTyglROQxkBQlD
         3+lA==
X-Gm-Message-State: ACrzQf26tM0P77XheFVTRFgTpCerUbXapUkEnaxV6n4FfE+Bj+elx4y7
	pXdTs4cnOVPUMQb359Y+VazDgA==
X-Google-Smtp-Source: AMsMyM66kvpQWFo5u0OfUq/T3nHMOYZKy3o5Z+LNI+SLBAqxTTBw+3OHccmEWCRwfakgmYIBIojMlA==
X-Received: by 2002:a5d:5f03:0:b0:22f:8ad4:bd46 with SMTP id cl3-20020a5d5f03000000b0022f8ad4bd46mr27097794wrb.120.1666771368745;
        Wed, 26 Oct 2022 01:02:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ce41:a140:b67e:6c4b? ([2a01:e0a:982:cbb0:ce41:a140:b67e:6c4b])
        by smtp.gmail.com with ESMTPSA id f12-20020a05600c4e8c00b003b95ed78275sm1201579wmq.20.2022.10.26.01.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 01:02:46 -0700 (PDT)
Message-ID: <5d2ffeca-b41c-20b4-454b-703c39bbb29e@linaro.org>
Date: Wed, 26 Oct 2022 10:02:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCHv3] arm64: dts: meson: Enable active coling using gpio-fan
 on Odroid N2/N2+
To: Anand Moon <linux.amoon@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Dan Johansen <strit@manjaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221022084737.1028-1-linux.amoon@gmail.com>
 <CAFBinCBu_-0m9JeAr5kd-v7Z5LTi7w0WmmUYybW_kL4KJXXpOQ@mail.gmail.com>
 <CANAwSgRzdD0FWg+z6hTFs7KvpsD64bChX-k0dPXJfACXZH2zbQ@mail.gmail.com>
 <CAFBinCCNJiL-ZKRYesQAwys6bBMpYHJbUDK-Zi_VhGDVSvF7uQ@mail.gmail.com>
 <CANAwSgTLTCA9=WvWXcR-40baauN3kAk2qx9k4FQOPCa1+_O0Yw@mail.gmail.com>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <CANAwSgTLTCA9=WvWXcR-40baauN3kAk2qx9k4FQOPCa1+_O0Yw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_010253_216469_9EA1DFAB 
X-CRM114-Status: GOOD (  25.75  )
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

Hi,

On 25/10/2022 20:06, Anand Moon wrote:
> Hi Martin,
> 
> On Sat, 22 Oct 2022 at 17:22, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
>>
>> Hi Anand,
>>
>> On Sat, Oct 22, 2022 at 1:27 PM Anand Moon <linux.amoon@gmail.com> wrote:
>> [...]
>>>>> @@ -1982,7 +1982,6 @@ pwm_ao_d_10_pins: pwm-ao-d-10 {
>>>>>                                                  mux {
>>>>>                                                          groups = "pwm_ao_d_10";
>>>>>                                                          function = "pwm_ao_d";
>>>>> -                                                       bias-disable;
>>>> &pwm_ao_d_10_pins is not referenced anywhere so it seems that this
>>>> change has no impact on controlling the fan on Odroid-N2(+).
>>>> How did you test this change?
>>>>
>>> Ok I felt these changes affect the behavior of the pinctrl
>>>
>>>    * @PIN_CONFIG_BIAS_DISABLE: disable any pin bias on the pin, a
>>>   *  transition from say pull-up to pull-down implies that you disable
>>>   *  pull-up in the process, this setting disables all biasing.
>>>
>>> I mapped this is linked in pinctrl driver, pwm_ao_d_10_pins GPIOAO_10 see below
>> Yes, I understand this part.
>> My concern is: &pwm_ao_d_10_pins settings only become active when this
>> node is actively referenced. You can even see it in your output
>> below...
>>
>> [...]
>>> pin 10 (GPIOAO_10): (MUX UNCLAIMED) aobus-banks:1958
>> This shows that it's used as a GPIO. If the &pwm_ao_d_10_pins setting
>> was used then it would show "function pwm_ao_d group pwm_ao_d_10"
>> (similar to what GPIOE_1 shows in your output)
>>
>> If you want to know if a pull-up/down is enabled you can look at the output of:
>> $ cat /sys/kernel/debug/pinctrl/ff800000.sys-ctrl\:pinctrl@14-pinctrl-meson/pinconf-pins
>> (I'm sure this can also be retrieved from some userspace tools, but I
>> don't know how)
>>
> 
> I now switch using pwm-fan with the local changes I am able to link
> pwm_ao_d_10_pins
> but now the issue is fan keeps on spinning on boot-up and stays on.
> 
> I can manually turn on off by using
> $ sudo gpioset gpiochip1 10=1   // fan on
> $ sudo gpioset gpiochip1 10=0   // fan off

By doing that actually override the PWM function of the pin and set it as a GPIO.

> 
> It is not controlled by the thermal tip as expected.
> I feel some configuration is missing in pwm-meson driver.
> Any input for me?
> 
> $ sudo cat /sys/kernel/debug/pinctrl/ff800000.sys-ctrl\:pinctrl@14-pinctrl-meson/pinmux-pins
> [sudo] password for alarm:
> Pinmux settings per pin
> Format: pin (name): mux_owner gpio_owner hog?
> pin 0 (GPIOAO_0): ff803000.serial (GPIO UNCLAIMED) function uart_ao_a
> group uart_ao_a_tx
> pin 1 (GPIOAO_1): ff803000.serial (GPIO UNCLAIMED) function uart_ao_a
> group uart_ao_a_rx
> pin 2 (GPIOAO_2): (MUX UNCLAIMED) aobus-banks:1950
> pin 3 (GPIOAO_3): (MUX UNCLAIMED) (GPIO UNCLAIMED)
> pin 4 (GPIOAO_4): (MUX UNCLAIMED) (GPIO UNCLAIMED)
> pin 5 (GPIOAO_5): ff808000.ir (GPIO UNCLAIMED) function
> remote_ao_input group remote_ao_input
> pin 6 (GPIOAO_6): (MUX UNCLAIMED) (GPIO UNCLAIMED)
> pin 7 (GPIOAO_7): (MUX UNCLAIMED) (GPIO UNCLAIMED)
> pin 8 (GPIOAO_8): (MUX UNCLAIMED) aobus-banks:1956
> pin 9 (GPIOAO_9): (MUX UNCLAIMED) aobus-banks:1957
> pin 10 (GPIOAO_10): ff807000.pwm (GPIO UNCLAIMED) function pwm_ao_d
> group pwm_ao_d_10
> pin 11 (GPIOAO_11): (MUX UNCLAIMED) aobus-banks:1959
> pin 12 (GPIOE_0): (MUX UNCLAIMED) (GPIO UNCLAIMED)
> pin 13 (GPIOE_1): ff802000.pwm (GPIO UNCLAIMED) function pwm_ao_d
> group pwm_ao_d_e
> pin 14 (GPIOE_2): ffd1b000.pwm (GPIO UNCLAIMED) function pwm_a_e group pwm_a_e
> 
> $ sudo cat /sys/kernel/debug/pwm
> platform/ffd1b000.pwm, 2 PWM devices
>   pwm-0   (regulator-vddcpu-a  ): requested enabled period: 1250 ns
> duty: 838 ns polarity: normal
>   pwm-1   ((null)              ): period: 0 ns duty: 0 ns polarity: normal
> 
> platform/ff807000.pwm, 2 PWM devices
>   pwm-0   (pwm-fan             ): requested period: 1250 ns duty: 0 ns
> polarity: normal
>   pwm-1   ((null)              ): period: 0 ns duty: 0 ns polarity: normal

This should be on the pwm-1, hence the "pwm_AO_cd" name, "c" and "d" and the
names of the outputs.

So you need to use 1 as first PWM phandle argument instead of 0.

> 
> platform/ff802000.pwm, 2 PWM devices
>   pwm-0   ((null)              ): period: 0 ns duty: 0 ns polarity: normal
>   pwm-1   (regulator-vddcpu-b  ): requested enabled period: 1250 ns
> duty: 1213 ns polarity: normal
> 
> I could observe a change in duty when we have stress testing the CPU.

Can you share the complete change you did here ?

> 
> Thanks
> 
> -Anand

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
