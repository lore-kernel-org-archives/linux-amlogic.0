Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32881C19F2A
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jul 2022 05:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5Dv11xxLOfFRgCDwQPItouxm0ex/eVKP9UNDBd9AIk=; b=PerSnpLRwFNV5OBLicQYHmztMP
	A8XVWC6kZH6ng7hYyR0HEfUvehtBy3fbsEPEBG9gv0pmP7UOM8+6SFKm9929yZ6F7qwhaM+m+4+Sj
	Qrt+XFRXyKXC1EFmDqdy1i2OWgvUBbGj3Yi6d6lLoXaDSGkzz/ex3TDCjtrGfJLB1RsA8240Dci6d
	SvdMYKkG2BjtzUIVmLD6EADOI5ViFOTV0WhhtTNbK52W40W/OUdaHzPrpVB0Xz8Sq8UXeulca9Hnl
	5u/+eXPJUXiYI6hWxGDb2GB5k9Phvbhd8ug+wxuFEIzzIsbre79AQhz32CdsS9FHg9WF/TntQNZgl
	O8i0spoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHIuh-001bOu-4A; Fri, 29 Jul 2022 05:51:55 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHIuW-001bNi-V8; Fri, 29 Jul 2022 05:51:46 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Fri, 29 Jul
 2022 13:51:35 +0800
Message-ID: <8450f0b6-aa57-9797-f467-2074bde2cf7b@amlogic.com>
Date: Fri, 29 Jul 2022 13:51:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2 1/3] dt-bindings: clk: meson: add S4 SoC clock
 controller bindings
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
	<khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
References: <20220728054202.6981-1-yu.tu@amlogic.com>
 <20220728054202.6981-2-yu.tu@amlogic.com>
 <82e3fd36-df96-a555-4cea-47fabd26502b@linaro.org>
 <74cd833a-4773-eeb0-80aa-75ea1cdc093e@amlogic.com>
 <39395257-703b-a5e9-17c3-80f79f67fdc7@linaro.org>
 <ff582551-9661-4404-c00e-853bc60907cc@amlogic.com>
 <1jbkt9focq.fsf@starbuckisacylon.baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1jbkt9focq.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_225145_054483_6E574B24 
X-CRM114-Status: UNSURE (   8.72  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 2022/7/28 19:48, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
> 
> 
> On Thu 28 Jul 2022 at 18:19, Yu Tu <yu.tu@amlogic.com> wrote:
> 
>> On 2022/7/28 18:09, Krzysztof Kozlowski wrote:
>>> [ EXTERNAL EMAIL ]
>>> On 28/07/2022 12:05, Yu Tu wrote:
>>>> Hi Krzysztof,
>>>> 	Thanks for your reply.
>>>>
>>>> On 2022/7/28 16:41, Krzysztof Kozlowski wrote:
>>>>> [ EXTERNAL EMAIL ]
>>>>>
>>>>> On 28/07/2022 07:42, Yu Tu wrote:
>>>>>> Add new clock controller compatible and dt-bindings header for the
>>>>>> Everything-Else domain of the S4 SoC.
>>>>>>
>>>>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>>>>
>>>>>
>>>>>
>>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>>> index c1abc53f9e91..f872d0c0c253 100644
>>>>>> --- a/MAINTAINERS
>>>>>> +++ b/MAINTAINERS
>>>>>> @@ -1775,6 +1775,7 @@ F:	Documentation/devicetree/bindings/clock/amlogic*
>>>>>>     F:	drivers/clk/meson/
>>>>>>     F:	include/dt-bindings/clock/gxbb*
>>>>>>     F:	include/dt-bindings/clock/meson*
>>>>>> +F:	include/dt-bindings/clock/s4-clkc.h
>>>>>>        ARM/Amlogic Meson SoC Crypto Drivers
>>>>>>     M:	Corentin Labbe <clabbe@baylibre.com>
>>>>>> diff --git a/include/dt-bindings/clock/s4-clkc.h b/include/dt-bindings/clock/s4-clkc.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..b686c8877419
>>>>>> --- /dev/null
>>>>>> +++ b/include/dt-bindings/clock/s4-clkc.h
>>>>>
>>>>> Filename with vendor prefix, so:
>>>>> amlogic,s4-clkc.h
>>>> It's fine with me. It's mainly Jerome's opinion.
>>> To clarify: I understand such naming might bring inconsistency, but we
>>> want to bring some order in the bindings directories. They keep growing
>>> and at some point the model names might start conflicting.
>> If Jerome agrees, I will change it according to your opinion and make
>> another edition.
> 
> I'm aligned with Krzysztof on this. Please add the vendor prefix.
I will add it in next version.

> 
> It was mistake to omit the vendor prefix. Unfortunately, I don't think
> we can fix the old bindings now.
> 
>>
>>>
>>> Best regards,
>>> Krzysztof
>>> .
> 
> .

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
