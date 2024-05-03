Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E63C4345F
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 May 2024 12:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXmLLln5CQp2U3njsAI1m2bwr96oiiyPCY7W1AAGcbM=; b=m9F+ZddtdN6V1G
	OQoDYT254KD5+tym8aMV8wcUqdXk7Cyj1IOdMi6RmBHRR76bVCv/56U3bL8MXdV3Bij1rkONeLqjs
	evuTg3AI0b7WPrAUl+iM803BvKQUfgSdVLy9mv81ukwebW5tRa21BHtbSbIE+8L9j/KEn7aIqI4Bt
	3/fpfSEe4fRcf30JjHQGmsAHRgu081H20bvhUSMuaPyUn/6Lwe9DFvQFQuWGLj2WXz0Up/2CbpBka
	WZc00lryQ+VNb5iePT+9qyYWeHZUZp/IoX89HkOuYcGlwXzrc7oLfVqad9+emOgX6s21jVz93BVqs
	daBaEAhi6T33QNBmpUfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2rus-0000000GPR1-33Fe;
	Fri, 03 May 2024 12:21:30 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ruq-0000000GPPY-3WCx
	for linux-amlogic@lists.infradead.org;
	Fri, 03 May 2024 12:21:30 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-34e667905d2so528994f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 03 May 2024 05:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714738885; x=1715343685; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=FE1I/jBycBoqAmvsabhWL2xuaCucHohgag0bUdqLVzQ=;
        b=AlALcazc/Wb7K3Sc1CrqW8ZzJ14HiY65GTLA4k0nyCa30mqrckGlfw1B27IPfJ5R5p
         l/KlnOO3chz0Qha5r7q3bt/eJ0FpIp67FBD4thLEskxqgGtg3MmMuUkF4ATLmA38hCoL
         xntGJRCgWKJ9JEXqgM+yZ/PbTP9pwnhOpGcxtN7gQ0QW6SJSoWI6JV+fGTOzg1ddIN+s
         wAluJr9iVv8WyhCxoO0ijgktqE3hhBOebKqSzQ16yXsL6hPGO2WM5e4qIO+OZs2rl4VX
         9Nwv53FEB+ZnPOXfdQqXjrxwZqGZ92rknvsftfQOMY6RjeJx4XbVbiEJpyy1FN1UYVDZ
         pXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714738885; x=1715343685;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FE1I/jBycBoqAmvsabhWL2xuaCucHohgag0bUdqLVzQ=;
        b=R6YxD20PKsFnR8LbKtEk6t6VUE7PYGbW1AQJSbRp/kFKqGHChIQPF/7AtKdOe34Agj
         GTaeRiE9tKc74iitswOD5HkI5A/tiVdQ6QPK4uRx1/b5BUpfZ97sziZwBdXnxOyyOnEi
         6YGX6pkAZaxB/3MK6b0tywgyYZccTRqg8yvZxQAXjHAHn0oR2OkNcAZNFsFyYX4pL/U6
         6pFOfqSgVvf7ogjQRtUOr98xddcnZmcK0L56fV/ZDnLF1MtUfxo88YDArWOZYWPitCr3
         tn3e/wzMfJLi46hB+tDbeXLe7inClkWMyAJbbyp2Z7wECbYAZsNqdd3Xi3InmG6f9U8P
         ZkcA==
X-Forwarded-Encrypted: i=1; AJvYcCXPzz+nOekuFz32U8BC01/qSQYNuKY0cXLZHvZ/pY2wih4l1yLLVPBh+eH8+C7dGGQ7D55YRletYbhdrqKwOnG1epnpgvSeXkwDipymcyAYZlE=
X-Gm-Message-State: AOJu0YwxHNfw45fA3dRApgUvaUzZt4pyxycYHBGru/DH7h9j3FNc4q3y
	F3Eg6FPoPWnZkgWL2rvetrmj6gotbwllpIcJRsqC4/oOY+q3kwwMlRBhXvo1IiQ=
X-Google-Smtp-Source: AGHT+IE0DbMuSx/eoQe4w4zgYxtSoMrhzPIpgLgKzjijku4u86QRScfsOqCpX0Dv3i9LAF6ci4xU3A==
X-Received: by 2002:a05:6000:128c:b0:34d:a3e5:c954 with SMTP id f12-20020a056000128c00b0034da3e5c954mr1761292wrx.67.1714738885490;
        Fri, 03 May 2024 05:21:25 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1b85:e590:355b:9957])
        by smtp.gmail.com with ESMTPSA id c4-20020a5d4cc4000000b0034e4d029a62sm2452058wrt.2.2024.05.03.05.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 05:21:25 -0700 (PDT)
References: <20240424050928.1997820-1-xianwei.zhao@amlogic.com>
 <20240424050928.1997820-6-xianwei.zhao@amlogic.com>
 <20240424200107.GA372179-robh@kernel.org>
 <9a9ab302-5da5-47bb-85f1-d2295fa9f8c9@amlogic.com>
 <1jle4r3x5l.fsf@starbuckisacylon.baylibre.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Rob Herring <robh@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil  Armstrong
 <neil.armstrong@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Chuan Liu <chuan.liu@amlogic.com>
Subject: Re: [PATCH v7 5/5] clk: meson: c3: add c3 clock peripherals
 controller driver
