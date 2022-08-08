Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A86C00140
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Aug 2022 10:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5uFbSJ9rBArcNxhqnIn9QKoMu5K935329HEYpa9tFRk=; b=yRrLkTsp23H2buzh2wkd7/U1GE
	bub/r2wf9W+rJfK2JHwWBg2uZLFR0foMRJ1vK2hVh7epu/Z/umxzqEkt4uyYn1S6PZyZSj83keWdM
	06BT8SmKMaTa4r3LZ/VBcvxvKmcZKhO4K1wHR4fKvMKaRpQmvqoT/shGKdZTIz3+PLjHuZE874Xyw
	9vm2q3kdHT5MTgpW/+8SIoXUEf3aEvecBJ3Tpmvj0mSxXjmexiCwV4+yspbKIhQPkWAXLq5YTtKkn
	B33hNl4qW0tecbWEX7isrcdLbEtopsMmcncO7QRwR5bLtt/z2ly8duH7BQNiQUG8t1vXqzoAcbibN
	sp9fkBJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKzZS-00Cns6-V0; Mon, 08 Aug 2022 10:01:14 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKzZE-00Cnmc-KQ; Mon, 08 Aug 2022 10:01:02 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 8 Aug 2022
 18:00:48 +0800
Message-ID: <7c635801-4d8b-2d52-6ad9-03be2e27f74a@amlogic.com>
Date: Mon, 8 Aug 2022 18:00:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V3 4/6] dt-bindings: clk: meson: add S4 SoC peripheral
 clock controller bindings
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Neil
 Armstrong" <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
References: <20220805085716.5635-1-yu.tu@amlogic.com>
 <20220805085716.5635-5-yu.tu@amlogic.com>
 <562043e1-83d4-d4ab-2c18-20b770b02955@linaro.org>
 <4d923b9e-61d4-b4cc-906f-cb186a16e1f4@amlogic.com>
 <e78f108d-ab29-1d92-d96e-07393aaf2a65@linaro.org>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <e78f108d-ab29-1d92-d96e-07393aaf2a65@linaro.org>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_030100_714219_31B72ECE 
X-CRM114-Status: UNSURE (   8.56  )
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

Hi Krzysztof,

On 2022/8/8 14:16, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 05/08/2022 11:33, Yu Tu wrote:
>> Hi Krzysztof,
>> 	Thank you for your reply.
>>
>> On 2022/8/5 17:15, Krzysztof Kozlowski wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On 05/08/2022 10:57, Yu Tu wrote:
>>>> Add peripheral clock controller compatible and dt-bindings header for
>>>> the of the S4 SoC.
>>>>
>>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>>> ---
>>>>    .../bindings/clock/amlogic,s4-clkc.yaml       |  92 ++++++++++++
>>>>    include/dt-bindings/clock/amlogic,s4-clkc.h   | 131 ++++++++++++++++++
>>>>    2 files changed, 223 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-clkc.yaml
>>>>    create mode 100644 include/dt-bindings/clock/amlogic,s4-clkc.h
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,s4-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s4-clkc.yaml
>>>> new file mode 100644
>>>> index 000000000000..2471276afda9
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/clock/amlogic,s4-clkc.yaml
>>>
>>> Filename should be based on compatible, so amlogic,s4-periphs-clkc.yaml
>> I will correct as you suggest in the next version.
>>>
>>>> @@ -0,0 +1,92 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/clock/amlogic,s4-clkc.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Amlogic Meson S serials Peripheral Clock Controller Device Tree Bindings
>>>
>>> s/Device Tree Bindings//
>> what's mean?
> 
> It's a expression (simplified not accurate) from many Linux tools, e.g.
> sed, vim etc
> s/SEARCH/REPLACE/
> so just drop that piece I wrote above.
Do you mean you need me to delete "Device Tree Bindings"?

> 
> Best regards,
> Krzysztof
> 
> .

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
