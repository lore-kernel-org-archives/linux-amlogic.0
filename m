Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F729C433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Oct 2022 08:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RtZGuDuqr2jGzgfr4Ew6j620XwKMDgpxmTK9vkWyjT4=; b=Q98SG9bhwuF5OvZFAGWkuFWDSa
	mebCXULVgUSo9kBvCB826jUf2lRY4xA/1bXO6oS7j23NvBPcDKWtKsfMG2Bgl3KfwcNPgfqvpg4K8
	Nx2mjT8mrPKvFpHrA3FLFnKcjf70+cXbwhFNjk5bPREDCc0UN4Oi5ZTR6u6KaZHc8KC/otzxck9Se
	xsaOIVxzhN9/SQgsh1gIWgvo+vO9W0xaP6RxpKSiKlj8E3gQWUpX2TC0JbugT6BizHcEm1g6UrmLL
	JTHCgRtzqRAkHQ8/3jOmLdEDPgWSqG7juuXXfpR+mfHoFlBn1FJajwInuHKoMAVASXNcp5AwR7yCX
	skupfnGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnYh-006Qr4-SN; Fri, 21 Oct 2022 08:39:15 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnYL-006Qfd-9Y
	for linux-amlogic@lists.infradead.org; Fri, 21 Oct 2022 08:38:55 +0000
Received: by mail-wr1-x42a.google.com with SMTP id v1so3670479wrt.11
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Oct 2022 01:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sbUO6Dk9wacjXHXZ2vzksSa8OSWDNuLkK+4lOLdOmPc=;
        b=NP/wWIdsBuvCI4fur1IEWKky461bIFRG7op7qLKecW2XkT8gvMZ2E0XgDk876FN01H
         lxSBW4R2JRWQLFq2AZwXQyQMSu53ExurT5Ye+oIQSdX3Nxa9ZC3haROrivTZVDSzcUq2
         TGF0AoTS+QXdfkmofuvn/CkNn6Kxs/xeiCDBLUDXMKOKlLS9dqtnqNmZIAtWjYdRW6WO
         PL0QwIA3BgtRNED6BpJunhlO8VwL7GB0J5q0kfElsbDqVrstIklgg2k9Ahdlo2hTvf61
         DhZb5IXpiBBEsnBu3cQuvJ2BJwXMrpSKANyDnxa3NZsolu6QgV6YhAlomRgIb1LNbJxd
         gKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbUO6Dk9wacjXHXZ2vzksSa8OSWDNuLkK+4lOLdOmPc=;
        b=Wr3DUwRqPkCe5N0Lcj6y55SgpKhWS+EdDuTKInBXm56Ma2S1eAqWwmHu54QwDThbS4
         o2KbjPPMz+o6VOK9FdRm1RfVsCMjU2KklhHr4RWEQblRV/ntJ1zMYbzmyYiXn1otMvgy
         aeik/zo9TbLrm8JODc/DxO+MUcBWSuLGO/611RcESvxLp+B6qrvjuweEDf1DGtaPwNqA
         xv/aBrhompRjHuT3u2tToyOtngOntCC5cu1A2SDIUDTilhjpx6bpBcYxCwzrn1kJay/B
         xVAMEPqFeHCkbqne46IeUhCj9BvLovYMe4zCdf5LM/ZYEHnp2cxwi51pztLcMyWg7uuQ
         cNeQ==
X-Gm-Message-State: ACrzQf3VKEYjyWTV9w5axsoZbg/Vr3Y0TkmX5Rk+kLYUwSSVRL4R8C/d
	p1wNW/kLaeulq3V5KH1CPCkcmw==
X-Google-Smtp-Source: AMsMyM7k1nPOKOFdlc7vwxPWLFbFhF4RxUJr5xqjxVc0GYiDzbCYzF2K9vcTPnLs/uYo92+HPlMnzg==
X-Received: by 2002:adf:d0c3:0:b0:22e:6ce8:f7a1 with SMTP id z3-20020adfd0c3000000b0022e6ce8f7a1mr11353672wrh.287.1666341529694;
        Fri, 21 Oct 2022 01:38:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8104:adb4:5d77:2050? ([2a01:e0a:982:cbb0:8104:adb4:5d77:2050])
        by smtp.gmail.com with ESMTPSA id i18-20020a5d5232000000b00236576c8eddsm329556wra.12.2022.10.21.01.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 01:38:49 -0700 (PDT)
