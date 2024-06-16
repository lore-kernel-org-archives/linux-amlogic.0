Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D227C27C6E
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Jun 2024 07:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zpjCpjk3T7XX1Fi3wYrCq2JLmmE9P62X7MAYiAIQxtQ=; b=T/VDjp9q1KnC55
	NEv0iyBu6sqlHzVkwV+kb1PtK1nYpqG3cjtQGGXp8PddTR6ehuZekCH+4T+4hhD6xfaCr/xiFGCi4
	KLdu3fObPFHpsxojWeYhT1OS6mqnosotyj9xaap0G54iz7h03eaVQRYLu5JZh/vi8fpzVp+ed1Njp
	e+nWEo7dhUhQsuo5je9D2AkB46i9rwsSW0vGSYfCdO8efgpxuuUwVXSXeWIOjRMad9m7G5CUaMAcZ
	/EiokbFFl7NkITDuSa5fC2OZ15WSwjjyjlhE9kSevBP0KEUF0KI4+Rl8JCvAjWznG8QSZ7TGGKlDv
	ki92JvBDYQ7rze0ptHPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIkM7-000000071iM-2wZN;
	Sun, 16 Jun 2024 07:31:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIkM4-000000071hB-1zyA;
	Sun, 16 Jun 2024 07:31:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8D156CE0628;
	Sun, 16 Jun 2024 07:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3BF6C2BBFC;
	Sun, 16 Jun 2024 07:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718523068;
	bh=NzHHupP56Awo5wdnFHpA+aC/loSGgwA5FG6iFWikcYc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=og7VOUDXOVMxFXrezJaFEvc/knHI3tTUhuDbxQuZJZlL1yOlSXoO3KuWd0Cn+u4ij
	 gqBpeTuMJ8BU4dd7oArn1XvjrVANbJYkZp8W7dR96vDvPpjdUV6PJUsEw/3PBeGYgM
	 z4hob/w64g3mlJlSWajkFOjBzkMlnPFPdBW+khntHPa1fx9DfCOI6yWFWZVmT19qSX
	 Hqv0WVjXxdWJfGh7k3ps5YOTVFV/U5M8uq62CgusHBYZ550k5ZlhpH1QLYl+JUrwo5
	 EV499oWu4+/z9CffZrEi5ZfXWH2rlXyjIy6Moy5aN3Cr8TUp8snkv678klvGcQ7X2a
	 Kh5Tiz7wQK2Hg==
Message-ID: <777a36e8-c02b-4403-ae01-b2933f554da8@kernel.org>
Date: Sun, 16 Jun 2024 09:31:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add support for Amlogic A4 SoCs
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240611-a4_pinctrl-v1-0-dc487b1977b3@amlogic.com>
 <20240611-a4_pinctrl-v1-1-dc487b1977b3@amlogic.com>
 <20240613170816.GA2020944-robh@kernel.org>
 <42752f1c-fa79-450c-bbf8-f55464db14ae@amlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <42752f1c-fa79-450c-bbf8-f55464db14ae@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_003112_924173_9EE1DD9A 
X-CRM114-Status: GOOD (  18.80  )
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

