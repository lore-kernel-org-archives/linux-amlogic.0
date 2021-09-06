Return-Path: <SRS0=2xsp=N4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29EF7C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Sep 2021 12:28:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7C3C60F92
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Sep 2021 12:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7C3C60F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jcWBsOqV+NkW9wXieDMN8foesm6FP/QXNYTp919ufys=; b=Iry50BYH3jW6Um8nJTOlKTBdRY
	er9VokwBecJaPBGKT4tkDzDYfPxeno0wdZPPoWEfniD8ZWhmxONBB6tgGgcNeWxVIibWYFrPew0An
	ZBGja5jOGsiCahZ5K6gNHO3pSm8seBZjroL/T2Roc3YeI6+jwOy+LGEaKNaq8w81EXLXALrl2Fylv
	hAnEh3VCy4kqx6DsGIwdWKadpoEfYr6NF+MTwY7wW07Lcqo/w2utPsgo56QeGBKGs1iZ8TJ+uLtCB
	7fuoF9XpQLIij53vgwkiTDnOCryhFCEqx9MlW6z6oF5eR6IFkVoq9H5lEWj5yfwjOCspsu2O3IGbb
	Q6aJ4e+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNDjx-000n30-2y; Mon, 06 Sep 2021 12:28:45 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNDjt-000mza-U4
 for linux-amlogic@lists.infradead.org; Mon, 06 Sep 2021 12:28:43 +0000
Received: by mail-wr1-x42a.google.com with SMTP id v10so9621605wrd.4
 for <linux-amlogic@lists.infradead.org>; Mon, 06 Sep 2021 05:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c7jc3IYQ7RGnXbO/5TtHji0wZke1aLhu70WLZPxKzuY=;
 b=jyBrm4jeQ/XpKdWWPTMjMxU4AhAImOR86O32BnDTgg2yYXIy2VUq0AU5GUTAljkgj4
 VDDdmJwovzbUspiL8jnTM47hLd9ZRg4DJg1p0nxa4BfKWq5bp0BcQyIebPfkzXxJUN8i
 oEDCvk76HjuKSiqTfWREA9jARHSqCITA0fqU8Dmp7RSvRp+WTm+vmsTV/Fw6pArfqJrs
 4PMpzckqf+ATKQvU/5FVLTzO4bxMktKXh4oSk/MOsyumaI/BpGZuvPS2uDte6umjbgaZ
 gMY3Gm/TuBfc1ssZyQ7ZK8Ao1/mnANlj5icGCiExsUpu5UI+/LH+bODvVTcAFpMuT65D
 uGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=c7jc3IYQ7RGnXbO/5TtHji0wZke1aLhu70WLZPxKzuY=;
 b=StyddV9O09iBknmu7mpHBlKszDu8GsRoy1SRfZMzYR7XJ6q0dfjP60aBozQ/fBIo1N
 jL4DQ2TU/2Wbw1p0IAxxuJRacCyl/MfTF2NKAmI+UX1XTLdShfqLdQAVnU5sRD1AZTw6
 WLOggHtUF1/Chu/6nFA9sXVGNdqT0JsROtNOqOzWFjoogkpTLMgx5ETOszPNlrrh+W4Q
 96gRY0/n6xQLzTeH58kAriy8XUJxQJZFKcSQHwMluwFt22d/cZUmQNlYZmzinQWNn6mS
 FMYe8Q7HBK4Gx5ykQlQKlF9mH8+0be91Hf6DszH6Q35SbFOlcOrCftsAsGIpVqm/RhKX
 Zk0w==
X-Gm-Message-State: AOAM531XIn9cnwBsMDvqCmvJrS0xWfC4vw8HhLKqvvV2vL9QA9QST/Lm
 +LH7/negPVQJEBYsvUPvR8aL+g==
X-Google-Smtp-Source: ABdhPJxFPdt+Egf/+bN+An3ipOHNnO47OWI8DI4FFeyq5OD4hknChjLFGpHxRVWz1ai5EoO2ldeUqQ==
X-Received: by 2002:a5d:5712:: with SMTP id a18mr12958148wrv.367.1630931319458; 
 Mon, 06 Sep 2021 05:28:39 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:9afb:57ba:5ea:2010?
 ([2001:861:44c0:66c0:9afb:57ba:5ea:2010])
 by smtp.gmail.com with ESMTPSA id n5sm7051594wmd.29.2021.09.06.05.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 05:28:39 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: meson-sm1: add spdifin spdifout nodes
To: Art Nikpal <email2tema@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>, Artem Lapkin
 <art@khadas.com>, Nick Xie <nick@khadas.com>, Gouwa Wang <gouwa@khadas.com>
References: <20210811050941.398360-1-art@khadas.com>
 <64a6a9e1-64de-4b31-9413-cdfd981862de@baylibre.com>
 <1jlf4ayrv1.fsf@starbuckisacylon.baylibre.com>
 <CAKaHn9JOtmYoJsmZed4hLYAbtdyyMkhaM1iVThs0=2SV6y5ojQ@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <5c9583a5-62bb-5a5f-5f1c-72479f8bfbf8@baylibre.com>