Message-ID: <fcdbf59d-0512-1e35-b4fd-3317782c6e34@linaro.org>
Date: Fri, 21 Oct 2022 10:38:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: meson: Enable active coling using gpio-fan on
 Odroid N2/N2+
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
 <402500e8-b4fe-9b8f-d634-e329191af1b8@linaro.org>
 <CANAwSgQhWrzeRcpQSSAmfp+i3966dUQdtCLbcWwifQk=1ce=og@mail.gmail.com>
 <CAFBinCCyEVbc4N7TUEi=sbLFv7Rc-L=y-h8xBuZK446x1oLc2g@mail.gmail.com>
 <CANAwSgQ9gJvtdr_r1K0xxrDxQ6aBh5v=pR9aJSxRytia2PSbrg@mail.gmail.com>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <CANAwSgQ9gJvtdr_r1K0xxrDxQ6aBh5v=pR9aJSxRytia2PSbrg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_013853_356002_A2790121 
X-CRM114-Status: GOOD (  20.06  )
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

On 21/10/2022 07:07, Anand Moon wrote:
> Hi Martin / Neil,
> 
> On Thu, 20 Oct 2022 at 02:10, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
>>
>> Hi Anand,
>>
>> On Wed, Oct 19, 2022 at 7:17 PM Anand Moon <linux.amoon@gmail.com> wrote:
>> [...]
>>>>> +&pwm_AO_ab {
>>>>
>>>> &pwm_AO_cd not _ab
>>>>
>>> No it has a conflict with CPU_B (vddcpu_b) PWM
>> Uh, you're right. That's probably why the Hardkernel team uses a
>> software based PWM implementation: [0]
>> In hindsight they should have used a different pad either for VDDCPU_B
>> or the fan.
>>
>> I think the most pragmatic approach (since the "GPIO PWM" driver is
>> not upstream and I don't know if something like that would be accepted
>> upstream) is to use a GPIO based fan as you did in your initial patch.
>> Not sure what others think though.
>>
> 
> When I use gpio-fan  I get the following output with gpioinfo
> Feature it woks as expected.
> 
> $ .sudo gpioinfo
> ....
> gpiochip1 - 15 lines:
>          line   0:      unnamed       unused   input  active-high
>          line   1:      unnamed       unused   input  active-high
>          line   2:      unnamed     "enable"  output  active-high [used]
>          line   3:      unnamed       unused   input  active-high
>          line   4:      unnamed       unused  output  active-high
>          line   5:      unnamed       unused   input  active-high
>          line   6:      unnamed       unused   input  active-high
>          line   7:      unnamed       unused   input  active-high
>          line   8:      unnamed "regulator-tflash_vdd" output active-high [used]
>          line   9:      unnamed      "TF_IO"  output  active-high [used]
>          line  10:      unnamed   "gpio-fan"  output  active-high [used]
>          line  11:      unnamed    "n2:blue"  output  active-high [used]
>          line  12:      unnamed       unused   input  active-high
>          line  13:      unnamed       unused   input  active-high
>          line  14:      unnamed       unused   input  active-high
> 
> When I am using pwm-fan using *pwm_ao_d_10_pins* pin is not getting
> registered below hence it is not working on my end.

It's expected because it's not used as a GPIO but another function, you should look
in the pinctrl debugfs files to see it.

> 
> $ .sudo gpioinfo
> ....
> gpiochip1 - 15 lines:
>          line   0:      unnamed       unused   input  active-high
>          line   1:      unnamed       unused   input  active-high
>          line   2:      unnamed     "enable"  output  active-high [used]
>          line   3:      unnamed       unused   input  active-high
>          line   4:      unnamed       unused  output  active-high
>          line   5:      unnamed       unused   input  active-high
>          line   6:      unnamed       unused   input  active-high
>          line   7:      unnamed       unused   input  active-high
>          line   8:      unnamed "regulator-tflash_vdd" output active-high [used]
>          line   9:      unnamed      "TF_IO"  output  active-high [used]
>          line  10:      unnamed       unused  output  active-high
>          line  11:      unnamed    "n2:blue"  output  active-high [used]
>          line  12:      unnamed       unused   input  active-high
>          line  13:      unnamed       unused   input  active-high
>          line  14:      unnamed       unused   input  active-high
> 
> Thanks
> -Anand
> 
> 
> 
> 
>>
>> Best regards,
>> Martin
>>
>>
>> [0] https://github.com/hardkernel/linux/blob/c109dec94e7e819554830acfac4b6ed96e230179/arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi#L356-L359


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