On 14/06/2024 10:51, Xianwei Zhao wrote:
> Hi Rob,
>       Thanks for your review.
> 
> On 2024/6/14 01:08, Rob Herring wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On Tue, Jun 11, 2024 at 01:10:57PM +0800, Xianwei Zhao wrote:
>>> Add the new compatible name for Amlogic A4 pin controller, and add
>>> a new dt-binding header file which document the detail pin names.
>>>
>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>> ---
>>>   .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |  2 +
>>>   .../dt-bindings/gpio/amlogic,a4-aobus-pinctrl.h    | 21 +++++
>>>   .../dt-bindings/gpio/amlogic,a4-periphs-pinctrl.h  | 93 ++++++++++++++++++++++
>>>   3 files changed, 116 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
>>> index d9e0b2c48e84..f5eefa0fab5b 100644
>>> --- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
>>> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
>>> @@ -15,6 +15,8 @@ allOf:
>>>   properties:
>>>     compatible:
>>>       enum:
>>> +      - amlogic,a4-aobus-pinctrl
>>> +      - amlogic,a4-periphs-pinctrl
>>>         - amlogic,c3-periphs-pinctrl
>>>         - amlogic,t7-periphs-pinctrl
>>>         - amlogic,meson-a1-periphs-pinctrl
>>> diff --git a/include/dt-bindings/gpio/amlogic,a4-aobus-pinctrl.h b/include/dt-bindings/gpio/amlogic,a4-aobus-pinctrl.h
>>> new file mode 100644
>>> index 000000000000..7c7e746baed5
>>> --- /dev/null
>>> +++ b/include/dt-bindings/gpio/amlogic,a4-aobus-pinctrl.h
>>> @@ -0,0 +1,21 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>>> +/*
>>> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
>>> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>> + */
>>> +
>>> +#ifndef _DT_BINDINGS_AMLOGIC_A4_AOBUS_PINCTRL_H
>>> +#define _DT_BINDINGS_AMLOGIC_A4_AOBUS_PINCTRL_H
>>> +
>>> +/* GPIOAO */
>>> +#define GPIOAO_0                     0
>>> +#define GPIOAO_1                     1
>>> +#define GPIOAO_2                     2
>>> +#define GPIOAO_3                     3
>>> +#define GPIOAO_4                     4
>>> +#define GPIOAO_5                     5
>>> +#define GPIOAO_6                     6
>>
>> I find defines with the value of the define in the name pretty
>> pointless.
>>
> In the driver, this macro definition not only uses its value, but also 
> uses this character, for example as following,
> 
> MESON_PIN(GPIOE_0),
> #define MESON_PIN(x) PINCTRL_PIN(x, #x)
> 
> GPIO_GROUP(GPIOE_0),
> #define GPIO_GROUP(gpio)                                               \
>          {                                                              \
>                  .name = #gpio,                                         \
>                  .pins = (const unsigned int[]){ gpio },                \
>                  .num_pins = 1,                                         \
>                  .data = (const struct meson_pmx_axg_data[]){           \
>                          PMX_DATA(0),                                   \
>                  },                                                     \
>          }

Still pointless.

> 
>>> +
>>> +#define GPIO_TEST_N                  7
>>> +
>>> +#endif
>>> diff --git a/include/dt-bindings/gpio/amlogic,a4-periphs-pinctrl.h b/include/dt-bindings/gpio/amlogic,a4-periphs-pinctrl.h
>>> new file mode 100644
>>> index 000000000000..dfabca4b4790
>>> --- /dev/null
>>> +++ b/include/dt-bindings/gpio/amlogic,a4-periphs-pinctrl.h
>>> @@ -0,0 +1,93 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>>> +/*
>>> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
>>> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>> + */
>>> +
>>> +#ifndef _DT_BINDINGS_AMLOGIC_A4_PERIPHS_PINCTRL_H
>>> +#define _DT_BINDINGS_AMLOGIC_A4_PERIPHS_PINCTRL_H
>>> +
>>> +/* GPIOE */
>>> +#define GPIOE_0                              0
>>> +#define GPIOE_1                              1
>>> +
>>> +/* GPIOD */
>>> +#define GPIOD_0                              2
>>> +#define GPIOD_1                              3
>>> +#define GPIOD_2                              4
>>> +#define GPIOD_3                              5
>>> +#define GPIOD_4                              6
>>> +#define GPIOD_5                              7
>>> +#define GPIOD_6                              8
>>> +#define GPIOD_7                              9
>>> +#define GPIOD_8                              10
>>> +#define GPIOD_9                              11
>>> +#define GPIOD_10                     12
>>> +#define GPIOD_11                     13
>>> +#define GPIOD_12                     14
>>> +#define GPIOD_13                     15
>>> +#define GPIOD_14                     16
>>> +#define GPIOD_15                     17
>>
>> I'm not really much of a fan of using defines for GPIOs, but if you do,
>> wouldn't be better to split banks and lines up rather than a global
>> number space. See ASPEED_GPIO() or tegra header.
>> For the same reasons described above.
> I want to keep the same style as the previous drive.

Which part of Rob's feedback needs more explanation?


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