Date: Mon, 6 Sep 2021 14:28:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKaHn9JOtmYoJsmZed4hLYAbtdyyMkhaM1iVThs0=2SV6y5ojQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_052842_077352_C10701E7 
X-CRM114-Status: GOOD (  21.64  )
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

On 06/09/2021 13:56, Art Nikpal wrote:
>> It would be nice to indicate how it was tested ?
> 
> https://github.com/khadas/khadas-linux-kernel/blob/master/patches/linux-5.14-rc5.sound/0001-arm64-dts-meson-khadas-vim3-remake-simple-sound-for-.patch
> 
> i have test it
> 
> i2s  and spdif output from gpio headers - works well
> 
> On Mon, Sep 6, 2021 at 5:29 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>>
>> On Thu 02 Sep 2021 at 15:31, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>>> Hi,
>>>
>>> On 11/08/2021 07:09, Artem Lapkin wrote:
>>>> Add spdifin spdifout spdifout_b nodes for Amlogic SM1 SoCs.
>>>>
>>>> Signed-off-by: Artem Lapkin <art@khadas.com>
>>>> ---
>>>>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 40 ++++++++++++++++++++++
>>>>  1 file changed, 40 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
>>>> index 3d8b1f4f2..1efdbb61e 100644
>>>> --- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
>>>> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
>>>> @@ -356,6 +356,33 @@ tdmin_lb: audio-controller@3c0 {
>>>>                      status = "disabled";
>>>>              };
>>>>
>>>> +            spdifin: audio-controller@400 {
>>>> +                    compatible = "amlogic,g12a-spdifin",
>>>> +                    "amlogic,axg-spdifin";
>>>> +                    reg = <0x0 0x400 0x0 0x30>;
>>>> +                    #sound-dai-cells = <0>;
>>>> +                    sound-name-prefix = "SPDIFIN";
>>>> +                    interrupts = <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
>>>> +                    clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
>>>> +                    <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
>>>> +                    clock-names = "pclk", "refclk";
>>>> +                    resets = <&clkc_audio AUD_RESET_SPDIFIN>;
>>>> +                    status = "disabled";
>>>> +            };
>>>> +
>>>> +            spdifout: audio-controller@480 {
>>>> +                    compatible = "amlogic,g12a-spdifout",
>>>> +                    "amlogic,axg-spdifout";
>>>> +                    reg = <0x0 0x480 0x0 0x50>;
>>>> +                    #sound-dai-cells = <0>;
>>>> +                    sound-name-prefix = "SPDIFOUT";
>>>> +                    clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
>>>> +                    <&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
>>>> +                    clock-names = "pclk", "mclk";
>>>> +                    resets = <&clkc_audio AUD_RESET_SPDIFOUT>;
>>>> +                    status = "disabled";
>>>> +            };
>>>> +
>>>>              tdmout_a: audio-controller@500 {
>>>>                      compatible = "amlogic,sm1-tdmout";
>>>>                      reg = <0x0 0x500 0x0 0x40>;
>>>> @@ -401,6 +428,19 @@ tdmout_c: audio-controller@580 {
>>>>                      status = "disabled";
>>>>              };
>>>>
>>>> +            spdifout_b: audio-controller@680 {
>>>> +                    compatible = "amlogic,g12a-spdifout",
>>>> +                    "amlogic,axg-spdifout";
>>>> +                    reg = <0x0 0x680 0x0 0x50>;
>>>> +                    #sound-dai-cells = <0>;
>>>> +                    sound-name-prefix = "SPDIFOUT_B";
>>>> +                    clocks = <&clkc_audio AUD_CLKID_SPDIFOUT_B>,
>>>> +                    <&clkc_audio AUD_CLKID_SPDIFOUT_B_CLK>;
>>>> +                    clock-names = "pclk", "mclk";
>>>> +                    resets = <&clkc_audio AUD_RESET_SPDIFOUT_B>;
>>>> +                    status = "disabled";
>>>> +            };
>>>> +
>>>>              toacodec: audio-controller@740 {
>>>>                      compatible = "amlogic,sm1-toacodec",
>>>>                                   "amlogic,g12a-toacodec";
>>>>
>>>
>>> Jerome could you quickly review this ?
>>>
>>
>> Just this, without the related card change is not usefull as it won't be
>> part of the card.
>>
>> It would be nice to indicate how it was tested ?
>>
>> AFAIK:
>> - spdifout b can only be routed to hdmi and dw-hdmi driver does not
>>   support that yet

It doesn't harm to have it described in DT, maybe one day the dw-hdmi driver will support SPDIF input.

Neil

>> - the VIM3 does not have connectors for the spdif (in or out). If it
>>   requires some extension card, it should be noted somewhere, at least
>>
>>
>>> Thanks,
>>> Neil
>>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