Date: Fri, 03 May 2024 14:20:58 +0200
In-reply-to: <1jle4r3x5l.fsf@starbuckisacylon.baylibre.com>
Message-ID: <1jh6ff3x2z.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_052128_900546_7225AE0D 
X-CRM114-Status: GOOD (  20.65  )
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


On Fri 03 May 2024 at 14:16, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Thu 25 Apr 2024 at 14:28, Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:
>
>> Hi Rob,
>>    Thanks for your review.
>>
>> On 2024/4/25 04:01, Rob Herring wrote:
>>> [ EXTERNAL EMAIL ]
>>> On Wed, Apr 24, 2024 at 01:09:28PM +0800, Xianwei Zhao wrote:
>>>> Add the C3 peripherals clock controller driver in the C3 SoC family.
>>>>
>>>> Co-developed-by: Chuan Liu <chuan.liu@amlogic.com>
>>>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>> ---
>>>>   drivers/clk/meson/Kconfig          |   15 +
>>>>   drivers/clk/meson/Makefile         |    1 +
>>>>   drivers/clk/meson/c3-peripherals.c | 2366 ++++++++++++++++++++++++++++
>>>>   3 files changed, 2382 insertions(+)
>>>>   create mode 100644 drivers/clk/meson/c3-peripherals.c
>>>>
>>>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>>>> index 9f975a980581..0b85d584910e 100644
>>>> --- a/drivers/clk/meson/Kconfig
>>>> +++ b/drivers/clk/meson/Kconfig
>>>> @@ -142,6 +142,21 @@ config COMMON_CLK_C3_PLL
>>>>          AKA C3. Say Y if you want the board to work, because PLLs are the parent
>>>>          of most peripherals.
>>>>
>>>> +config COMMON_CLK_C3_PERIPHERALS
>>>> +     tristate "Amlogic C3 peripherals clock controller"
>>>> +     depends on ARM64
>>>> +     depends on ARM_SCMI_PROTOCOL
>>> I may have missed it, but I don't see the dependency on SCMI in this
>>> driver.
>>> 
>>
>> Some clock sources for peripherals controller from SCMI module.
>> In previous version, Jerome suggest us the clock  that relevant registers
>> can only be accessed securely is implemented through SCMI.
>>
>
> There is no dependency but you are guranteed to have have problem if
> SCMI is missing because it provides several inputs to this controller.
>
> IMO, this controller should 'imply ARM_SCMI_PROTOCOL'
>
> You have already posted a v8 without it.
> I expect a fix up change on top of v8 if there is no other comment on
> this v8 version. Part of v9 otherwise.
>
>>>> +     depends on COMMON_CLK_SCMI
>>>> +     depends on COMMON_CLK_C3_PLL

Same here - imply, not depends

>>>> +     default y
>>>> +     select COMMON_CLK_MESON_REGMAP
>>>> +     select COMMON_CLK_MESON_DUALDIV
>>>> +     select COMMON_CLK_MESON_CLKC_UTILS
>>>> +     help
>>>> +       Support for the Peripherals clock controller on Amlogic C302X and
>>>> +       C308L devices, AKA C3. Say Y if you want the peripherals clock to
>>>> +       work.
>>>> +
>>>>   config COMMON_CLK_G12A
>>>>        tristate "G12 and SM1 SoC clock controllers support"
>>>>        depends on ARM64
>>>> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
>>>> index 4420af628b31..20ad9482c892 100644
>>>> --- a/drivers/clk/meson/Makefile
>>>> +++ b/drivers/clk/meson/Makefile
>>>> @@ -20,6 +20,7 @@ obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
>>>>   obj-$(CONFIG_COMMON_CLK_A1_PLL) += a1-pll.o
>>>>   obj-$(CONFIG_COMMON_CLK_A1_PERIPHERALS) += a1-peripherals.o
>>>>   obj-$(CONFIG_COMMON_CLK_C3_PLL) += c3-pll.o
>>>> +obj-$(CONFIG_COMMON_CLK_C3_PERIPHERALS) += c3-peripherals.o
>>>>   obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
>>>>   obj-$(CONFIG_COMMON_CLK_G12A) += g12a.o g12a-aoclk.o
>>>>   obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o meson8-ddr.o
>>>> diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
>>>> new file mode 100644
>>>> index 000000000000..0f834ced0ee9
>>>> --- /dev/null
>>>> +++ b/drivers/clk/meson/c3-peripherals.c
>>>> @@ -0,0 +1,2366 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * Amlogic C3 Peripherals Clock Controller Driver
>>>> + *
>>>> + * Copyright (c) 2023 Amlogic, inc.
>>>> + * Author: Chuan Liu <chuan.liu@amlogic.com>
>>>> + */
>>>> +
>>>> +#include <linux/clk-provider.h>
>>>> +#include <linux/of_device.h>
>>> I don't think you need this header.
>>> 
>>
>> Yes, I will fix it with c3-pll.c.
>>
>>>> +#include <linux/platform_device.h>
>>>> +#include "clk-regmap.h"
>>>> +#include "clk-dualdiv.h"
>>>> +#include "meson-clkc-utils.h"
>>>> +#include <dt-bindings/clock/amlogic,c3-peripherals-clkc.h>


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
